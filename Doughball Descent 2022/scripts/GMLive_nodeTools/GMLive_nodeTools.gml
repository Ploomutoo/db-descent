// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.

// Helpers for AST nodes
#region gml.node_tools

if (live_enabled) 
function gml_node_tools_get_pos_string(l_q) {
	return gml_std_haxe_enum_tools_getParameter(l_q, 0).h_to_string();
}

if (live_enabled) 
function gml_node_tools_unpack(l_q) {
	while (l_q != undefined) {
		var l__g = l_q;
		if (l__g.__enumIndex__/* gml_node */ == 102/* block */) {
			var l__g2 = l__g.h_nodes;
			if (array_length(l__g2) == 1) l_q = l__g2[0]; else return l_q;
		} else return l_q;
	}
	return l_q;
}

if (live_enabled) 
function gml_node_tools_is_statement(l_q) {
	switch (l_q.__enumIndex__/* gml_node */) {
		case 22/* call */: return true;
		case 36/* set_op */: return true;
		case 101/* var_decl */: return true;
		case 32/* prefix */: return true;
		case 33/* postfix */: return true;
		case 102/* block */: return true;
		case 103/* if_then */: return true;
		case 105/* switch */: return true;
		case 112/* for */: return true;
		case 108/* while */: return true;
		case 111/* repeat */: return true;
		case 110/* do_while */: return true;
		case 109/* do_until */: return true;
		case 113/* with */: return true;
		case 117/* break */: return true;
		case 118/* continue */: return true;
		case 116/* exit */: return true;
		case 115/* return */: return true;
		case 106/* wait */: return true;
		case 119/* debugger */: return true;
		case 120/* try_catch */: return true;
		case 121/* throw */: return true;
		default: return false;
	}
}

if (live_enabled) 
function gml_node_tools_is_in_block(l_q, l_p) {
	if (l_p == undefined) return false;
	var l__g = l_p;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 102/* block */: return true;
		case 103/* if_then */: return l_q != l__g.h_cond;
		case 108/* while */: return l_q != l__g.h_cond;
		case 110/* do_while */: return l_q != l__g.h_cond;
		case 109/* do_until */: return l_q != l__g.h_cond;
		case 111/* repeat */: return l_q != l__g.h_times;
		case 112/* for */: return l_q != l__g.h_cond;
		case 105/* switch */: return l_q != l__g.h_expr;
		default: return false;
	}
}

if (live_enabled) 
function gml_node_tools_to_value(l_q) {
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 0/* undefined */: return [undefined];
		case 1/* number */: return [l__g.h_value];
		case 2/* cstring */: return [l__g.h_value];
		case 4/* enum_ctr */: return [l__g.h_ctr.h_value];
		default: return undefined;
	}
}

if (live_enabled) 
function gml_node_tools_has_value(l_q) {
	switch (l_q.__enumIndex__/* gml_node */) {
		case 0/* undefined */: return true;
		case 1/* number */: return true;
		case 2/* cstring */: return true;
		case 4/* enum_ctr */: return true;
		default: return false;
	}
}

if (live_enabled) 
function gml_node_tools_equals_list(l_a, l_b) {
	var l_n = array_length(l_a);
	if (array_length(l_b) != l_n) return false;
	var l_i = 0;
	while (l_i < l_n) {
		if (gml_node_tools_equals(l_a[l_i], l_b[l_i])) l_i++; else return false;
	}
	return true;
}

