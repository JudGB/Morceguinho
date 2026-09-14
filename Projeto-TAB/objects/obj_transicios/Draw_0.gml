
for (var i = 0; i < lins; i ++)
{
	for (var j = 0; j < cols; j ++)
	{
		var _img = min(max(0, img - i), img_num);
		
		draw_sprite_ext(spr_transicios, _img, j * tamanho, i * tamanho, 1, 1, 0, #191919, 1);	
	}
	
}