Projeto criado para o módulo de Banco de Dados da turma 913 (Dev_Makers2) da Ada.
Professor: Alex Facincani

Já há alguns dados persistidos na tabela. Para criar novos clientes, é necessário utilizar chaves estrangeiras de telefone e endereço. Para criar novos carros, chave estrangeira de unidade.
Para fazer a locação, basta utilizar a tabela "locação". O insert de quando o cliente ainda não devolveu o carro não deve conter dados como a data de devolução, unidade de devolução, quilômetros rodados e valor total. Esses valores devem ser atualizados num update quando o carro for devolvido e, até lá, permanecer nulos. O valor total será calculado no momento da devolução.
# CARLOCA