if (live_enabled) 
function gml_node_tools_equals(l_a, l_b) {
	if (gml_std_Type_enumIndex(l_a) != gml_std_Type_enumIndex(l_b)) return false;
	var l_i, l_n;
	var l__g = l_a;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 0/* undefined */: return true;
		case 14/* other */: return true;
		case 107/* fork */: return true;
		case 119/* debugger */: return true;
		case 15/* global_ref */: return true;
		case 116/* exit */: return true;
		case 118/* continue */: return true;
		case 21/* arg_count */: return true;
		case 117/* break */: return true;
		case 13/* self */: return true;
		case 12/* ident */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 12/* ident */) return l__g.h_id == l__g1.h_id; else return false;
		case 3/* other_const */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 3/* other_const */) return l__g.h_value == l__g1.h_value; else return false;
		case 31/* func_literal */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 31/* func_literal */) return l__g.h_name == l__g1.h_name; else return false;
		case 10/* ensure_array_for_index */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 10/* ensure_array_for_index */) {
				var l_b_arr = l__g1.h_arr;
				var l_b_ind = l__g1.h_ind;
				return gml_node_tools_equals(l__g.h_arr, l_b_arr) && gml_node_tools_equals(l__g.h_ind, l_b_ind);
			} else return false;
		case 9/* ensure_array_for_field */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 9/* ensure_array_for_field */) {
				var l_b_obj = l__g1.h_obj;
				var l_b_fd = l__g1.h_fd;
				return gml_node_tools_equals(l__g.h_obj, l_b_obj) && l__g.h_fd == l_b_fd;
			} else return false;
		case 8/* ensure_array_for_global */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 8/* ensure_array_for_global */) return l__g.h_name == l__g1.h_name; else return false;
		case 7/* ensure_array_for_local */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 7/* ensure_array_for_local */) return l__g.h_name == l__g1.h_name; else return false;
		case 2/* cstring */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 2/* cstring */) return l__g.h_value == l__g1.h_value; else return false;
		case 22/* call */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 22/* call */) {
				var l_b_x = l__g1.h_x;
				var l_b_args = l__g1.h_args;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 23/* call_script */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 23/* call_script */) {
				var l_b_name = l__g1.h_name;
				var l_b_args = l__g1.h_args;
				return l__g.h_name == l_b_name && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 24/* call_script_at */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 24/* call_script_at */) {
				var l_b_inst = l__g1.h_inst;
				var l_b_script = l__g1.h_script;
				var l_b_args = l__g1.h_args;
				return gml_node_tools_equals(l__g.h_inst, l_b_inst) && l__g.h_script == l_b_script && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 25/* call_script_id */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 25/* call_script_id */) {
				var l_b_index = l__g1.h_index;
				var l_b_args = l__g1.h_args;
				return gml_node_tools_equals(l__g.h_index, l_b_index) && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 26/* call_script_with_array */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 26/* call_script_with_array */) {
				var l_b_index = l__g1.h_index;
				var l_b_array = l__g1.h_array;
				return gml_node_tools_equals(l__g.h_index, l_b_index) && gml_node_tools_equals(l__g.h_array, l_b_array);
			} else return false;
		case 27/* call_field */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 27/* call_field */) {
				var l_b_inst = l__g1.h_inst;
				var l_b_prop = l__g1.h_prop;
				var l_b_args = l__g1.h_args;
				return gml_node_tools_equals(l__g.h_inst, l_b_inst) && l__g.h_prop == l_b_prop && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 28/* call_func */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 28/* call_func */) {
				var l_b_funcName = l__g1.h_funcName;
				var l_b_args = l__g1.h_args;
				return l__g.h_funcName == l_b_funcName && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 29/* call_func_at */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 29/* call_func_at */) {
				var l_b_x = l__g1.h_x;
				var l_b_s = l__g1.h_s;
				var l_b_args = l__g1.h_args;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_s == l_b_s && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 30/* construct */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 30/* construct */) {
				var l_b_ctr = l__g1.h_ctr;
				var l_b_args = l__g1.h_args;
				return gml_node_tools_equals(l__g.h_ctr, l_b_ctr) && gml_node_tools_equals_list(l__g.h_args, l_b_args);
			} else return false;
		case 94/* ds_grid_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 94/* ds_grid_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_k = l__g1.h_k;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_inc == l_b_inc;
			} else return false;
		case 32/* prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 32/* prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_inc == l_b_inc;
			} else return false;
		case 33/* postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 33/* postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_inc == l_b_inc;
			} else return false;
		case 11/* ensure_array_for_index2d */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 11/* ensure_array_for_index2d */) {
				var l_b_arr = l__g1.h_arr;
				var l_b_ind1 = l__g1.h_ind1;
				var l_b_ind2 = l__g1.h_ind2;
				return gml_node_tools_equals(l__g.h_arr, l_b_arr) && gml_node_tools_equals(l__g.h_ind1, l_b_ind1) && gml_node_tools_equals(l__g.h_ind2, l_b_ind2);
			} else return false;
		case 35/* bin_op */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 35/* bin_op */) {
				var l_b_o = l__g1.h_o;
				var l_b_a = l__g1.h_a;
				var l_b_b = l__g1.h_b;
				return l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_a, l_b_a) && gml_node_tools_equals(l__g.h_b, l_b_b);
			} else return false;
		case 36/* set_op */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 36/* set_op */) {
				var l_b_o = l__g1.h_o;
				var l_b_a = l__g1.h_a;
				var l_b_b = l__g1.h_b;
				return l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_a, l_b_a) && gml_node_tools_equals(l__g.h_b, l_b_b);
			} else return false;
		case 37/* to_bool */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 37/* to_bool */) return gml_node_tools_equals(l__g.h_v, l__g1.h_v); else return false;
		case 38/* from_bool */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 38/* from_bool */) return gml_node_tools_equals(l__g.h_v, l__g1.h_v); else return false;
		case 39/* in */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 39/* in */) {
				var l_b_fd = l__g1.h_fd;
				var l_b_val = l__g1.h_val;
				var l_b_not = l__g1.h_not;
				return gml_node_tools_equals(l__g.h_fd, l_b_fd) && gml_node_tools_equals(l__g.h_val, l_b_val) && l__g.h_not == l_b_not;
			} else return false;
		case 64/* index_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 64/* index_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 20/* arg_index */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 20/* arg_index */) return gml_node_tools_equals(l__g.h_id, l__g1.h_id); else return false;
		case 19/* arg_const */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 19/* arg_const */) return l__g.h_id == l__g1.h_id; else return false;
		case 1/* number */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 1/* number */) {
				var l_b_value = l__g1.h_value;
				var l_b_src = l__g1.h_src;
				return l__g.h_value == l_b_value && l__g.h_src == l_b_src;
			} else return false;
		case 18/* const */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 18/* const */) return l__g.h_id == l__g1.h_id; else return false;
		case 5/* array_decl */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 5/* array_decl */) return gml_node_tools_equals_list(l__g.h_values, l__g1.h_values); else return false;
		case 49/* env */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 49/* env */) return l__g.h_id == l__g1.h_id; else return false;
		case 16/* script */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 16/* script */) return l__g.h_ref == l__g1.h_ref; else return false;
		case 128/* comment_block_post */:
			var l__g = l_b;
			if (l__g.__enumIndex__/* gml_node */ == 128/* comment_block_post */) {
				var l_b_x = l__g.h_x;
				var l_b_s = l__g.h_s;
				var l_b_pl = l__g.h_pl;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_s == l_b_s && l__g.h_pl == l_b_pl;
			} else return false;
		case 50/* env_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 50/* env_set */) {
				var l_b_id = l__g1.h_id;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 51/* env_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 51/* env_aop */) {
				var l_b_id = l__g1.h_id;
				var l_b_op = l__g1.h_op;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 52/* env_fd */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 52/* env_fd */) {
				var l_b_x = l__g1.h_x;
				var l_b_fd = l__g1.h_fd;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_fd == l_b_fd;
			} else return false;
		case 53/* env_fd_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 53/* env_fd_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_fd = l__g1.h_fd;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_fd == l_b_fd && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 54/* env_fd_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 54/* env_fd_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_fd = l__g1.h_fd;
				var l_b_op = l__g1.h_op;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_fd == l_b_fd && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 55/* env1d */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 55/* env1d */) {
				var l_b_id = l__g1.h_id;
				var l_b_k = l__g1.h_k;
				return l__g.h_id == l_b_id && gml_node_tools_equals(l__g.h_k, l_b_k);
			} else return false;
		case 56/* env1d_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 56/* env1d_set */) {
				var l_b_id = l__g1.h_id;
				var l_b_k = l__g1.h_k;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && gml_node_tools_equals(l__g.h_k, l_b_k) && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 57/* env1d_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 57/* env1d_aop */) {
				var l_b_id = l__g1.h_id;
				var l_b_k = l__g1.h_k;
				var l_b_op = l__g1.h_op;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 58/* alarm */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 58/* alarm */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i);
			} else return false;
		case 59/* alarm_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 59/* alarm_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 60/* alarm_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 60/* alarm_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_op = l__g1.h_op;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 61/* index */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 61/* index */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id);
			} else return false;
		case 62/* index_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 62/* index_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 63/* index_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 63/* index_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 48/* field_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 48/* field_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_fd = l__g1.h_fd;
				var l_b_op = l__g1.h_op;
				var l_b_val = l__g1.h_val;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_fd == l_b_fd && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 65/* index_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 65/* index_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 66/* index2d */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 66/* index2d */) {
				var l_b_x = l__g1.h_x;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2);
			} else return false;
		case 67/* index2d_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 67/* index2d_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 68/* index2d_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 68/* index2d_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 69/* index2d_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 69/* index2d_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_k = l__g1.h_k;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_inc == l_b_inc;
			} else return false;
		case 70/* index2d_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 70/* index2d_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_k = l__g1.h_k;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_inc == l_b_inc;
			} else return false;
		case 71/* raw_id */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 71/* raw_id */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id);
			} else return false;
		case 72/* raw_id_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 72/* raw_id_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 73/* raw_id_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 73/* raw_id_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 74/* raw_id_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 74/* raw_id_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 75/* raw_id_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 75/* raw_id_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 76/* raw_id2d */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 76/* raw_id2d */) {
				var l_b_x = l__g1.h_x;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2);
			} else return false;
		case 77/* raw_id2d_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 77/* raw_id2d_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 78/* raw_id2d_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 78/* raw_id2d_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 79/* raw_id2d_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 79/* raw_id2d_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_k = l__g1.h_k;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_inc == l_b_inc;
			} else return false;
		case 80/* raw_id2d_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 80/* raw_id2d_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_k = l__g1.h_k;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_inc == l_b_inc;
			} else return false;
		case 81/* ds_list */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 81/* ds_list */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_id = l__g1.h_id;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_id, l_b_id);
			} else return false;
		case 82/* ds_list_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 82/* ds_list_set */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_id = l__g1.h_id;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_id, l_b_id) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 83/* ds_list_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 83/* ds_list_aop */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_id = l__g1.h_id;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_id, l_b_id) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 84/* ds_list_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 84/* ds_list_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 85/* ds_list_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 85/* ds_list_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 86/* ds_map */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 86/* ds_map */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_id = l__g1.h_id;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_id, l_b_id);
			} else return false;
		case 87/* ds_map_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 87/* ds_map_set */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_id = l__g1.h_id;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_id, l_b_id) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 88/* ds_map_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 88/* ds_map_aop */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_id = l__g1.h_id;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_id, l_b_id) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 89/* ds_map_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 89/* ds_map_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 90/* ds_map_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 90/* ds_map_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 91/* ds_grid */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 91/* ds_grid */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2);
			} else return false;
		case 92/* ds_grid_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 92/* ds_grid_set */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 93/* ds_grid_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 93/* ds_grid_aop */) {
				var l_b_lx = l__g1.h_lx;
				var l_b_i1 = l__g1.h_i1;
				var l_b_i2 = l__g1.h_i2;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_lx, l_b_lx) && gml_node_tools_equals(l__g.h_i1, l_b_i1) && gml_node_tools_equals(l__g.h_i2, l_b_i2) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 47/* field_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 47/* field_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_fd = l__g1.h_fd;
				var l_b_val = l__g1.h_val;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_fd == l_b_fd && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 46/* field */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 46/* field */) {
				var l_b_x = l__g1.h_x;
				var l_b_fd = l__g1.h_fd;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_fd == l_b_fd;
			} else return false;
		case 95/* ds_grid_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 95/* ds_grid_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_k = l__g1.h_k;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && gml_node_tools_equals(l__g.h_k, l_b_k) && l__g.h_inc == l_b_inc;
			} else return false;
		case 96/* key_id */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 96/* key_id */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id);
			} else return false;
		case 97/* key_id_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 97/* key_id_set */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id) && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 98/* key_id_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 98/* key_id_aop */) {
				var l_b_x = l__g1.h_x;
				var l_b_id = l__g1.h_id;
				var l_b_o = l__g1.h_o;
				var l_b_v = l__g1.h_v;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_id, l_b_id) && l__g.h_o == l_b_o && gml_node_tools_equals(l__g.h_v, l_b_v);
			} else return false;
		case 99/* key_id_prefix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 99/* key_id_prefix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 100/* key_id_postfix */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 100/* key_id_postfix */) {
				var l_b_x = l__g1.h_x;
				var l_b_i = l__g1.h_i;
				var l_b_inc = l__g1.h_inc;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && gml_node_tools_equals(l__g.h_i, l_b_i) && l__g.h_inc == l_b_inc;
			} else return false;
		case 101/* var_decl */:
			var l_a_value = l__g.h_value;
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 101/* var_decl */) {
				var l_b_name = l__g1.h_name;
				var l_b_value = l__g1.h_value;
				if (l__g.h_name == l_b_name) {
					if (l_a_value != undefined) return l_b_value != undefined && gml_node_tools_equals(l_a_value, l_b_value); else return l_b_value == undefined;
				} else return false;
			} else return false;
		case 102/* block */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 102/* block */) return gml_node_tools_equals_list(l__g.h_nodes, l__g1.h_nodes); else return false;
		case 103/* if_then */:
			var l_a_not = l__g.h_not;
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 103/* if_then */) {
				var l_b_cond = l__g1.h_cond;
				var l_b_then = l__g1.h_then;
				var l_b_not = l__g1.h_not;
				if (gml_node_tools_equals(l__g.h_cond, l_b_cond) && gml_node_tools_equals(l__g.h_then, l_b_then)) {
					if (l_a_not != undefined) return l_b_not != undefined && gml_node_tools_equals(l_a_not, l_b_not); else return l_b_not == undefined;
				} else return false;
			} else return false;
		case 104/* ternary */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 104/* ternary */) {
				var l_b_cond = l__g1.h_cond;
				var l_b_then = l__g1.h_then;
				var l_b_not = l__g1.h_not;
				return gml_node_tools_equals(l__g.h_cond, l_b_cond) && gml_node_tools_equals(l__g.h_then, l_b_then) && gml_node_tools_equals(l__g.h_not, l_b_not);
			} else return false;
		case 34/* un_op */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 34/* un_op */) {
				var l_b_x = l__g1.h_x;
				var l_b_o = l__g1.h_o;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_o == l_b_o;
			} else return false;
		case 106/* wait */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 106/* wait */) return gml_node_tools_equals(l__g.h_time, l__g1.h_time); else return false;
		case 108/* while */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 108/* while */) {
				var l_b_cond = l__g1.h_cond;
				var l_b_node = l__g1.h_node;
				return gml_node_tools_equals(l__g.h_cond, l_b_cond) && gml_node_tools_equals(l__g.h_node, l_b_node);
			} else return false;
		case 109/* do_until */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 109/* do_until */) {
				var l_b_node = l__g1.h_node;
				var l_b_cond = l__g1.h_cond;
				return gml_node_tools_equals(l__g.h_node, l_b_node) && gml_node_tools_equals(l__g.h_cond, l_b_cond);
			} else return false;
		case 110/* do_while */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 110/* do_while */) {
				var l_b_node = l__g1.h_node;
				var l_b_cond = l__g1.h_cond;
				return gml_node_tools_equals(l__g.h_node, l_b_node) && gml_node_tools_equals(l__g.h_cond, l_b_cond);
			} else return false;
		case 111/* repeat */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 111/* repeat */) {
				var l_b_times = l__g1.h_times;
				var l_b_node = l__g1.h_node;
				return gml_node_tools_equals(l__g.h_times, l_b_times) && gml_node_tools_equals(l__g.h_node, l_b_node);
			} else return false;
		case 112/* for */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 112/* for */) {
				var l_b_pre = l__g1.h_pre;
				var l_b_cond = l__g1.h_cond;
				var l_b_post = l__g1.h_post;
				var l_b_loop = l__g1.h_loop;
				return gml_node_tools_equals(l__g.h_pre, l_b_pre) && gml_node_tools_equals(l__g.h_cond, l_b_cond) && gml_node_tools_equals(l__g.h_post, l_b_post) && gml_node_tools_equals(l__g.h_loop, l_b_loop);
			} else return false;
		case 113/* with */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 113/* with */) {
				var l_b_ctx = l__g1.h_ctx;
				var l_b_node = l__g1.h_node;
				return gml_node_tools_equals(l__g.h_ctx, l_b_ctx) && gml_node_tools_equals(l__g.h_node, l_b_node);
			} else return false;
		case 114/* once */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 114/* once */) return gml_node_tools_equals(l__g.h_node, l__g1.h_node); else return false;
		case 115/* return */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 115/* return */) return gml_node_tools_equals(l__g.h_v, l__g1.h_v); else return false;
		case 45/* global_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 45/* global_aop */) {
				var l_b_id = l__g1.h_id;
				var l_b_op = l__g1.h_op;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 44/* global_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 44/* global_set */) {
				var l_b_id = l__g1.h_id;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 43/* global */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 43/* global */) return l__g.h_id == l__g1.h_id; else return false;
		case 42/* local_aop */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 42/* local_aop */) {
				var l_b_id = l__g1.h_id;
				var l_b_op = l__g1.h_op;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && l__g.h_op == l_b_op && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 120/* try_catch */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 120/* try_catch */) {
				var l_b_node = l__g1.h_node;
				var l_b_cap = l__g1.h_cap;
				var l_b_cat = l__g1.h_cat;
				return gml_node_tools_equals(l__g.h_node, l_b_node) && l__g.h_cap == l_b_cap && gml_node_tools_equals(l__g.h_cat, l_b_cat);
			} else return false;
		case 41/* local_set */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 41/* local_set */) {
				var l_b_id = l__g1.h_id;
				var l_b_val = l__g1.h_val;
				return l__g.h_id == l_b_id && gml_node_tools_equals(l__g.h_val, l_b_val);
			} else return false;
		case 123/* comment_line_pre */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 123/* comment_line_pre */) {
				var l_b_s = l__g1.h_s;
				var l_b_x = l__g1.h_x;
				return l__g.h_s == l_b_s && gml_node_tools_equals(l__g.h_x, l_b_x);
			} else return false;
		case 124/* comment_line_post */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 124/* comment_line_post */) {
				var l_b_x = l__g1.h_x;
				var l_b_s = l__g1.h_s;
				return gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_s == l_b_s;
			} else return false;
		case 125/* comment_line_sep */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 125/* comment_line_sep */) {
				var l_b_s = l__g1.h_s;
				var l_b_x = l__g1.h_x;
				return l__g.h_s == l_b_s && gml_node_tools_equals(l__g.h_x, l_b_x);
			} else return false;
		case 126/* comment_block */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 126/* comment_block */) return l__g.h_s == l__g1.h_s; else return false;
		case 127/* comment_block_pre */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 127/* comment_block_pre */) {
				var l_b_s = l__g1.h_s;
				var l_b_x = l__g1.h_x;
				var l_b_pl = l__g1.h_pl;
				return l__g.h_s == l_b_s && gml_node_tools_equals(l__g.h_x, l_b_x) && l__g.h_pl == l_b_pl;
			} else return false;
		case 122/* comment_line */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 122/* comment_line */) return l__g.h_s == l__g1.h_s; else return false;
		case 121/* throw */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 121/* throw */) return gml_node_tools_equals(l__g.h_x, l__g1.h_x); else return false;
		case 40/* local */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 40/* local */) return l__g.h_id == l__g1.h_id; else return false;
		case 4/* enum_ctr */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 4/* enum_ctr */) {
				var l_b_e = l__g1.h_e;
				var l_b_ctr = l__g1.h_ctr;
				return l__g.h_e == l_b_e && l__g.h_ctr == l_b_ctr;
			} else return false;
		case 17/* native_script */:
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 17/* native_script */) return l__g.h_name == l__g1.h_name; else return false;
		case 6/* object_decl */:
			var l_m1 = l__g.h_values;
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 6/* object_decl */) {
				var l_k2 = l__g1.h_keys;
				var l_m2 = l__g1.h_values;
				l_n = array_length(l_m1);
				if (array_length(l_m2) == l_n) {
					l_i = 0;
					while (l_i < l_n) {
						if (l__g.h_keys[l_i] == l_k2[l_i] && gml_node_tools_equals(l_m1[l_i], l_m2[l_i])) l_i++; else break;
					}
					return l_i >= l_n;
				} else return false;
			} else return false;
		case 105/* switch */:
			var l_m1 = l__g.h_list;
			var l_o1 = l__g.h_def;
			var l__g1 = l_b;
			if (l__g1.__enumIndex__/* gml_node */ == 105/* switch */) {
				var l_x2 = l__g1.h_expr;
				var l_m2 = l__g1.h_list;
				var l_o2 = l__g1.h_def;
				if (gml_node_tools_equals(l__g.h_expr, l_x2) && (l_o1 != undefined && l_o2 != undefined && gml_node_tools_equals(l_o1, l_o2) || l_o1 == undefined && l_o2 == undefined)) {
					l_n = array_length(l_m1);
					if (array_length(l_m2) != l_n) return false;
					l_i = 0;
					while (l_i < l_n) {
						if (gml_node_tools_equals(l_m1[l_i].expr, l_m2[l_i].expr) && gml_node_tools_equals_list(l_m1[l_i].values, l_m2[l_i].values)) l_i++; else break;
					}
					return l_i >= l_n;
				} else return false;
			} else return false;
	}
}

