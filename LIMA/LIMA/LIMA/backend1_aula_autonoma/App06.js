// const entrada  = require('readline-sync')

// const placa = entrada.question("Digite a placa do veiculo: ");
// const ano = entrada.questionInt("Digite o ano do veiculo: ");
// const velocidade = entrada.questionInt("Digite a velocidade do veiculo: ");


// if (velocidade <= 80) {
//     console.log(`O veiculo placa ${placa}, ano ${ano} Não foi multado`);
// } else {
//     console.log(`O veiculo placa ${placa}, ano ${ano} foi multado`);

// }

// let contador = 0;
// while (contador < 100) {
//     console.log(`Contagem: ${contador}`);
//     contador +=5 // Isso aumenta 5 no contador (IMPORTANTE)
// }
// console.log("Fim da contagem!");

// const entrada = require('readline-sync')

// const num = entrada.questionInt("Tabuada de qual numero? ");

// for (let i = 1; i <= 10; i++) {
//     console.log(`${num} x ${i} = ${num * i}`);
// }

// const entrada = require('readline-sync');

// let opcao = 0;

// // O programa vai repetir tudo o que estiver aqui dentro
// while (opcao !== 3) {
//     console.log("\n=== MENU DA PADARIA ===");
//     console.log("1. Calcular Venda");
//     console.log("2. Ver Horario de Funcionamento");
//     console.log("3. Sair");
   
//     opcao = entrada.questionInt("Escolha uma opcao: ");

//     if (opcao === 1) {
//         let preco = entrada.questionFloat("Preco do produto: ");
//         let qtd = entrada.questionInt("Quantidade: ");
//         console.log(`Total: R$ ${(preco * qtd).toFixed(2)}`);
//     } else if (opcao === 2) {
//         console.log("Funcionamos das 07h as 22h.");
//     } else if (opcao === 3) {
//         console.log("Saindo do sistema...");
//     } else {
//         console.log("Opcao invalida!");
//     }
// }


const entrada = require('readline-sync');

const nome = entrada.question("Digite o nome do Eleitor: ");
const idade = entrada.questionInt("Digite a idade do Eleitor: ");

if (idade >= 16) {
    console.log(`O Eleitor ${nome} pode votar.`);
} else {
    console.log(`O Eleitor ${nome} não pode votar.`);
}