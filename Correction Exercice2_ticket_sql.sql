-- créer la base de données

create database ticket;
use ticket;

-- créer les tables

create table product(
id_product int primary key auto_increment not null,
name_product varchar(50) not null,
description_product text not null,
price_product float not null,
id_category int not null
)Engine=InnoDB;

create table category(
id_category int primary key auto_increment not null,
name_category varchar(50) not null
)Engine=InnoDB;

create table receipt(
id_receipt int primary key auto_increment not null,
date_receipt datetime not null,
id_seller int not null
)Engine=InnoDB;

create table seller(
id_seller int primary key auto_increment not null,
name_seller varchar(50) not null,
first_name_seller varchar(50) not null
)Engine=InnoDB;

create table to_add(
id_product int not null,
id_receipt int not null,
qtx_add int not null,
primary key(id_product, id_receipt)
)Engine=InnoDB;

-- Ajouter les contraintes Foreign key

alter table product
add constraint fk_completer_category
foreign key(id_category)
references category(id_category);

alter table receipt
add constraint fk_vendre_seller
foreign key(id_seller)
references seller(id_seller);

alter table to_add
add constraint fk_ajouter_produit
foreign key(id_product)
references product(id_product),
add constraint fk_ajouter_ticket
foreign key(id_receipt)
references receipt(id_receipt);