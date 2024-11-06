# Projeto de Banco de Dados - E-commerce

Este projeto é uma modelagem de banco de dados para um cenário de e-commerce, incluindo a definição de tabelas, relacionamentos e queries SQL. O objetivo é criar um esquema lógico de banco de dados com tabelas inter-relacionadas, chaves primárias e estrangeiras, e constraints, visando atender as necessidades de um sistema de e-commerce.

## Objetivo do Projeto

O projeto visa replicar uma modelagem de banco de dados para um cenário de e-commerce, criando um script SQL que:

1. Define a estrutura de tabelas e relacionamentos (modelagem EER).
2. Implementa queries SQL complexas com operações de filtragem, ordenação, junção e agregação de dados.
3. Testa o esquema de banco de dados com dados fictícios e executa consultas para extrair insights.

## Estrutura do Banco de Dados

O banco de dados possui as seguintes tabelas principais:

- **Clientes**: Tabela com dados dos clientes, que podem ser pessoas físicas (PF) ou jurídicas (PJ).
- **Pedidos**: Armazena os pedidos realizados, com uma ligação ao cliente.
- **Produtos**: Informações dos produtos disponíveis no e-commerce.
- **Itens**: Detalha os itens de cada pedido, ligando produtos e pedidos.
- **Pagamentos**: Registra as formas de pagamento utilizadas.
- **Entrega**: Contém informações sobre o status e o código de rastreio de cada pedido.

### Relacionamentos Principais

- **Pedidos** possui uma chave estrangeira referenciando **Clientes**.
- **Itens** possui chaves estrangeiras referenciando **Pedidos** e **Produtos**.
- **Pagamentos** pode armazenar múltiplos registros para um mesmo **Pedido** (um pedido pode ter mais de uma forma de pagamento).
- **Entrega** está relacionada com **Pedidos**, detalhando o status e código de rastreamento.

## Estrutura do Banco de Dados

### Diagrama EER

*Adicione aqui uma imagem do diagrama EER, se possível.*

### Script SQL para Criação do Banco de Dados

O arquivo SQL `schema.sql` contém todas as instruções para criar as tabelas e relacionamentos do banco de dados. 

## Instruções de Uso

1. Clone este repositório e abra o arquivo `schema.sql` em um editor de SQL.
2. Execute o script SQL em seu sistema de gerenciamento de banco de dados (SGBD) para criar o esquema do banco de dados.
3. Insira dados de teste nas tabelas para validar o funcionamento do banco de dados e das queries.

## Queries de Exemplo

Aqui estão algumas queries SQL para recuperar informações do banco de dados:

1. **Listar todos os pedidos de cada cliente**:
   ```sql
   SELECT c.nome AS Cliente, COUNT(p.id) AS TotalPedidos
   FROM Clientes c
   JOIN Pedidos p ON c.id = p.id_cliente
   GROUP BY c.nome;
