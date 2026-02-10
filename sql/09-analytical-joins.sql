USE icms_control;

-- Notas + fornecedor, ordenando pelas mais recentes
SELECT nf.id, nf.data_emissao, nf.numero_nf, nf.valor_total_nf, f.razao_social
FROM notas_fiscais AS nf
JOIN fornecedores AS f
  ON nf.cnpj_fornecedor = f.cnpj
ORDER BY nf.data_emissao DESC, nf.id DESC;

-- Fornecedores sem notas
SELECT f.id, f.cnpj, f.razao_social
FROM fornecedores AS f
LEFT JOIN notas_fiscais AS nf
  ON f.cnpj = nf.cnpj_fornecedor
WHERE nf.id IS NULL
ORDER BY f.razao_social DESC;

-- Notas órfãs
SELECT nf.id, nf.data_emissao, nf.numero_nf, nf.valor_total_nf
FROM notas_fiscais AS nf
LEFT JOIN fornecedores AS f
  ON nf.cnpj_fornecedor = f.cnpj
WHERE f.id IS NULL
ORDER BY nf.id DESC;

-- Total por fornecedor
SELECT f.cnpj, f.razao_social,
       SUM(nf.valor_total_nf) AS total_fornecedor,
       COUNT(*) AS quantidade_notas
FROM notas_fiscais AS nf
JOIN fornecedores AS f
  ON f.cnpj = nf.cnpj_fornecedor
GROUP BY f.cnpj, f.razao_social
ORDER BY total_fornecedor DESC;

-- Notas com ICMS destacado
SELECT f.cnpj, f.razao_social, nf.numero_nf, nf.valor_total_nf, nf.aliquota_icms, nf.valor_icms
FROM notas_fiscais AS nf
JOIN fornecedores AS f
  ON nf.cnpj_fornecedor = f.cnpj
WHERE nf.valor_icms > 0
ORDER BY nf.valor_icms DESC, nf.data_emissao DESC;

-- Notas com ICMS zero ou nulo
SELECT f.cnpj, f.razao_social, nf.numero_nf, nf.valor_total_nf, nf.aliquota_icms, nf.valor_icms
FROM fornecedores AS f
LEFT JOIN notas_fiscais AS nf
  ON f.cnpj = nf.cnpj_fornecedor
WHERE nf.valor_icms = 0 OR nf.valor_icms IS NULL
ORDER BY f.id;

-- Ranking mensal por fornecedor
SELECT DATE_FORMAT(nf.data_emissao, '%Y-%m') AS mes,
       f.cnpj,
       f.razao_social,
       SUM(nf.valor_total_nf) AS total_mes,
       COUNT(*) AS quantidade_notas
FROM notas_fiscais AS nf
JOIN fornecedores AS f
  ON nf.cnpj_fornecedor = f.cnpj
GROUP BY mes, f.cnpj, f.razao_social
ORDER BY mes DESC, total_mes DESC;

-- Notas com situação pendente ou conferida
SELECT nf.data_emissao, f.cnpj, f.razao_social, nf.numero_nf, nf.valor_total_nf, nf.situacao
FROM notas_fiscais AS nf
JOIN fornecedores AS f
  ON f.cnpj = nf.cnpj_fornecedor
WHERE nf.situacao IN ('Pendente', 'Conferida')
ORDER BY nf.data_emissao DESC;

-- Última nota de cada fornecedor
SELECT *
FROM (
  SELECT nf.*,
         ROW_NUMBER() OVER (
           PARTITION BY f.cnpj
           ORDER BY nf.data_emissao DESC, nf.id DESC
         ) AS rn
  FROM notas_fiscais AS nf
  JOIN fornecedores AS f
    ON f.cnpj = nf.cnpj_fornecedor
) AS t
WHERE t.rn = 1;