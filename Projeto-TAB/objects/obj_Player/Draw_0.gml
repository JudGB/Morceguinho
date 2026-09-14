
draw_self()
var _d = keyboard_check(ord("D"));
var _a = keyboard_check(ord("A"));

var _xscale = 0.6
var _yscale = 0.6


if keyboard_check(ord("D"))
{
	draw_sprite_ext(spr_seta, 0, x + 50, y, _xscale, _yscale, 0, c_white, 1)
	
}

if keyboard_check(ord("A"))
{
	draw_sprite_ext(spr_seta, 0, x - 50, y, _xscale, _yscale, 180, c_white, 1)
}


if l_dash or dash{
	image_yscale = lerp(image_yscale, 0.55, 0.20)
	
	
}else{
	image_yscale = lerp(image_yscale, 1, 0.15)	
	
}
if u_dash or d_dash{
	image_xscale = lerp(image_xscale, 0.55, 0.20)
	
	
}else{
	image_xscale = lerp(image_xscale, 1, 0.15)	
	
}

if _d or _a{
	sprite_index = spr_Player
}

if keyboard_check(vk_nokey) or keyboard_check(ord("S")){
	sprite_index = spr_Player_fall	
	
}





//Adcionar umas fumças de quando ele der um dash, igual o echos of head
