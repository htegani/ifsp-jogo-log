persistent = true;

show_debug_message("PLAYER CRIADO");

if (instance_number(oplayer) > 1) {
    instance_destroy();
    exit;
}