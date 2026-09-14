//cell_t = 32
//room_width = cell_t * 40 
//room_height = room_width div 2 
//cell_h = room_width div cell_t + 1;
//cell_v = room_height div cell_t + 1;

//grid = ds_grid_create(cell_h, cell_v);
//ds_grid_clear(grid, 0);

//randomize();
//var dir = irandom(3)
//var xx = cell_h div 2
//var yy = cell_v div 2
//var chances = 1
//var passos = 400

//for(var i = 0; i < passos; i++){
//	if irandom(chances) == chances{
//		dir =irandom(3)	
//	}
	
//	xx += lengthdir_x(1, dir * 90)
//	yy += lengthdir_y(1, dir * 90)
	
//	xx = clamp(xx, 2, cell_h - 2)
//	yy = clamp(yy, 2, cell_v - 2)
	
//	grid[# xx,yy] = 1
//}

//for (var xx = 0; xx < cell_h; xx++){
//	for (var yy = 0; yy < cell_v; yy++){
//		if grid[# xx,yy] == 0{
//			instance_create_layer(xx * cell_t, yy * cell_t, "Instances", obj_Paredes)
//		}
//		if grid[# xx,yy] == 1{
//			var x1 = xx*cell_t 
//			var y1 = yy*cell_t 
//			if (!instance_exists(obj_Player)){
//				instance_create_layer(x1, y1, "Instances", obj_Player)
//			}
//			if (!instance_exists(OCam_control)){
//				instance_create_layer(x1, y1, "Instances", OCam_control)
//			}
//		}
//	}
//}


bloco    = 32  //Isso define o tamnho que a sala vai ser dividida
sala_alt = 4   //Isso define a quantidade de blocos na vertical
sala_lar = 6   //Isso define a quantidade de blocos na horizontal

ds_grid_create(sala_lar, sala_alt)