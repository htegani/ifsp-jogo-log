if (global.tem_chave && distance_to_object(oplayer) < dist_interacao) {
    global.tem_chave = false;   // a chave desaparece do inventário

    // Onde o player nasce no rm_final
    global.spawn_x = 480;
    global.spawn_y = 470;

    room_goto(rm_final);
}