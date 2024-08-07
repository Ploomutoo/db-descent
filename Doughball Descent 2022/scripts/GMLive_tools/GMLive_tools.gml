// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.

// Most of the functions that you are actually supposed to touch are here
#region live

if (live_enabled) 
function live_temp_path_init() {
	return "gmlive-" + gml_std_Std_stringify(gml_std_Date_now().h_getTime());
}

if (live_enabled) 
function live_script_get_index(l_name) {
	return asset_get_index(l_name);
}

if (live_enabled) 
function live_log_impl(l_v) {
	show_debug_message(l_v);
}

if (live_enabled) 
function live_log(l_s) {
	live_log_script("[live][" + date_datetime_string(gml_std_Date_now().h_date) + "] " + l_s);
}

if (live_enabled) 
function live_update_script_impl_add_source(l_name, l_acc, l_found, l_m) {
	variable_struct_set(l_found.h_obj, l_name, true);
	var l_tokenCount = l_m.h_token_count;
	if (l_tokenCount < 0) return 0;
	var l_tokens = l_m.h_tokens;
	if (l_tokens == undefined) {
		l_tokens = gml_parser_run(l_m);
		if (l_tokens == undefined) {
			l_m.h_token_count = -1;
			return 0;
		}
		l_tokenCount = gml_parser_tokens_found;
		l_m.h_tokens = l_tokens;
		l_m.h_token_count = l_tokenCount;
	}
	ds_list_add(l_acc, l_m);
	live_update_script_impl_index_rec(l_tokens, l_tokenCount, l_acc, l_found);
}

if (live_enabled) 
function live_update_script_impl_index_rec(l_tokens, l_tokensLen, l_acc, l_found) {
	var l_tokensLen1 = l_tokensLen - 1;
	var l_tokensPos = -1;
	var l_macros = live_live_macros;
	var l_enums = live_live_enums;
	while (++l_tokensPos < l_tokensLen) {
		var l_tk = l_tokens[l_tokensPos];
		var l_id;
		if (l_tk.__enumIndex__/* gml_token */ == 11/* ident */) l_id = l_tk.h_id; else continue;
		if (variable_struct_exists(l_found.h_obj, l_id)) continue;
		var l_src = variable_struct_get(l_macros.h_obj, l_id);
		if (l_src != undefined) {
			live_update_script_impl_add_source(l_id, l_acc, l_found, l_src);
			continue;
		}
		l_src = variable_struct_get(l_enums.h_obj, l_id);
		if (l_src != undefined) {
			if (l_tokensPos > 0) {
				var l__g1 = l_tokens[l_tokensPos - 1];
				var l_tmp;
				if (l__g1.__enumIndex__/* gml_token */ == 5/* period */) l_tmp = true; else l_tmp = false;
				if (l_tmp) continue;
			}
			if (l_tokensPos < l_tokensLen1) {
				var l__g3 = l_tokens[l_tokensPos + 1];
				var l_tmp1;
				if (l__g3.__enumIndex__/* gml_token */ == 5/* period */) l_tmp1 = true; else l_tmp1 = false;
				if (l_tmp1) live_update_script_impl_add_source(l_id, l_acc, l_found, l_src);
			}
			continue;
		}
		variable_struct_set(l_found.h_obj, l_id, true);
	}
}

function live_update_script_impl(l_name, l_ident, l_code) {
	if (live_enabled) {
		var l_found = live_async_http_1_found;
		var l_acc = live_async_http_1_acc;
		var l_data = variable_struct_get(live_live_map.h_obj, l_ident);
		if (l_data == undefined) {
			l_data = live_cache_data_create();
			variable_struct_set(live_live_map.h_obj, l_ident, l_data);
		}
		var l_source = new gml_source(l_name, l_code, l_name);
		var l_tokens = gml_parser_run(l_source);
		if (l_tokens == undefined) {
			live_log("Error in " + l_name + ":");
			live_log(gml_parser_error_text);
			return 0;
		}
		l_found.h_clear();
		ds_list_clear(l_acc);
		if (live_live_globals != undefined) ds_list_add(l_acc, live_live_globals);
		l_source.h_tokens = l_tokens;
		l_source.h_token_count = gml_parser_tokens_found;
		live_update_script_impl_index_rec(l_tokens, l_source.h_token_count, l_acc, l_found);
		ds_list_add(l_acc, l_source);
		var l_srci = ds_list_size(l_acc);
		var l_srcs = array_create(l_srci);
		while (--l_srci >= 0) {
			l_srcs[@l_srci] = ds_list_find_value(l_acc, l_srci);
		}
		var l_pg = new gml_program(l_srcs);
		if (!l_pg.h_is_ready) {
			live_log("Error in " + l_name + ":");
			live_log(l_pg.h_error_text);
			l_pg.h_destroy();
			return 0;
		}
		if (l_pg.h_error_text != undefined) {
			live_log("Warning in " + l_name + ":");
			live_log(l_pg.h_error_text);
		}
		l_pg.h_tag = l_name;
		l_pg.h_live_ident = l_ident;
		live_log("Reloaded " + l_name + ".");
		if (l_data[0/* program */] != undefined) l_data[0/* program */].h_destroy();
		l_data[@0/* program */] = l_pg;
	}
}

