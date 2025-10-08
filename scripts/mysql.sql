DROP DATABASE IF EXISTS `injection`;
CREATE database `injection`;
use `injection`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE USER 'admin'@'%' identified by 'password';
GRANT ALL PRIVILEGES ON injection.* TO 'admin';
FLUSH PRIVILEGES;
