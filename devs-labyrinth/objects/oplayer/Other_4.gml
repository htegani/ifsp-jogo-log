if (global.spawn_x != -1) {
    x = global.spawn_x;
    y = global.spawn_y;
}

show_debug_message("Entrei em: " + room_get_name(room) + " | x: " + string(x) + " y: " + string(y));

visible = (room != rm_quiz && room != rm_craft);