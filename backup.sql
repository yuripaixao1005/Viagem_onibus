CREATE DATABASE IF NOT EXISTS Viagem_Onibus;
USE Viagem_Onibus;

-- Tabela Passageiros
CREATE TABLE IF NOT EXISTS Passageiros (
    passageiro_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Veículos
CREATE TABLE IF NOT EXISTS Veiculos (
    veiculos_id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    capacidade INT NOT NULL,
    ano_fabricacao YEAR
);

-- Tabela Viagens
CREATE TABLE IF NOT EXISTS Viagens (
    viagem_id INT AUTO_INCREMENT PRIMARY KEY,
    origem VARCHAR(100),
    destino VARCHAR(100),
    data_hora_saida DATETIME,
    data_hora_chegada DATETIME,
    veiculos_id INT,
    FOREIGN KEY (veiculos_id) REFERENCES Veiculos(veiculos_id)
);

-- Tabela Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    passageiro_id INT,
    viagem_id INT,
    assento VARCHAR(5),
    data_reserva DATETIME,
    FOREIGN KEY (passageiro_id) REFERENCES Passageiros(passageiro_id),
    FOREIGN KEY (viagem_id) REFERENCES Viagens(viagem_id)
);

-- Tabela Funcionários
CREATE TABLE IF NOT EXISTS Funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO Passageiros (nome, cpf, data_nascimento, telefone, email)
VALUES
('João Silva', '123.456.789-00', '1985-05-20', '(11) 98765-4321', 'joao.silva@example.com'),
('Maria Oliveira', '987.654.321-00', '1990-07-15', '(21) 99876-5432', 'maria.oliveira@example.com');

INSERT INTO veiculos (placa, modelo, capacidade, ano_fabricacao)
VALUES
('ABC1D23', 'Mercedes-Benz OF-1721', 42, 2018),
('XYZ9W88', 'Volvo B8R', 45, 2020);

INSERT INTO viagens (origem, destino, data_hora_saida, data_hora_chegada, veiculos_id)
VALUES
('São Paulo', 'Rio de Janeiro', '2024-08-15 08:00:00', '2024-08-15 18:00:00', 1),
('Rio de Janeiro', 'Belo Horizonte', '2024-08-16 09:00:00', '2024-08-16 14:00:00', 2);

INSERT INTO Reservas (passageiro_id, viagem_id, assento, data_reserva)
VALUES
(1, 1, '12A', '2024-08-10 14:30:00'),
(2, 2, '22B', '2024-08-11 09:00:00');

INSERT INTO Funcionarios (nome, cpf, cargo, telefone, email)
VALUES
('Carlos Mendes', '456.123.789-00', 'Motorista', '(31) 99999-1111', 'carlos.mendes@example.com'),
('Ana Santos', '321.654.987-00', 'Atendente', '(41) 98888-2222', 'ana.santos@example.com');

