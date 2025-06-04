DROP DATABASE IF EXISTS automarket;
CREATE DATABASE automarket DEFAULT CHARACTER SET utf8;

USE automarket;

DROP TABLE IF EXISTS car_features;
DROP TABLE IF EXISTS features;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS users;

CREATE TABLE cars (
  id BIGINT NOT NULL AUTO_INCREMENT,
  brand VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE features (
  id BIGINT NOT NULL AUTO_INCREMENT,
  feature_type VARCHAR(30) NOT NULL,  
  feature_value VARCHAR(50) NOT NULL,  
  PRIMARY KEY (id),
  UNIQUE KEY (feature_type, feature_value)  
);

CREATE TABLE car_features (
  car_id BIGINT NOT NULL,
  feature_id BIGINT NOT NULL,
  PRIMARY KEY (car_id, feature_id),
  FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE CASCADE,
  FOREIGN KEY (feature_id) REFERENCES features(id) ON DELETE CASCADE
);

CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  username VARCHAR(64) NOT NULL,
  password VARCHAR(64) NOT NULL,
  authority VARCHAR(64) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (username)
);

INSERT INTO cars (brand, model, year, price, status) VALUES 
('Toyota', 'Camry', 2022, 30000.00, 'ON_SALE'),
('Tesla', 'Model S', 2023, 90000.00, 'ON_SALE'),
('BMW', 'X5', 2022, 65000.00, 'BOOKED');

INSERT INTO features (feature_type, feature_value) VALUES
('Двигатель', '2.0L бензин'),
('Двигатель', '3.0L дизель'),
('Двигатель', 'Электрический'),
('Цвет', 'Красный'),
('Цвет', 'Синий'),
('Цвет', 'Черный'),
('Цвет', 'Зелёный'),
('Цвет', 'Белый'),
('Цвет', 'Жёлтый'),
('Цвет', 'Серый'),
('Коробка передач', 'Автомат'),
('Коробка передач', 'Механика'),
('Привод', 'Передний'),
('Привод', 'Полный'),
('Цвет салона', 'Красный'),
('Цвет салона', 'Синий'),
('Цвет салона', 'Черный'),
('Цвет салона', 'Зелёный'),
('Цвет салона', 'Белый'),
('Цвет салона', 'Жёлтый'),
('Цвет салона', 'Серый');

INSERT INTO car_features (car_id, feature_id) VALUES
(1, 1), (1, 4), (1, 7), (1, 17),  
(2, 3), (2, 5), (2, 7), (1, 18), 
(3, 2), (3, 6), (3, 7), (3, 10);  

INSERT INTO users (username, password, authority) VALUES 
('admin', '$2a$10$jrryFNptnoGWwyWhxc47eeeHpin/LPOut7J221Xv4DB3qTswVcvJS', 'ROLE_ADMIN'),
('manager', '$2a$10$uJnN.ggxcNajsWj96CjeguwgJMkEMbkb7JwzH1DuDQt0092TNuZuW', 'ROLE_MANAGER');