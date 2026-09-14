with(obj_Player)
{
	if place_meeting(x, y, obj_detector2) and keyboard_check(ord("D")) and global.luz < 0.90
	{
		global.luz += 0.005
		
	}
	if keyboard_check(ord("A")) and global.luz > 0.75
	{
		global.luz -= 0.005
		
	}
}