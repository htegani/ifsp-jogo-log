if (!concluido && distance_to_object(oplayer) < dist_interacao) {
    global.quiz_materia = global.slot_materia[global.slot_atual];
    global.quiz_sala = room;
    global.quiz_ret_x = oplayer.x;
    global.quiz_ret_y = oplayer.y;

    // o player não muda de lugar ao entrar no quiz
    global.spawn_x = oplayer.x;
    global.spawn_y = oplayer.y;

    room_goto(rm_quiz);
}