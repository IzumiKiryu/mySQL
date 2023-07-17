create database artiste;
use artiste;

-- table classique

create table utilisateur(
id_utilisateur int primary key auto_increment not null,
nom_utilisateur varchar(50) not null,
prenom_utilisateur varchar(50) not null,
email_utilisateur varchar(50) unique not null,
password_utilisateur varchar(100) not null,
statut_utilisateur tinyint(1) default 0,
id_role_utilisateur int
)Engine=InnoDB;

create table role_utilisateur(
id_role_utilisateur int primary key auto_increment not null,
nom_role_utilisateur varchar(50) not null
)Engine=InnoDB;

create table article(
id_article int primary key auto_increment not null,
titre_article varchar(50) not null,
date_article datetime not null,
statut tinyint(1) default 0,
contenu_article text not null,
id_categorie int,
id_utilisateur int
)Engine=InnoDB;

create table categorie(
id_categorie int primary key auto_increment not null,
nom_categorie varchar(50) not null
)Engine=InnoDB;

create table message(
id_message int primary key auto_increment not null,
contenu_message varchar(200) not null,
date_message datetime not null,
statut_message tinyint(1) default 0
)Engine=InnoDB;

create table media(
id_media int primary key auto_increment not null,
url_media varchar(100) not null,
nom_media varchar(50) not null
)Engine=InnoDB;

create table commentaire(
id_commentaire int primary key auto_increment not null,
message_commentaire varchar(200) not null,
date_commentaire datetime not null,
statut_commentaire tinyint(1) default 0,
id_article int,
id_utilisateur int
)Engine=InnoDB;

create table groupe(
id_groupe int primary key auto_increment not null,
nom_groupe varchar(50) not null
)Engine=InnoDB;

-- table association

create table abonner(
abonne int not null,
utilisateur int not null,
primary key(abonne, utilisateur)
)Engine=InnoDB;

create table appartenir(
id_utilisateur int not null,
id_groupe int not null,
primary key(id_utilisateur, id_groupe)
)Engine=InnoDB;

create table illustrer(
id_article int not null,
id_media int not null,
primary key(id_article, id_media)
)Engine=InnoDB;

create table envoyer(
destinataire int not null,
expediteur int not null,
id_message int not null,
primary key(destinataire,expediteur,id_message)
)Engine=InnoDB;

-- contraintes foreign key

alter table utilisateur
add constraint fk_posseder_role
foreign key(id_role_utilisateur)
references role_utilisateur(id_role_utilisateur);

alter table article
add constraint fk_rediger_utilisateur
foreign key(id_utilisateur)
references utilisateur(id_utilisateur);

alter table article
add constraint fk_categoriser_categorie
foreign key(id_categorie)
references categorie(id_categorie);

alter table commentaire
add constraint fk_completer_utilisateur
foreign key(id_utilisateur)
references utilisateur(id_utilisateur);

alter table commentaire
add constraint fk_completer_commentaire
foreign key(id_article)
references article(id_article);

-- contrainte table association

alter table abonner
add constraint fk_abonner_utilisateur
foreign key(utilisateur)
references utilisateur(id_utilisateur);

alter table abonner
add constraint fk_abonner_abonne
foreign key(abonne)
references utilisateur(id_utilisateur);

alter table appartenir
add constraint fk_appartenir_utilisateur
foreign key(id_utilisateur)
references utilisateur(id_utilisateur);

alter table appartenir
add constraint fk_appartenir_groupe
foreign key(id_groupe)
references groupe(id_groupe);

alter table illustrer
add constraint fk_illustrer_article
foreign key(id_article)
references article(id_article);

alter table illustrer
add constraint fk_illustrer_media
foreign key(id_media)
references media(id_media);

alter table envoyer
add constraint fk_envoyer_destinataire
foreign key(destinataire)
references utilisateur(id_utilisateur);

alter table envoyer
add constraint fk_envoyer_expediteur
foreign key(expediteur)
references utilisateur(id_utilisateur);

alter table envoyer
add constraint fk_envoyer_message
foreign key(id_message)
references message(id_message);





    