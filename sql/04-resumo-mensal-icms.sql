USE icms_control;

CREATE TABLE resumo_mensal_icms(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT 'ID único do resumo mensal',
    mes_ref DATE NOT NULL UNIQUE COMMENT 'Mês de referência (formato YYYY-MM-01)',
    total_notas INT UNSIGNED DEFAULT 0 COMMENT 'Quantidade total de notas fiscais no mês',
    valor_total_entradas DECIMAL(15,2) UNSIGNED DEFAULT 0.00 COMMENT 'Valor total das entradas do mês',
    total_icms_credito DECIMAL(15,2) UNSIGNED DEFAULT 0.00 COMMENT 'Total de créditos de ICMS no mês',
    media_aliquota DECIMAL(5,2) UNSIGNED COMMENT 'Alíquota média de ICMS do período (%)',
    data_fechamento DATE COMMENT 'Data de fechamento/apuração do mês',
    status_apuracao ENUM('Conferido', 'Pendente') DEFAULT 'Pendente' COMMENT 'Status da apuração mensal'
) DEFAULT CHARSET = utf8mb4, DEFAULT COLLATE = utf8mb4_unicode_ci COMMENT 'Resumo mensal de apuração de ICMS';
