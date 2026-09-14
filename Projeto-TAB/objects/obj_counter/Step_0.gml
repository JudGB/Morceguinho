if global.start = false and global.touch = false
{
	Mil += 1
	if Mil = 10
	{
		Mil = 0
		Sec += 1	
	}
	if Sec = 60
	{
		Sec = 0
		Min += 1	
	}
	if Min = 60
	{
		Min = 0
		H += 1	
	}
	
	if Sec < 10{
		global.X = string(Min) + "0" + string(Sec) + string(Mil)		
	}else{
	//Usar o for para armazenar seu tempo 3 vezes
		global.X = string(Min) + string(Sec) + string(Mil)
	}
	
}
if global.touch = true{	
	if ds_list_empty(global.lista) || global.lista[| ds_list_size(global.lista) - 1] != global.X
	{
		ds_list_add(global.lista, global.X)
	}

}

if Min >= 10{
	global.Morreu = true	
	
}

show_debug_message(global.X)