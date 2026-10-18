if (global.tem_chave) {
    global.tem_chave = false;   // a chave é usada

    // Onde o player nasce no rm_final (embaixo, no centro)
    global.spawn_x = 480;
    global.spawn_y = 470;

    room_goto(rm_final);
}