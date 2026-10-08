//direção do angulo
x += lengthdir_x(velocidade, direction);
y += lengthdir_y(velocidade, direction);

//destruir se colidir
if (place_meeting(x, y, obj_parede)) {
	instance_destroy();
}

//destruir por tempo
tempo_de_vida -= 1;
if (tempo_de_vida <= 0) {
	instance_destroy();
}