//Persegue o jogador e desvia das paredes
if (instance_exists(obj_player)) {
    mp_potential_step_object(obj_player.x, obj_player.y, velocidade, obj_parede);
}

//Morte
if (vida <= 0) {
    instance_destroy();
}