function sprite_set_live(l_spr, l_live1) {
	if (live_enabled) {
		var l_i;
		if (l_live1) {
			if (ds_map_exists(live_live_sprites, l_spr)) return 0;
			ds_map_set(live_live_sprites, l_spr, true);
			l_i = ds_list_find_index(live_live_sprites_stop, l_spr);
			if (l_i >= 0) ds_list_delete(live_live_sprites_stop, l_i);
			ds_list_add(live_live_sprites_start, l_spr);
		} else {
			if (!ds_map_exists(live_live_sprites, l_spr)) return 0;
			ds_map_delete(live_live_sprites, l_spr);
			l_i = ds_list_find_index(live_live_sprites_start, l_spr);
			if (l_i >= 0) ds_list_delete(live_live_sprites_start, l_i);
			ds_list_add(live_live_sprites_stop, l_spr);
		}
	}
}

function room_set_live(l_rm, l_enable) {
	if (live_enabled) {
		var l_i;
		if (l_enable) {
			if (ds_map_exists(live_live_rooms, l_rm)) return 0;
			ds_map_set(live_live_rooms, l_rm, true);
			l_i = ds_list_find_index(live_live_rooms_stop, l_rm);
			if (l_i >= 0) ds_list_delete(live_live_rooms_stop, l_i);
			ds_list_add(live_live_rooms_start, l_rm);
		} else {
			if (!ds_map_exists(live_live_rooms, l_rm)) return 0;
			ds_map_delete(live_live_rooms, l_rm);
			ds_map_delete(live_live_room_data, l_rm);
			l_i = ds_list_find_index(live_live_rooms_start, l_rm);
			if (l_i >= 0) ds_list_delete(live_live_rooms_start, l_i);
			ds_list_add(live_live_rooms_stop, l_rm);
		}
	}
}

function room_goto_live(l_rm) {
	if (live_enabled) {
		if (ds_map_exists(live_live_rooms, l_rm) && ds_map_exists(live_live_room_data, l_rm)) {
			live_live_room = l_rm;
			if (!room_exists(live_blank_room)) throw gml_std_haxe_Exception_thrown("Please add a completely empty room, add live_room_start(); to it's Creation Code, and assign it to live_blank_room in obj_gmlive's create event.");
			room_goto(live_blank_room);
			return 0;
		}
		room_goto(l_rm);
	}
}

if (live_enabled) 
function live_room_updated_impl(l_rm) {
	room_goto_live(l_rm);
}

function live_constant_add(l_name, l_value) {
	if (live_enabled) {
		gml_const_add(l_name, l_value);
	}
}

function live_constant_delete(l_name) {
	if (live_enabled) {
		return gml_remove_const(l_name);
	} else return false;
}

function live_variable_add(l_signature, l_func) {
	if (live_enabled) {
		gml_var_add(l_signature, l_func);
	}
}

function live_variable_delete(l_name) {
	if (live_enabled) {
		return gml_remove_var(l_name);
	} else return false;
}

