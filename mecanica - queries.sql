Recupera��es simples com SELECT Statement;
select * from ordem_servico

Filtros com WHERE Statement;
select * from veiculo where placa = 'ABC1234'

Crie express�es para gerar atributos derivados;
select (data_emissao + 5) as data_limite_entrega from ordem_servico 

Defina ordena��es dos dados com ORDER BY;
select * from mao_de_obra orde by valormao_de_obra desc

Condi��es de filtros aos grupos � HAVING Statement;
select COUNT(tipo_servico_idtiposervico),veiculo_idveiculo
from ordem_servico
group by veiculo_idveiculo
having COUNT(tipo_servico_idtiposervico) > 2;

Crie jun��es entre tabelas para fornecer uma perspectiva mais complexa dos dados;
select * from ordem_servico, veiculo
where veiculo_idveiculo = idveiculo