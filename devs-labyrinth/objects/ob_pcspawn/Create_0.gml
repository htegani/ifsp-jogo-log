var slot = global.slot_atual;

if (global.slot_pc[slot]) {
    var pc = instance_create_layer(x, y, layer, ob_pc);
    pc.concluido = global.slot_concluido[slot];
}

instance_destroy();