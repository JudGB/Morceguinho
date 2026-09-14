
if global.touch = true
{
		
	draw_set_colour(c_black)
	draw_rectangle(0, 0, room_width, room_height, false)
	draw_set_alpha(.6)
	
	draw_set_colour(c_white)
	scribble($"[f_TelaInic][wave]Your Time[/wave]").align(fa_center).draw(640, 210);
	
	RMin  = string_copy(global.X, 1, 1); RSec  = string_copy(global.X, 2, 2); RMil  = string_copy(global.X, 4, 1);
	
	if RMin < 10{
		scribble($"[f_TelaInic]0{string(RMin) + ":" + string(RSec) + ":" + string(RMil)}").align(fa_center).draw(640, 260);
	}else{
		scribble($"[f_TelaInic]{string(RMin) + ":" + string(RSec) + ":" + string(RMil)}").align(fa_center).draw(640, 260);

	}
}