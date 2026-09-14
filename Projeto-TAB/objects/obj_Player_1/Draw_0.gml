draw_self()

var _xscale = 1.3
var _yscale = 1.3

if keyboard_check(ord("D"))
{
	draw_sprite_ext(spr_seta, 0, x + 37, y, _xscale, _yscale, 0, c_white, 1)
}

if keyboard_check(ord("A"))
{
	draw_sprite_ext(spr_seta, 0, x - 37, y, _xscale, _yscale, 180, c_white, 1)
}

if l_dash or dash{
	image_yscale = lerp(image_yscale, 0.55, 0.20)
	
	
}else{
	image_yscale = lerp(image_yscale, 1, 0.15)	
	
}




//Adcionar umas fumças de quando ele der um dash, igual o echos of head
