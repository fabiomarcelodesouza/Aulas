--https://www.postgresql.org/docs/current/sql-altertable.html
create table produto (id_produto serial, nome text, modelo text, fabricante text, valor numeric(18,2), cores text[])

--INSERINDO DADOS NA TABLE Produto
insert into produto values ( 1,'camiseta', 'classic fit      ', 'fashionco     ',  50.00, array['amarelo', 'azul', 'rosa']);
insert into produto values ( 2,'calça   ', 'slim fit         ', 'denimstyle    ',  80.00, '{vermelho, roxo, cinza}');

--criando a tabela cor
create table cor(id_cor serial, nome char(50) not null, primary key (id_cor), unique(nome));

--INSERINDO DADOS NA TABLE Cor
insert into cor values( 1, 'Azul Marinho');
insert into cor values( 2, 'Rosa Pétala');
insert into cor values( 3, 'Verde Esmeralda');
insert into cor values( 4, 'Amarelo Sol');
insert into cor values( 5, 'Vermelho Cereja');
insert into cor values( 6, 'Cinza Chumbo');
insert into cor values( 7, 'Lilás Lavanda');
insert into cor values( 8, 'Bege Caramelo');
insert into cor values( 9, 'Laranja Coral');
insert into cor values(10, 'Roxo Ametista');

--INSERINDO DADOS NA TABLE Produto
insert into produto select 3,'vestido ', 'floral print     ', 'glamourfashion', 120.00, array_agg(nome) from cor