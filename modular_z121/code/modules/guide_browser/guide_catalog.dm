/datum/config_entry/string/guide_catalog_url

/datum/guide_catalog_candidate
	var/wiki_base_url
	var/list/tree = list()
	var/list/pages_by_id = list()
	var/default_page_id
	var/node_count = 0

SUBSYSTEM_DEF(guide_catalog)
	name = "Guide Catalog"
	ss_flags = SS_NO_FIRE

	var/catalog_ready = FALSE
	var/reload_in_progress = FALSE
	var/catalog_url
	var/wiki_base_url
	var/list/guide_tree = list()
	var/list/pages_by_id = list()
	var/default_page_id
	var/catalog_generation = 0
	var/last_error

/datum/controller/subsystem/guide_catalog/Initialize()
	RegisterSignal(SSticker, COMSIG_TICKER_ENTER_PREGAME, PROC_REF(load_round_catalog))
	RegisterSignal(SSdcs, COMSIG_GLOB_CLIENT_CONNECT, PROC_REF(on_client_connect))
	return SS_INIT_SUCCESS

/datum/controller/subsystem/guide_catalog/proc/load_round_catalog()
	SIGNAL_HANDLER
	set waitfor = FALSE
	set_catalog_unavailable()
	var/url = CONFIG_GET(string/guide_catalog_url)
	if(!length(url))
		last_error = "GUIDE_CATALOG_URL is not configured"
		log_config("Guide catalog is unavailable: [last_error].")
		return
	var/list/result = load_catalog(url)
	if(!result["success"])
		last_error = result["error"]
		log_config("Guide catalog failed to load: [last_error].")
		return
	commit_catalog(result["candidate"], url)

/datum/controller/subsystem/guide_catalog/proc/load_catalog(url)
	if(reload_in_progress)
		return list("success" = FALSE, "error" = "A guide catalog reload is already in progress.")
	if(!is_valid_catalog_url(url, TRUE))
		return list("success" = FALSE, "error" = "The catalog URL must be a valid public HTTPS URL.")
	reload_in_progress = TRUE
	var/list/result
	var/datum/http_request/request = new
	request.prepare(RUSTG_HTTP_METHOD_GET, url, timeout_seconds = 10)
	request.begin_async()
	UNTIL(request.is_complete())
	var/datum/http_response/response = request.into_response()
	if(response.errored)
		result = list("success" = FALSE, "error" = "The catalog request failed.")
	else if(response.status_code != 200)
		result = list("success" = FALSE, "error" = "The catalog returned HTTP [response.status_code].")
	else if(!istext(response.body) || length(response.body) > 524288)
		result = list("success" = FALSE, "error" = "The catalog response is empty or too large.")
	else
		var/list/raw_catalog = safe_json_decode(response.body)
		var/datum/guide_catalog_candidate/candidate = validate_catalog(raw_catalog)
		if(candidate)
			result = list("success" = TRUE, "candidate" = candidate)
		else
			result = list("success" = FALSE, "error" = "The catalog JSON does not match the required schema.")
	reload_in_progress = FALSE
	return result

/datum/controller/subsystem/guide_catalog/proc/validate_catalog(list/raw_catalog)
	if(!islist(raw_catalog) || raw_catalog["version"] != 1 || !islist(raw_catalog["tree"]))
		return
	var/wiki_url = normalize_wiki_base_url(raw_catalog["wiki_base_url"])
	if(!wiki_url || !length(raw_catalog["tree"]) || length(raw_catalog["tree"]) > 64)
		return
	var/datum/guide_catalog_candidate/candidate = new
	candidate.wiki_base_url = wiki_url
	for(var/list/raw_node as anything in raw_catalog["tree"])
		var/list/node = validate_node(raw_node, 1, candidate)
		if(!node)
			return
		candidate.tree += list(node)
	return candidate.default_page_id ? candidate : null

/datum/controller/subsystem/guide_catalog/proc/validate_node(list/raw_node, depth, datum/guide_catalog_candidate/candidate)
	if(!islist(raw_node) || depth > 8 || ++candidate.node_count > 512)
		return
	var/node_id = raw_node["id"]
	var/label = normalize_display_text(raw_node["label"], 128)
	if(!is_valid_id(node_id) || !label || candidate.pages_by_id[node_id])
		return
	var/kind = raw_node["kind"]
	switch(kind)
		if("page")
			if(length(candidate.pages_by_id) >= 256)
				return
			var/title = normalize_display_text(raw_node["title"], 255)
			if(!title)
				return
			candidate.pages_by_id[node_id] = list("label" = label, "title" = title)
			candidate.default_page_id ||= node_id
			return list("kind" = "page", "id" = node_id, "label" = label)
		if("category")
			var/list/raw_children = raw_node["children"]
			if(!islist(raw_children) || !length(raw_children) || length(raw_children) > 64)
				return
			candidate.pages_by_id[node_id] = "category"
			var/list/children = list()
			for(var/list/raw_child as anything in raw_children)
				var/list/child = validate_node(raw_child, depth + 1, candidate)
				if(!child)
					return
				children += list(child)
			return list("kind" = "category", "id" = node_id, "label" = label, "children" = children)
	return

