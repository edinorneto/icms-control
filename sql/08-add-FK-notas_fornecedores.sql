USE icms_control;

-- Adiciona a chave estrangeira para relacao entre notas fiscais e fornecedor
ALTER TABLE notas_fiscais
ADD CONSTRAINT fk_notas_fiscais_fornecedores
FOREIGN KEY (cnpj_fornecedor)
REFERENCES fornecedores (cnpj);