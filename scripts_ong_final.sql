CREATE TABLE VOLUNTARIO (
    ID_Voluntario INT PRIMARY KEY,
    Nome_Voluntario VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    CPF VARCHAR(14) UNIQUE NOT NULL
);


CREATE TABLE PROJETO (
    ID_Projeto INT PRIMARY KEY,
    Nome_Projeto VARCHAR(100) NOT NULL,
    Data_Inicio DATE NOT NULL,
    Descricao TEXT
);


CREATE TABLE DOADOR (
    ID_Doador INT PRIMARY KEY,
    Nome_Doador VARCHAR(100) NOT NULL,
    Tipo_Pessoa CHAR(1) CHECK (Tipo_Pessoa IN ('F', 'J')),
    CPF_CNPJ VARCHAR(18) UNIQUE NOT NULL
);

CREATE TABLE DOACAO (
    ID_Doacao INT PRIMARY KEY,
    ID_Doador INT NOT NULL,
    ID_Projeto INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Doacao DATE NOT NULL,
    
    FOREIGN KEY (ID_Doador) REFERENCES DOADOR(ID_Doador),
    FOREIGN KEY (ID_Projeto) REFERENCES PROJETO(ID_Projeto)
);

CREATE TABLE PARTICIPACAO (
    ID_Voluntario INT NOT NULL,
    ID_Projeto INT NOT NULL,
    Horas_Dedicadas INT,
    
    PRIMARY KEY (ID_Voluntario, ID_Projeto),
    
    FOREIGN KEY (ID_Voluntario) REFERENCES VOLUNTARIO(ID_Voluntario),
    FOREIGN KEY (ID_Projeto) REFERENCES PROJETO(ID_Projeto)
);


INSERT INTO DOADOR (ID_Doador, Nome_Doador, Tipo_Pessoa, CPF_CNPJ) VALUES (1, 'Leandro Amaro', 'F', '111.111.111-11');
INSERT INTO VOLUNTARIO (ID_Voluntario, Nome_Voluntario, CPF) VALUES (10, 'Ana Carolina', '444.444.444-44');
INSERT INTO PROJETO (ID_Projeto, Nome_Projeto, Data_Inicio) VALUES (100, 'Reforço Escolar', '2025-01-15');
INSERT INTO DOACAO (ID_Doacao, ID_Doador, ID_Projeto, Valor, Data_Doacao) VALUES (1000, 1, 100, 150.00, '2025-11-20');
INSERT INTO PARTICIPACAO (ID_Voluntario, ID_Projeto, Horas_Dedicadas) VALUES (10, 100, 40);



SELECT V.Nome_Voluntario, P.Nome_Projeto
FROM VOLUNTARIO V
JOIN PARTICIPACAO PA ON V.ID_Voluntario = PA.ID_Voluntario
JOIN PROJETO P ON PA.ID_Projeto = P.ID_Projeto;


FROM DOACAO DOA
JOIN DOADOR D ON DOA.ID_Doador = D.ID_Doador
WHERE DOA.Valor > 100.00;


UPDATE PARTICIPACAO
SET Horas_Dedicadas = Horas_Dedicadas * 1.15
WHERE ID_Voluntario = 10;


DELETE FROM DOACAO
WHERE ID_Doacao = 1000;