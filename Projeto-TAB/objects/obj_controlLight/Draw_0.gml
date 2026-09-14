if !surface_exists(surf)
{
	surf = surface_create(room_width, room_height)	
}
else
{
	surface_set_target(surf);

	draw_clear_alpha(c_black, global.luz);

	//Desenhando o buraco
	gpu_set_blendmode(bm_subtract); 
	//Desenhando os "buracos" da luz
	with(obj_light){
	
		//Desenhar eu mesmo
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * .8, image_yscale * .8, image_angle, c_white, 1)
	}
	
	with (obj_Player){
		
		var _value = random_range(-.05, .05)
		draw_sprite_ext(spr_light, 0, x, y, 2.5 + _value, 1.5 + _value, 0, c_white, .8)	
	}
	//Resetando ele
	gpu_set_blendmode(bm_normal);

	surface_reset_target();
	
	draw_surface(surf, 0, 0);
}