if (live_enabled) 
function gml_node_tools_clone_opt(l_q) {
	if (l_q != undefined) return gml_node_tools_clone(l_q); else return undefined;
}

if (live_enabled) 
function gml_node_tools_clone(l_q) {
	var l_xw, l_i, l_n, l_fi;
	var l_d = gml_std_haxe_enum_tools_getParameter(l_q, 0);
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 2/* cstring */: return gml_node_cstring(l_d, l__g.h_value);
		case 0/* undefined */: return gml_node_undefined(l_d);
		case 1/* number */: return gml_node_number(l_d, l__g.h_value, l__g.h_src);
		case 6/* object_decl */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_values);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_object_decl(l_d, gml_std_gml_internal_ArrayImpl_slice(l__g.h_keys, 0), l_xw);
		case 7/* ensure_array_for_local */: return gml_node_ensure_array_for_local(l_d, l__g.h_name);
		case 8/* ensure_array_for_global */: return gml_node_ensure_array_for_global(l_d, l__g.h_name);
		case 9/* ensure_array_for_field */: return gml_node_ensure_array_for_field(l_d, gml_node_tools_clone(l__g.h_obj), l__g.h_fd);
		case 10/* ensure_array_for_index */: return gml_node_ensure_array_for_index(l_d, gml_node_tools_clone(l__g.h_arr), gml_node_tools_clone(l__g.h_ind));
		case 3/* other_const */: return gml_node_other_const(l_d, l__g.h_value);
		case 12/* ident */: return gml_node_ident(l_d, l__g.h_id);
		case 14/* other */: return gml_node_other(l_d);
		case 15/* global_ref */: return gml_node_global_ref(l_d);
		case 16/* script */: return gml_node_script(l_d, l__g.h_ref);
		case 5/* array_decl */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_values);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_array_decl(l_d, l_xw);
		case 18/* const */: return gml_node_const(l_d, l__g.h_id);
		case 19/* arg_const */: return gml_node_arg_const(l_d, l__g.h_id);
		case 20/* arg_index */: return gml_node_arg_index(l_d, gml_node_tools_clone(l__g.h_id));
		case 21/* arg_count */: return gml_node_arg_count(l_d);
		case 22/* call */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call(l_d, gml_node_tools_clone(l__g.h_x), l_xw);
		case 23/* call_script */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call_script(l_d, l__g.h_name, l_xw);
		case 24/* call_script_at */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call_script_at(l_d, gml_node_tools_clone(l__g.h_inst), l__g.h_script, l_xw);
		case 25/* call_script_id */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call_script_id(l_d, gml_node_tools_clone(l__g.h_index), l_xw);
		case 26/* call_script_with_array */: return gml_node_call_script_with_array(l_d, gml_node_tools_clone(l__g.h_index), gml_node_tools_clone(l__g.h_array));
		case 27/* call_field */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call_field(l_d, gml_node_tools_clone(l__g.h_inst), l__g.h_prop, l_xw);
		case 28/* call_func */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call_func(l_d, l__g.h_funcName, l_xw);
		case 29/* call_func_at */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_call_func_at(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_s, l_xw);
		case 30/* construct */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_args);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_construct(l_d, gml_node_tools_clone(l__g.h_ctr), l_xw);
		case 31/* func_literal */: return gml_node_func_literal(l_d, l__g.h_name);
		case 32/* prefix */: return gml_node_prefix(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_inc);
		case 33/* postfix */: return gml_node_postfix(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_inc);
		case 11/* ensure_array_for_index2d */: return gml_node_ensure_array_for_index2d(l_d, gml_node_tools_clone(l__g.h_arr), gml_node_tools_clone(l__g.h_ind1), gml_node_tools_clone(l__g.h_ind2));
		case 35/* bin_op */: return gml_node_bin_op(l_d, l__g.h_o, gml_node_tools_clone(l__g.h_a), gml_node_tools_clone(l__g.h_b));
		case 36/* set_op */: return gml_node_set_op(l_d, l__g.h_o, gml_node_tools_clone(l__g.h_a), gml_node_tools_clone(l__g.h_b));
		case 37/* to_bool */: return gml_node_to_bool(l_d, gml_node_tools_clone(l__g.h_v));
		case 38/* from_bool */: return gml_node_from_bool(l_d, gml_node_tools_clone(l__g.h_v));
		case 39/* in */: return gml_node_in(l_d, gml_node_tools_clone(l__g.h_fd), gml_node_tools_clone(l__g.h_val), l__g.h_not);
		case 41/* local_set */: return gml_node_local_set(l_d, l__g.h_id, gml_node_tools_clone(l__g.h_val));
		case 42/* local_aop */: return gml_node_local_aop(l_d, l__g.h_id, l__g.h_op, gml_node_tools_clone(l__g.h_val));
		case 43/* global */: return gml_node_global(l_d, l__g.h_id);
		case 44/* global_set */: return gml_node_global_set(l_d, l__g.h_id, gml_node_tools_clone(l__g.h_val));
		case 45/* global_aop */: return gml_node_global_aop(l_d, l__g.h_id, l__g.h_op, gml_node_tools_clone(l__g.h_val));
		case 46/* field */: return gml_node_field(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_fd);
		case 47/* field_set */: return gml_node_field_set(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_fd, gml_node_tools_clone(l__g.h_val));
		case 48/* field_aop */: return gml_node_field_aop(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_fd, l__g.h_op, gml_node_tools_clone(l__g.h_val));
		case 49/* env */: return gml_node_env(l_d, l__g.h_id);
		case 50/* env_set */: return gml_node_env_set(l_d, l__g.h_id, gml_node_tools_clone(l__g.h_val));
		case 51/* env_aop */: return gml_node_env_aop(l_d, l__g.h_id, l__g.h_op, gml_node_tools_clone(l__g.h_val));
		case 52/* env_fd */: return gml_node_env_fd(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_fd);
		case 53/* env_fd_set */: return gml_node_env_fd_set(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_fd, gml_node_tools_clone(l__g.h_v));
		case 54/* env_fd_aop */: return gml_node_env_fd_aop(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_fd, l__g.h_op, gml_node_tools_clone(l__g.h_v));
		case 55/* env1d */: return gml_node_env1d(l_d, l__g.h_id, gml_node_tools_clone(l__g.h_k));
		case 56/* env1d_set */: return gml_node_env1d_set(l_d, l__g.h_id, gml_node_tools_clone(l__g.h_k), gml_node_tools_clone(l__g.h_val));
		case 57/* env1d_aop */: return gml_node_env1d_aop(l_d, l__g.h_id, gml_node_tools_clone(l__g.h_k), l__g.h_op, gml_node_tools_clone(l__g.h_val));
		case 58/* alarm */: return gml_node_alarm(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i));
		case 59/* alarm_set */: return gml_node_alarm_set(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_v));
		case 60/* alarm_aop */: return gml_node_alarm_aop(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_op, gml_node_tools_clone(l__g.h_v));
		case 61/* index */: return gml_node_index(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id));
		case 62/* index_set */: return gml_node_index_set(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id), gml_node_tools_clone(l__g.h_v));
		case 63/* index_aop */: return gml_node_index_aop(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 64/* index_prefix */: return gml_node_index_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 65/* index_postfix */: return gml_node_index_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 66/* index2d */: return gml_node_index2d(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2));
		case 67/* index2d_set */: return gml_node_index2d_set(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2), gml_node_tools_clone(l__g.h_v));
		case 68/* index2d_aop */: return gml_node_index2d_aop(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 69/* index2d_prefix */: return gml_node_index2d_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_k), l__g.h_inc);
		case 70/* index2d_postfix */: return gml_node_index2d_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_k), l__g.h_inc);
		case 71/* raw_id */: return gml_node_raw_id(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id));
		case 72/* raw_id_set */: return gml_node_raw_id_set(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id), gml_node_tools_clone(l__g.h_v));
		case 73/* raw_id_aop */: return gml_node_raw_id_aop(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 74/* raw_id_prefix */: return gml_node_raw_id_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 75/* raw_id_postfix */: return gml_node_raw_id_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 76/* raw_id2d */: return gml_node_raw_id2d(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2));
		case 77/* raw_id2d_set */: return gml_node_raw_id2d_set(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2), gml_node_tools_clone(l__g.h_v));
		case 78/* raw_id2d_aop */: return gml_node_raw_id2d_aop(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 79/* raw_id2d_prefix */: return gml_node_raw_id2d_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_k), l__g.h_inc);
		case 80/* raw_id2d_postfix */: return gml_node_raw_id2d_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_k), l__g.h_inc);
		case 81/* ds_list */: return gml_node_ds_list(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_id));
		case 82/* ds_list_set */: return gml_node_ds_list_set(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_id), gml_node_tools_clone(l__g.h_v));
		case 83/* ds_list_aop */: return gml_node_ds_list_aop(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_id), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 84/* ds_list_prefix */: return gml_node_ds_list_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 85/* ds_list_postfix */: return gml_node_ds_list_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 86/* ds_map */: return gml_node_ds_map(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_id));
		case 87/* ds_map_set */: return gml_node_ds_map_set(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_id), gml_node_tools_clone(l__g.h_v));
		case 88/* ds_map_aop */: return gml_node_ds_map_aop(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_id), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 89/* ds_map_prefix */: return gml_node_ds_map_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 90/* ds_map_postfix */: return gml_node_ds_map_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 91/* ds_grid */: return gml_node_ds_grid(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2));
		case 92/* ds_grid_set */: return gml_node_ds_grid_set(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2), gml_node_tools_clone(l__g.h_v));
		case 93/* ds_grid_aop */: return gml_node_ds_grid_aop(l_d, gml_node_tools_clone(l__g.h_lx), gml_node_tools_clone(l__g.h_i1), gml_node_tools_clone(l__g.h_i2), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 94/* ds_grid_prefix */: return gml_node_ds_grid_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_k), l__g.h_inc);
		case 95/* ds_grid_postfix */: return gml_node_ds_grid_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), gml_node_tools_clone(l__g.h_k), l__g.h_inc);
		case 96/* key_id */: return gml_node_key_id(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id));
		case 97/* key_id_set */: return gml_node_key_id_set(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id), gml_node_tools_clone(l__g.h_v));
		case 98/* key_id_aop */: return gml_node_key_id_aop(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_id), l__g.h_o, gml_node_tools_clone(l__g.h_v));
		case 99/* key_id_prefix */: return gml_node_key_id_prefix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 100/* key_id_postfix */: return gml_node_key_id_postfix(l_d, gml_node_tools_clone(l__g.h_x), gml_node_tools_clone(l__g.h_i), l__g.h_inc);
		case 101/* var_decl */: return gml_node_var_decl(l_d, l__g.h_name, gml_node_tools_clone_opt(l__g.h_value));
		case 102/* block */:
			l_xw = gml_std_gml_internal_ArrayImpl_copy(l__g.h_nodes);
			l_fi = array_length(l_xw);
			while (--l_fi >= 0) {
				l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
			}
			return gml_node_block(l_d, l_xw);
		case 103/* if_then */: return gml_node_if_then(l_d, gml_node_tools_clone(l__g.h_cond), gml_node_tools_clone(l__g.h_then), gml_node_tools_clone_opt(l__g.h_not));
		case 104/* ternary */: return gml_node_ternary(l_d, gml_node_tools_clone(l__g.h_cond), gml_node_tools_clone(l__g.h_then), gml_node_tools_clone(l__g.h_not));
		case 34/* un_op */: return gml_node_un_op(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_o);
		case 106/* wait */: return gml_node_wait(l_d, gml_node_tools_clone(l__g.h_time));
		case 107/* fork */: return gml_node_fork(l_d);
		case 108/* while */: return gml_node_while(l_d, gml_node_tools_clone(l__g.h_cond), gml_node_tools_clone(l__g.h_node));
		case 109/* do_until */: return gml_node_do_until(l_d, gml_node_tools_clone(l__g.h_node), gml_node_tools_clone(l__g.h_cond));
		case 110/* do_while */: return gml_node_do_while(l_d, gml_node_tools_clone(l__g.h_node), gml_node_tools_clone(l__g.h_cond));
		case 111/* repeat */: return gml_node_repeat(l_d, gml_node_tools_clone(l__g.h_times), gml_node_tools_clone(l__g.h_node));
		case 112/* for */: return gml_node_for(l_d, gml_node_tools_clone(l__g.h_pre), gml_node_tools_clone(l__g.h_cond), gml_node_tools_clone(l__g.h_post), gml_node_tools_clone(l__g.h_loop));
		case 113/* with */: return gml_node_with(l_d, gml_node_tools_clone(l__g.h_ctx), gml_node_tools_clone(l__g.h_node));
		case 114/* once */: return gml_node_once(l_d, gml_node_tools_clone(l__g.h_node));
		case 115/* return */: return gml_node_return(l_d, gml_node_tools_clone(l__g.h_v));
		case 116/* exit */: return gml_node_exit(l_d);
		case 117/* break */: return gml_node_break(l_d);
		case 118/* continue */: return gml_node_continue(l_d);
		case 119/* debugger */: return gml_node_debugger(l_d);
		case 120/* try_catch */: return gml_node_try_catch(l_d, gml_node_tools_clone(l__g.h_node), l__g.h_cap, gml_node_tools_clone(l__g.h_cat));
		case 122/* comment_line */: return gml_node_comment_line(l_d, l__g.h_s);
		case 123/* comment_line_pre */: return gml_node_comment_line_pre(l_d, l__g.h_s, gml_node_tools_clone(l__g.h_x));
		case 124/* comment_line_post */: return gml_node_comment_line_post(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_s);
		case 125/* comment_line_sep */: return gml_node_comment_line_sep(l_d, l__g.h_s, gml_node_tools_clone(l__g.h_x));
		case 126/* comment_block */: return gml_node_comment_block(l_d, l__g.h_s);
		case 127/* comment_block_pre */: return gml_node_comment_block_pre(l_d, l__g.h_s, gml_node_tools_clone(l__g.h_x), l__g.h_pl);
		case 128/* comment_block_post */: return gml_node_comment_block_post(l_d, gml_node_tools_clone(l__g.h_x), l__g.h_s, l__g.h_pl);
		case 121/* throw */: return gml_node_throw(l_d, gml_node_tools_clone(l__g.h_x));
		case 40/* local */: return gml_node_local(l_d, l__g.h_id);
		case 13/* self */: return gml_node_self(l_d);
		case 4/* enum_ctr */: return gml_node_enum_ctr(l_d, l__g.h_e, l__g.h_ctr);
		case 17/* native_script */: return gml_node_native_script(l__g.h_d, l__g.h_name, l__g.h_id);
		case 105/* switch */:
			var l_m = l__g.h_list;
			l_m = gml_std_gml_internal_ArrayImpl_copy(l_m);
			l_n = array_length(l_m);
			for (l_i = 0; l_i < l_n; l_i++) {
				var l_cc = l_m[l_i];
				l_xw = gml_std_gml_internal_ArrayImpl_copy(l_cc.values);
				l_fi = array_length(l_xw);
				while (--l_fi >= 0) {
					l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
				}
				l_cc = { values: l_xw, expr: gml_node_tools_clone(l_cc.expr), pre: l_cc.pre }
				l_m[@l_i] = l_cc;
				l_xw = gml_std_gml_internal_ArrayImpl_copy(l_cc.pre);
				l_fi = array_length(l_xw);
				while (--l_fi >= 0) {
					l_xw[@l_fi] = gml_node_tools_clone(l_xw[l_fi]);
				}
				l_cc.pre = l_xw;
			}
			return gml_node_switch(l__g.h_d, gml_node_tools_clone(l__g.h_expr), l_m, gml_node_tools_clone_opt(l__g.h_def));
	}
}

