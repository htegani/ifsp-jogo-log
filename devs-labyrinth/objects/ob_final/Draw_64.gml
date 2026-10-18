if (estado == 2) {
    var w = display_get_gui_width();
    var h = display_get_gui_height();

    // Fundo: a imagem da escola
    draw_sprite_stretched(spr_vitoria, 0, 0, 0, w, h);

    draw_set_font(fnt_quiz);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var msg = "Parabéns! Você venceu!";

    // Sombra preta para o texto ficar legível
    draw_set_color(c_black);
    draw_text_transformed(w / 2 + 3, h * 0.2 + 3, msg, 3, 3, 0);

    // Texto branco
    draw_set_color(c_white);
    draw_text_transformed(w / 2, h * 0.2, msg, 3, 3, 0);

    draw_text(w / 2, h - 40, "Pressione ENTER para jogar novamente");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}