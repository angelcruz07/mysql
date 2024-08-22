DROP TABLE IF EXISTS paymentApp;

CREATE DATABASE paymentApp;

USE paymentApp;

CREATE TABLE
    users (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        email VARCHAR(255) UNIQUE,
        username VARCHAR(255),
        password VARCHAR(255) NOT NULL
    );

CREATE TABLE
    accounts (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255) NOT NULL,
        balance DECIMAL(8, 2) NOT NULL,
        id_account INT UNSIGNED,
        FOREIGN KEY (id_account) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    corpore_accounts(
        account_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        tax_id DECIMAL(8, 2) NOT NULL UNIQUE,
        FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    transfers(
        id INT AUTO_INCREMENT PRIMARY KEY,
        from_account_id INT,
        to_account_id INT,
        amount DECIMAL(8, 2) NOT NULL,
        date TIMESTAMP,
        status BOOLEAN,
        FOREIGN KEY (from_account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE RESTRICT,
        FOREIGN KEY (to_account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    bank_account_associated(
        bank_account_id INT AUTO_INCREMENT PRIMARY KEY,
        account_id INT,
        FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    bank_accounts(
        id INT AUTO_INCREMENT PRIMARY KEY,
        number VARCHAR(255) NOT NULL UNIQUE,
        FOREIGN KEY (id) REFERENCES bank_account_associated(bank_account_id) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE
    transfersForeigners(
        id INT AUTO_INCREMENT PRIMARY KEY,
        bank_account_id INT,
        account_id INT,
        amount DECIMAL(8, 2) NOT NULL,
        direction VARCHAR(255) NOT NULL,
        start_date DATETIME,
        end_date DATETIME,
        status BOOLEAN,
        FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id) ON UPDATE CASCADE ON DELETE RESTRICT,
        FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE RESTRICT
    );