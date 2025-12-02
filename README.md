# 💚 ONG Sementes do Saber: Sistema de Gestão de Voluntários

## 🌟 Visão Geral do Projeto

Este repositório contém o projeto de implementação de um Banco de Dados Relacional (SGBDR) para a ONG fictícia **"Sementes do Saber"**. O objetivo é criar uma estrutura de dados íntegra e não redundante para gerenciar as atividades de apoio à educação.

O projeto cumpre todas as exigências de modelagem conceitual, lógica e física, com foco na **Normalização (3FN)** e **Integridade Referencial**.

---

## 🛠️ Detalhes Técnicos e Modelo Lógico

O sistema foi modelado para evitar redundância, resultando em 5 tabelas principais que se relacionam através de Chaves Estrangeiras (FKs).

### 🔗 Estrutura das Relações (5 Tabelas)

| Tabela | Função | Chaves | Relacionamentos (Integridade) |
| :--- | :--- | :--- | :--- |
| **DOADOR** | Dados de Pessoas Físicas/Jurídicas. | PK: `ID_Doador` | - |
| **PROJETO** | Dados dos projetos (Ex: Reforço Escolar). | PK: `ID_Projeto` | - |
| **VOLUNTARIO** | Dados dos participantes. | PK: `ID_Voluntario` | - |
| **DOACAO** | Registo da contribuição. | FKs: `ID_Doador`, `ID_Projeto` | Relacionamento 1:N com Doador e Projeto. |
| **PARTICIPACAO** | Tabela de Junção. | PK Composta: `ID_Voluntario` + `ID_Projeto` | Resolve a relação N:M entre Voluntário e Projeto. |

### ⚙️ Tecnologias

* **SGBDR:** PostgreSQL (Ambiente de Execução)
* **Linguagem:** SQL (DDL, DML, DQL)
* **Modelagem:** Modelo Entidade-Relacionamento (DER) e Normalização (3FN)

---

## 🚀 Instruções de Execução do Script

O ficheiro **`scripts_ong_final.sql`** contém todo o código necessário para criar e popular o banco de dados.

### Pré-requisito

* Servidor PostgreSQL (ou MySQL) instalado e em execução.
* Um banco de dados vazio criado (ex: `ong_db`).

### Passos

1.  **Conexão:** Conecte-se ao seu SGBDR usando o PGAdmin ou o terminal `psql`.
2.  **Execução do DDL:** Rode o script. Ele executará em ordem:
    * **CREATE TABLE:** Cria as 5 tabelas e define todas as regras de `PRIMARY KEY` e `FOREIGN KEY` (integridade).
    * **INSERT INTO:** Insere dados de teste em todas as tabelas.
3.  **Verificação (Consultas):** O script finaliza com comandos `SELECT` que demonstram que as relações N:M (Participação) e 1:N (Doação) estão a funcionar corretamente.

### Exemplo de Consulta (DQL)

O script prova a funcionalidade com consultas que ligam três tabelas (Voluntário, Participação e Projeto):

```sql
SELECT V.Nome_Voluntario, P.Nome_Projeto
FROM VOLUNTARIO V
JOIN PARTICIPACAO PA ON V.ID_Voluntario = PA.ID_Voluntario
JOIN PROJETO P ON PA.ID_Projeto = P.ID_Projeto;
