-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clientes (
Nome Texto(1),
CPF Texto(1),
Endereco Texto(1),
Email Texto(1),
ID_Cliente Texto(1) PRIMARY KEY
)

CREATE TABLE Produtos (
ID_Produto Texto(1) PRIMARY KEY,
Tipo Texto(1),
Preco Texto(1),
Nome Texto(1),
Validade Texto(1),
Quantidade Texto(1)
)

CREATE TABLE Funcionario (
ID_Funcionario Texto(1) PRIMARY KEY,
Nome Texto(1),
Cargo Texto(1),
Endereco Texto(1),
Telefone Texto(1),
Periodo de trabalho Texto(1),
CPF_Funcionario Texto(1)
)

CREATE TABLE Pedidos (
ID_Pedido Texto(1),
Nome_Cliente Texto(1),
Endereco Texto(1),
CPF_Cliente Texto(1),
Telefone_Cliente Texto(1),
PIx Texto(1),
Debito Texto(1),
Credito Texto(1),
Horario_Pedido Texto(1),
PRIMARY KEY(ID_Pedido,Credito)
)

CREATE TABLE Estoque (
ID_Estoque Texto(1) PRIMARY KEY,
Horario_Entrada Texto(1),
Horario_retiramento Texto(1),
Nome_Funcionario_Estoque Texto(1),
Produtos_Dispoiveis Texto(1),
Horario_Retirada Texto(1),
Produtos_Indisponiveis Texto(1)
)

CREATE TABLE Delivery (
ID_Delivery Texto(1) PRIMARY KEY,
Endereço_Entrega Texto(1),
Nome_cliente Texto(1),
Entregador Texto(1),
CPF_CLiente Texto(1),
Telefone Texto(1),
Observação Texto(1),
Ponte_Entrega Texto(1)
)

CREATE TABLE Programa Fidelidade (
ID_Fidelidade Texto(1) PRIMARY KEY,
Nome_cliente Texto(1),
Endereco Texto(1),
CPF_Cliente Texto(1),
Nome_Social Texto(1),
Telefone Texto(1),
Tempo_Fidelidade Texto(1)
)

CREATE TABLE Pagamento (
ID_Pagamento Texto(1),
Data_Pagamento Texto(1),
Horario_Pagamento Texto(1),
Nome_Pagamento Texto(1),
Forma_Pagamento Texto(1),
Pix Texto(1),
Debito Texto(1),
Credito Texto(1),
PRIMARY KEY(ID_Pagamento,Credito)
)

CREATE TABLE Usuarios (
ID_Usuario Texto(1) PRIMARY KEY
)

