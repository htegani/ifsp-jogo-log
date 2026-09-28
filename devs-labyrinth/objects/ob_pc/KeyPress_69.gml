if (!concluido && distance_to_object(oplayer) < 40) {
    concluido = true;
    global.slot_concluido[global.slot_atual] = true;
    global.pcs_concluidos += 1;
    show_debug_message("PCs concluidos: " + string(global.pcs_concluidos) + " de " + string(global.total_pcs));
}