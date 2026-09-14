//if ds_exists(grid, ds_type_grid){
//	ds_grid_destroy(grid)	
//}

// Clean Up Event
for (var i = 0; i < ds_list_size(lista_chunks); i++) {
    var grid_deletar = lista_chunks[| i];
    if (ds_exists(grid_deletar, ds_type_grid)) {
        ds_grid_destroy(grid_deletar);
    }
}
ds_list_destroy(lista_chunks);
