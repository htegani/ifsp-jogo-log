global.corredor_atual = numero_porta - 1;   // porta 1 vira 0, porta 7 vira 6

global.ret_mc_x = x + retorno_dx;
global.ret_mc_y = y + retorno_dy;

event_inherited();

room_goto(rm_sidecorr);