function live_function_add(l_signature, l_func) {
	if (live_enabled) {
		var l_s = l_signature;
		var l_p0 = gml_std_string_pos_ext_haxe(l_s, "(") + 1;
		var l_p1 = gml_std_string_pos_ext_haxe(l_s, ")");
		var l_argv = gml_std_StringTools_trim(gml_std_string_substring(l_s, l_p0, l_p1));
		var l_flags = gml_std_string_substring(l_s, l_p1 + 1);
		var l_argc, l_arg1;
		var l_arg0 = -1;
		var l_argt;
		var l_rest = gml_type_check_any;
		if (l_argv == "") {
			l_argc = 0;
			l_arg1 = 0;
			l_argt = array_create(0);
		} else {
			var l_args1 = gml_std_string_split(l_argv, ",");
			l_argc = array_length(l_args1);
			l_arg1 = l_argc;
			l_argt = array_create(l_argc);
			var l_tmap = gml_type_check_map;
			var l_isJS = gml_std_haxe_boot_isJS;
			var l_i = 0;
			for (var l__g1 = l_argc; l_i < l__g1; l_i++) {
				var l_arg = l_args1[l_i];
				var l_pos = gml_std_string_pos_ext_haxe(l_arg, "=");
				var l_opt = false;
				if (l_pos >= 0) {
					l_opt = true;
					l_arg = gml_std_string_substring(l_arg, 0, l_pos);
				} else if (gml_std_string_pos_ext_haxe(l_arg, "...") >= 0) {
					l_arg1 = 81;
					l_argc = -1;
					l_opt = true;
				}
				l_pos = gml_std_string_pos_ext_haxe(l_arg, ":");
				if (l_pos >= 0) {
					if (gml_std_string_pos_ext_haxe(gml_std_string_substring(l_arg, 0, l_pos), "?") >= 0) l_opt = true;
					var l_type = gml_std_StringTools_trim(gml_std_string_substring(l_arg, l_pos + 1));
					if (l_isJS && l_type == "id") l_type = "index";
					if (variable_struct_exists(l_tmap.h_obj, l_type)) {
						var l_tfun = variable_struct_get(l_tmap.h_obj, l_type);
						if (gml_std_string_pos_ext_haxe(l_arg, "...") >= 0) l_rest = l_tfun;
						l_argt[@l_i] = l_tfun;
					} else throw gml_std_haxe_Exception_thrown("\"" + l_type + "\" is not a known type (in argument[" + string(l_i) + "] \"" + l_arg + "\" in \"" + l_signature + "\")");
				} else l_argt[@l_i] = gml_type_check_any;
				if (l_opt && l_arg0 < 0) l_arg0 = l_i;
			}
			if (gml_std_string_pos_ext_haxe(l_argv, "...") >= 0 || gml_std_string_pos_ext_haxe(l_argv, "?") >= 0 || gml_std_string_pos_ext_haxe(l_argv, "=") >= 0) l_argc = -1;
		}
		if (l_argc < 0) {
			if (l_arg0 < 0) l_arg0 = 0;
		} else {
			l_arg1 = l_argc;
			l_arg0 = l_argc;
		}
		var l_i = 0;
		var l_inst = 0;
		if (string_ord_at(l_s, l_i + 1) == 58) {
			l_i++;
			l_inst++;
		}
		if (string_ord_at(l_s, l_i + 1) == 58) {
			l_i++;
			l_inst++;
		}
		if (string_ord_at(l_s, l_i + 1) == 58) {
			l_i++;
			l_inst++;
		}
		if (string_ord_at(l_s, l_i + 1) == 36 && string_ord_at(l_s, l_i + 1 + 1) == 123) {
			var l_k = gml_std_string_pos_ext_haxe(l_s, "}", l_i + 2);
			if (l_k < 0) throw gml_std_haxe_Exception_thrown("Unclosed $(meta)");
			if (gml_std_string_substring(l_s, l_i + 2, l_k) == "raw") l_inst = -5; else throw gml_std_haxe_Exception_thrown("Unknown meta $(" + gml_std_string_substring(l_s, l_i + 2, l_k) + ")");
			l_i = l_k + 1;
		}
		var l_name = gml_parse_name(l_s, l_i);
		if (l_inst != 0) variable_struct_set(gml_inst_data.h_obj, l_name, l_inst);
		variable_struct_set(gml_func_eval.h_obj, l_name, (gml_std_string_pos_ext_haxe(l_flags, "#") >= 0));
		variable_struct_set(gml_func_args.h_obj, l_name, l_argt);
		variable_struct_set(gml_func_rest.h_obj, l_name, l_rest);
		variable_struct_set(gml_func_arg0.h_obj, l_name, l_arg0);
		variable_struct_set(gml_func_arg1.h_obj, l_name, l_arg1);
		variable_struct_set(gml_func_script.h_obj, l_name, l_func);
		variable_struct_set(gml_func_sig.h_obj, l_name, l_s);
	}
}

function live_function_delete(l_name) {
	if (live_enabled) {
		return gml_remove_func(l_name);
	} else return false;
}

