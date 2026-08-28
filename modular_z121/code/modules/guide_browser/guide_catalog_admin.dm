ADMIN_VERB(reload_guide_catalog, R_SERVER, "Reload Guide Catalog", "Load the guide catalog from an HTTPS JSON endpoint.", ADMIN_CATEGORY_SERVER)
	var/current_url = CONFIG_GET(string/guide_catalog_url)
	var/new_url = tgui_input_text(user, "Enter the HTTPS URL of the guide catalog.", "Reload Guide Catalog", current_url, 2048, encode = FALSE)
	if(isnull(new_url))
		return
	new_url = trim(new_url)
	if(!length(new_url))
		to_chat(user, span_warning("A guide catalog URL is required."))
		return
	var/list/result = SSguide_catalog.load_catalog(new_url)
	if(!result["success"])
		to_chat(user, span_warning("Guide catalog reload failed: [result["error"]] [SSguide_catalog.catalog_ready ? "The previous catalog remains active." : "The guide browser remains unavailable."]"))
		log_admin("[key_name(user)] failed to reload the guide catalog: [result["error"]]")
		return
	CONFIG_SET(string/guide_catalog_url, new_url)
	SSguide_catalog.commit_catalog(result["candidate"], new_url)
	var/datum/guide_catalog_candidate/candidate = result["candidate"]
	to_chat(user, span_notice("Guide catalog reloaded with [candidate.node_count] nodes. This URL is runtime-only; update config.txt to persist it after restart."))
	log_admin("[key_name(user)] reloaded the guide catalog with [candidate.node_count] nodes.")
	message_admins("[key_name_admin(user)] reloaded the guide catalog with [candidate.node_count] nodes.")
	SSblackbox.record_feedback("nested tally", "admin_verb", 1, list("Reload Guide Catalog"))
