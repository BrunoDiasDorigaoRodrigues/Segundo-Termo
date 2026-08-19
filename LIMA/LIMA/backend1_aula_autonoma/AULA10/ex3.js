// const alunos = ["Ana", "Bruno", "Carlos", "Enzo"];

// console.log("Lista de alunos: ");
// console.log(alunos);

// console.log(`Primeiro aluno: ${alunos[0]}`)
// console.log(`Segundo aluno: ${alunos[1]}`)
// console.log(`Quantidade de alunos: ${alunos.length}`);

//acrescentar mais 2 nomes ao array
// mostrar o terceiro aluno
//mostrar o último aluno

const alunos = ["Ana", "Bruno", "Carlos", "Enzo",];


// console.log(`Terceiro aluno: ${alunos[2]}`)
// console.log(`Ultimo aluno: ${alunos[5]}`)

alunos.push("Cecilia")
alunos.push("Leona")
alunos.splice(3,1);

console.log("Lista de alunos: ");
console.log(alunos);
console.log(`Segundo aluno: ${alunos[2]}`)
console.log(`Ultimo aluno: ${alunos[alunos.length - 1]}`)
console.log(`A quantidade de alunos: ${alunos.length}`);