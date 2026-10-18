if (estado == 0) {
    var escolha = -1;
    if (keyboard_check_pressed(ord("A"))) escolha = 0;
    if (keyboard_check_pressed(ord("B"))) escolha = 1;
    if (keyboard_check_pressed(ord("C"))) escolha = 2;
    if (keyboard_check_pressed(ord("D"))) escolha = 3;

    if (escolha != -1) {
        if (escolha == correta) acertos += 1;
        q_atual += 1;

        if (acertos >= acertos_meta) {
            // Já fez os 4 acertos: sai antes da questão 7
            estado = 1; resultado = true; timer_fim = 90;
        } else if (q_atual >= total_q) {
            // Acabaram as questões sem os 4 acertos
            estado = 1; resultado = false; timer_fim = 90;
        } else {
            prepara_pergunta();
        }
    }
} else {
    timer_fim -= 1;
    if (timer_fim <= 0 || keyboard_check_pressed(vk_enter)) {
        scr_quiz_finalizar(resultado);
    }
}