if (live_enabled) 
function gml_node_tools_seek_all_out(l_q, l_st, l_c, l_si) {
	var l_w, l_i;
	var l_par = ds_list_find_value(l_st, l_si);
	if (l_par == undefined) return false;
	var l__g = l_par;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 102/* block */:
			l_w = l__g.h_nodes;
			l_i = array_length(l_w);
			while (--l_i >= 0) {
				if (l_w[l_i] == l_q) break;
			}
			while (--l_i >= 0) {
				if (l_c(l_w[l_i], undefined)) return true;
			}
			break;
		case 103/* if_then */:
			var l_c1 = l__g.h_cond;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 108/* while */:
			var l_c1 = l__g.h_cond;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 110/* do_while */:
			var l_c1 = l__g.h_node;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 109/* do_until */:
			var l_c1 = l__g.h_node;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 111/* repeat */:
			var l_c1 = l__g.h_times;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 112/* for */:
			var l_c1 = l__g.h_pre;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 105/* switch */:
			var l_c1 = l__g.h_expr;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 113/* with */:
			var l_c1 = l__g.h_ctx;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 124/* comment_line_post */: break;
		case 123/* comment_line_pre */: break;
		case 125/* comment_line_sep */: break;
		case 127/* comment_block_pre */: break;
		case 128/* comment_block_post */: break;
		default: throw gml_std_haxe_Exception_thrown("Can't seekAllOut over " + gml_node_tools_get_pos_string(l_par) + " " + gml_std_Type_enumConstructor(l_par));
	}
	return gml_node_tools_seek_all_out(l_par, l_st, l_c, l_si + 1);
}

