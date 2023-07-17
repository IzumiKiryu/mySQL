drop database test ; create database test;
use test;
CREATE USER 'alice'@'localhost' IDENTIFIED BY 'password';
grant all privileges on *.* to 'alice'@'localhost';
show grants for 'alice'@'localhost';
flush privileges;
create table users(
id int primary key NOT null auto_increment,
 name varchar(100),
 email varchar(255) NOT null
 );
 use test;
 alter table users
 add firstname varchar(100) after name;
 create index index_email on users (email);
create table employes(
	id int not null,
    nom varchar(100) not null,
    email varchar(100) not null unique,
    age int not null check (age >=18),
    salaire decimal (8, 2) default 3000.00,
    primary key (id)
);
create table conges(
	id int primary key not null auto_increment,
    date_debut date not null,
    date_fin date not null,
    id_employe int,
    foreign key(id_employe) references employes(id) on delete cascade
    );
    
create database shop_db;
use shop_db;
create user 'admin'@'localhost' identified by '123456';
create user 'developper'@'localhost' identified by '1234567';
grant all privileges on *.* to 'admin'@'localhost';
grant alter, create, drop, index, update on shop_db.* to 'developper'@'localhost';
create table Customer(
	id int primary key NOT null auto_increment,
	username varchar(16) NOT null unique,
	email varchar(255) NOT null unique,
    password varchar(32) NOT null,
    create_time timestamp
 );
create table Adress(
	id int primary key NOT null auto_increment,
	road_number int,
    road_name varchar(100) NOT null,
    zip_code char(5) NOT null,
    city_name varchar(100) NOT null,
    country_name varchar(100) NOT null
);
create table `Order`(
	id int primary key NOT null auto_increment,
	ref varchar(45) NOT null unique,
	date date NOT null,
    shipping_cost decimal (6, 2) default 0.00,
    total_amount decimal (6, 2) default 0.00
);
create table Product(
	ref char(20) primary key,
    name varchar(100) NOT null,
    price decimal (6, 2) NOT null,
    description longtext,
    stock int default 0
);
create table Order_Product(
quantity int default 0,
	constraint fk_id_product foreign key (id_product) references product(id)
);

-- create database judo;
-- use judo;
-- create user 'adminclubjudo'@'localhost' IDENTIFIED BY 'pAssword';
-- grant all privileges on *.* to 'adminclubjudo'@'localhost';

-- create table judokas(
-- 	id int primary key NOT null auto_increment,
-- 	name varchar(50),
--     first_name varchar(50),
-- 	age int not null,
--     sex boolean
--  );
--  
--  create table belt(
-- 	id int primary key NOT null auto_increment,
--     belt_color varchar(50),
--     CONSTRAINT fk_id_judokas FOREIGN KEY (id_judokas) REFERENCES judokas(id)
-- );

-- create table competition(
-- 	id int primary key NOT null auto_increment,
--     name_competition varchar(50),
--     date_start date NOT null,
--     date_end date NOT null
-- );

-- Correction : --
use judo;
create table judoka(
id_judoka int primary key auto_increment not null,
nom_judoka varchar(50) not null,
prenom_judoka varchar(50) not null,
age_judoka int not null,
sexe_judoka tinyint(1) not null,
id_ceinture int not null
)Engine=InnoDB;

create table ceinture(
id_ceinture int primary key auto_increment not null,
couleur_ceinture varchar(50) not null
)Engine=InnoDB;

create table competition(
id_competition int primary key auto_increment not null,
nom_competition varchar(50) not null,
date_debut_competition datetime not null,
date_fin_competiton datetime not null
)Engine=InnoDB;

create table participer(
id_judoka int not null,
id_competition int not null,
primary key(id_judoka, id_competition)
)Engine=InnoDB;

alter table judoka
add constraint fk_posseder_ceinture
foreign key(id_ceinture)
references ceinture(id_ceinture);

alter table participer
add constraint fk_participer_competition
foreign key(id_competition)
references competition(id_competition);

alter table participer
add constraint fk_participer_judoka
foreign key(id_judoka)
references judoka(id_judoka);

-- Exercice 2 : shop --

create database shop;
use shop;
create table product_shop(
id_product_shop int primary key auto_increment not null,
name_product_shop varchar(50),
description_product_shop text,
price_product_shop real,
id_category_shop int not null
)Engine=InnoDB;

create table category_shop(
id_category_shop int primary key auto_increment not null,
name_category_shop varchar(50)
)Engine=InnoDB;

