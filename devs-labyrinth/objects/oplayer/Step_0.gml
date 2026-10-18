if (room == rm_quiz || room == rm_craft || room == rm_final) exit;

// Velocidade do jogador
var move_speed = 3;

// Movimento horizontal
if (keyboard_check(ord("D")))
{
    x += move_speed;
}

if (keyboard_check(ord("A")))
{
    x -= move_speed;
}

// Movimento vertical
if (keyboard_check(ord("S")))
{
    y += move_speed;
}

if (keyboard_check(ord("W")))
{
    y -= move_speed;
}

show_debug_message(
    "PLAYER: x=" + string(x) +
    " y=" + string(y) +
    " room=" + string(room)
);


// Decide se está correndo
if (keyboard_check(vk_shift) && stamina > 0) {
    correndo = true;
    stamina -= 1;
} else {
    correndo = false;
    if (stamina < stamina_max) {
        stamina += stamina_regen;
    }
}

stamina = clamp(stamina, 0, stamina_max);

var spd_atual = correndo ? spd_correr : spd_andar;

var mx = (keyboard_check(ord("D")) - keyboard_check(ord("A")));
var my = (keyboard_check(ord("S")) - keyboard_check(ord("W")));

if (mx != 0 || my != 0) {
    var dir = point_direction(0, 0, mx, my);
    x += lengthdir_x(spd_atual, dir);
    y += lengthdir_y(spd_atual, dir);
}