if (live_enabled) 
function gml_node_tools_seek_all(l_q, l_st, l_c) {
	if (l_st != undefined) ds_list_insert(l_st, 0, l_q);
	var l_r, l_x, l_w, l_i, l_n;
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 37/* to_bool */: l_r = l_c(l__g.h_v, undefined); break;
		case 115/* return */: l_r = l_c(l__g.h_v, undefined); break;
		case 106/* wait */: l_r = l_c(l__g.h_time, undefined); break;
		case 51/* env_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 124/* comment_line_post */: l_r = l_c(l__g.h_x, undefined); break;
		case 9/* ensure_array_for_field */: l_r = l_c(l__g.h_obj, undefined); break;
		case 121/* throw */: l_r = l_c(l__g.h_x, undefined); break;
		case 125/* comment_line_sep */: l_r = l_c(l__g.h_x, undefined); break;
		case 20/* arg_index */: l_r = l_c(l__g.h_id, undefined); break;
		case 123/* comment_line_pre */: l_r = l_c(l__g.h_x, undefined); break;
		case 44/* global_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 42/* local_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 128/* comment_block_post */: l_r = l_c(l__g.h_x, undefined); break;
		case 114/* once */: l_r = l_c(l__g.h_node, undefined); break;
		case 33/* postfix */: l_r = l_c(l__g.h_x, undefined); break;
		case 41/* local_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 32/* prefix */: l_r = l_c(l__g.h_x, undefined); break;
		case 127/* comment_block_pre */: l_r = l_c(l__g.h_x, undefined); break;
		case 38/* from_bool */: l_r = l_c(l__g.h_v, undefined); break;
		case 45/* global_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 50/* env_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 7/* ensure_array_for_local */: l_r = false; break;
		case 3/* other_const */: l_r = false; break;
		case 122/* comment_line */: l_r = false; break;
		case 31/* func_literal */: l_r = false; break;
		case 117/* break */: l_r = false; break;
		case 118/* continue */: l_r = false; break;
		case 2/* cstring */: l_r = false; break;
		case 119/* debugger */: l_r = false; break;
		case 17/* native_script */: l_r = false; break;
		case 0/* undefined */: l_r = false; break;
		case 8/* ensure_array_for_global */: l_r = false; break;
		case 21/* arg_count */: l_r = false; break;
		case 12/* ident */: l_r = false; break;
		case 19/* arg_const */: l_r = false; break;
		case 116/* exit */: l_r = false; break;
		case 1/* number */: l_r = false; break;
		case 49/* env */: l_r = false; break;
		case 16/* script */: l_r = false; break;
		case 107/* fork */: l_r = false; break;
		case 43/* global */: l_r = false; break;
		case 14/* other */: l_r = false; break;
		case 4/* enum_ctr */: l_r = false; break;
		case 15/* global_ref */: l_r = false; break;
		case 126/* comment_block */: l_r = false; break;
		case 18/* const */: l_r = false; break;
		case 40/* local */: l_r = false; break;
		case 13/* self */: l_r = false; break;
		case 35/* bin_op */:
			switch (l__g.h_o) {
				case 80:
					var l_a = l__g.h_a;
					var l_b = l__g.h_b;
					l_r = l_c(l_a, undefined) && l_c(l_b, undefined);
					break;
				case 96: l_r = l_c(l__g.h_a, undefined); break;
				default:
					var l_l_a = l__g.h_a;
					var l_l_b = l__g.h_b;
					l_r = l_c(l_l_a, undefined) || l_c(l_l_b, undefined);
			}
			break;
		case 6/* object_decl */:
			l_w = l__g.h_values;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], undefined)) break;
			}
			l_r = l_i < l_n;
			break;
		case 5/* array_decl */:
			l_w = l__g.h_values;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], undefined)) break;
			}
			l_r = l_i < l_n;
			break;
		case 101/* var_decl */:
			var l_v = l__g.h_value;
			l_r = l_v != undefined && l_c(l_v, undefined);
			break;
		case 34/* un_op */: l_r = l_c(l__g.h_x, undefined); break;
		case 102/* block */:
			l_w = l__g.h_nodes;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], undefined)) break;
			}
			l_r = l_i < l_n;
			break;
		case 30/* construct */:
			var l_x1 = l__g.h_ctr;
			var l_m = l__g.h_args;
			if (l_c(l_x1, undefined)) {
				l_r = true;
			} else {
				l_w = l_m;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], undefined)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 22/* call */:
			var l_x1 = l__g.h_x;
			var l_m = l__g.h_args;
			if (l_c(l_x1, undefined)) {
				l_r = true;
			} else {
				l_w = l_m;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], undefined)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 25/* call_script_id */:
			var l_x1 = l__g.h_index;
			var l_m = l__g.h_args;
			if (l_c(l_x1, undefined)) {
				l_r = true;
			} else {
				l_w = l_m;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], undefined)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 27/* call_field */:
			var l_x1 = l__g.h_inst;
			var l_m = l__g.h_args;
			if (l_c(l_x1, undefined)) {
				l_r = true;
			} else {
				l_w = l_m;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], undefined)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 24/* call_script_at */:
			var l_x1 = l__g.h_inst;
			var l_m = l__g.h_args;
			if (l_c(l_x1, undefined)) {
				l_r = true;
			} else {
				l_w = l_m;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], undefined)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 29/* call_func_at */:
			var l_x1 = l__g.h_x;
			var l_m = l__g.h_args;
			if (l_c(l_x1, undefined)) {
				l_r = true;
			} else {
				l_w = l_m;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], undefined)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 28/* call_func */:
			l_w = l__g.h_args;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], undefined)) break;
			}
			l_r = l_i < l_n;
			break;
		case 23/* call_script */:
			l_w = l__g.h_args;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], undefined)) break;
			}
			l_r = l_i < l_n;
			break;
		case 26/* call_script_with_array */:
			var l_x1 = l__g.h_index;
			var l_y = l__g.h_array;
			l_r = l_c(l_x1, undefined) || l_c(l_y, undefined);
			break;
		case 103/* if_then */:
			var l_c1 = l__g.h_cond;
			var l_a = l__g.h_then;
			var l_b = l__g.h_not;
			l_r = l_c(l_c1, undefined) || l_b != undefined && l_c(l_a, undefined) && l_c(l_b, undefined);
			break;
		case 104/* ternary */:
			var l_c1 = l__g.h_cond;
			var l_a = l__g.h_then;
			var l_b = l__g.h_not;
			l_r = l_c(l_c1, undefined) || l_c(l_a, undefined) && l_c(l_b, undefined);
			break;
		case 112/* for */:
			var l_x = l__g.h_pre;
			var l_c1 = l__g.h_cond;
			l_r = l_c(l_x, undefined) || l_c(l_c1, undefined);
			break;
		case 108/* while */: l_r = l_c(l__g.h_cond, undefined); break;
		case 113/* with */: l_r = l_c(l__g.h_ctx, undefined); break;
		case 110/* do_while */: l_r = l_c(l__g.h_node, undefined); break;
		case 109/* do_until */: l_r = l_c(l__g.h_node, undefined); break;
		case 111/* repeat */: l_r = l_c(l__g.h_times, undefined); break;
		case 105/* switch */:
			var l__x = l__g.h_expr;
			var l__cc = l__g.h_list;
			var l__d = l__g.h_def;
			if (l_c(l__x, undefined)) {
				l_r = true;
			} else {
				l_x = l__d;
				if (l_x != undefined && l_c(l_x, undefined)) {
					l_n = array_length(l__cc);
					l_i = 0;
					while (l_i < l_n) {
						if (l_c(l_x, undefined)) l_i++; else break;
					}
					l_r = l_i >= l_n;
				} else l_r = false;
			}
			break;
		case 120/* try_catch */:
			var l_x = l__g.h_node;
			var l_e = l__g.h_cat;
			l_r = l_c(l_x, undefined) || l_c(l_e, undefined);
			break;
		case 36/* set_op */:
			var l_l_a = l__g.h_a;
			var l_l_b = l__g.h_b;
			l_r = l_c(l_l_a, undefined) || l_c(l_l_b, undefined);
			break;
		case 39/* in */:
			var l_l_fd = l__g.h_fd;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_fd, undefined) || l_c(l_l_val, undefined);
			break;
		case 55/* env1d */: l_r = l_c(l__g.h_k, undefined); break;
		case 56/* env1d_set */:
			var l_l_k = l__g.h_k;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_k, undefined) || l_c(l_l_val, undefined);
			break;
		case 57/* env1d_aop */:
			var l_l_k = l__g.h_k;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_k, undefined) || l_c(l_l_val, undefined);
			break;
		case 58/* alarm */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 59/* alarm_set */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_v, undefined);
			break;
		case 60/* alarm_aop */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_v, undefined);
			break;
		case 10/* ensure_array_for_index */:
			var l_l_arr = l__g.h_arr;
			var l_l_ind = l__g.h_ind;
			l_r = l_c(l_l_arr, undefined) || l_c(l_l_ind, undefined);
			break;
		case 11/* ensure_array_for_index2d */:
			var l_l_arr = l__g.h_arr;
			var l_l_ind1 = l__g.h_ind1;
			var l_l_ind2 = l__g.h_ind2;
			l_r = l_c(l_l_arr, undefined) || l_c(l_l_ind1, undefined) || l_c(l_l_ind2, undefined);
			break;
		case 61/* index */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined);
			break;
		case 62/* index_set */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 63/* index_aop */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 64/* index_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 65/* index_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 66/* index2d */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined);
			break;
		case 67/* index2d_set */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined) || l_c(l_l_v, undefined);
			break;
		case 68/* index2d_aop */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined) || l_c(l_l_v, undefined);
			break;
		case 69/* index2d_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_k, undefined);
			break;
		case 70/* index2d_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_k, undefined);
			break;
		case 71/* raw_id */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined);
			break;
		case 72/* raw_id_set */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 73/* raw_id_aop */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 74/* raw_id_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 75/* raw_id_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 76/* raw_id2d */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined);
			break;
		case 77/* raw_id2d_set */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined) || l_c(l_l_v, undefined);
			break;
		case 78/* raw_id2d_aop */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined) || l_c(l_l_v, undefined);
			break;
		case 79/* raw_id2d_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_k, undefined);
			break;
		case 80/* raw_id2d_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_k, undefined);
			break;
		case 46/* field */: l_r = l_c(l__g.h_x, undefined); break;
		case 47/* field_set */:
			var l_l_x = l__g.h_x;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_val, undefined);
			break;
		case 48/* field_aop */:
			var l_l_x = l__g.h_x;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_val, undefined);
			break;
		case 52/* env_fd */: l_r = l_c(l__g.h_x, undefined); break;
		case 53/* env_fd_set */:
			var l_l_x = l__g.h_x;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_v, undefined);
			break;
		case 54/* env_fd_aop */:
			var l_l_x = l__g.h_x;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_v, undefined);
			break;
		case 81/* ds_list */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_id, undefined);
			break;
		case 82/* ds_list_set */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 83/* ds_list_aop */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 84/* ds_list_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 85/* ds_list_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 86/* ds_map */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_id, undefined);
			break;
		case 87/* ds_map_set */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 88/* ds_map_aop */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 89/* ds_map_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 90/* ds_map_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 91/* ds_grid */:
			var l_l_lx = l__g.h_lx;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined);
			break;
		case 92/* ds_grid_set */:
			var l_l_lx = l__g.h_lx;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined) || l_c(l_l_v, undefined);
			break;
		case 93/* ds_grid_aop */:
			var l_l_lx = l__g.h_lx;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, undefined) || l_c(l_l_i1, undefined) || l_c(l_l_i2, undefined) || l_c(l_l_v, undefined);
			break;
		case 94/* ds_grid_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_k, undefined);
			break;
		case 95/* ds_grid_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined) || l_c(l_l_k, undefined);
			break;
		case 96/* key_id */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined);
			break;
		case 97/* key_id_set */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 98/* key_id_aop */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_id, undefined) || l_c(l_l_v, undefined);
			break;
		case 99/* key_id_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
		case 100/* key_id_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, undefined) || l_c(l_l_i, undefined);
			break;
	}
	if (l_st != undefined) ds_list_delete(l_st, 0);
	return false;
}

if (live_enabled) 
function gml_node_tools_seek(l_q, l_st, l_c) {
	if (l_st != undefined) ds_list_insert(l_st, 0, l_q);
	var l_r, l_w, l_i, l_n, l_k, l_l;
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 2/* cstring */: l_r = false; break;
		case 0/* undefined */: l_r = false; break;
		case 1/* number */: l_r = false; break;
		case 6/* object_decl */:
			l_w = l__g.h_values;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], l_st)) break;
			}
			l_r = l_i < l_n;
			break;
		case 7/* ensure_array_for_local */: l_r = false; break;
		case 8/* ensure_array_for_global */: l_r = false; break;
		case 9/* ensure_array_for_field */: l_r = l_c(l__g.h_obj, l_st); break;
		case 10/* ensure_array_for_index */:
			var l_l_arr = l__g.h_arr;
			var l_l_ind = l__g.h_ind;
			l_r = l_c(l_l_arr, l_st) || l_c(l_l_ind, l_st);
			break;
		case 3/* other_const */: l_r = false; break;
		case 12/* ident */: l_r = false; break;
		case 14/* other */: l_r = false; break;
		case 15/* global_ref */: l_r = false; break;
		case 16/* script */: l_r = false; break;
		case 5/* array_decl */:
			l_w = l__g.h_values;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], l_st)) break;
			}
			l_r = l_i < l_n;
			break;
		case 18/* const */: l_r = false; break;
		case 19/* arg_const */: l_r = false; break;
		case 20/* arg_index */: l_r = l_c(l__g.h_id, l_st); break;
		case 21/* arg_count */: l_r = false; break;
		case 22/* call */:
			var l_l_x = l__g.h_x;
			var l_l_args = l__g.h_args;
			if (l_c(l_l_x, l_st)) {
				l_r = true;
			} else {
				l_w = l_l_args;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], l_st)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 23/* call_script */:
			l_w = l__g.h_args;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], l_st)) break;
			}
			l_r = l_i < l_n;
			break;
		case 24/* call_script_at */:
			var l_l_inst = l__g.h_inst;
			var l_l_args = l__g.h_args;
			if (l_c(l_l_inst, l_st)) {
				l_r = true;
			} else {
				l_w = l_l_args;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], l_st)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 25/* call_script_id */:
			var l_l_index = l__g.h_index;
			var l_l_args = l__g.h_args;
			if (l_c(l_l_index, l_st)) {
				l_r = true;
			} else {
				l_w = l_l_args;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], l_st)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 26/* call_script_with_array */:
			var l_l_index = l__g.h_index;
			var l_l_array = l__g.h_array;
			l_r = l_c(l_l_index, l_st) || l_c(l_l_array, l_st);
			break;
		case 27/* call_field */:
			var l_l_inst = l__g.h_inst;
			var l_l_args = l__g.h_args;
			if (l_c(l_l_inst, l_st)) {
				l_r = true;
			} else {
				l_w = l_l_args;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], l_st)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 28/* call_func */:
			l_w = l__g.h_args;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], l_st)) break;
			}
			l_r = l_i < l_n;
			break;
		case 29/* call_func_at */:
			var l_l_x = l__g.h_x;
			var l_l_args = l__g.h_args;
			if (l_c(l_l_x, l_st)) {
				l_r = true;
			} else {
				l_w = l_l_args;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], l_st)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 30/* construct */:
			var l_l_ctr = l__g.h_ctr;
			var l_l_args = l__g.h_args;
			if (l_c(l_l_ctr, l_st)) {
				l_r = true;
			} else {
				l_w = l_l_args;
				l_n = array_length(l_w);
				for (l_i = 0; l_i < l_n; l_i++) {
					if (l_c(l_w[l_i], l_st)) break;
				}
				l_r = l_i < l_n;
			}
			break;
		case 31/* func_literal */: l_r = false; break;
		case 32/* prefix */: l_r = l_c(l__g.h_x, l_st); break;
		case 33/* postfix */: l_r = l_c(l__g.h_x, l_st); break;
		case 11/* ensure_array_for_index2d */:
			var l_l_arr = l__g.h_arr;
			var l_l_ind1 = l__g.h_ind1;
			var l_l_ind2 = l__g.h_ind2;
			l_r = l_c(l_l_arr, l_st) || l_c(l_l_ind1, l_st) || l_c(l_l_ind2, l_st);
			break;
		case 35/* bin_op */:
			var l_l_a = l__g.h_a;
			var l_l_b = l__g.h_b;
			l_r = l_c(l_l_a, l_st) || l_c(l_l_b, l_st);
			break;
		case 36/* set_op */:
			var l_l_a = l__g.h_a;
			var l_l_b = l__g.h_b;
			l_r = l_c(l_l_a, l_st) || l_c(l_l_b, l_st);
			break;
		case 37/* to_bool */: l_r = l_c(l__g.h_v, l_st); break;
		case 38/* from_bool */: l_r = l_c(l__g.h_v, l_st); break;
		case 39/* in */:
			var l_l_fd = l__g.h_fd;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_fd, l_st) || l_c(l_l_val, l_st);
			break;
		case 41/* local_set */: l_r = l_c(l__g.h_val, l_st); break;
		case 42/* local_aop */: l_r = l_c(l__g.h_val, l_st); break;
		case 43/* global */: l_r = false; break;
		case 44/* global_set */: l_r = l_c(l__g.h_val, l_st); break;
		case 45/* global_aop */: l_r = l_c(l__g.h_val, l_st); break;
		case 46/* field */: l_r = l_c(l__g.h_x, l_st); break;
		case 47/* field_set */:
			var l_l_x = l__g.h_x;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_val, l_st);
			break;
		case 48/* field_aop */:
			var l_l_x = l__g.h_x;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_val, l_st);
			break;
		case 49/* env */: l_r = false; break;
		case 50/* env_set */: l_r = l_c(l__g.h_val, l_st); break;
		case 51/* env_aop */: l_r = l_c(l__g.h_val, l_st); break;
		case 52/* env_fd */: l_r = l_c(l__g.h_x, l_st); break;
		case 53/* env_fd_set */:
			var l_l_x = l__g.h_x;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_v, l_st);
			break;
		case 54/* env_fd_aop */:
			var l_l_x = l__g.h_x;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_v, l_st);
			break;
		case 55/* env1d */: l_r = l_c(l__g.h_k, l_st); break;
		case 56/* env1d_set */:
			var l_l_k = l__g.h_k;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_k, l_st) || l_c(l_l_val, l_st);
			break;
		case 57/* env1d_aop */:
			var l_l_k = l__g.h_k;
			var l_l_val = l__g.h_val;
			l_r = l_c(l_l_k, l_st) || l_c(l_l_val, l_st);
			break;
		case 58/* alarm */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 59/* alarm_set */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_v, l_st);
			break;
		case 60/* alarm_aop */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_v, l_st);
			break;
		case 61/* index */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st);
			break;
		case 62/* index_set */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 63/* index_aop */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 64/* index_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 65/* index_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 66/* index2d */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st);
			break;
		case 67/* index2d_set */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st) || l_c(l_l_v, l_st);
			break;
		case 68/* index2d_aop */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st) || l_c(l_l_v, l_st);
			break;
		case 69/* index2d_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_k, l_st);
			break;
		case 70/* index2d_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_k, l_st);
			break;
		case 71/* raw_id */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st);
			break;
		case 72/* raw_id_set */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 73/* raw_id_aop */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 74/* raw_id_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 75/* raw_id_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 76/* raw_id2d */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st);
			break;
		case 77/* raw_id2d_set */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st) || l_c(l_l_v, l_st);
			break;
		case 78/* raw_id2d_aop */:
			var l_l_x = l__g.h_x;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st) || l_c(l_l_v, l_st);
			break;
		case 79/* raw_id2d_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_k, l_st);
			break;
		case 80/* raw_id2d_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_k, l_st);
			break;
		case 81/* ds_list */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_id, l_st);
			break;
		case 82/* ds_list_set */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 83/* ds_list_aop */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 84/* ds_list_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 85/* ds_list_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 86/* ds_map */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_id, l_st);
			break;
		case 87/* ds_map_set */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 88/* ds_map_aop */:
			var l_l_lx = l__g.h_lx;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 89/* ds_map_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 90/* ds_map_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 91/* ds_grid */:
			var l_l_lx = l__g.h_lx;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st);
			break;
		case 92/* ds_grid_set */:
			var l_l_lx = l__g.h_lx;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st) || l_c(l_l_v, l_st);
			break;
		case 93/* ds_grid_aop */:
			var l_l_lx = l__g.h_lx;
			var l_l_i1 = l__g.h_i1;
			var l_l_i2 = l__g.h_i2;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_lx, l_st) || l_c(l_l_i1, l_st) || l_c(l_l_i2, l_st) || l_c(l_l_v, l_st);
			break;
		case 94/* ds_grid_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_k, l_st);
			break;
		case 95/* ds_grid_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			var l_l_k = l__g.h_k;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st) || l_c(l_l_k, l_st);
			break;
		case 96/* key_id */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st);
			break;
		case 97/* key_id_set */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 98/* key_id_aop */:
			var l_l_x = l__g.h_x;
			var l_l_id = l__g.h_id;
			var l_l_v = l__g.h_v;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_id, l_st) || l_c(l_l_v, l_st);
			break;
		case 99/* key_id_prefix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 100/* key_id_postfix */:
			var l_l_x = l__g.h_x;
			var l_l_i = l__g.h_i;
			l_r = l_c(l_l_x, l_st) || l_c(l_l_i, l_st);
			break;
		case 101/* var_decl */:
			var l_l_value = l__g.h_value;
			l_r = l_l_value != undefined && l_c(l_l_value, l_st);
			break;
		case 102/* block */:
			l_w = l__g.h_nodes;
			l_n = array_length(l_w);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (l_c(l_w[l_i], l_st)) break;
			}
			l_r = l_i < l_n;
			break;
		case 103/* if_then */:
			var l_l_cond = l__g.h_cond;
			var l_l_then = l__g.h_then;
			var l_l_not = l__g.h_not;
			l_r = l_c(l_l_cond, l_st) || l_c(l_l_then, l_st) || l_l_not != undefined && l_c(l_l_not, l_st);
			break;
		case 104/* ternary */:
			var l_l_cond = l__g.h_cond;
			var l_l_then = l__g.h_then;
			var l_l_not = l__g.h_not;
			l_r = l_c(l_l_cond, l_st) || l_c(l_l_then, l_st) || l_c(l_l_not, l_st);
			break;
		case 34/* un_op */: l_r = l_c(l__g.h_x, l_st); break;
		case 106/* wait */: l_r = l_c(l__g.h_time, l_st); break;
		case 107/* fork */: l_r = false; break;
		case 108/* while */:
			var l_l_cond = l__g.h_cond;
			var l_l_node = l__g.h_node;
			l_r = l_c(l_l_cond, l_st) || l_c(l_l_node, l_st);
			break;
		case 109/* do_until */:
			var l_l_node = l__g.h_node;
			var l_l_cond = l__g.h_cond;
			l_r = l_c(l_l_node, l_st) || l_c(l_l_cond, l_st);
			break;
		case 110/* do_while */:
			var l_l_node = l__g.h_node;
			var l_l_cond = l__g.h_cond;
			l_r = l_c(l_l_node, l_st) || l_c(l_l_cond, l_st);
			break;
		case 111/* repeat */:
			var l_l_times = l__g.h_times;
			var l_l_node = l__g.h_node;
			l_r = l_c(l_l_times, l_st) || l_c(l_l_node, l_st);
			break;
		case 112/* for */:
			var l_l_pre = l__g.h_pre;
			var l_l_cond = l__g.h_cond;
			var l_l_post = l__g.h_post;
			var l_l_loop = l__g.h_loop;
			l_r = l_c(l_l_pre, l_st) || l_c(l_l_cond, l_st) || l_c(l_l_post, l_st) || l_c(l_l_loop, l_st);
			break;
		case 113/* with */:
			var l_l_ctx = l__g.h_ctx;
			var l_l_node = l__g.h_node;
			l_r = l_c(l_l_ctx, l_st) || l_c(l_l_node, l_st);
			break;
		case 114/* once */: l_r = l_c(l__g.h_node, l_st); break;
		case 115/* return */: l_r = l_c(l__g.h_v, l_st); break;
		case 116/* exit */: l_r = false; break;
		case 117/* break */: l_r = false; break;
		case 118/* continue */: l_r = false; break;
		case 119/* debugger */: l_r = false; break;
		case 120/* try_catch */:
			var l_l_node = l__g.h_node;
			var l_l_cat = l__g.h_cat;
			l_r = l_c(l_l_node, l_st) || l_c(l_l_cat, l_st);
			break;
		case 122/* comment_line */: l_r = false; break;
		case 123/* comment_line_pre */: l_r = l_c(l__g.h_x, l_st); break;
		case 124/* comment_line_post */: l_r = l_c(l__g.h_x, l_st); break;
		case 125/* comment_line_sep */: l_r = l_c(l__g.h_x, l_st); break;
		case 126/* comment_block */: l_r = false; break;
		case 127/* comment_block_pre */: l_r = l_c(l__g.h_x, l_st); break;
		case 128/* comment_block_post */: l_r = l_c(l__g.h_x, l_st); break;
		case 121/* throw */: l_r = l_c(l__g.h_x, l_st); break;
		case 40/* local */: l_r = false; break;
		case 13/* self */: l_r = false; break;
		case 4/* enum_ctr */: l_r = false; break;
		case 17/* native_script */: l_r = false; break;
		case 105/* switch */:
			var l_x = l__g.h_expr;
			var l_m = l__g.h_list;
			var l_o = l__g.h_def;
			if (l_c(l_x, l_st)) {
				l_r = true;
			} else {
				l_n = array_length(l_m);
				for (l_i = 0; l_i < l_n; l_i++) {
					l_w = l_m[l_i].values;
					l_l = array_length(l_w);
					for (l_k = 0; l_k < l_l; l_k++) {
						if (l_c(l_w[l_k], l_st)) break;
					}
					if (l_k < l_l || l_c(l_m[l_i].expr, l_st)) break;
				}
				if (l_i < l_n) l_r = true; else l_r = l_o != undefined && l_c(l_o, l_st);
			}
			break;
	}
	if (l_st != undefined) ds_list_delete(l_st, 0);
	return l_r;
}

#endregion
