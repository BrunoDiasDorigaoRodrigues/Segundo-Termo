// const entrada = require('readline-sync')

// console.log("--- SISTEMA DE ANALISE DE CREDITOS ---")

// // Coleta de dados
// const nome = entrada.question("Digite o nome do cliente: ");
// const idade = entrada.questionInt("Idade: ");
// const renda = entrada.questionFloat("Renda mensal: ");
// const temImovel = entrada.keyInYNStrict("Possui imovel proprio? ");

// // A Lógica Combina
// // (idade >= 18) é obrigatório
// // (renda >=2500 || temImovel === true) um dos dois tem que ser verdade
// if (idade >= 18 && (renda >= 2500 || temImovel === true)) {
//     console.log(`\nParabéns ${nome}, seu crédito foi APROVADO!`);
// } else {
//     console.log(`\nSinto muito, ${nome}. Seu crédito foi NEGADO.`);
// }

const entrada = require('readline-sync')

const nome = entrada.question("Nome do aluno: ");
const n1 = entrada.questionFloat("Nota 1: ");
const n2 = entrada.questionFloat("Nota 2: ");

const media = (n1 + n2) / 2;

if (media >=7) {
    console.log("Aprovado");
}else if (media >=5 && media < 7) {
    console.log("Recuperação");
}else {
    console.log("Reprovado");
}