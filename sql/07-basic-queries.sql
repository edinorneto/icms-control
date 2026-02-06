USE icms_control;

-- Contagens de nota por situacao
SELECT situacao, count(*) as quantidade FROM notas_fiscais
GROUP BY situacao
ORDER BY quantidade DESC;

-- Todas as notas de Janeiro
SELECT numero_nf, valor_total_nf, data_emissao FROM notas_fiscais
WHERE year(data_emissao) = 2026 AND month(data_emissao) = 01
GROUP BY numero_nf, valor_total_nf, data_emissao
ORDER BY numero_nf;

-- Contagem de quantos sao contribuitens do ICMS
SELECT contribuinte_icms, count(*) AS quantidade FROM fornecedores
group by contribuinte_icms;

-- Todos contribuintes ICMS
SELECT id, cnpj, nome_fantasia, contribuinte_icms FROM fornecedores 
WHERE contribuinte_icms = 'Sim'
ORDER BY id;

-- Notas com valor acima de 10.000,00
SELECT numero_nf, cnpj_fornecedor, valor_total_nf FROM notas_fiscais
WHERE valor_total_nf > 10.000
ORDER BY numero_nf;

-- Ultimas 10 notas lancadas
SELECT id, numero_nf, valor_total_nf FROM notas_fiscais
ORDER BY id
LIMIT = 10;