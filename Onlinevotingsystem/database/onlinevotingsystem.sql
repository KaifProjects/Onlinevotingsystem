CREATE DATABASE IF NOT EXISTS onlinevotingsystem;
USE onlinevotingsystem;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(150),
    email VARCHAR(100),
    gender VARCHAR(10),
    voter_id VARCHAR(50) UNIQUE,
    voted INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS elections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('active', 'inactive') DEFAULT 'inactive'
);

CREATE TABLE IF NOT EXISTS candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    election_id INT,
    name VARCHAR(100),
    details TEXT,
    photo VARCHAR(255),
    votes INT DEFAULT 0,
    FOREIGN KEY (election_id) REFERENCES elections(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);
