with(obj_Player)
{
    if place_meeting(x, y, obj_End) 
    {
		global.start = true
		global.going = true

		if (double_click(vk_space, 300))
		{
			 instance_destroy(obj_counter)
			 instance_create_depth(0, 0, layer, obj_transicios, {destino: rm_Teste2});
			 instance_destroy(obj_End);
			 
			
		}
    }
}
