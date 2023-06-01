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
insert into produto values ( 1,'Camiseta', 'Classic Fit      ', 'FashionCo     ',  50.00);
insert into produto values ( 2,'Calça   ', 'Slim Fit         ', 'DenimStyle    ',  80.00);
insert into produto values ( 3,'Vestido ', 'Floral Print     ', 'GlamourFashion', 120.00);
insert into produto values ( 4,'Blusa   ', 'Off-Shoulder     ', 'TrendyStyles  ',  60.00);
insert into produto values ( 5,'Bermuda ', 'Cargo Shorts     ', 'SportWear     ',  70.00);
insert into produto values ( 6,'Jaqueta ', 'Bomber Jacket    ', 'UrbanChic     ', 150.00);
insert into produto values ( 7,'Saia    ', 'A-line Skirt     ', 'StyleMakers   ',  65.00);
insert into produto values ( 8,'Camisa  ', 'Oxford Shirt     ', 'ClassicLook   ',  90.00);
insert into produto values ( 9,'Blazer  ', 'Tailored Blazer  ', 'ModernSuits   ', 130.00);
insert into produto values (10,'Moletom ', 'Hooded Sweatshirt', 'StreetStyle   ',  75.00);

--INSERINDO DADOS NA TABLE Produto_Cor
insert into produto_cor values(1, 1);
insert into produto_cor values(1, 2);
insert into produto_cor values(1, 3);
insert into produto_cor values(1, 4);
insert into produto_cor values(1, 5);
insert into produto_cor values(1, 6);
insert into produto_cor values(1, 7);
insert into produto_cor values(2, 1);
insert into produto_cor values(2, 2);
insert into produto_cor values(2, 3);

--INSERINDO DADOS NA TABLE Tamanho
insert into tamanho values(1, 'PP');
insert into tamanho values(2, 'P');
insert into tamanho values(3, 'M');
insert into tamanho values(4, 'G');
insert into tamanho values(5, 'XG');
insert into tamanho values(6, 'XXG');
insert into tamanho values(7, 'U');

--INSERINDO DADOS NA TABLE Produto_Tamanho
insert into produto_tamanho values(1, 1);
insert into produto_tamanho values(1, 2);
insert into produto_tamanho values(1, 3);
insert into produto_tamanho values(1, 4);
insert into produto_tamanho values(1, 5);
insert into produto_tamanho values(1, 6);
insert into produto_tamanho values(1, 7);
insert into produto_tamanho values(2, 1);
insert into produto_tamanho values(2, 2);
insert into produto_tamanho values(2, 3);

--INSERINDO DADOS NA TABLE Cliente
insert into cliente values ( 1, '12345678901', 'João da Silva  ', 'Rua das Flores, 123     ', '12345-678', 'joao.silva@example.com     ', '(11) 98765-4321');
insert into cliente values ( 2, '23456789012', 'Maria Souza    ', 'Avenida Principal, 456  ', '23456-789', 'maria.souza@example.com    ', '(22) 87654-3210');
insert into cliente values ( 3, '34567890123', 'Carlos Santos  ', 'Rua dos Bandeirantes, 7 ', '34567-890', 'carlos.santos@example.com  ', '(33) 76543-2109');
insert into cliente values ( 4, '45678901234', 'Ana Oliveira   ', 'Rua das Palmeiras, 56   ', '45678-901', 'ana.oliveira@example.com   ', '(44) 65432-1098');
insert into cliente values ( 5, '56789012345', 'Pedro Costa    ', 'Avenida Central, 987    ', '56789-012', 'pedro.costa@example.com    ', '(55) 54321-0987');
insert into cliente values ( 6, '67890123456', 'Laura Rodrigues', 'Rua dos Girassóis, 34   ', '67890-123', 'laura.rodrigues@example.com', '(66) 43210-9876');
insert into cliente values ( 7, '78901234567', 'Felipe Almeida ', 'Avenida dos Coqueiros, 9', '78901-234', 'felipe.almeida@example.com ', '(77) 32109-8765');
insert into cliente values ( 8, '89012345678', 'Sofia Nunes    ', 'Rua das Orquídeas, 12   ', '89012-345', 'sofia.nunes@example.com    ', '(88) 21098-7654');
insert into cliente values ( 9, '90123456789', 'Lucas Silva    ', 'Avenida Principal, 321  ', '90123-456', 'lucas.silva@example.com    ', '(99) 10987-6543');
insert into cliente values (10, '01234567890', 'Juliana Santos ', 'Rua das Rosas, 78       ', '01234-567', 'juliana.santos@example.com ', '(00) 09876-5432');

--INSERINDO DADOS NA TABLE Pedido
insert into pedido values (1, 1, '2021-01-15');
insert into pedido values (2, 2, '2021-01-15');
insert into pedido values (3, 3, '2021-01-15');
insert into pedido values (4, 1, '2021-04-15');
insert into pedido values (5, 2, '2021-04-15');
insert into pedido values (6, 3, '2022-02-15');
insert into pedido values (7, 1, '2022-02-15');
insert into pedido values (8, 2, '2022-05-15');
insert into pedido values (9, 4, '2023-02-15');
insert into pedido values (10, 5, '2023-05-15');

--INSERINDO DADOS NA TABLE Pedido_Produto
insert into pedido_produto values (1, 3, 2, 2, 12, 1440.00);
insert into pedido_produto values (1, 2, 2, 2, 13, 1040.00);
insert into pedido_produto values (1, 5, 2, 2, 30, 2100.00);
insert into pedido_produto values (2, 2, 2, 2, 17, 1360.00);
insert into pedido_produto values (2, 3, 2, 2, 12, 1440.00);
insert into pedido_produto values (2, 8, 2, 2, 10, 900.00);
insert into pedido_produto values (3, 3, 2, 2, 13, 1560.00);
insert into pedido_produto values (3, 5, 2, 2, 20, 1400.00);
insert into pedido_produto values (4, 9, 2, 2, 10, 1300.00);
insert into pedido_produto values (4, 3, 2, 2, 10, 1200.00);
