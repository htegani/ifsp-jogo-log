var w = display_get_gui_width();
var h = display_get_gui_height();

// Tela em branco
draw_set_color(c_white);
draw_rectangle(0, 0, w, h, false);

draw_set_font(fnt_quiz);
draw_set_color(c_black);
draw_set_valign(fa_top);

// Matéria (canto superior esquerdo)
draw_set_halign(fa_left);
draw_text(20, 20, global.quiz_nomes[global.quiz_materia]);

// Contadores (canto superior direito)
draw_set_halign(fa_right);
draw_text(w - 20, 20, "Questões: " + string(min(q_atual + 1, total_q)) + "/" + string(total_q));
draw_text(w - 20, 50, "Acertos: " + string(acertos) + "/" + string(acertos_meta));

draw_set_halign(fa_left);

if (estado == 0) {
        // Pergunta
    draw_text_ext(60, 110, texto, 30, w - 120);

    // Alternativas
    var letras = ["A", "B", "C", "D"];
    for (var i = 0; i < 4; i++) {
        draw_text_ext(80, 230 + i * 60, letras[i] + ") " + opcoes[i], 30, w - 160);
    }

    // Rodapé (alinhado na base da tela)
    draw_set_valign(fa_bottom);
    draw_text(60, h - 15, "Pressione A, B, C ou D para responder");
    draw_set_valign(fa_top);
}