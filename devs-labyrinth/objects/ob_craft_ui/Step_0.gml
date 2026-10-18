// Progresso atual (0 a 5)
prog = min(global.pcs_concluidos, total);

// Botão só funciona com a barra cheia e a chave ainda não construída
pronto = (prog >= total && !global.chave_construida);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
hover = point_in_rectangle(mx, my, bx1, by1, bx2, by2);

if (pronto && hover && mouse_check_button_pressed(mb_left)) {
    global.tem_chave = true;
    global.chave_construida = true;
}

// ESC sai da máquina e volta ao laboratório
if (keyboard_check_pressed(vk_escape)) {
    global.spawn_x = global.craft_ret_x;
    global.spawn_y = global.craft_ret_y;
    room_goto(rm_lab);
}