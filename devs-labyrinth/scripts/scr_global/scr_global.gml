global.spawn_x = -1;
global.spawn_y = -1;

global.ret_mc_x = -1;   // onde voltar no corredor principal
global.ret_mc_y = -1;
global.ret_sc_x = -1;   // onde voltar no corredor secundário
global.ret_sc_y = -1;

randomize();   // sem isso, o sorteio é igual toda vez que o jogo abre

// Lista das salas possíveis
global.salas = [rm_sala, rm_sala2, rm_sala3];

// Onde o player nasce em cada sala (mesma ordem da lista acima)
global.salas_spawn_x = [96, 96, 96];
global.salas_spawn_y = [64, 64, 64];

// ===== MAPA SORTEADO =====
global.total_slots = 35;      // 7 portas x 5 salas
global.total_pcs   = 10;      // computadores no mapa inteiro

global.slot_sala      = [];   // tipo de sala de cada slot (0, 1 ou 2)
global.slot_pc        = [];   // true = tem computador
global.slot_concluido = [];   // true = computador já resolvido

global.slot_atual      = -1;  // slot em que o player está
global.corredor_atual  = 0;   // porta do corredor principal usada (0 a 6)
global.pcs_concluidos  = 0;

for (var i = 0; i < global.total_slots; i++) {
    array_push(global.slot_sala, irandom(array_length(global.salas) - 1));
    array_push(global.slot_pc, false);
    array_push(global.slot_concluido, false);
}

// Embaralha os números 0..34 e pega os 10 primeiros
var indices = [];
for (var i = 0; i < global.total_slots; i++) array_push(indices, i);

for (var i = global.total_slots - 1; i > 0; i--) {
    var j = irandom(i);
    var temp = indices[i];
    indices[i] = indices[j];
    indices[j] = temp;
}

for (var k = 0; k < global.total_pcs; k++) {
    global.slot_pc[indices[k]] = true;
}

show_debug_message("Slots com PC: " + string(global.slot_pc));