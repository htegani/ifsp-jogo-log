var banco = global.quiz_banco[global.quiz_materia];

// Sorteia 7 perguntas diferentes entre as 15
var idx = [];
for (var i = 0; i < array_length(banco); i++) array_push(idx, i);
for (var i = array_length(idx) - 1; i > 0; i--) {
    var j = irandom(i);
    var t = idx[i]; idx[i] = idx[j]; idx[j] = t;
}

total_q = 7;
acertos_meta = 4;
perguntas = [];
for (var k = 0; k < total_q; k++) array_push(perguntas, banco[idx[k]]);

q_atual = 0;       // 0 a 6
acertos = 0;
estado = 0;        // 0 = respondendo, 1 = tela de resultado
resultado = false;
timer_fim = 0;
texto = "";
opcoes = [];
correta = 0;

// Monta a pergunta atual e embaralha as alternativas
prepara_pergunta = function() {
    var q = perguntas[q_atual];
    texto = q[0];

    var ordem = [1, 2, 3, 4];   // 1 = correta, 2 a 4 = erradas
    for (var i = 3; i > 0; i--) {
        var j = irandom(i);
        var t = ordem[i]; ordem[i] = ordem[j]; ordem[j] = t;
    }

    opcoes = [];
    for (var i = 0; i < 4; i++) {
        array_push(opcoes, q[ordem[i]]);
        if (ordem[i] == 1) correta = i;
    }
}

prepara_pergunta();