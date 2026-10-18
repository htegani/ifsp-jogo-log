// Computador já usado fica cinza
image_blend = concluido ? c_gray : c_white;
draw_self();

// Aviso quando o player está perto
if (!concluido && distance_to_object(oplayer) < dist_interacao) {
    draw_set_font(fnt_quiz);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);

    var tx = x;
    var ty = bbox_top - 8;   // logo acima do computador
    var msg = "Pressione \"E\" para acessar";

    // Fundo do aviso
    var larg = string_width(msg) + 16;
    var alt = string_height(msg) + 8;
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(tx - larg / 2, ty - alt, tx + larg / 2, ty, false);
    draw_set_alpha(1);

    // Texto
    draw_set_color(c_white);
    draw_text(tx, ty - 4, msg);

    // Volta as configurações ao normal
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}