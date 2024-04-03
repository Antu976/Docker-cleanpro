
CREATE DATABASE IF NOT EXISTS cleanpro;
USE cleanpro;

CREATE TABLE IF NOT EXISTS client (
	id_client INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_client VARCHAR(100),
    prenom_client VARCHAR(100),
    email_client VARCHAR(255) NOT NULL unique,
    telephone INT(10) NOT NULL,
    adresse VARCHAR (500),
    code_postale INT(6),
    ville_rdv VARCHAR(30),
    mdp VARCHAR(200) NOT NULL
);


CREATE TABLE IF NOT EXISTS service(
id_service INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
type_service VARCHAR (100) NOT NULL,
prix FLOAT(5) NOT NULL,
description_service VARCHAR (500),
durée timestamp
);

CREATE TABLE IF NOT EXISTS prestataire_service(
id_prestataire INT PRIMARY KEY not null,
email_prestataire VARCHAR(255) ,
nom VARCHAR (100) NOT NULL,
prenom VARCHAR(100) NOT NULL,
telephone INT(10) NOT NULL,
adresse VARCHAR (500),
code_postale INT(6),
ville_prestataire varchar(30),
id_service INT,
FOREIGN KEY (id_service) REFERENCES service (id_service)
);

CREATE TABLE IF NOT EXISTS devis (
id_devis INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
description_service varchar (500),
date_demande DATE NOT NULL,
prix_estime FLOAT NOT NULL,
id_client INT,
FOREIGN KEY (id_client) REFERENCES client (id_client)
);

CREATE TABLE IF NOT EXISTS rdv (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    service_rdv VARCHAR(1000),
    frequence VARCHAR(100),
    nbr_article INT(10) NOT NULL,
    date_rdv DATE NOT NULL,
    heure_rdv TIME NOT NULL,
    services_supplementaire VARCHAR(500),
	email_client VARCHAR(255),
    id_client INT,
    id_service INT,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_service) REFERENCES service (id_service)
);

CREATE TABLE IF NOT EXISTS commentaire (
id_client INT,
id_service INT,
note INT (2) NOT NULL,
date_publication DATE,
commentaire VARCHAR (500),
 FOREIGN KEY (id_client) REFERENCES client(id_client),
 FOREIGN KEY (id_service) REFERENCES service (id_service)
 );
 
 CREATE TABLE IF NOT EXISTS redaction (
 id_service int,
 id_devis int,
  FOREIGN KEY ( id_devis) REFERENCES devis ( id_devis),
 FOREIGN KEY (id_service) REFERENCES service (id_service)
 );
 
 CREATE TABLE IF NOT EXISTS honorer(
 id INT,
 id_prestataire INT,
 
 FOREIGN KEY (id) REFERENCES rdv (id),
 FOREIGN KEY (id_prestataire ) REFERENCES prestataire_service (id_prestataire )
 );
 
 

delete from client;
delete from rdv;
DESCRIBE client;


