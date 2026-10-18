function scr_aviso(_x, _y, _msg) {
    draw_set_font(fnt_quiz);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);

    var larg = string_width(_msg) + 16;
    var alt = string_height(_msg) + 8;

    // Limites da área visível da câmera
    var cam = view_camera[0];
    var cx = camera_get_view_x(cam);
    var cy = camera_get_view_y(cam);
    var cw = camera_get_view_width(cam);

    // Prende a caixa dentro da tela
    _x = clamp(_x, cx + larg / 2 + 4, cx + cw - larg / 2 - 4);
    _y = max(_y, cy + alt + 4);

    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(_x - larg / 2, _y - alt, _x + larg / 2, _y, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_text(_x, _y - 4, _msg);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}