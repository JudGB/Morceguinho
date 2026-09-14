global.touch = true

//ds_list_add(tempos_run, {
//	tempo01: global.X,
//	tempo02: global.X,
//	tempo03: global.X
//	})
	
//var _val = tempos_run[| ds_list_size(tempos_run) - 1]

//Min = string_copy(_val.tempo01, 1, 2); Sec = string_copy(_val.tempo01, 3, 2); Mil = string_copy(_val.tempo01, 5, 2)
//Min2 = string_copy(_val.tempo02, 1, 2); Sec2 = string_copy(_val.tempo02, 3, 2); Mil2 = string_copy(_val.tempo02, 5, 2)
//Min3 = string_copy(_val.tempo03, 1, 2); Sec3 = string_copy(_val.tempo03, 3, 2); Mil3 = string_copy(_val.tempo03, 5, 2)

//show_debug_message("Seu tempo1: " + string(Min) + ":" + string(Sec) + ":" + string(Mil))
//show_debug_message("Seu tempo2: " + string(Min2) + ":" + string(Sec2) + ":" + string(Mil2))
//show_debug_message("Seu tempo3: " + string(Min3) + ":" + string(Sec3) + ":" + string(Mil3))


//Pensoi assim, primeiro tenho que definir algo que possibilite ele adcionar só um valor
//tipo já adcionou? ntão para, pq como renicia ele add de novo, mas o valor se mantém

ds_queue_enqueue(global.temp_runs, global.X)

