//game_roons = rm_level1 or rm_level2 or rm_level3


//if room == rm_level1 or room == rm_level2 or room == rm_level3
//{
//	audio_sound_gain(snd_musicMenu, -1, 500)
	
//	audio_resume_sound(snd_musicCave01)
//	audio_resume_sound(snd_fundomusiccave)
//	audio_resume_sound(snd_fundo2musiccave)
	
	
//}
//else
//{
//	audio_pause_sound(snd_fundo2musiccave)	
//	audio_pause_sound(snd_fundomusiccave)	
//	audio_pause_sound(snd_musicCave01)	
//	audio_resume_sound(snd_musicMenu)
//}



//#region Cave 01

//#region BatFlying
//if footstep_timer > 0
//{
//	    footstep_timer--;
//}
//if footstep_timer = 0
//{
	
//	with (obj_Player)
//	{
	
	
//		if hspd != 0 and !place_meeting(x, y, obj_Paredes) and global.touch = false
//		{
//				audio_play_sound(snd_flying, 2, false)
//		}
//		else
//		{
//			audio_stop_sound(snd_flying)	
//		}
		
		
//	}
//	footstep_timer = 20
//}
//#endregion

//#region dropwater

//if dropwater_timer > 0 and room = rm_level1
//{
//	dropwater_timer --;	
//}

//if dropwater_timer = 0 and global.touch = false
//{
//	audio_play_sound(snd_cave01, 5, false)	
//	dropwater_timer = 780;
//}
//#endregion

//#region Music


//#endregion

//#endregion