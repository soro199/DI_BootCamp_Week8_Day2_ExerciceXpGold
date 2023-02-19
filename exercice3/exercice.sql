-- Créer la table items
CREATE TABLE items (
  items_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  price DECIMAL(10,2)
);

-- Créer la table customers
CREATE TABLE customers (
  customers_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(20)
);


-- Insérer des données dans la table "items"
INSERT INTO items (items_id, name, description, price) VALUES
  (1, 'Petit bureau', '', 100),
  (2, 'Grand bureau', '', 300),
  (3, 'Ventilateur', '', 80);

-- Insérer des données dans la table "customers"
INSERT INTO customers (customers_id, name, email, phone) VALUES
  (1, 'Greg Jones', 'greg.jones@example.com', '555-1234'),
  (2, 'Sandra-Jones', 'sandra.jones@example.com', '555-5678'),
  (3, 'Scott Scott', 'scott.scott@example.com', '555-9101'),
  (4, 'Trevor Vert', 'trevor.vert@example.com', '555-1212'),
  (5, 'Mélanie-Johnson', 'melanie.johnson@example.com', '555-1515');
  

-- Créer la table achats avec les clés étrangères
CREATE TABLE achats (
  id SERIAL PRIMARY KEY,
  customers_id INT REFERENCES customers(customers_id),
  items_id INT REFERENCES items(items_id),
  quantity_purchased INT
);



-- Insérer les achats des clients
INSERT INTO achats (customers_id, items_id, quantity_purchased) VALUES
  ((SELECT customers_id FROM customers WHERE name = 'Scott Scott'), (SELECT items_id FROM items WHERE name = 'Ventilateur'), 1),
  ((SELECT customers_id FROM customers WHERE name = 'Melanie-Johnson'), (SELECT items_id FROM items WHERE name = 'Grand bureau'), 10),
  ((SELECT customers_id FROM customers WHERE name = 'Greg Jones'), (SELECT items_id FROM items WHERE name = 'Petit bureau'), 2);


--Afficharge des elements de la table achats

SELECT * FROM achats;

/* 
  1. Afficher le nom de tous les achats et clients
*/

SELECT * FROM achats
JOIN customers
ON achats.customers_id = customers.customers_id;



/*
  Afficher le nom de tous les clients et le nom de tous les achats pour le client avec l'id 5
*/

SELECT * FROM achats
WHERE customers_id = 5;



/*afficher les achats ou il y'a grand bureau et petit bureau*/

SELECT a.*
FROM achats a
INNER JOIN items i1 ON a.items_id = i1.items_id AND i1.name = 'Grand bureau'
INNER JOIN items i2 ON a.items_id = i2.items_id AND i2.name = 'Petit bureau';




-- Afficher le prénom de tous les clients
  
SELECT TRIM(SPLIT_PART(customers.name, ' ', 2)) AS first_name
FROM customers
INNER JOIN achats ON customers.customers_id = achats.customers_id;


--Afficher le nom de tous les clients
SELECT SPLIT_PART(customers.name, ' ', 1) AS last_name
FROM customers
INNER JOIN achats ON customers.customers_id = achats.customers_id;

-- Afficher le nom de tous les achats
  
SELECT items.name
FROM items
INNER JOIN achats on items.items_id = achats.items_id;


-- Insérer un achat pour le client avec l'id 1 et sans item_id
INSERT INTO achats (customers_id, items_id) VALUES (1, NULL);
