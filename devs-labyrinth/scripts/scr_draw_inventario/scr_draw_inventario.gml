function scr_draw_inventario() {
    var w = display_get_gui_width();
    var h = display_get_gui_height();
    var tam = 64;
    var x1 = w / 2 - tam / 2;
    var y1 = h - tam - 16;

    // Fundo do slot
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(x1, y1, x1 + tam, y1 + tam, false);
    draw_set_alpha(1);

    // Borda
    draw_set_color(c_white);
    draw_rectangle(x1, y1, x1 + tam, y1 + tam, true);

    // Item
    if (global.tem_chave) {
        draw_sprite_stretched(spr_chave, 0, x1 + 6, y1 + 6, tam - 12, tam - 12);
    }

    draw_set_color(c_white);
}