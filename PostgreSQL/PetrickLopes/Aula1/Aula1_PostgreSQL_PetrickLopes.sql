/********************************************************************************************************************************************************************/
/*                                                            TRABALHANDO COM ARRAYS                                                                                */
/********************************************************************************************************************************************************************/
--criando a tabela funcionario
create table funcionario_array (id_funcionario serial, nome text, historico_cargo text[], historico_salario numeric(18,2)[], primary key(id_funcionario));

--descrevendo a table no pgadmin
select *
  from information_schema."columns"
 where table_name = 'funcionario_array'
 order by ordinal_position;

--acessando o container
docker exec -it aulaspostgres-database bash

--acessando a base de dados pelo psql
psql -U postgres -d aula1

--descrevendo a tabela
\d funcionario_array

--inserindo registros
insert into funcionario_array (nome, historico_cargo, historico_salario) values ('Paola Oliveira', ARRAY['Analista'], ARRAY[1500.00]);
insert into funcionario_array (nome, historico_cargo, historico_salario) values ('Pedro Bial', ARRAY['Analista', 'Coordenador'], ARRAY[1500.00, 2500.00]);
insert into funcionario_array (nome, historico_cargo, historico_salario) values ('Rita Lee', '{Analista, Coordenador}', '{1500.00, 2500.00}');

--create table salarios
create table salario_historico (nome text, cargo text, valor numeric(18,2));

--inserindo dados do cid moreira
insert into salario_historico values ('Cid Moreira', 'Junior', 1000);
insert into salario_historico values ('Cid Moreira', 'Pleno', 2000);
insert into salario_historico values ('Cid Moreira', 'Senior', 3000);
insert into salario_historico values ('Cid Moreira', 'Especialista', 4000);

--inserindo na funcionario_array com select 
--A função array_agg no PostgreSQL é usada para agregar os valores de uma coluna em um array. Essa função retorna um array que contém todos os valores da coluna especificada.
insert into funcionario_array (nome, historico_cargo, historico_salario) select nome, array_agg(cargo), array_agg(valor) from salario_historico group by nome;

--acessando arrays
select * from funcionario_array;
select nome, historico_salario[2] from funcionario_array;
select nome from funcionario_array where historico_salario[2] = 2500;
select nome, historico_salario[1:2] from funcionario_array where  historico_cargo[1] = 'Analista';
select nome, historico_salario[:2] from funcionario_array where  historico_cargo[1] = 'Analista';
select nome, historico_salario[2:] from funcionario_array where  historico_cargo[1] = 'Analista';

--atualizando arrays
update funcionario_array set historico_salario[2] = 3500 where nome = 'Rita Lee';
update funcionario_array set historico_cargo = '{Analista,Coordenador,Gerente}', historico_salario = '{1500.00,3500.00,4500}' where nome = 'Rita Lee';
update funcionario_array set historico_salario[1:2] = '{2500.00,4500.00}' where nome = 'Rita Lee';

--criando array multidimensional (matriz)
create table funcionario_matriz (id_funcionario serial, nome text, historico text[][], primary key(id_funcionario));

--inserindo no array multidimensional (matriz)
insert into funcionario_matriz (nome, historico) values ('Paola Oliveira', ARRAY[['Analista'],['1500.00']]);
insert into funcionario_matriz (nome, historico) values ('Pedro Bial', ARRAY[['Analista', 'Coordenador'], ['1500.00', '2500.00']]);
insert into funcionario_matriz (nome, historico) values ('Rita Lee', '{{Analista, Coordenador, Gerente},{1500.00, 2500.00, 3500.00}}');

--select
select * from funcionario_matriz where historico[1][3] = 'Gerente'

/********************************************************************************************************************************************************************/
/*                                                            TRABALHANDO COM JSON                                                                                  */
/********************************************************************************************************************************************************************/
--criando a tabela funcionario
create table funcionario_json (id_funcionario serial, nome text, historico jsonb, primary key(id_funcionario));

--descrevendo a table no pgadmin
select *
  from information_schema."columns"
 where table_name = 'funcionario_json'
 order by ordinal_position;

--acessando o container
docker exec -it aulaspostgres-database bash

--acessando a base de dados pelo psql
psql -U postgres -d aula1

--descrevendo a tabela
\d funcionario_json

--inserindo registros
insert into funcionario_json (nome, historico) values ('Paola Oliveira', '{"dataContratacao":"2002-05-06","historico":[{ "dataPromocao": "2002-05-06","cargo": "Analista","salario": 1500}]}');
insert into funcionario_json (nome, historico) values ('Pedro Bial',     '{"dataContratacao":"2002-05-06","historico":[{ "dataPromocao": "2002-05-06","cargo": "Analista","salario": 1500},{ "dataPromocao": "2010-08-18","cargo": "Coordenador","salario": 2500}]}');
insert into funcionario_json (nome, historico) values ('Rita Lee',       '{"dataContratacao":"2002-05-06","historico":[{ "dataPromocao": "2002-05-06","cargo": "Analista","salario": 1500},{ "dataPromocao": "2010-08-18","cargo": "Coordenador","salario": 2500},{ "dataPromocao": "2019-10-18","cargo": "Gerente","salario": 5000}]}');

--acessando arrays
select nome, historico ->> 'dataContratacao' as "dataContratacao", historico -> 'historico'
  from funcionario_json

select nome, historico ->> 'dataContratacao' as "Data de Contracao", json_array_elements(historico -> 'historico')
  from funcionario_json
 
--update json
--json_set (target jsonb, path text[], new_value jsonb [, create_if_missing boolean ])
--atualizando o elemento do JSON
update funcionario_json
   set  historico = jsonb_set(historico, '{dataContratacao}', '"2003-05-12"', false)
 where nome = 'Pedro Bial';

--atualizando array
UPDATE funcionario_json
   SET historico = jsonb_set(historico, '{historico,0,dataPromocao}', '"2003-05-12"')
 WHERE nome = 'Pedro Bial'

--inserindo um elemento
UPDATE funcionario_json
   SET historico = jsonb_insert(historico, '{historico,-1}', '{ "dataPromocao": "2023-05-06","cargo": "Superintendente","salario": 10500}', false)
WHERE nome = 'Pedro Bial';

--utilizando WITH
WITH item AS (
    SELECT ('{historico,' || index - 1 || ',"dataPromocao"}')::TEXT[] AS path,
           id_funcionario,
		       nome,
	         item ->> 'dataPromocao' as dataPromocao
      FROM funcionario_json,
           jsonb_array_elements(historico -> 'historico') WITH ORDINALITY arr(item, index)
     WHERE item ->> 'dataPromocao' IS NOT NULL
	     and nome = 'Pedro Bial'
)
UPDATE funcionario_json func
   SET historico = jsonb_set(historico, item.path, '"2003-05-12"')
  from item
 WHERE item.nome = func.nome
   and item.dataPromocao = '2002-05-06'

--utilizando subquery normal
UPDATE funcionario_json func
   SET historico = jsonb_set(historico, item.path, '"2003-05-12"')
  from (SELECT ('{historico,' || index - 1 || ',"dataPromocao"}')::TEXT[] AS path,
               id_funcionario,
		       nome,
	           item ->> 'dataPromocao' as dataPromocao
          FROM funcionario_json,
               jsonb_array_elements(historico -> 'historico') WITH ORDINALITY arr(item, index)
         WHERE item ->> 'dataPromocao' IS NOT NULL
	       and nome = 'Pedro Bial') item
 WHERE item.nome = func.nome
   and item.dataPromocao = '2023-05-06'