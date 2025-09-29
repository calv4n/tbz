drop database if exists M_164;
create database M_164;
use M_164;

CREATE TABLE schuhe (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  farbe VARCHAR(255),
  groesse INT,
  preis DECIMAL(10, 2)
);

INSERT INTO schuhe (name, farbe, groesse, preis)
VALUES ('Nike', 'Weiß', 43, 109.99), ('Rebook', 'Schwarz', '43', 79.99), ('Adidas', 'Grün', 44, 119.99);  

select * from schuhe;