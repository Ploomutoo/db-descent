function tab(_title,_spritepath,_subimages) constructor {
	title = _title
	sprite = sprite_add(_spritepath,_subimages,0,0,0,0)
	path = _spritepath
	subimages = _subimages
	
	switch(_title)
	{
		case "Base":
		originalPath = "PlayerSprites/dewey_idle_base.png"
		break;
		case "Base-Jiggle":
		originalPath = "PlayerSprites/dewey_idle_jiggle.png"
		break;
		case "Bump":
		originalPath = "PlayerSprites/dewey_bump.png"
		break;
		case "Swim":
		originalPath = "PlayerSprites/dewey_swim.png"
		break;
		case "Dead":
		originalPath = "PlayerSprites/dewey_dead.png"
		break
	}
	originalPath = working_directory + originalPath
}


ini_open("PlayerSprites/dewey.ini")
tabs = 
[
	new tab("Base",ini_read_string("Sprites","Base",working_directory + "PlayerSprites/dewey_idle_base.png"),9),
	new tab("Base-Jiggle",ini_read_string("Sprites","Base-Jiggle",working_directory + "PlayerSprites/dewey_idle_jiggle.png"),9),
	new tab("Bump",ini_read_string("Sprites","Bump",working_directory + "PlayerSprites/dewey_bump.png"),1),
	new tab("Swim",ini_read_string("Sprites","Swim",working_directory + "PlayerSprites/dewey_swim.png"),1),
	new tab("Dead",ini_read_string("Sprites","Dead",working_directory + "PlayerSprites/dewey_dead.png"),9)
]
ini_close()
tabSelected = 0

function editorButton(_title,_func) constructor {
	title = _title
	func = _func
}

buttons = 
[
	new editorButton("Upload",function()
	{
		var file = get_open_filename_ext("PNG File | *.png", "", working_directory+"/PlayerSprites", "");
		if file != ""
		{
			tabs[tabSelected].path = file
			show_debug_message(file)
			tabs[tabSelected].sprite = sprite_add(file,tabs[tabSelected].subimages,0,0,0,0)
		}
	}),
	new editorButton("Reset",function()
	{
		ini_open("PlayerSprites/dewey.ini")
		ini_write_string("Sprites",tabs[tabSelected].title,tabs[tabSelected].originalPath)
		ini_close()
		
		tabs[tabSelected].path = tabs[tabSelected].originalPath
		tabs[tabSelected].sprite = sprite_add(tabs[tabSelected].path,tabs[tabSelected].subimages,0,0,0,0)
		soundRand(sndBad)
	}),
	new editorButton("Save",function()
	{
		soundRand(sndDonutSharp)
		ini_open("PlayerSprites/dewey.ini")
		ini_write_string("Sprites",tabs[tabSelected].title,tabs[tabSelected].path)
		ini_close()
	}),
	new editorButton("Clear INI",function()
	{
		ini_open("PlayerSprites/dewey.ini")
		ini_section_delete("Sprites")
		ini_close()
	}),
	new editorButton("Done",function()
	{
		playMusic(musLevel0);
		room_goto(rTitle)
	})
]

playMusic(musPlayerEditor)