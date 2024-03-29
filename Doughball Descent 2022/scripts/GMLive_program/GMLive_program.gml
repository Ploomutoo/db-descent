// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.

// VM "programs"
#region gml.program

if (live_enabled) 
function gml_program(l_sources) constructor {
	static h_sources = undefined;
	static h_script_array = undefined;
	static h_script_map = undefined;
	static h_enum_array = undefined;
	static h_enum_map = undefined;
	static h_macro_map = undefined;
	static h_wait_list = undefined;
	static h_wait_list_swap = undefined;
	static h_callback = undefined;
	static h_time_tag = undefined;
	static h_error_text = undefined;
	static h_error_pos = undefined;
	static h_is_ready = undefined;
	static h_tag = undefined;
	static h_live_ident = undefined;
	static h_error = function(l_text, l_d) {
		var l_pos = l_d;
		self.h_error_text = l_pos.h_to_string() + " " + l_text;
		self.h_error_pos = l_pos;
		return true;
	}
	static h_destroy = function() {
		var l__g = 0;
		var l__g1 = self.h_script_array;
		while (l__g < array_length(l__g1)) {
			var l_q = l__g1[l__g];
			l__g++;
			l_q.h_destroy();
		}
		self.h_script_array = undefined;
		self.h_script_map = undefined;
		self.h_enum_map = undefined;
		self.h_macro_map = undefined;
		ds_list_destroy(self.h_wait_list);
		self.h_wait_list = undefined;
		ds_list_destroy(self.h_wait_list_swap);
		self.h_wait_list_swap = undefined;
	}
	static h_call_v = function(l_name, l_args1, l_copy) {
		if (l_copy == undefined) l_copy = true;
		if (false) show_debug_message(argument[2]);
		if (variable_struct_exists(self.h_script_map.h_obj, l_name)) {
			var l_scr = variable_struct_get(self.h_script_map.h_obj, l_name);
			var l_locals = array_create(l_scr.h_locals);
			if (l_copy) l_args1 = gml_value_list_copy(l_args1);
			gml_value_list_pad_to_size_with_null(l_args1, l_scr.h_arguments);
			var l_th = new gml_thread(self, l_scr.h_actions, l_args1, l_locals);
			l_th.h_callback = self.h_callback;
			l_th.h_time_tag = self.h_time_tag;
			l_th.h_exec();
			return l_th;
		} else return undefined;
	}
	static h_print = function() {
		var l_r = "";
		var l_i = 0;
		for (var l__g1 = array_length(self.h_script_array); l_i < l__g1; l_i++) {
			if (l_i > 0) l_r += "\n";
			var l_scr = self.h_script_array[l_i];
			l_r += "#define " + l_scr.h_name + "\n" + gml_action_list_print(l_scr.h_actions);
		}
		return l_r;
	}
	static h_seek = function(l_f, l_st) {
		if (l_st == undefined) l_st = false;
		if (false) show_debug_message(argument[1]);
		var l_w;
		if (l_st) l_w = ds_list_create(); else l_w = undefined;
		gml_program_seek_func = l_f;
		var l_m = self.h_script_array;
		var l_n = array_length(l_m);
		var l_i = 0;
		while (l_i < l_n) {
			var l_scr = l_m[l_i];
			gml_program_seek_script = l_scr;
			var l_scrNode = l_scr.h_node;
			if (l_scrNode != undefined && l_f(l_scrNode, l_w)) break; else l_i++;
		}
		gml_program_seek_script = undefined;
		gml_program_seek_func = undefined;
		if (l_st) ds_list_destroy(l_w);
		return l_i < l_n;
	}
	static h_check = function() {
		gml_program_seek_inst = self;
		if (self.h_seek(gml_seek_arguments_proc, false)) return true;
		if (self.h_seek(gml_seek_locals_proc, false)) return true;
		if (self.h_seek(gml_seek_idents_proc, true)) return true;
		if (self.h_seek(gml_seek_fields_proc, false)) return true;
		if (self.h_seek(gml_seek_calls_proc, false)) return true;
		if (gml_seek_enum_values_proc()) return true;
		if (self.h_seek(gml_seek_enum_fields_proc, false)) return true;
		if (gml_seek_eval_opt()) return true;
		if (self.h_seek(gml_seek_self_fields_proc, false)) return true;
		if (self.h_seek(gml_seek_alarms_proc, false)) return true;
		if (self.h_seek(gml_seek_adjfix_proc, true)) return true;
		if (self.h_seek(gml_seek_set_op_proc, true)) return true;
		gml_program_seek_inst = undefined;
		return false;
	}
	static h_eval_value = undefined;
	static h_eval = function(l_q) {
		var l_r, l_v;
		var l__g = l_q;
		switch (l__g.__enumIndex__/* gml_node */) {
			case 1/* number */: l_r = l__g.h_value; break;
			case 2/* cstring */: l_r = l__g.h_value; break;
			case 46/* field */:
				var l__hx_tmp = l__g.h_x;
				if (l__hx_tmp.__enumIndex__/* gml_node */ == 12/* ident */) {
					var l_d = l__g.h_d;
					var l_s = l__hx_tmp.h_id;
					var l_f = l__g.h_fd;
					var l_e = variable_struct_get(self.h_enum_map.h_obj, l_s);
					if (l_e != undefined) {
						var l_c = variable_struct_get(l_e.h_ctr_map.h_obj, l_f);
						if (l_c != undefined) {
							l_r = l_c.h_value;
							if (l_r == undefined) return self.h_error("Value of " + l_s + "." + l_f + " is not known here", l_d);
						} else return self.h_error("Enum `" + l_s + "` does not contain field `" + l_f + "`", l_d);
					} else return self.h_error("Could not find enum " + l_s, l_d);
				} else return self.h_error("Can not evaluate this compile-time", gml_std_haxe_enum_tools_getParameter(l_q, 0));
				break;
			case 35/* bin_op */:
				if (self.h_eval(l__g.h_a)) return true;
				l_r = self.h_eval_value;
				if (self.h_eval(l__g.h_b)) return true;
				l_v = self.h_eval_value;
				switch (l__g.h_o) {
					case 16: l_r += l_v; break;
					case 17: l_r -= l_v; break;
					case 0: l_r *= l_v; break;
					case 1: l_r /= l_v; break;
					case 2: l_r %= l_v; break;
					case 3: l_r = (l_r div l_v); break;
					case 49: l_r &= l_v; break;
					case 48: l_r |= l_v; break;
					case 50: l_r ^= l_v; break;
					case 32: l_r = l_r << l_v; break;
					case 33: l_r = l_r >> l_v; break;
					default: return self.h_error("Can not evaluate this compile-time", gml_std_haxe_enum_tools_getParameter(l_q, 0));
				}
				break;
			default: return self.h_error("Can not evaluate this compile-time", gml_std_haxe_enum_tools_getParameter(l_q, 0));
		}
		self.h_eval_value = l_r;
		return false;
	}
	self.h_is_ready = false;
	self.h_error_text = undefined;
	self.h_time_tag = undefined;
	self.h_callback = undefined;
	self.h_wait_list_swap = ds_list_create();
	self.h_wait_list = ds_list_create();
	self.h_macro_map = new haxe_ds_string_map();
	self.h_enum_map = new haxe_ds_string_map();
	self.h_enum_array = [];
	self.h_script_map = new haxe_ds_string_map();
	self.h_script_array = [];
	self.h_sources = undefined;
	self.h_sources = l_sources;
	var l_builders = [];
	var l__g = 0;
	while (l__g < array_length(l_sources)) {
		var l_src = l_sources[l__g];
		l__g++;
		var l_b = new gml_builder(self, l_src);
		gml_std_gml_internal_ArrayImpl_push(l_builders, l_b);
		if (l_b.h_error_text == undefined) {
			var l_main = l_src.h_main;
			var l__g1 = 0;
			var l__g2 = l_b.h_scripts;
			while (l__g1 < array_length(l__g2)) {
				var l_scr = l__g2[l__g1];
				l__g1++;
				if (variable_struct_exists(self.h_script_map.h_obj, l_scr.h_name)) {
					if (l_scr.h_name == l_main) {
						var l__g3 = variable_struct_get(self.h_script_map.h_obj, l_main).h_node;
						var l_tmp;
						if (l__g3.__enumIndex__/* gml_node */ == 102/* block */) l_tmp = array_length(l__g3.h_nodes) == 0; else l_tmp = false;
						if (l_tmp) {
							var l_w = self.h_script_array;
							var l_i = 0;
							var l_n = array_length(l_w);
							while (l_i < l_n) {
								if (l_w[l_i].h_name == l_main) {
									while (++l_i < l_n) {
										l_w[@l_i - 1] = l_w[l_i];
									}
									l_w[@l_n - 1] = l_scr;
								} else l_i++;
							}
							variable_struct_set(self.h_script_map.h_obj, l_scr.h_name, l_scr);
						} else {
							self.h_error("Cannot override prefix-script \"" + l_main + "\" because it is not empty", l_scr.h_pos);
							return 0;
						}
					} else {
						self.h_error("Script " + l_scr.h_name + " is already defined at " + variable_struct_get(self.h_script_map.h_obj, l_scr.h_name).h_pos.h_to_string(), l_scr.h_pos);
						return 0;
					}
				} else {
					gml_std_gml_internal_ArrayImpl_push(self.h_script_array, l_scr);
					variable_struct_set(self.h_script_map.h_obj, l_scr.h_name, l_scr);
				}
			}
			var l__g5 = 0;
			var l__g6 = l_b.h_enums;
			while (l__g5 < array_length(l__g6)) {
				var l_e = l__g6[l__g5];
				l__g5++;
				gml_std_gml_internal_ArrayImpl_push(self.h_enum_array, l_e);
				variable_struct_set(self.h_enum_map.h_obj, l_e.h_name, l_e);
			}
			var l_mcrNames = l_b.h_macro_names;
			var l_mcrNodes = l_b.h_macro_nodes;
			var l_mcrMap = self.h_macro_map;
			var l_i1 = 0;
			for (var l__g8 = array_length(l_mcrNames); l_i1 < l__g8; l_i1++) {
				variable_struct_set(l_mcrMap.h_obj, l_mcrNames[l_i1], l_mcrNodes[l_i1]);
			}
		} else if (l_src.h_opt) {
			var l_errorNext = l_b.h_error_text;
			if (self.h_error_text != undefined) self.h_error_text += "\n" + l_errorNext; else self.h_error_text = l_errorNext;
		} else {
			self.h_error_text = l_b.h_error_text;
			self.h_error_pos = l_b.h_error_pos;
			return 0;
		}
	}
	var l_i;
	var l_n = array_length(self.h_script_array);
	for (l_i = 0; l_i < l_n; l_i++) {
		self.h_script_array[l_i].h_index = gml_script_index_offset + l_i;
	}
	if (self.h_check()) {
		gml_program_seek_inst = undefined;
		return 0;
	} else if (gml_compile_program(self)) {
		if (self.h_error_text != undefined) self.h_error_text += "\n" + gml_compile_error_text; else self.h_error_text = gml_compile_error_text;
		self.h_error_pos = gml_compile_error_pos;
		return 0;
	}
	self.h_is_ready = true;
	static __class__ = mt_gml_program;
}

#endregion
