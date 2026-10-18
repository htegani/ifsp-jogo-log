if (room == rm_final) exit;
// Inventário (sempre visível, menos no quiz e no craft, que desenham o próprio)
if (room != rm_quiz && room != rm_craft) scr_draw_inventario();
if (room == rm_quiz || room == rm_craft) exit;
if (stamina < stamina_max) {
	var barra_w = 150;
var barra_h = 14;
var px = 20;
var py = 20;

var pct = stamina / stamina_max;

// Fundo da barra
draw_set_color(c_black);
draw_rectangle(px - 2, py - 2, px + barra_w + 2, py + barra_h + 2, false);

// Fundo vazio (cinza)
draw_set_color(c_gray);
draw_rectangle(px, py, px + barra_w, py + barra_h, false);

// Preenchimento
draw_set_color(correndo ? c_yellow : c_lime);
draw_rectangle(px, py, px + barra_w * pct, py + barra_h, false);

draw_set_color(c_white);
}