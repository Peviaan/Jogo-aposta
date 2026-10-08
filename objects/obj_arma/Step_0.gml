//segue o player
if (instance_exists(dono)) {
	//calcula angulo do mouse
	var _mira_dir = point_direction(dono.x, dono.y, mouse_x, mouse_y);
	image_angle = _mira_dir;
	
	//orbitar o jogador
	x = dono.x + lengthdir_x(distancia_dono, _mira_dir);
	y = dono.y + lengthdir_y(distancia_dono, _mira_dir);
	
	//inverte a arma
	if (_mira_dir > 90 && _mira_dir < 270) {
		image_yscale = -1;
	}else{
		image_yscale = 1;
	}
	
	//atirar
	if (mouse_check_button(mb_left) && can_shoot) {
		can_shoot = false;
		alarm[0] = cadencia;
		
		//calculo do ponto de saida do tiro
		var _offset_x = sprite_width - sprite_xoffset;
		var _offset_y = -3;
		_offset_y *= image_yscale;

		var _cano_x = x + lengthdir_x(_offset_x, image_angle) + lengthdir_x(_offset_y, image_angle - 90);
		var _cano_y = y + lengthdir_y(_offset_x, image_angle) + lengthdir_y(_offset_y, image_angle - 90);

		var _tiro = instance_create_layer(_cano_x, _cano_y, layer, obj_tiro);
		_tiro.direction = image_angle;
		_tiro.image_angle = image_angle;
	}
}