-- Active: 1698628320755@@127.0.0.1@3306@socialnetwork

DROP TABLE IF EXISTS socialNetwork;

CREATE DATABASE socialNetwork;

USE socialNetwork;

CREATE TABLE
    users (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        email VARCHAR(255) UNIQUE,
        username VARCHAR(255),
        password VARCHAR(255) NOT NULL
    );

CREATE TABLE
    profile(
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT UNSIGNED NOT NULL,
        profile_photo BIGINT NOT NULL,
        password VARCHAR(255) NOT NULl,
        image VARCHAR(255) NOT NULL,
        username VARCHAR(255) NOT NULL UNIQUE,
        FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    post(
        id INT AUTO_INCREMENT PRIMARY KEY,
        profile_id VARCHAR(255) NOT NULl,
        description VARCHAR(255) NULL,
        DATE TIMESTAMP,
        FOREIGN KEY (id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    comments(
        profile_id INT AUTO_INCREMENT PRIMARY KEY,
        post_id INT UNSIGNED NOT NULL,
        comment VARCHAR(512),
        date TIMESTAMP,
        FOREIGN KEY (profile_id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    follows(
        profile_id INT AUTO_INCREMENT PRIMARY KEY,
        following_profile_id INT,
        FOREIGN KEY (profile_id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (following_profile_id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    post_image(
        post_id INT AUTO_INCREMENT PRIMARY KEY,
        url VARCHAR(255) NOT NULL,
        FOREIGN KEY (post_id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE
    );