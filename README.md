# Pedido-Venda

Aplicando técnicas de POO, MVC, Clean Code.
Tela de pedidos de venda:

1. Tela - Pedido de Venda [Número do Pedido, Data Emissão, Cód. Cliente]

2. Tela - Itens do Pedido [Cód. Produto, Quantidade, Vlr. Unitário, Vlr. Total]

3. Para informar o produto na tela do pedido de vendas, o operador deve digitar: código do produto, quantidade e valor unitário

4. À medida que o operador digita os produtos e confirma, eles devem ir entrando em um grid para visualização. 
Deve existir um botão para inserir o produto no grid

5. O grid deve apresentar: código do produto, descrição do produto, quantidade, vlr. unitário e vlr. Total

6. Deve ser possível navegar pelo grid com seta para cima seta pra baixo

7. Estando navegando pelo grid, deve ser possível acionar ENTER sobre um produto para alterá-lo.
Poderá ser alterado quantidade e vlr. unitário. Utilizar o mesmo botão de inserir para confirmar e
atualizar o grid com as alterações feitas pelo operador

8. Estando navegando pelo grid, deve ser possível acionar DEL sobre um produto para apagá-lo.
Perguntar ao operador se realmente deseja apagá-lo

9. Permitir produtos repetidos no grid

10. Exibir no rodapé da tela o valor total do pedido

11. Incluir botão GRAVAR PEDIDO. Quando acionado, o sistema deve gravar 2 tabelas (dados gerais do
pedido e produtos do pedido)

12. Campos da tabela de pedidos dados gerais (Número pedido, Data emissão, Código cliente, Valor total)

13. Campos da tabela de pedidos produtos (Autoincrem, Número pedido, Código produto, Quantidade,
Vlr. Unitário, Vlr. Total)

14. Utilizar transação e tratar possíveis erros

15. O pedido deve possuir número sequencial crescente

16. A chave primária da tabela de dados gerais do pedido deve ser (Número pedido), não podendo haver
duplicidade entre os registros gravados

17. A chave primária da tabela de produtos deve ser (autoincrem), pois pode existir repetição de produtos

18. Criar FKs necessárias para ligar a tabela de produtos do pedido e tabela de dados gerais do pedido

19. Criar índices necessários nas tabelas de dados gerais do pedido e produtos do pedido

20. Criar botão na tela de pedidos, que deve ficar visível quando o código do cliente estiver em branco,
para carregar pedidos já gravados. Solicitar (número do pedido) e carregar o cliente e os produtos

21. Criar botão na tela de pedidos, que deve ficar visível quando o código do cliente estiver em branco,
para cancelar um pedido. Solicitar (número do pedido) e apagar as duas tabelas.

Critérios
1. Utilizado MySQL como banco de dados.
2. Utilizado conceitos de orientação a objetos.
3. Não utilizado componentes de terceiros, focando sempre no que é nativo da IDE.