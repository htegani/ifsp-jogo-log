var w = display_get_gui_width();

// Botão "Construir"
bw = 300;
bh = 60;
bx1 = w / 2 - bw / 2;
by1 = 380;
bx2 = bx1 + bw;
by2 = by1 + bh;

prog = 0;
total = global.total_pcs;
pronto = false;
hover = false;