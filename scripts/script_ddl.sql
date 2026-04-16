2-aluno (
  id_matricula PK,
  nome,
  email,
  endereco,
  data_ingresso
)
disciplina (
  cod_disciplina PK,
  nome,
  carga_h
)
docente (
  id_docente PK,
  nome
)
operador (
  id_operador PK
)
matricula (
  id PK,
  id_aluno FK,
  cod_disciplina FK,
  id_docente FK,
  id_operador FK,
  ciclo,
  nota,
  ativo
)

3-CREATE DATABASE academico;

CREATE TABLE aluno (
  id_matricula INT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100),
  endereco VARCHAR(150),
  data_ingresso DATE,
  ativo TINYINT(1) DEFAULT 1
);

CREATE TABLE disciplina (
  cod_disciplina VARCHAR(10) PRIMARY KEY,
  nome VARCHAR(100),
  carga_h INT,
  ativo TINYINT(1) DEFAULT 1
);

CREATE TABLE docente (
  id_docente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  ativo TINYINT(1) DEFAULT 1
);

CREATE TABLE operador (
  id_operador VARCHAR(10) PRIMARY KEY
);

CREATE TABLE matricula (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_aluno INT,
  cod_disciplina VARCHAR(10),
  id_docente INT,
  id_operador VARCHAR(10),
  ciclo VARCHAR(10),
  nota DECIMAL(4,2),
  ativo TINYINT(1) DEFAULT 1,

  FOREIGN KEY (id_aluno) REFERENCES aluno(id_matricula),
  FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina),
  FOREIGN KEY (id_docente) REFERENCES docente(id_docente),
  FOREIGN KEY (id_operador) REFERENCES operador(id_operador)
);

INSERT INTO aluno VALUES
(2026001,'Ana Beatriz Lima','ana.lima@aluno.edu.br','Braganca Paulista/SP','2026-01-20',1),
(2026002,'Bruno Henrique Souza','bruno.souza@aluno.edu.br','Atibaia/SP','2026-01-21',1);

INSERT INTO disciplina VALUES
('ADS101','Banco de Dados',80,1),
('ADS102','Engenharia de Software',80,1);

INSERT INTO docente (nome) VALUES
('Prof. Carlos Mendes'),
('Profa. Juliana Castro');

INSERT INTO operador VALUES
('OP9001'),
('OP9002');

INSERT INTO matricula
(id_aluno, cod_disciplina, id_docente, id_operador, ciclo, nota)
VALUES
(2026001,'ADS101',1,'OP9001','2026/1',9.1),
(2026002,'ADS101',1,'OP9002','2026/1',7.3);

4-SELECT a.nome, d.nome, m.ciclo
FROM matricula m
JOIN aluno a ON a.id_matricula = m.id_aluno
JOIN disciplina d ON d.cod_disciplina = m.cod_disciplina;
WHERE m.ciclo = '2026/1';

SELECT d.nome, AVG(m.nota)
FROM matricula m
JOIN disciplina d ON d.cod_disciplina = m.cod_disciplina
GROUP BY d.nome
HAVING AVG(m.nota) < 6;

SELECT doc.nome, d.nome
FROM docente doc
LEFT JOIN matricula m ON m.id_docente = doc.id_docente
LEFT JOIN disciplina d ON d.cod_disciplina = m.cod_disciplina;

SELECT a.nome, m.nota
FROM matricula m
JOIN aluno a ON a.id_matricula = m.id_aluno
JOIN disciplina d ON d.cod_disciplina = m.cod_disciplina
WHERE d.nome = 'Banco de Dados'
AND m.nota = (
  SELECT MAX(nota)
  FROM matricula m2
  JOIN disciplina d2 ON d2.cod_disciplina = m2.cod_disciplina
  WHERE d2.nome = 'Banco de Dados'
);