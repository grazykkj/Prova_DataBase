1-SGBD Relacional vs NoSQL

Um SGBD relacional (como PostgreSQL) é mais adequado para o sistema acadêmico porque garante ACID, ou seja:

Atomicidade (tudo ou nada)
Consistência (dados válidos sempre)
Isolamento (transações não conflitam)
Durabilidade (dados não se perdem)

Isso é essencial para evitar erros em notas, matrículas e relações entre alunos e disciplinas.

Já o NoSQL não garante integridade relacional com o mesmo nível de segurança, sendo menos indicado para esse tipo de sistema.

2- Uso de Schemas

Schemas ajudam a organizar o banco em partes lógicas:

academico: alunos, disciplinas, matrículas
seguranca: usuários e permissões

Isso melhora organização, segurança e manutenção, evitando bagunça no schema padrão (public).

3- Uso do XAMPP (Contexto de implementação)

O projeto foi testado no ambiente XAMPP (MySQL/MariaDB), que possui diferenças em relação ao PostgreSQL.

Por isso:

schemas foram substituídos por um único database (academico)
algumas permissões avançadas (DCL) foram tratadas de forma teórica
ajustes como AUTO_INCREMENT e TINYINT foram utilizados

Mesmo assim, a estrutura relacional, normalização e consultas SQL foram mantidas corretamente. Enfim, para fins de testes, foi utilizado o ambiente XAMPP (MySQL/MariaDB).
Devido a limitações do MySQL em relação ao PostgreSQL:

Os schemas "academico" e "seguranca" foram representados por um único database.
Algumas permissões (DCL), como controle por coluna e roles avançadas, foram descritas conceitualmente, pois possuem suporte mais completo em PostgreSQL.

Ainda assim, toda a modelagem, integridade referencial e consultas foram implementadas corretamente.

5-Problema:
Dois usuários alterando a mesma nota ao mesmo tempo.

Solução:
O banco usa LOCKS
Quando um usuário altera:
o registro fica “travado”
o outro espera

Isolamento (ACID):
evita que um sobrescreva o outro
garante consistência

Resultado:
nenhuma nota é corrompida
sempre teremos um valor válido final

![alt text](image-1.png)