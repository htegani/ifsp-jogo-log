persistent = true;

show_debug_message("PLAYER CRIADO");

if (instance_number(oplayer) > 1) {
    instance_destroy();
    exit;
}

spd_andar = -1;       // velocidade normal, ajuste ao que você já usa
spd_correr = 1;       // velocidade correndo (o dobro é um bom começo)

stamina_max = 7 * room_speed;   // 7 segundos, convertidos em frames
stamina = stamina_max;
stamina_regen = 0.5;            // velocidade de recuperação (frames por frame parado)
correndo = false;