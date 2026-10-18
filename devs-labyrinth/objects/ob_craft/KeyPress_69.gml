if (distance_to_object(oplayer) < dist_interacao) {
    global.craft_ret_x = oplayer.x;
    global.craft_ret_y = oplayer.y;

    global.spawn_x = oplayer.x;
    global.spawn_y = oplayer.y;

    room_goto(rm_craft);
}