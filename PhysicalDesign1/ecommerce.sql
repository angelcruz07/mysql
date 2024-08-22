-- Active: 1699564752858@@127.0.0.1@3306@ecommerce

DROP TABLE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE
    users(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL,
        name VARCHAR(255) NOT NULL
    );

CREATE TABLE
    stores(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        user_id VARCHAR(255),
        name VARCHAR(255) NOT NULL,
        FOREIGN KEY (id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    products(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        store_id INT UNSIGNED,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255) NOT NULL,
        pice VARCHAR(255) NOT NULL,
        discount DECIMAL(6, 2),
        FOREIGN KEY (store_id) REFERENCES stores(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    product_image(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        product_id INT UNSIGNED,
        url VARCHAR(255) NOT NULL,
        FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    product_size(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        product_id INT UNSIGNED,
        size VARCHAR(255),
        FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    product_coolors(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        product_id INT UNSIGNED,
        color VARCHAR(255),
        FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    adreess(
        user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        country VARCHAR(255) NOT NULL,
        province VARCHAR(255),
        city VARCHAR(255) NOT NULL,
        street VARCHAR(255) NOT NULL,
        number VARCHAR(255) NULL,
        unit VARCHAR(255) NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    orders (
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        status BOOLEAN NOT NULL,
        total_price DECIMAL(8, 2) NOT NULL,
        invoce_number VARCHAR(250) UNIQUE NOT NULL,
        adress_id INT UNSIGNED,
        FOREIGN KEY (adress_id) REFERENCES adreess(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT
    );

CREATE TABLE
    order_products(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        order_id INT UNSIGNED,
        product_id INT UNSIGNED,
        product_color_id INT UNSIGNED,
        product_size_id INT UNSIGNED,
        quantity INT UNSIGNED,
        price DECIMAL(8, 2),
        discount DECIMAL(8, 2),
        FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT,
        FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE RESTRICT ON DELETE RESTRICT,
        FOREIGN KEY (product_color_id) REFERENCES product_coolors(product_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
        FOREIGN KEY (product_size_id) REFERENCES product_size(product_id) ON UPDATE RESTRICT ON DELETE RESTRICT
    );