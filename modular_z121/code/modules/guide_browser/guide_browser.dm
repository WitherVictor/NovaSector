/datum/action/guide_browser
	name = "指南浏览器"
	desc = "浏览服务器 Wiki 指南。"
	button_icon_state = "round_end"
	show_to_observers = FALSE

	var/selected_page_id

/datum/action/guide_browser/New(datum/persistent_client/persistent)
	. = ..()
	selected_page_id = SSguide_catalog.get_default_page_id()

/datum/action/guide_browser/Trigger(mob/clicker, trigger_flags)
	. = ..()
	if(!. || !SSguide_catalog.catalog_ready)
		return
	var/mob/user = clicker || owner
	if(!user?.client)
		return
	if(user.client.byond_version < 516)
		open_page_external(user, selected_page_id, TRUE)
		return
	ui_interact(user)

/datum/action/guide_browser/ui_status(mob/user, datum/ui_state/state)
	if(!SSguide_catalog.catalog_ready)
		return UI_CLOSE
	return IsAvailable() ? UI_INTERACTIVE : UI_CLOSE

/datum/action/guide_browser/ui_interact(mob/user, datum/tgui/ui)
	if(!SSguide_catalog.catalog_ready || !user?.client)
		return
	if(user.client.byond_version < 516)
		open_page_external(user, selected_page_id, TRUE)
		return
	ui = SStgui.try_update_ui(user, src, ui)
	if(isnull(ui))
		ui = new(user, src, "GuideBrowser")
		ui.open()

/datum/action/guide_browser/ui_static_data(mob/user)
	return list("guide_tree" = SSguide_catalog.guide_tree)

/datum/action/guide_browser/ui_data(mob/user)
	if(!SSguide_catalog.get_page(selected_page_id))
		selected_page_id = SSguide_catalog.get_default_page_id()
	var/list/page = SSguide_catalog.get_page(selected_page_id)
	return list(
		"selected_id" = selected_page_id,
		"selected_title" = page?["label"],
		"page_url" = SSguide_catalog.get_page_url(selected_page_id),
		"wiki_available" = SSguide_catalog.catalog_ready,
		"supports_iframe" = user?.client?.byond_version >= 516,
	)

/datum/action/guide_browser/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(. || !SSguide_catalog.catalog_ready)
		return
	switch(action)
		if("select_page")
			var/page_id = params["id"]
			if(!istext(page_id) || !SSguide_catalog.get_page(page_id))
				return
			selected_page_id = page_id
			return TRUE
		if("open_external")
			return open_page_external(ui.user, selected_page_id)

/datum/action/guide_browser/proc/open_page_external(mob/user, page_id, confirm = FALSE)
	var/page_url = SSguide_catalog.get_page_url(page_id)
	if(!page_url)
		user.balloon_alert(user, "wiki unavailable")
		return FALSE
	if(confirm && tgui_alert(user, "This guide will open in your browser. Continue?", "Guide Browser", list("Yes", "No")) != "Yes")
		return FALSE
	DIRECT_OUTPUT(user, link(page_url))
	return TRUE
