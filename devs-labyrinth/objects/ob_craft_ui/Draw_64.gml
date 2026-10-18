var w = display_get_gui_width();
var h = display_get_gui_height();

// Tela preta
draw_set_color(c_black);
draw_rectangle(0, 0, w, h, false);

draw_set_font(fnt_cli);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Título grande + quadrado com a imagem da chave
var titulo = "ITEM: CHAVE";
draw_text_transformed(60, 40, titulo, 2.5, 2.5, 0);

var qx = 60 + string_width(titulo) * 2.5 + 30;
var qy = 25;
var qt = 80;
draw_rectangle(qx, qy, qx + qt, qy + qt, true);
draw_sprite_stretched(spr_chave, 0, qx + 4, qy + 4, qt - 8, qt - 8);

// Subtítulo
draw_text_transformed(60, 150, "PROGRESSO", 1.5, 1.5, 0);

// Número acima da barra
draw_text(60, 200, string(prog) + "/" + string(total));

// Barra de progresso
var bx = 60;
var by = 235;
var bw_barra = w - 120;
var bh_barra = 30;
draw_rectangle(bx, by, bx + bw_barra, by + bh_barra, true);
if (prog > 0) {
    draw_rectangle(bx + 3, by + 3, bx + 3 + (bw_barra - 6) * (prog / total), by + bh_barra - 3, false);
}

// Botão Construir
var texto_botao = "CONSTRUIR";
if (global.chave_construida) {
    texto_botao = "CHAVE CONSTRUIDA";
    draw_set_color(c_dkgray);
} else if (!pronto) {
    draw_set_color(c_gray);
} else if (hover) {
    draw_set_color(c_lime);
} else {
    draw_set_color(c_green);
}
draw_rectangle(bx1, by1, bx2, by2, false);

draw_set_color(pronto && hover ? c_black : c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text((bx1 + bx2) / 2, (by1 + by2) / 2, texto_botao);

// Dica
draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_text(w / 2, h - 90, "Pressione ESC para sair");

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Slot do inventário
scr_draw_inventario();