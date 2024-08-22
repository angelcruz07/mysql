-- Active: 1698628320755@@127.0.0.1@3306@departmens

DROP TABLE IF EXISTS departments;

CREATE DATABASE departments;

USE departments;

CREATE TABLE
    buildings (
        city VARCHAR(255) NOT NULL,
        number INT UNSIGNED NOT NULL,
        PRIMARY KEY (city, number)
    );

CREATE TABLE
    departments (
        number VARCHAR(255) NOT NULL,
        name VARCHAR(255) NOT NULL UNIQUE,
        annual_budget DECIMAL(9, 1) NOT NULL,
        city VARCHAR(255) NOT NULL,
        building_number INT UNSIGNED NOT NULL,
        PRIMARY KEY (number),
        FOREIGN KEY (city, building_number) REFERENCES buildings(city, number) ON UPDATE CASCADE ON DELETE RESTRICT
    );

CREATE TABLE employees (
    number INT UNSIGNED NOT NULL,
    department_number VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    manager_number VARCHAR(255) NOT NULL,
    manager_department_number VARCHAR(255) NOT NULL,
    PRIMARY KEY (number, department_number),
    FOREIGN KEY (department_number) REFERENCES departments(number) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (manager_number, manager_department_number) REFERENCES employees(number, department_number) ON UPDATE CASCADE ON DELETE RESTRICT
);