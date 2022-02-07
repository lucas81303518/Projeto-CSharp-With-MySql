-- Criando base de dados 
create database cad_clientes;
use cad_clientes;

create table Cliente(
Id int auto_increment primary key,
Nome varchar(50), 
Telefone varchar(50),
Estado varchar(50) ,
Cidade varchar(50) , 
Endereço varchar(50) ,
Numero varchar(50), 
CEP varchar(50), 
Instagram varchar(50)
);

create table Pedido(
Id int auto_increment primary key,
Produto varchar(100) ,
Cliente_Cadastrado varchar(100),
Status_Pedido varchar(100),
Valor_Total float, 
Valor_Pago float,
Restante float null,
Custo float,
Forma_Pagamento varchar(50), 
Data_Pedido varchar(50),
Data_Entrega varchar(50),
FK_Id_Cliente int not null,
foreign key (FK_Id_Cliente) references Cliente(Id)
);

create table Financas(
id_Financas int auto_increment primary key,
Vendas_Total float,
Custo_Total float,
Lucro_Total float,
Maluart_50 float,
Salario_30 float,
Investimento_20 float
);
 -- Inserção inicial ...
insert into Financas (Vendas_Total, Custo_Total, Lucro_Total, Maluart_50, Salario_30, Investimento_20) 
select sum(p.Valor_Total), sum(p.Custo), (sum(p.Valor_Total)-sum(p.Custo)), ((sum(p.Valor_Total)-sum(p.Custo))*0.5), ((sum(p.Valor_Total)-sum(p.Custo))*0.3), ((sum(p.Valor_Total)-sum(p.Custo))*0.2)
from Pedido p;


