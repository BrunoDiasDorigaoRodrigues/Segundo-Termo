const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ");
const data = entrada.questionFloat("Digite seu ano de nascimento: ");
const data2 = entrada.questionFloat("digite o ano atual: ");

const media = (data - data2);
console.log("Sua idade é: " );