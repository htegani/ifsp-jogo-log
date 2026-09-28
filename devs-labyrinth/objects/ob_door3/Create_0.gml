retorno_dx = 0;

if (y < room_height / 2) {
    retorno_dy = 96;    // porta em cima: player reaparece abaixo
} else {
    retorno_dy = -96;   // porta embaixo: player reaparece acima
}