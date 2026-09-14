if entrando 
{

	img += img_vel
	global.going = true
	show_debug_message("entrando...")
	if img - img_num > cols - 5
	{
		
		if room_exists(destino)
		{
			
			room_goto(destino);
			
			entrando = false;
			if room != rm_end{
				 if global.fases == 3{
					room_goto(rm_end)	 
				 }else{
				
					room_goto(rm_Teste)
				 }
			}
			
		}
	}

}
else
{
	if room == rm_Teste or room == rm_TelaInicial or room = rm_end img -= img_vel;
	
	if img < 0 
	{
		
		global.going = false
		
		instance_destroy();
		
	}
	
}