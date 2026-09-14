if array_contains(rooms_menus, room)
{
	
	if keyboard_check_pressed(vk_escape)
	{
		room_goto(rm_TelaInicial)
		//audio_play_sound(snd_EffConfirm, 0, false, global.volume, 0)
	}
}

if global.Sound = true{
	
	audio_pause_all()
}else{
	
	audio_resume_all()
}

if global.Morreu = true{
	if (double_click(vk_space, 300))
	{
			global.DeathCount ++
			room_restart()
	}
}

if room == rm_TelaInicial{
	global.DeathCount = 0
	global.fases      = 0
	ds_list_clear(global.lista)
	
}