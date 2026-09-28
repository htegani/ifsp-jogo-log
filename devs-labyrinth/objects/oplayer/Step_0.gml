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