function live_throw_error(l_text) {
	if (live_enabled) {
		throw gml_std_haxe_Exception_thrown(l_text);
	}
}

function live_execute_string(l_gml_code) {
	if (false) show_debug_message(argument[argument_count - 1]);
	if (live_enabled) {
		var l_pg = new gml_program([new gml_source("execute_string", l_gml_code, "execute_string")]);
		var l_ok;
		live_custom_self = self;
		live_custom_other = other;
		if (l_pg.h_error_text == undefined) {
			var l_argc = (argument_count - 1);
			var l_argv = array_create(l_argc);
			var l_i = 0;
			var l__ = 0;
			for (var l__g1 = l_argc; l__ < l__g1; l__++) {
				l_argv[@l_i] = argument[l_i + 1];
				l_i++;
			}
			var l_th = l_pg.h_call_v("execute_string", l_argv, false);
			if (l_th.h_status[0]/* gml_thread_status */ == 3/* done */) {
				l_ok = true;
				live_result = l_th.h_result;
			} else {
				l_ok = false;
				live_result = l_th.h_error_text;
				if (live_result == undefined) live_result = "(unknown error)";
			}
		} else {
			l_ok = false;
			live_result = l_pg.h_error_text;
		}
		l_pg.h_destroy();
		return l_ok;
	} else return false;
}

function live_snippet_create(l_gml_code, l_name) {
	if (l_name == undefined) l_name = "snippet";
	if (false) show_debug_message(argument[1]);
	if (live_enabled) {
		var l_pg = new gml_program([new gml_source(l_name, l_gml_code, "snippet")]);
		if (l_pg.h_error_text == undefined) {
			return l_pg;
		} else {
			live_result = l_pg.h_error_text;
			l_pg.h_destroy();
			return undefined;
		}
	} else return undefined;
}

function live_snippet_destroy(l_snippet) {
	if (live_enabled) {
		if (l_snippet.h_script_array != undefined) l_snippet.h_destroy(); else throw gml_std_haxe_Exception_thrown("This snippet is already destroyed");
	}
}

function live_snippet_call(l_snippet) {
	if (false) show_debug_message(argument[argument_count - 1]);
	if (live_enabled) {
		var l_argc = (argument_count - 1);
		var l_argv = array_create(l_argc);
		var l_i = 0;
		var l__ = 0;
		for (var l__g1 = l_argc; l__ < l__g1; l__++) {
			l_argv[@l_i] = argument[l_i + 1];
			l_i++;
		}
		live_custom_self = self;
		live_custom_other = other;
		var l_th = l_snippet.h_call_v("snippet", l_argv, false);
		if (l_th == undefined) {
			live_result = "(script missing)";
			return false;
		} else if (l_th.h_status[0]/* gml_thread_status */ == 3/* done */) {
			live_result = l_th.h_result;
			return true;
		} else {
			live_result = l_th.h_error_text;
			if (live_result == undefined) live_result = "(unknown error)";
			return false;
		}
	} else return false;
}

function live_update() {
	if (live_enabled) {
		if (live_request_url == undefined) return 0;
		if (live_request_id == undefined) {
			var l_now = current_time;
			if (l_now > live_request_time) {
				live_request_time = l_now + live_request_rate * 1000;
				var l_url;
				if (live_request_guid == undefined) {
					l_url = live_request_url + "/init?password=" + live_request_password + "&version=" + string(105) + "&config=" + live_config + "&runtime=" + live_runtime_version + "&buildDate=" + gml_std_Std_stringify(live_build_date);
				} else {
					l_url = live_request_url + "/update?guid=" + ((live_request_guid == undefined ? "null" : live_request_guid));
					var l_sl = live_live_sprites_stop;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&sprites" + string(0) + "=" + sprite_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + sprite_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_sl = live_live_sprites_start;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&sprites" + string(1) + "=" + sprite_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + sprite_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_sl = live_shader_live_shaders_stop;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&shaders" + string(0) + "=" + shader_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + shader_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_sl = live_shader_live_shaders_start;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&shaders" + string(1) + "=" + shader_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + shader_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_rl = live_live_rooms_stop;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&rooms" + string(0) + "=" + room_get_name(ds_list_find_value(l_rl, 0));
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + room_get_name(ds_list_find_value(l_rl, l_i));
						}
						ds_list_clear(l_rl);
					}
					var l_rl = live_live_rooms_start;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&rooms" + string(1) + "=" + room_get_name(ds_list_find_value(l_rl, 0));
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + room_get_name(ds_list_find_value(l_rl, l_i));
						}
						ds_list_clear(l_rl);
					}
				}
				live_request_id = http_get(l_url);
			}
		}
	}
}

