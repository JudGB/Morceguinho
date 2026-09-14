 // Desenhando os tempos e notas
 //nota 01
 if global.going == false{
 
	if Min < 10{
		scribble($"[f_TelaInic]0{Min}:{Sec}:{Mil}").align(fa_center).draw(640,200);
		scribble($"[f_TelaInic]{Nota1}").align(fa_center).draw(640,250);
	}else{
		scribble($"[f_TelaInic]{Min}:{Sec}:{Mil}").align(fa_center).draw(640,200);
		scribble($"[f_TelaInic]{Nota1}").align(fa_center).draw(640,250);	
	}
	
	//nota 02
	if Min2 < 10{
		scribble($"[f_TelaInic]0{Min2}:{Sec2}:{Mil2}").align(fa_center).draw(640,300);
		scribble($"[f_TelaInic]{Nota2}").align(fa_center).draw(640,350);
	}else{
		scribble($"[f_TelaInic]{Min}:{Sec}:{Mil}").align(fa_center).draw(640,200);
		scribble($"[f_TelaInic]{Nota1}").align(fa_center).draw(640,250);	
	}
	
	//nota 03
	if Min3 < 10{
		scribble($"[f_TelaInic]0{Min3}:{Sec3}:{Mil3}").align(fa_center).draw(640,400);
	    scribble($"[f_TelaInic]{Nota3}").align(fa_center).draw(640,450);
	}else{
		scribble($"[f_TelaInic]{Min3}:{Sec3}:{Mil3}").align(fa_center).draw(640,400);
	    scribble($"[f_TelaInic]{Nota3}").align(fa_center).draw(640,450);	
	}
    
	draw_set_colour(c_white)
	
}