const fs = require ('fs');

console.log(" === SISTEMA DE PERSISTÊNCIA DE DADOS === ");

const maquinasIndustriais = [
    {id: 101, nome: "Furadeira de Bancada", setor: "Usinagem", operacional: true},
    {id: 102, nome: "Prensa Hidraulica", setor: "Estamparia", operacional: false},
    {id: 103, nome: "Torno automatico", setor: "Usinagem", operacional: true}
]
const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2);

const nomeDoArquivo = "maquinas.json";
fs.writeFileSync(nomeDoArquivo, dadosParaGravar);

console.log(`\nGravacao concluida com sucesso.`);
console.log(`Verifique o arquivo '${nomeDoArquivo}' gerado na pasta`);