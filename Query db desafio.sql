SELECT * FROM tb_filmes
SELECT * FROM tb_atores
SELECT * FROM tb_filmes_genero
SELECT * FROM tb_elenco_filmes
SELECT * FROM tb_generos

--1. Buscar o nome e ano dos filmes
SELECT nome AS Nome, ano AS Ano
FROM tb_filmes

--2. Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT nome, ano
FROM tb_filmes
ORDER BY ano ASC

--3. Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT nome, ano, duracao FROM tb_filmes
WHERE nome = 'De volta para o futuro'

--4. Buscar os filmes lançados em 1997
SELECT * FROM tb_filmes
WHERE ano = 1997

--5. Buscar os filmes lançados após o ano 2000
SELECT * FROM tb_filmes
WHERE ano > 2000

--6. Buscar os filmes com a duracao maior que 100 e menor que 150,
--ordenando pela duracao em ordem crescente
SELECT * FROM tb_filmes
WHERE duracao > 100 AND duracao < 150
ORDER BY duracao ASC

--7. Buscar a quantidade de filmes lançados no ano,
--agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT ano, COUNT(*) AS Quantidade
FROM tb_filmes
GROUP BY ano
ORDER BY Quantidade DESC

--8. Buscar os atores do gênero masculino, retornando o primeiro_nome, ultimo_nome
SELECT primeiro_nome, ultimo_nome, genero
FROM tb_atores
WHERE genero = 'M'

--9. Buscar os atores do gênero feminino, retornando o primeiro_nome,
--ultimo_nome e ordenando pelo primeiro_nome
SELECT primeiro_nome, ultimo_nome, genero
FROM tb_atores
WHERE genero = 'F'
ORDER BY primeiro_nome

--10. Buscar o nome do filme e o genero
SELECT F.nome, G.genero
FROM tb_filmes_genero FG
JOIN tb_filmes F ON F.id = FG.id_filme
JOIN tb_generos G ON G.id = FG.id_genero

--11. Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT F.nome, G.genero
FROM tb_filmes_genero FG
JOIN tb_filmes F ON F.id = FG.id_filme
JOIN tb_generos G ON G.id = FG.id_genero
WHERE G.genero = 'Mistério'

--12. Buscar o nome do filme e os atores, trazendo o primeiro_nome,
--ultimo_nome e seu papel
SELECT F.nome, A.primeiro_nome, A.ultimo_nome, EF.papel
FROM tb_elenco_filmes EF
JOIN tb_filmes F ON F.id = EF.id_filme
JOIN tb_atores A ON A.id = EF.id_ator