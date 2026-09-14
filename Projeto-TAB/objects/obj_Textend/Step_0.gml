//iniciando as variaveis 
var _val    = global.lista[| ds_list_size(global.lista) - 1]
var tempo01 = global.lista[| 0]
var tempo02 = global.lista[| 1]
var tempo03 = global.lista[| 2]

//dividindo os valores em Minutos, Segundos e Milesimos
Min  = string_copy(tempo01, 1, 1); Sec  = string_copy(tempo01, 2, 2); Mil  = string_copy(tempo01, 4, 1);
Min2 = string_copy(tempo02, 1, 1); Sec2 = string_copy(tempo02, 2, 2); Mil2 = string_copy(tempo02, 4, 1);
Min3 = string_copy(tempo03, 1, 1); Sec3 = string_copy(tempo03, 2, 2); Mil3 = string_copy(tempo03, 4, 1);

//show_debug_message("Seu tempo1: " + string(Min)  + ":" + string(Sec) + ":"  + string(Mil))
//show_debug_message("Seu tempo2: " + string(Min2) + ":" + string(Sec2) + ":" + string(Mil2))
//show_debug_message("Seu tempo3: " + string(Min3) + ":" + string(Sec3) + ":" + string(Mil3))

//transformando de string em int
var _temp01 = [real(Min) , real(Sec) ]
var _temp02 = [real(Min2), real(Sec2)]
var _temp03 = [real(Min3), real(Sec3)]

show_debug_message(_temp01)
show_debug_message(_temp02)
show_debug_message(_temp03)

//Notas das runs
#region Notas tempo 01
if _temp01[0] == 0 or _temp01[0] == 1 and _temp01[1] <= 50{ //or _temp02 <= 150 or _temp03 <= 150{
	Nota1 = "Nota A"	
	
	
}else{
	if _temp01[0] <= 3 and _temp01[1] <= 50 //or _temp02 <= 035000 or _temp03 <= 035000
	{
		Nota1 = "Nota B"	
		
	}else{

		Nota1 = "Nota C"	
			
	}
}

#endregion
#region Notas tempo 02
if _temp02[0] == 0 or _temp02[0] == 1 and _temp02[1] <= 50 //or _temp02 <= 035000 or _temp03 <= 035000
{
	Nota2 = "Nota A"	
		
}else{
	if _temp02[0] <= 3 and _temp02[1] <= 50 //or _temp02 <= 035000 or _temp03 <= 035000
	{
		Nota2 = "Nota B"	
		
	}else{

		Nota2 = "Nota C"	
			
	}
}

#endregion
#region Notas tempo 03
if _temp03[0] == 0 or _temp03[0] == 1 and _temp03[1] <= 50 //or _temp02 <= 035000 or _temp03 <= 035000
{
	Nota3 = "Nota A"	
		
}else{
	if _temp03[0] <= 3 and _temp03[1] <= 50 //or _temp02 <= 035000 or _temp03 <= 035000
	{
		Nota3 = "Nota B"	
		
	}else{

		Nota3 = "Nota C"	
			
	}
}

#endregion

if (double_click(vk_space, 300) and room == rm_end) 
{
		instance_destroy(obj_Textend)
	    instance_create_depth(0, 0, layer, obj_transicios, {destino: rm_TelaInicial});	
		
		 		
}

//show_debug_message(global.lista[| 1])
//show_debug_message(global.lista[| 2])