function live_init(l_updateRate, l_url, l_password) {
	if (live_enabled) {
		if (l_url != undefined) {
			var l_url_last = string_length(l_url) - 1;
			if (string_ord_at(l_url, l_url_last + 1) == 47) l_url = gml_std_string_substring(l_url, 0, l_url_last);
		}
		live_log("Initializing...");
		live_config = os_get_config();
		live_runtime_version = GM_runtime_version;
		var l_date1 = gml_std_Date_now();
		l_date1.h_date = GM_build_date;
		live_build_date = l_date1.h_getTime();
		live_request_rate = l_updateRate;
		live_request_url = l_url;
		live_request_password = l_password;
		var l_srs = asset_get_index("shader_replace_simple");
		if (l_srs != -1) live_shader_updated = l_srs;
		live_log("Indexing assets...");
		var l_s;
		for (var l_i = 0; sprite_exists(l_i); l_i++) {
			gml_asset_add(sprite_get_name(l_i), l_i);
		}
		for (l_i = 0; font_exists(l_i); l_i++) {
			gml_asset_add(font_get_name(l_i), l_i);
		}
		for (l_i = 0; object_exists(l_i); l_i++) {
			gml_asset_add(object_get_name(l_i), l_i);
		}
		for (l_i = 0; audio_exists(l_i); l_i++) {
			gml_asset_add(audio_get_name(l_i), l_i);
		}
		for (l_i = 0; l_i < 1024 && string_ord_at(tileset_get_name(l_i), 1) != 60; l_i++) {
			gml_asset_add(tileset_get_name(l_i), l_i);
		}
		for (l_i = 0; room_exists(l_i); l_i++) {
			gml_asset_add(room_get_name(l_i), l_i);
		}
		for (l_i = 0; path_exists(l_i); l_i++) {
			gml_asset_add(path_get_name(l_i), l_i);
		}
		for (l_i = 0; timeline_exists(l_i); l_i++) {
			gml_asset_add(timeline_get_name(l_i), l_i);
		}
		for (l_i = 0; l_i < 256; l_i++) {
			l_s = audio_group_name(l_i);
			if (l_s == "<undefined>" || l_s == "" || l_s == undefined) break;
			gml_asset_add(l_s, l_i);
		}
		if (l_url == undefined) for (l_i = 100000; script_exists(l_i); l_i++) {
			l_s = script_get_name(l_i);
			gml_func_add(l_s + "(...)", l_i);
			variable_struct_set(gml_func_script_id.h_obj, l_s, l_i);
		}
		live_log("Indexed OK!");
	}
}

if (live_enabled) 
function live_preinit_project_fake_call() {
	live_name = undefined;
	return false;
}

if (live_enabled) 
function live_preinit_project_lf(l_write, l_val) {
	if (l_write) {
		live_name = l_val;
		return l_val;
	} else return live_name;
}

if (live_enabled) 
function live_preinit_project() {
	gml_var_add("live_name", live_preinit_project_lf);
	gml_const_add("live_result", false);
	gml_func_add("live_call(...):", live_preinit_project_fake_call);
	gml_func_add("live_defcall(...):", live_preinit_project_fake_call);
	gml_func_add("live_call_ext(...):", live_preinit_project_fake_call);
	gml_func_add("live_defcall_ext(...):", live_preinit_project_fake_call);
	gml_func_add("live_method(self, func):", live_method);
	gml_func_add("method(self, func):", live_method);
	gml_func_add("live_method_get_self(func):", live_method_get_self);
	gml_func_add("method_get_self(func):", live_method_get_self);
	gml_func_add("live_execute_string(:string):", live_execute_string);
	gml_func_add("live_snippet_create(:string, :string=\"snippet\"):", live_snippet_create);
	gml_func_add("live_snippet_call(snip, ...rest):", live_snippet_call);
	gml_func_add("live_snippet_destroy(snip):", live_snippet_destroy);
	gml_func_add("sprite_set_live(spr:index, status:bool)", sprite_set_live);
	gml_func_add("shader_set_live(sh:index, status:bool)", sprite_set_live);
	gml_func_add("room_set_live(rm:index, status:bool)", sprite_set_live);
	gml_func_add("room_goto_live(rm:index)", room_goto_live);
}

#endregion
