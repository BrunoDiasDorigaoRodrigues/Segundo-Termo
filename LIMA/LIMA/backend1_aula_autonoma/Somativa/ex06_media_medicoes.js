const entrada = require('readline-sync');
let total = 0;
let media = -1;

while (media !== 0) {
    media = entrada.questionFloat("Digite a media dos valores (ou 0 para finalizar): ");
    total += media;
}
console.log(`\n total da soma: ${total.toFixed(2)}`)
console.log(`\nSua media e: ${total/5}`)