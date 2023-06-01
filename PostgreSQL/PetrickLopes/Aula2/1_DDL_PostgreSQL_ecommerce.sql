--criando table cor
create table cor(id_cor serial, nome char(50) not null, primary key (id_cor), unique(nome));

--criando a table produto
create table produto(id_produto serial, nome char(50), modelo char(50), fabricante char(50), valor decimal(10,2), primary key (id_produto));

--criando table produto_cor
create table produto_cor(id_produto serial, id_cor int, primary key (id_produto, id_cor), foreign key (id_produto) references produto(id_produto), foreign key (id_cor) references cor(id_cor));

--criando table tamanho
create table tamanho(id_tamanho serial, descricao char(50) unique, primary key (id_tamanho));

--criando table produto_tamanho
create table produto_tamanho(id_produto int, id_tamanho int, primary key (id_produto, id_tamanho), foreign key (id_produto) references produto(id_produto), foreign key (id_tamanho) references tamanho(id_tamanho));

--criando table cliente	
create table cliente(id_cliente serial, cpf char(11) unique, nome char(50), endereco char(50), cep char(9), email char(50), telefone char(15), primary key (id_cliente));

--criando table pedido
create table pedido(id_pedido serial, id_cliente int, primary key(id_pedido), data_pedido date not null, foreign key (id_cliente) references cliente(id_cliente));

--criando table pedido_produto	
create table pedido_produto(id_pedido int, id_produto int, id_cor int, id_tamanho int, quantidade int, valor_pago decimal(10, 2), primary key (id_pedido, id_produto), foreign key (id_pedido) references pedido(id_pedido), foreign key (id_produto) references produto(id_produto), foreign key (id_cor) references cor(id_cor), foreign key (id_tamanho) references tamanho(id_tamanho));
