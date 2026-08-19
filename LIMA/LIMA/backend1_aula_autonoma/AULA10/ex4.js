const entrada = require("readline-sync");

console.log("=== Registro de temperatura ===")

const temperaturas = [];

const quantidade = entrada.questionInt("Quantas temperaturas deseja registrar? ");

for (let i= 0; i < quantidade; i++) {
    let temperatura = entrada.questionFloat(`Temperatura ${i+1}: `);
    temperaturas.push(temperatura)
}
console.log("\n--- Relatorio ---");
console.log(`Teperaturas registradas: ${temperaturas.join (" °C| ")}°C`);

console.log(`Quantidade de resgistros: ${quantidade}`)
console.log(`O primeiro registo foi: ${temperaturas[0]}°C`)
console.log(`Ultimo registro foi de: ${temperaturas[temperaturas.length - 1]}°C`)


