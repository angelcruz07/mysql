-- Active: 1700014601609@@127.0.0.1@3306

-- CREATE DATABASE todos;

USE todos:

DELETE FROM users WHERE id < 1;

-- USE todos;
CREATE TABLE
    users (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL ,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL
    );

CREATE TABLE
    task (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT UNSIGNED NOT NULL,
        title VARCHAR(255) NOT NULL,
        description VARCHAR(512) NOT NULL,
        status BOOLEAN NOT NULL,
        due_date DATETIME, 
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
    )