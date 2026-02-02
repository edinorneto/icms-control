USE icms_control;

CREATE TABLE resumo_mensal_icms(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    mes_ref DATE NOT NULL UNIQUE,
    total_notas INT UNSIGNED DEFAULT 0,
    valor_total_entradas DECIMAL (15,2) UNSIGNED DEFAULT 0.00,
    total_icms_credito DECIMAL (15,2) UNSIGNED DEFAULT 0.00,
    media_aliquota DECIMAL (5,2) UNSIGNED
    data_fechamento DATE
    status_apuracao enum('Conferido', 'Pendente') DEFAULT 'Pendente'
) DEFAULT CHARSET = utf8mb4, DEFAULT COLLATE = utf8mb4_unicode_ci;