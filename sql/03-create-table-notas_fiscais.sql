USE icms_control;

CREATE TABLE notas_fiscais (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT 'ID único da nota fiscal',
    numero_nf VARCHAR(30) NOT NULL COMMENT 'Número da nota fiscal',
    cnpj_fornecedor CHAR(18) NOT NULL COMMENT 'CNPJ do fornecedor emissor',
    chave_acesso VARCHAR(44) UNIQUE COMMENT 'Chave de acesso da NF-e (44 dígitos)',
    data_emissao DATE NOT NULL COMMENT 'Data de emissão da nota',
    data_entrada DATE NOT NULL COMMENT 'Data de entrada na empresa',
    valor_total_nf DECIMAL(12,2) UNSIGNED NOT NULL COMMENT 'Valor total da nota fiscal',
    aliquota_icms DECIMAL(5,2) UNSIGNED COMMENT 'Alíquota de ICMS (%)',
    valor_icms DECIMAL(10,2) UNSIGNED DEFAULT 0.00 COMMENT 'Valor do ICMS destacado',
    situacao ENUM('Pendente', 'Conferida', 'Escriturada', 'Cancelada') DEFAULT 'Pendente' COMMENT 'Status da nota',
    observacoes TEXT COMMENT 'Observações gerais, informações destinadas ao Fisco',
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Data/hora de registro no sistema'
) DEFAULT CHARSET = utf8mb4, DEFAULT COLLATE = utf8mb4_unicode_ci COMMENT = 'Notas fiscais de entrada';