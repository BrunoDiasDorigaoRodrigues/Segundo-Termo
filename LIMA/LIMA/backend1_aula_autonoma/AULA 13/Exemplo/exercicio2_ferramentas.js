const fs = require('fs');
const entrada = require('readline-sync');
console.log("=== CADASTRO DE FERRAMENTA ===")

const TotalItens = entrada.questionInt("Quantas ferramenteas serao registradas? ")

const listaFerramentas = [];

for(let i = 0; i < TotalItens; i++) {
    console.log(`\nItem ${i + 1} de ${TotalItens}:`);

    const nome = entrada.question("Nome da ferramenta: ");
    const quantidade = entrada.question("Quantidade: ");
    const custoUnitario = entrada.question("Custo Unitario (R$): ");

    listaFerramentas.push({
        nome: nome,
        quantidade: quantidade,
        custoUnitario: custoUnitario
    });
}
const dadosParaGravar = JSON.stringify(listaFerramentas, null, 2);

const nomeDoArquivo = "Ferramentas.js"
fs.writeFileSync(nomeDoArquivo, dadosParaGravar)
console.log("------------------------------")
console.log(`\nGravado com sucesso em ${nomeDoArquivo}`)
console.log("------------------------------")