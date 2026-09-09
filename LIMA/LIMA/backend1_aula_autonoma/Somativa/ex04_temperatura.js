// 4. 

const entrada = require('readline-sync');

const graus = entrada.questionInt("Digite a temperatura:")

if (graus <= 60) {
    console.log("Situacao NORMAL😁");
} else if (graus >= 61 && graus <= 80) {
    console.log("ATENCAO😶");
}
if (graus > 80) {
    console.log("Situacao CRITICA🤯");
}