const fs = require('fs')
const { json } = require('stream/consumers')

console.log("=== REGISTRO DE SENSORES ===")

const sensores = [
    {codigo: 1001, Tipo: "Temperatura", leituraAtual: 6.2, status: "operando" },
    {codigo: 1002, Tipo: "Pressão", leituraAtual: 85.4, status: 
    "Operando"},
    {codigo: 1003, Tipo: "Temperatura", leituraAtual: 102.5, status:
    "Alerta"}
]

const dadosParaGravar = JSON.stringify(sensores, null, 2);

const nomeDoArquivo = "sensores.json";
fs.writeFileSync(nomeDoArquivo, dadosParaGravar);

console.log(`\nDados gravados com sucesso.`)