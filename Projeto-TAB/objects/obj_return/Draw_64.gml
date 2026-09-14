// Se estiver pausado, desenha o print da tela de fundo
if (paused) {
    if (sprite_exists(global.pause_sprite)) {
        draw_sprite(global.pause_sprite, 0, 0, 0);
		draw_set_alpha(.5)
    }

	
    // Desenhe seu menu de pause aqui (Texto, Botões, etc.)
    scribble($"[f_TelaInic][wave]JOGO PAUSADO[/wave]").align(fa_center).draw(640,300);
	draw_set_colour(c_white)
}


