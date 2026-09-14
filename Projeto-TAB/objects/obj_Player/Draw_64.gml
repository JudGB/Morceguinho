
if global.going = false
{
		
	scribble($"[f_TelaInic]Morreu: [wave]{global.DeathCount}[/wave]").align(fa_right).draw(730, 15);
	
	//scribble($"[f_TelaInic]Dashs: [wave]{Isdash}[/wave]").align(fa_right).draw(155, 75);
	draw_set_colour(c_white)
	
	if global.start = true and global.touch = false{
	
		scribble($"[f_TelaInic][wave][rainbow]FASE {global.fases + 1}[/rainbow][/wave]").scale(3.0).align(fa_center).draw(640,300);
	
		//scribble($"[f_TelaInic]Dashs: [wave]{Isdash}[/wave]").align(fa_right).draw(155, 75);
		draw_set_colour(c_white)
	}
	
}

