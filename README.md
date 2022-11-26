# Pedido-Venda

Aplicando técnicas de POO, MVC, Clean Code.
Tela de pedidos de venda:

1. O operador deverá informar o cliente (não precisa desenvolver o cadastro), e os produtos (não precisa
desenvolver o cadastro)

2. Campos da tabela de clientes (Código, Nome, Cidade, UF)

3. Campos da tabela de produtos (Código, Descrição, Preço de venda)

4. As tabelas de clientes e produtos devem ser criadas no banco de dados e alimentadas com 20 registros
ou mais, para teste. As tabelas serão avaliadas no teste (PK, FK, índices, etc.)

5. Para informar o produto na tela do pedido de vendas, o operador deve digitar: código do produto,
quantidade e valor unitário

6. À medida que o operador digita os produtos e confirma, eles devem ir entrando em um grid para
visualização. Deve existir um botão para inserir o produto no grid

7. O grid deve apresentar: código do produto, descrição do produto, quantidade, vlr. unitário e vlr. Total

8. Deve ser possível navegar pelo grid com seta para cima seta pra baixo

9. Estando navegando pelo grid, deve ser possível acionar ENTER sobre um produto para alterá-lo.
Poderá ser alterado quantidade e vlr. unitário. Utilizar o mesmo botão de inserir para confirmar e
atualizar o grid com as alterações feitas pelo operador

10. Estando navegando pelo grid, deve ser possível acionar DEL sobre um produto para apagá-lo.
Perguntar ao operador se realmente deseja apagá-lo

11. Permitir produtos repetidos no grid

12. Exibir no rodapé da tela o valor total do pedido

13. Incluir botão GRAVAR PEDIDO. Quando acionado, o sistema deve gravar 2 tabelas (dados gerais do
pedido e produtos do pedido)

14. Campos da tabela de pedidos dados gerais (Número pedido, Data emissão, Código cliente, Valor total)

15. Campos da tabela de pedidos produtos (Autoincrem, Número pedido, Código produto, Quantidade,
Vlr. Unitário, Vlr. Total)

16. Utilizar transação e tratar possíveis erros

17. O pedido deve possuir número sequencial crescente

18. A chave primária da tabela de dados gerais do pedido deve ser (Número pedido), não podendo haver
duplicidade entre os registros gravados

19. A chave primária da tabela de produtos deve ser (autoincrem), pois pode existir repetição de produtos

20. Criar FKs necessárias para ligar a tabela de produtos do pedido e tabela de dados gerais do pedido

21. Criar índices necessários nas tabelas de dados gerais do pedido e produtos do pedido

22. Criar botão na tela de pedidos, que deve ficar visível quando o código do cliente estiver em branco,
para carregar pedidos já gravados. Solicitar (número do pedido) e carregar o cliente e os produtos

23. Criar botão na tela de pedidos, que deve ficar visível quando o código do cliente estiver em branco,
para cancelar um pedido. Solicitar (número do pedido) e apagar as duas tabelas.

Critérios
1. Utilizado MySQL como banco de dados.
2. Utilizado conceitos de orientação a objetos.
3. Não utilizado componentes de terceiros, focando sempre no que é nativo da IDE.