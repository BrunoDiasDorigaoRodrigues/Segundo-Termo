// 5.

const entrada = require('readline-sync');
const num = entrada.questionInt("Qual sera o valor fixo? ");

for (let i = 1; i <= 10; i++) {
    console.log(`${num} x ${i} = ${num * i}`);
}
console.log("Fim do ciclo!")