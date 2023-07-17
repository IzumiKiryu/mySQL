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

create database judo;
use judo;
create user 'adminclubjudo'@'localhost' IDENTIFIED BY 'pAssword';
grant all privileges on *.* to 'adminclubjudo'@'localhost';

create table judokas(
	id int primary key NOT null auto_increment,
	name varchar(50),
    first_name varchar(50),
	age int not null,
    sex boolean
 );
 
 create table belt(
	id int primary key NOT null auto_increment,
    belt_color varchar(50),
    CONSTRAINT fk_id_judokas FOREIGN KEY (id_judokas) REFERENCES judokas(id)
);

create table competition(
	id int primary key NOT null auto_increment,
    name_competition varchar(50),
    date_start date NOT null,
    date_end date NOT null
);


    