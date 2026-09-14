with(obj_Player)
{
	if place_meeting(x, y, obj_detector1) and keyboard_check(ord("D")) and global.luz < 0.75
	{
		global.luz += 0.01
		
	}
	if keyboard_check(ord("A")) and global.luz > 0
	{
		global.luz -= 0.01
		show_debug_message("deu bom")
	}
}