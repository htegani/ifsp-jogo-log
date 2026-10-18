function scr_quiz_finalizar(_venceu) {
    var slot = global.slot_atual;
    var materia = global.quiz_materia;

    if (_venceu) {
        // Concluiu: marca o computador e libera a parte da chave
        global.slot_concluido[slot] = true;
        global.pcs_concluidos += 1;
        global.partes_chave[materia] = true;
    } else {
        // Falhou: o computador some e vai para outra sala sem computador
        var livres = [];
        for (var i = 0; i < global.total_slots; i++) {
            if (!global.slot_pc[i] && i != slot) array_push(livres, i);
        }

        if (array_length(livres) > 0) {
            var novo = livres[irandom(array_length(livres) - 1)];
            global.slot_pc[novo] = true;
            global.slot_materia[novo] = materia;
            global.slot_concluido[novo] = false;

            global.slot_pc[slot] = false;
            global.slot_materia[slot] = -1;
        }
    }

    // Volta para a sala de onde o player veio
    global.spawn_x = global.quiz_ret_x;
    global.spawn_y = global.quiz_ret_y;
    room_goto(global.quiz_sala);
}