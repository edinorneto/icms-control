USE icms_control;

CREATE TABLE fornecedores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT 'ID único do fornecedor',
    cnpj CHAR(18) NOT NULL UNIQUE COMMENT 'CNPJ no formato XX.XXX.XXX/XXXX-XX',
    razao_social VARCHAR(200) NOT NULL COMMENT 'Razão social (nome empresarial)',
    nome_fantasia VARCHAR(150) COMMENT 'Nome fantasia (nome comercial)',
    regime ENUM('Simples Nacional', 'Lucro Real', 'Lucro Presumido') NOT NULL COMMENT 'Regime tributário',
    contribuinte_icms ENUM('Sim', 'Não') NOT NULL DEFAULT 'Sim' COMMENT 'Contribuinte de ICMS?',
    email VARCHAR(254) COMMENT 'E-mail de contato',
    telefone VARCHAR(16) COMMENT 'Telefone de contato',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de cadastro do fornecedor',
    ativo ENUM('Sim', 'Não') NOT NULL DEFAULT 'Sim' COMMENT 'Fornecedor ativo?'
)  DEFAULT CHARSET = utf8mb4, DEFAULT COLLATE = utf8mb4_unicode_ci COMMENT 'Cadastro de fornecedores';
