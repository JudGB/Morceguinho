if room == rm_level1
{
	if !VinylIsPlaying(snd_musicCave01)
	Music_game = VinylPlayFadeIn(snd_musicCave01, true, global.Music_volume + 0.5)
}