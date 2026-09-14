//// Define qual objeto a câmera vai seguir
//alvo = obj_Player;


//// Define o tamanho da view (quanto o jogador enxerga)
//largura = 630;
//altura = 350;
//x_cam = camera_get_view_width(view_camera[0])

//barra_cam = camera_get_view_border_x(view_camera[0])

//// Centraliza a câmera no jogador
//cam_x = alvo.x - largura / 2;

//cam_y = alvo.y - altura / 2;

//camX_move = false
//CameraNew = 0

move_camera = function()
{
	
	static _larg = 630,	_altu = 350;
	
	var _xCam, _yCam;
	
	_xCam = (obj_Player.x div _larg) * _larg
	_yCam = (obj_Player.y div _altu) * _altu
	
	var _camx = lerp(camera_get_view_x(view_camera[0]), _xCam, .03)
	var _camy = lerp(camera_get_view_y(view_camera[0]), _yCam, .03)
	
	camera_set_view_pos(view_camera[0], _camx, _camy)
	
}