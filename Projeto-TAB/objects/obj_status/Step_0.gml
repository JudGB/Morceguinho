#region Status

switch (game_status)
{

	case GAME_STATUS.START:
		
		if keyboard_check_pressed(vk_space) and global.start
		{
			global.start = false; //Start
			game_status = GAME_STATUS.GAME
		}
		
	break;
	
	case GAME_STATUS.GAME:
		
		if keyboard_check(vk_space) and !global.start and !global.Morreu
		{
			obj_Player.y -= 3.5 //Pulando	
			obj_Player.image_xscale = lerp(obj_Player.image_xscale, 0.55, 0.40)
		}
	
	break;
}


#endregion


