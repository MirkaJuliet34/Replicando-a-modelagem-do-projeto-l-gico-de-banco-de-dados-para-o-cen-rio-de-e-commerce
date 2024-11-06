CREATE DATABASE esquema_completo;
USE esquema_completo;

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    tipo_cliente ENUM('PJ', 'PF') NOT NULL,
    UNIQUE (id)
);

CREATE TABLE Itens (
    id INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id)
);

SELECT Clientes.nome, COUNT(Pedidos.id) AS total_pedidos
FROM Clientes
JOIN Pedidos ON Clientes.id = Pedidos.id_cliente
GROUP BY Clientes.nome;

SELECT Clientes.nome, SUM(Produtos.preco * Itens.quantidade) AS receita_total
FROM Pedidos
JOIN Itens ON Pedidos.id = Itens.id_pedido
JOIN Produtos ON Itens.id_produto = Produtos.id
JOIN Clientes ON Pedidos.id_cliente = Clientes.id
GROUP BY Clientes.nome
ORDER BY receita_total DESC;

SELECT Clientes.nome, COUNT(Pedidos.id) AS total_pedidos
FROM Clientes
JOIN Pedidos ON Clientes.id = Pedidos.id_cliente
GROUP BY Clientes.nome
HAVING total_pedidos > 5;

