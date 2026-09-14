rooms_menus = [rm_Config, rm_TelaInicial, rm_creditos];

paused = false//Pausa o game
global.Sound = false//Quando ta pausado em game, clica f1 ele tira o som todo

global.click = false
global.DeathCount = 0 //contado de mortes
global.going = false
global.Morreu = false

global.fases = 0 //contaddor de fases


global.temp_runs = ds_queue_create()
global.lista = ds_list_create()

//ds_list_add(global.lista,"1234", "10234")
contou = false