DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS carteira CASCADE;
DROP DATABASE IF EXISTS FIAP;

CREATE DATABASE FIAP;

CREATE TABLE address (
   id_address int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   cidade VARCHAR(100) NOT NULL,
   rua VARCHAR(100) NOT NULL,
   bairro VARCHAR(100),
   numero VARCHAR(10),
   complemento VARCHAR(100)
);

CREATE TABLE users (
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   cpf VARCHAR(14) UNIQUE,
   nome VARCHAR(100) NOT NULL,
   dt_nascimento DATE NOT NULL,
   renda NUMERIC(12, 2),
   email VARCHAR(100) UNIQUE NOT NULL,
   senha VARCHAR(255) NOT NULL,
   id_address INT,
   CONSTRAINT fk_users_address FOREIGN KEY (id_address) REFERENCES address(id_address)
);


CREATE TABLE carteira (
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   saldo NUMERIC(12, 2) DEFAULT 0.00,
   id_user INT NOT NULL,
   CONSTRAINT fk_carteira_user FOREIGN KEY (id_user) REFERENCES users(id)
);


INSERT INTO address (cidade, rua, bairro, numero, complemento) VALUES
('São Paulo', 'Av. Paulista', 'Bela Vista', '1000', 'Apto 12'),
('Rio de Janeiro', 'Rua das Laranjeiras', 'Laranjeiras', '55', ''),
('Belo Horizonte', 'Av. Afonso Pena', 'Centro', '1234', 'Bloco B'),
('Curitiba', 'Rua XV de Novembro', 'Centro', '222', 'Casa'),
('Porto Alegre', 'Av. Ipiranga', 'Partenon', '987', ''),
('Fortaleza', 'Rua Dragão do Mar', 'Praia de Iracema', '300', 'Cobertura'),
('Salvador', 'Av. Sete de Setembro', 'Barra', '45', ''),
('Recife', 'Rua da Aurora', 'Boa Vista', '888', ''),
('Brasília', 'EQS 210', 'Asa Sul', '10', 'Bloco C'),
('Manaus', 'Rua Eduardo Ribeiro', 'Centro', '70', 'Apto 101');

INSERT INTO users (cpf, nome, dt_nascimento, renda, email, senha, id_address) VALUES
('123.456.789-00', 'Ana Silva', '1990-05-20', 5000.00, 'ana@email.com', '123456', 1),
('234.567.890-11', 'Bruno Costa', '1985-08-15', 6200.50, 'bruno@email.com', '123456', 2),
('345.678.901-22', 'Carlos Souza', '1979-03-10', 7200.75, 'carlos@email.com', '123456', 3),
('456.789.012-33', 'Daniela Lima', '1992-12-01', 4500.00, 'daniela@email.com', '123456', 4),
('567.890.123-44', 'Eduardo Pereira', '1988-09-25', 5300.80, 'eduardo@email.com', '123456', 5),
('678.901.234-55', 'Fernanda Rocha', '1995-11-30', 6100.90, 'fernanda@email.com', '123456', 6),
('789.012.345-66', 'Gabriel Martins', '1983-07-12', 8000.00, 'gabriel@email.com', '123456', 7),
('890.123.456-77', 'Helena Alves', '1991-02-17', 4700.40, 'helena@email.com', '123456', 8),
('901.234.567-88', 'Igor Mendes', '1986-06-28', 6900.10, 'igor@email.com', '123456', 9),
('012.345.678-99', 'Juliana Dias', '1993-04-05', 5500.25, 'juliana@email.com', '123456', 10);


INSERT INTO carteira (nome, descricao, saldo, id_user) VALUES
('Carteira Principal', 'Conta pessoal para despesas do dia a dia', 1500.00, 1),
('Investimentos', 'Aplicações de renda fixa', 3200.00, 2),
('Poupança', 'Reserva de emergência', 4500.00, 3),
('Digital Wallet', 'Carteira digital com PIX', 800.00, 4),
('Despesas Mensais', 'Contas fixas mensais', 2300.00, 5),
('Cartão Universitário', 'Controle de gastos acadêmicos', 900.00, 6),
('Caixinha de Viagem', 'Economia para viagem', 2700.00, 7),
('Empreendimento', 'Receitas de negócios', 4100.00, 8),
('Doações', 'Dinheiro separado para doações', 600.00, 9),
('Diversos', 'Despesas aleatórias e sazonais', 500.00, 10);