create table seller_shop(
id_seller_shop int primary key auto_increment not null,
name_seller_shop varchar(50),
first_name_shop varchar(50)
)Engine=InnoDB;

create table receipt_shop(
id_receipt_shop int primary key auto_increment not null,
date_receipt_shop datetime,
id_seller_shop int not null
)Engine=InnoDB;

create table toadd(
id_product_shop int not null,
id_receipt_shop int not null,
qtx_add int not null,
primary key(id_product_shop, id_receipt_shop)
)Engine=InnoDB;

alter table toadd
add constraint fk_receipt_shop
foreign key(id_receipt_shop)
references receipt_shop(id_receipt_shop);

alter table toadd
add constraint fk_product_shop
foreign key(id_product_shop)
references product_shop(id_product_shop);

-- Ok c'est bon, mais il manque les 2 foreign key (tables produits et ticket) --

-- Exercice 3 --

create database chocoblast;
use chocoblast;

create table roles(
id_roles int primary key auto_increment not null,
name_roles varchar(50)
);

create table users(
id_users int primary key auto_increment not null,
name_users varchar(50),
firstname_users varchar(50),
email_users varchar(50),
password_users varchar(100),
image_users varchar(100),
statut_users tinyint(1) not null,
id_roles int 
)Engine=InnoDB;

create table chocoblast(
id_chocoblast int primary key auto_increment not null,
slogan_chocoblast text,
date_creation_chocoblast date,
statut_chocoblast tinyint(1) not null,
cible int,
auteur int
)Engine=InnoDB;

create table commentary(
id_commentary int primary key auto_increment not null,
note_commentary int not null,
content_commentary text not null,
date_creation_commentary datetime not null,
statut_commentary tinyint(1) not null,
id_chocoblast int,
auteur int
)Engine=InnoDB;

alter table users
add constraint fk_posseder_roles
foreign key(id_roles)
references roles(id_roles);

alter table chocoblast
add constraint fk_chocoblaster_auteur
foreign key(auteur)
references users(id_users);

alter table chocoblast
add constraint fk_cibler_cible
foreign key(cible)
references users(id_users);

alter table commentary
add constraint fk_rattacher_chocoblast
foreign key(id_chocoblast)
references chocoblast(id_chocoblast);

alter table commentary
add constraint fk_poster_users
foreign key(auteur)
references users(id_users);

-- Exercice requête MAJ INSERT (base ticket) --

show databases;
use ticket1;
INSERT INTO category(name_category) VALUES ("alimentaire"),("produit"),("loisir");

INSERT INTO product(name_product, description_product, price_product, id_category) 
VALUES ("tomate","paquet de 3kgs de tomates",4.20,1),
("pain","baguette de pain de 350gr",0.90,1),
("lessive","paquet de lessive de 1kg",14.30,2),
("livre","livre sur le cinéma",29.99,3);

INSERT INTO seller(name_seller, first_name_seller)
VALUES ("Dupont","Sophie"),
("Albert","Marc");

INSERT INTO receipt(date_receipt, id_seller)
VALUES ("2023-02-03","1"),
("2023-05-06","2"),
("2023-07-14","2");

INSERT INTO to_add(id_product, id_receipt, qtx_add)
VALUES (14,4,5),
(13,6,2),
(15,5,1),
(16,4,2);

-- Exercice requête MAJ UPDATE (base ticket) --

UPDATE category SET name_category = 'alimentation' WHERE name_category='alimentaire';
UPDATE category SET name_category = 'autre' WHERE id_category=2;
UPDATE product SET price_product = 34.99 WHERE id_product=16;
UPDATE product SET price_product = 0.90 WHERE id_product=14;
UPDATE product SET description_product = 'Lessive liquide 40 lavages' WHERE id_product=15;
UPDATE product SET price_product = price_product + 1;
UPDATE seller SET name_seller = 'Dupont', first_name_seller = 'Anne' WHERE id_seller=1;
UPDATE seller SET name_seller = 'Albert', first_name_seller='Marc' WHERE id_seller=2;
UPDATE seller SET first_name_seller='Maxime' WHERE name_seller = 'Albert';
UPDATE receipt SET date_receipt='2023-06-23' WHERE id_receipt=5;
UPDATE receipt SET date_receipt='2023-07-14' WHERE id_receipt=6;
UPDATE receipt SET id_seller=1 WHERE date_receipt="2023-07-14";
UPDATE to_add SET qtx_add=qtx_add+2 WHERE id_receipt=4 AND id_product=14;
UPDATE to_add SET id_product=15 WHERE id_receipt=6 AND id_product=13;
