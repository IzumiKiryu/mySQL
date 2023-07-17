create database choco;
use choco;

create table roles(
id_roles int primary key auto_increment not null,
nom varchar(50) not null
)Engine=InnoDB;

create table utilisateur(
id_utilisateur int primary key auto_increment not null,
nom varchar(50) not null,
prenom varchar(50) not null,
email varchar(50) not null,
password varchar(100) not null,
image varchar(50) not null,
statut tinyint(1) default 0,
id_roles int not null
)Engine=InnoDB;

create table chocoblast(
id_chocoblast int primary key auto_increment not null,
slogan text not null,
date_creation date not null,
statut tinyint(1) default 0,
auteur int not null,
cible int not null
)Engine=InnoDB;

create table commentaire(
id_commentaire int primary key auto_increment not null,
note int not null,
contenu text not null,
date_creation datetime not null,
statut tinyint(1) default 0,
id_chocoblast int not null,
auteur int not null
)Engine=InnoDB;

alter table utilisateur
add constraint fk_posseder_roles
foreign key(id_roles)
references roles(id_roles);

alter table chocoblast
add constraint fk_chocoblaster_utilisateur
foreign key(auteur)
references utilisateur(id_utilisateur);

alter table chocoblast
add constraint fk_cibler_utilisateur
foreign key(cible)
references utilisateur(id_utilisateur);

alter table commentaire
add constraint fk_poster_utilisateur
foreign key(auteur)
references utilisateur(id_utilisateur);

alter table commentaire
add constraint fk_rattacher_chocoblast
foreign key(id_chocoblast)
references chocoblast(id_chocoblast);
