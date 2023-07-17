SELECT id_category, name_category FROM ticket1.category
WHERE name_category NOT LIKE 'a%';

SELECT id_product, name_product, price_product FROM product WHERE price_product <20;
-- Afficher la liste des tickets (id, date, id vendeur) qui ont une date comme date 2023/02/03
SELECT id_receipt, date_receipt, id_seller FROM receipt WHERE date_receipt = '2023-02-03';
-- Afficher la liste des vendeur avec (prenom et le nom)
SELECT first_name_seller prenom, name_seller nom FROM seller;