global.spawn_x = -1;
global.spawn_y = -1;

global.ret_mc_x = -1;   // onde voltar no corredor principal
global.ret_mc_y = -1;
global.ret_sc_x = -1;   // onde voltar no corredor secundário
global.ret_sc_y = -1;

randomize();   // sem isso, o sorteio é igual toda vez que o jogo abre

// Lista das salas possíveis
global.salas = [rm_sala, rm_sala2, rm_sala3, rm_sala4, rm_sala5];

// Onde o player nasce em cada sala (mesma ordem da lista acima)
global.salas_spawn_x = [96, 96, 96, 96, 96];
global.salas_spawn_y = [64, 64, 64, 64, 64];

// ===== MAPA SORTEADO =====
global.total_slots = 70;      // 7 portas x 10 salas
global.total_pcs   = 5;      // computadores no mapa inteiro

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
// Cada computador recebe uma matéria diferente (0 a 4)
global.slot_materia = array_create(global.total_slots, -1);
var materias = [0, 1, 2, 3, 4];
for (var i = array_length(materias) - 1; i > 0; i--) {
    var j = irandom(i);
    var t = materias[i]; materias[i] = materias[j]; materias[j] = t;
}
for (var k = 0; k < global.total_pcs; k++) {
    global.slot_materia[indices[k]] = materias[k];
}

show_debug_message("Slots com PC: " + string(global.slot_pc));


// ===== ROBÔS =====
global.robot_qtd_pequeno = 10;
global.robot_qtd_grande  = 10;
global.robot_respawn_seg = 90;

// Quantos "slots" de robô existem em cada corredor fixo
global.robot_pts_maincorr = 10;
global.robot_pts_sidecorr = 10;

// Slots dos corredores + 1 slot por sala (igual ao sistema de computador)
global.robot_total_pts = global.robot_pts_maincorr + global.robot_pts_sidecorr + global.total_slots;

global.robot_tipo      = array_create(global.robot_total_pts, 0);
global.robot_vivo      = array_create(global.robot_total_pts, false);
global.robot_morreu_em = array_create(global.robot_total_pts, 0);

var idx = [];
for (var i = 0; i < global.robot_total_pts; i++) array_push(idx, i);

for (var i = array_length(idx) - 1; i > 0; i--) {
    var j = irandom(i);
    var t = idx[i]; idx[i] = idx[j]; idx[j] = t;
}

var n = 0;
for (n = 0; n < global.robot_qtd_pequeno; n++) {
    global.robot_tipo[idx[n]] = 1;
    global.robot_vivo[idx[n]] = true;
}
for (; n < global.robot_qtd_pequeno + global.robot_qtd_grande; n++) {
    global.robot_tipo[idx[n]] = 2;
    global.robot_vivo[idx[n]] = true;
}

// ===== QUIZ =====
global.quiz_materia = 0;
global.quiz_sala = rm_lab;
global.quiz_ret_x = 0;
global.quiz_ret_y = 0;
global.partes_chave = array_create(5, false);   // true = parte da chave conquistada
global.quiz_nomes = ["Lógica de Programação", "Desenvolvimento Web", "Arquitetura de Computadores e Redes", "Desenvolvimento", "Matemática"];

// ===== CRAFT =====
global.tem_chave = false;         // chave está no inventário
global.chave_construida = false;  // já construiu alguma vez
global.craft_ret_x = 0;
global.craft_ret_y = 0;