if (estado == 0) {
    // Player anda sozinho para frente
    if (oplayer.y > alvo_y) {
        oplayer.y = max(alvo_y, oplayer.y - 2);
    } else {
        estado = 1;
        timer = 5 * room_speed;           // 5 segundos
        with (ob_professor) festa = true;
    }
}
else if (estado == 1) {
    timer -= 1;
    if (timer <= 0) {
        estado = 2;
        with (ob_professor) festa = false;
    }
}
else if (keyboard_check_pressed(vk_enter)) {
    game_restart();   // joga de novo
}