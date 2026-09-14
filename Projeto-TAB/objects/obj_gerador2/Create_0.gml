#region Gerador de caverna V2.0

//========Criando um gerador de cavernas 2560x1440========//

cell_grid = 32 //Cada quadrado da grid é 32x32
y_grid = 45 //Isso compreende a 45 cell_grid no y (y da sala inteira)
x_grid = 80 //Isso compreende a 80 cell_grid no x (x da sala inteira)
quant_grid = 2 //Quantas grids serão geradas. isso pode ser um "aumentador de dificuldade"já que menos fica menor o espaço

grid = ds_grid_create(x_grid, y_grid) //Agora "grid" é a criação da grid nos tamanhos
ds_grid_clear(grid, 0)//Agora na grid tudo é 0 cada celula

//Agora randomizar as variaveis que fazem os caminhos
randomise()
var _dir = irandom(3) //a direção muda de 1, 2, 3

//Aqui define o ponto de inicio
var _xx = choose(1, 40, 80)
var _yy = choose(1, 22, 45)

//Quantas vezes vão tirar blocos por chunck
var _passos = 250

north = 1
west  = 2
east  = 4
south = 8

var tile_layer = layer_tilemap_get_id("TileAuto")

for(var qg = 0; qg < quant_grid; qg++){
	var _NGrid = ds_grid_create(x_grid, y_grid)
	ds_grid_clear(_NGrid, 0)
	
	//Isso é o caminhar dos bebos
	for (var p = 0; p < _passos; p++){
	
		if irandom(4) == 1
		{
			_dir = irandom(3)
		}
	
		_xx += lengthdir_x(2, _dir * 90) //Vai mudando a direção 
		_yy += lengthdir_y(2, _dir * 90) //Vai mudando a direção 
	
		//Agora impedir que vaze a borda do mapa
		_xx = clamp(_xx, 3, x_grid - 4)
		_yy = clamp(_yy, 3, y_grid - 4)
	
		// Usar choose() dentro da condição do 'for' fazia o tamanho do pincel quebrar no meio do desenho, deixando rastros isolados.
		var _min_x = choose(-2, -1, 0);
		var _min_y = choose(-2, -1, 0);
		
		for(var _gx = _min_x; _gx <= 1; _gx++){
			for(var _gy = _min_y; _gy <= 1; _gy++){
				//Agora de fato transformando a posição que demos de 0 para 1
				var _xturbinado = _xx + _gx
				var _yturbinado = _yy + _gy
				
				if _yturbinado > 1 and _yturbinado < y_grid - 3 {
					if _xturbinado > 1 and _xturbinado < x_grid - 3 {
						
						grid[# _xturbinado, _yturbinado] = 1 		
					}	
				}
			}
		}
		
		
	}
	
}

for (var xx = 0; xx < x_grid; xx++){
	for (var yy = 0; yy < y_grid; yy++){
		//Onde é 0 coloque parede
		if grid[# xx,yy] == 0{
			var norte = grid[# xx,yy - 1] == 0	
			var sul   = grid[# xx,yy + 1] == 0	
			var oeste = grid[# xx - 1,yy] == 0	
			var leste = grid[# xx + 1,yy] == 0	
			
			var tile_index = norte * north + oeste * west + leste * east + sul * south + 1;
			
			tilemap_set(tile_layer, tile_index, xx - 1, yy)
			
		}
	}
}

//Checando as linhas e colunas
for (var xx = 0; xx < x_grid; xx++){
	for (var yy = 0; yy < y_grid; yy++){
		//Onde é 0 coloque parede
		if grid[# xx,yy] == 0{
			//Multiplica pela cell_grid pq xx ta em (0,1) ai multiplicando passa para px
			instance_create_layer(xx * cell_grid, yy * cell_grid, "Instances", obj_Paredes)
		}
		
		//Onde é 1 não tem parede
		if grid[# xx,yy] == 1{
			//Transformando de grid para px
			var x1 = xx*cell_grid 
			var y1 = yy*cell_grid
			
			//Evitar que tenha mais player, só um
			/*Explicando isso:
			  Ele em todos os espaços 1 (vazio) ele cria o player e essa verificação
			  a baixo fala que se ja tiver não cria outro, ou seja cria o player no 1°
			  espaço vazio e quando vai para o 2° ele viu que já existe então não cria 
			  mais*/
			if !instance_exists(obj_Player){
				instance_create_layer(x1, y1, "Instances", obj_Player)
			}
			
			//Camera diferentona (celeste) so ligar ai
			if (!instance_exists(OCam_control)){
				instance_create_layer(x1, y1, "Instances", OCam_control)
			}
			
			//Contador de tempo
			if (!instance_exists(obj_counter)){
				instance_create_layer(x1, y1, "Instances", obj_counter)
			}
			
			//Contador de tempo
			if (!instance_exists(obj_sensores)){
				instance_create_layer(x1, y1, "Instances", obj_sensores)
			}
		}
	}
}

/*Pensar em uma ideia para que não colidem com uma parede, quando tiverem passando para a próxima sala
ideia 1: Pensei em uma cruz que da um bloco onde não gera parede +
	Lado ruim: o player pode usar esse espaço para passar mais rápido
	Lado bom: mais fácil
ideia 2: Fazer a camera descer um pouco antes de atravessar a sala, assim ele ve a ponta do que lhe agurda
*/

#endregion

#region Sistema de busca em largura (BFS)

//Como o obj tá em instância, precisamos pegar seu id para poder pegar sua posição em game
var _player = instance_find(obj_Player, 0)

//Se tiver mesmo o player (!= noone) aquelas variaveis vão ser o x e y do player
//Ele ta transformando sua posição no jogo x = 300 y = 200 e voltando a ser uma celula
if (_player != noone)
{
    xPlayerGrid = floor(_player.x / cell_grid)
    yPlayerGrid = floor(_player.y / cell_grid)
}

//Agora o ponto mais dintante da grid
var distance_grid = ds_grid_create(x_grid, y_grid)
ds_grid_clear(distance_grid, -1)


// Fila
var queue = ds_queue_create()


// Posição inicial
var start = xPlayerGrid + yPlayerGrid * x_grid


// Player = distância 0
distance_grid[# xPlayerGrid, yPlayerGrid] = 0


// Coloca Player na fila
ds_queue_enqueue(queue, start)


// Melhor posição encontrada
var longe_x = xPlayerGrid
var longe_y = yPlayerGrid
var longe_distante = 0


// Direções
var dir_x = [1, -1, 0, 0]
var dir_y = [0, 0, 1, -1]

/*Explicando ↑ tudo:
  Começa que fazemos uma grid por cima de mesmo taamanho e todos os valores são -1
  agora podemos usar o "if grid[# xx, yy] = -1" assim é um "Se é -1 é pq não passei aqui ainda"
  dps criamos uma lista onde usaremos o fifo para exploar e descobrir o caminho mais longe para o
  player.
  "var start = xPlayerGrid + yPlayerGrid * x_grid;" isso é muito importante, o queue não entende (2, 4)
  apenas 0204, então essa formula transforma a grid do player em um id.
  "distance_grid[# xPlayerGrid, yPlayerGrid] = 0;" pegando a posição dele agora e zerando, estamos falando
  que ele esta a 0 passos dele mesmo, vamos e colocamos no final da fila (fifo) "ds_queue_enqueue(queue, start);"
  logo após salvamos o ponto mais distante que no momento é zero.
  "var dir_x = [1, -1, 0, 0]; var dir_y = [0, 0, 1, -1];" são arrays que vão controlar a direção no eixo X e no
  eixo Y, com isso podemos iniciar a caçada ao ponto mais longe*/
  


while (!ds_queue_empty(queue))
{
    var atual = ds_queue_dequeue(queue)

    var atual_x = atual mod x_grid
    var atual_y = floor(atual / x_grid)

    var distancia_atual = distance_grid[# atual_x, atual_y]


    for (var i = 0; i < 4; i++)
    {
        var novo_x = atual_x + dir_x[i]
        var novo_y = atual_y + dir_y[i]


        // Dentro da grid?
        if 
            novo_x >= 0 &&
            novo_x < x_grid &&
            novo_y >= 0 &&
            novo_y < y_grid
   
        {
            // É chão e ainda não visitou?
            if grid[# novo_x, novo_y] == 1 and distance_grid[# novo_x, novo_y] == -1{
                var nova_distancia = distancia_atual + 1

                distance_grid[# novo_x, novo_y] = nova_distancia

                // Coloca na fila
                var nova_pos = novo_x + novo_y * x_grid

                ds_queue_enqueue(queue, nova_pos)

                // É o mais distante?
                if nova_distancia > longe_distante
                {
                    longe_distante = nova_distancia

                    longe_x = novo_x
                    longe_y = novo_y
                }
            }
        }
    }
}
/*Explicando:
  Basicamente começamos com um enquanto tiver canto para olhar não para, seguimos para definir algumas
  coisas muito importantes como, ver a posição atual e destrasformar o 0204 para (2,4) apenas dividindo 
  e com os valores certo aplico na grid e ag tenho a distancia, que nada mais é a posição.
  com o for ele vai checar onde estou e mais as 4 posições ao redor, com isso ele vai aumentando e diminuindo
  apartir do centro (posição player) dando mais valor aos pontos mais longe do centro (posição player) e menos 
  valor quanto mais perto, impondo limites para não ultrapassar a barreira do tamanho da sala.
  "if grid[# novo_x, novo_y] == 1 && distance_grid[# novo_x, novo_y] == -1" agora com tudo olhamos se andou aqui e
  é pisavel essa celula se sim ele visita e atrela o valor especifico e ao fim sempre adcionando na fila e ao final
  so pegando o maior valor, caso ele não seja pisavel ou ja tenha passado, so ignora.*/


//Por fim criamos o objeto na posição correta
if (longe_x != -1)
{
    instance_create_layer(
        longe_x * cell_grid,
        longe_y * cell_grid,
        "Instances",
        obj_End
    );
}

//para não encher a memoria, dps de todo o processo limpa tudo
ds_queue_destroy(queue);
ds_grid_destroy(distance_grid);

#endregion