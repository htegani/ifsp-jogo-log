function scr_robot_try_spawn(slot) {
    if (global.robot_tipo[slot] == 0) return;

    if (!global.robot_vivo[slot]) {
        var passado = (current_time - global.robot_morreu_em[slot]) / 1000;
        if (passado >= global.robot_respawn_seg) {
            global.robot_vivo[slot] = true;
        } else {
            return; // ainda no tempo de respawn
        }
    }

    var tentativas = 30;
    var margem = 32;
    var pos_x = -1, pos_y = -1;

    repeat (tentativas) {
        var tx = irandom_range(margem, room_width - margem);
        var ty = irandom_range(margem, room_height - margem);

        // precisa estar livre de paredes/objetos sólidos e longe do player
        if (place_free(tx, ty) && point_distance(tx, ty, oplayer.x, oplayer.y) > 150) {
            pos_x = tx;
            pos_y = ty;
            break;
        }
    }

    if (pos_x == -1) return; // não achou espaço livre nessa tentativa

    var obj = (global.robot_tipo[slot] == 1) ? ob_robo1 : ob_robo2;
    var r = instance_create_layer(pos_x, pos_y, layer, ob_robo1, ob_robo2);
    r.robot_slot = slot;
}