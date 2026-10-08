//input
var _direita = keyboard_check(ord("D"));
var _esquerda = keyboard_check(ord("A"));
var _cima = keyboard_check(ord("W"));
var _baixo = keyboard_check(ord("S"));

//ultima direção
if (keyboard_check_pressed(ord("D"))) ultima_dir_x = 1;
if (keyboard_check_pressed(ord("A"))) ultima_dir_x = -1;
if (keyboard_check_pressed(ord("W"))) ultima_dir_y = -1;
if (keyboard_check_pressed(ord("S"))) ultima_dir_y = 1;

var _input_x = 0;
if (_direita && _esquerda) {
	_input_x = ultima_dir_x;
}else if (_direita) {
	_input_x = 1;
}else if (_esquerda) {
	_input_x = -1;
}

var _input_y = 0;
if (_cima && _baixo) {
	_input_y = ultima_dir_y;
}else if (_baixo) {
	_input_y = 1;
}else if (_cima) {
	_input_y = -1;
}

//problema da diagonal
if (_input_x != 0 || _input_y != 0) {
	var _dir = point_direction(0, 0, _input_x, _input_y);
	vel_x = lengthdir_x(move_speed, _dir);
	vel_y = lengthdir_y(move_speed, _dir);
}else{
	vel_x = 0;
	vel_y = 0;
}

//colisão horizontal
if (place_meeting(x + vel_x, y, obj_parede)) {
	while (!place_meeting(x + sign (vel_x), y, obj_parede)) {
		x += sign (vel_x);
	}
	vel_x = 0;
}
x += vel_x;
	
//colisão vertical
if (place_meeting(x, y + vel_y, obj_parede)) {
    while (!place_meeting(x, y + sign(vel_y), obj_parede)) {
        y += sign(vel_y);
    }
    vel_y = 0;
}
y += vel_y;