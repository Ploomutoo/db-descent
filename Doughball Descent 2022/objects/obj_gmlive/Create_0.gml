/// @description Don't forget to place this object in the first room!
// this is a simple safeguard against making multiple obj_gmlive instances
if (instance_number(obj_gmlive) > 1) {
	var first = instance_find(obj_gmlive, 0);
	if (id != first) { instance_destroy(); exit; }
}
#macro live_enabled 1

live_blank_object = oBlank;
live_blank_room = rBlank;

// change IP/port here if you connect to remote gmlive-server:
//live_init(1, "http://localhost:5100", "");

