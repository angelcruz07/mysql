-- Active: 1698628320755@@127.0.0.1@3306@taxis

-- taxis

DROP TABLE IF EXISTS taxis;

CREATE DATABASE taxis;

USE taxis;

CREATE TABLE
    drivers (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        phone_number VARCHAR(255) NOT NULL
    );

CREATE TABLE
    parkings(
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        city VARCHAR(255) NOT NULL,
        street VARCHAR(255) NOT NULL,
        number VARCHAR(255) NOT NULL
    );

CREATE TABLE
    vehicles (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        parking_id INT UNSIGNED NULL,
        plate_number VARCHAR(255) NOT NULL UNIQUE,
        brand VARCHAR(255) NOT NULL,
        model VARCHAR(255) NOT NULL,
        FOREIGN KEY (parking_id) REFERENCES parkings(id) ON UPDATE CASCADE ON DELETE
        SET NULL
    );

CREATE TABLE
    vehicle_image (
        vehicle_id INT UNSIGNED NOT NULL,
        url VARCHAR(255) NOT NULL UNIQUE
    );

CREATE TABLE
    driver_vehicle (
        driver_id INT UNSIGNED NOT NULL,
        vehicle_id INT UNSIGNED NOT NULL,
        start_date DATETIME NOT NULL,
        end_date DATETIME NOT NULL,
        FOREIGN KEY (driver_id) REFERENCES drivers(id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON UPDATE CASCADE ON DELETE CASCADE
    );