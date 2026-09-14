tamanho = sprite_get_width(spr_transicios);

audio_play_sound(snd_nextfase, 10, false)

cols = ceil(room_width / tamanho);

lins = ceil(room_height / tamanho);

img = 0;

img_vel = sprite_get_speed(spr_transicios) / game_get_speed(gamespeed_fps);

img_num = sprite_get_number(spr_transicios) - 1;

global.nextrm = destino;

entrando = true;

global.fases++