/datum/controller/subsystem/guide_catalog/proc/is_valid_id(value)
	if(!istext(value) || length(value) > 64)
		return FALSE
	var/static/regex/id_regex = regex(@"^[A-Za-z0-9][A-Za-z0-9_-]{0,63}$")
	return id_regex.Find(value)

/datum/controller/subsystem/guide_catalog/proc/normalize_display_text(value, maximum_length)
	if(!istext(value))
		return
	value = trim(value)
	if(!length(value) || length_char(value) > maximum_length)
		return
	for(var/index in 1 to length_char(value))
		var/character_code = text2ascii_char(value, index)
		if(character_code < 32 || character_code == 127)
			return
	return value

/datum/controller/subsystem/guide_catalog/proc/is_valid_catalog_url(value, allow_query)
	if(!istext(value))
		return FALSE
	value = trim(value)
	if(length(value) > 2048 || copytext(lowertext(value), 1, 9) != "https://" || findtext(value, "#") || findtext(value, "@"))
		return FALSE
	if(!allow_query && findtext(value, "?"))
		return FALSE
	var/authority = copytext(value, 9)
	var/slash = findtext(authority, "/")
	if(slash)
		authority = copytext(authority, 1, slash)
	if(!length(authority) || findtext(authority, "localhost") || findtext(authority, "127.") || findtext(authority, "10.") || findtext(authority, "192.168.") || findtext(authority, "169.254."))
		return FALSE
	var/static/regex/whitespace_regex = regex("\\s")
	return !whitespace_regex.Find(value)

/datum/controller/subsystem/guide_catalog/proc/normalize_wiki_base_url(value)
	if(!is_valid_catalog_url(value, FALSE))
		return
	value = trim(value)
	while(copytext(value, -1) == "/")
		value = copytext(value, 1, -1)
	return value

/datum/controller/subsystem/guide_catalog/proc/commit_catalog(datum/guide_catalog_candidate/candidate, url)
	wiki_base_url = candidate.wiki_base_url
	guide_tree = candidate.tree
	pages_by_id = candidate.pages_by_id
	default_page_id = candidate.default_page_id
	catalog_url = url
	catalog_ready = TRUE
	catalog_generation++
	last_error = null
	reconcile_actions()

/datum/controller/subsystem/guide_catalog/proc/set_catalog_unavailable()
	catalog_ready = FALSE
	wiki_base_url = null
	guide_tree = list()
	pages_by_id = list()
	default_page_id = null
	for(var/datum/persistent_client/persistent as anything in GLOB.persistent_clients)
		remove_guide_actions(persistent)

/datum/controller/subsystem/guide_catalog/proc/on_client_connect(datum/source, client/connected_client)
	SIGNAL_HANDLER
	if(catalog_ready)
		ensure_guide_action(connected_client.persistent_client)

/datum/controller/subsystem/guide_catalog/proc/reconcile_actions()
	for(var/datum/persistent_client/persistent as anything in GLOB.persistent_clients)
		var/datum/action/guide_browser/action = ensure_guide_action(persistent)
		if(action && !islist(pages_by_id[action.selected_page_id]))
			action.selected_page_id = default_page_id
		SStgui.close_uis(action)

/datum/controller/subsystem/guide_catalog/proc/ensure_guide_action(datum/persistent_client/persistent)
	if(!catalog_ready || !persistent)
		return
	var/datum/action/guide_browser/action
	for(var/datum/action/guide_browser/candidate as anything in persistent.player_actions)
		if(action)
			persistent.player_actions -= candidate
			qdel(candidate)
			continue
		action = candidate
	if(!action)
		action = new(persistent)
		persistent.player_actions += action
	if(persistent.mob)
		action.Grant(persistent.mob)
	return action

/datum/controller/subsystem/guide_catalog/proc/remove_guide_actions(datum/persistent_client/persistent)
	if(!persistent)
		return
	for(var/datum/action/guide_browser/action as anything in persistent.player_actions)
		SStgui.close_uis(action)
		persistent.player_actions -= action
		qdel(action)

/datum/controller/subsystem/guide_catalog/proc/get_page(page_id)
	var/page = pages_by_id[page_id]
	return islist(page) ? page : null

/datum/controller/subsystem/guide_catalog/proc/get_page_url(page_id)
	var/list/page = get_page(page_id)
	if(!page)
		return
	return "[wiki_base_url]/[url_encode(page["title"])]?useskin=vector"

/datum/controller/subsystem/guide_catalog/proc/get_default_page_id()
	return default_page_id
