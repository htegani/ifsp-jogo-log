draw_self();

if (distance_to_object(oplayer) < dist_interacao) {
    if (global.tem_chave) {
        scr_aviso(x, bbox_top - 8, "Pressione \"E\" para usar a chave");
    } else {
        scr_aviso(x, bbox_top - 8, "Trancada. Precisa da chave.");
    }
}