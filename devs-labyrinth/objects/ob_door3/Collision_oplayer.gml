retorno_dx = 0;

if (y < room_height / 2) {
    retorno_dy = 96;    // porta em cima: player reaparece abaixo
} else {
    retorno_dy = -96;   // porta embaixo: player reaparece acima
}

global.ret_sc_x = x + retorno_dx;
global.ret_sc_y = y + retorno_dy;

// Descobre qual das 70 salas é esta
var slot = global.corredor_atual * 10 + (numero_sala - 1);
global.slot_atual = slot;

// Usa o tipo de sala sorteado no início do jogo
var i = global.slot_sala[slot];
destino_room = global.salas[i];
destino_x = global.salas_spawn_x[i];
destino_y = global.salas_spawn_y[i];

// Em vez de event_inherited():
global.spawn_x = destino_x;
global.spawn_y = destino_y;
room_goto(destino_room);