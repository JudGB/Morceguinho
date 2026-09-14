if array_contains(rooms_menus, room) = false
{
	
	
	paused =! paused
	show_debug_message(paused)
	if paused = true{
		
		global.pause_sprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
		
		instance_deactivate_all(true)
	}else{
	
		 // Deleta o sprite da memória para não dar lag
	    if (sprite_exists(global.pause_sprite)) {
	        sprite_delete(global.pause_sprite);
	    }
		instance_activate_all()	
	}
	
	
	
}


if room == rm_end{
	
	game_end()

}