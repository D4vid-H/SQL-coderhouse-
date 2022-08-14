CREATE DATABASE IF NOT EXISTS videojuego;
USE videojuego;

CREATE TABLE `user` (
user_id INT NOT NULL PRIMARY KEY,
email VARCHAR (50) NOT NULL UNIQUE,
`password` VARCHAR (50) NOT NULL,
`birthday` DATE NOT NULL
);

CREATE TABLE game_level (
game_level_id INT NOT NULL PRIMARY KEY,
level_number INT NOT NULL,
`name` VARCHAR (50) NOT NULL,
`description` VARCHAR (500) NOT NULL
);

CREATE TABLE pet (
pet_id INT NOT NULL PRIMARY KEY,
`name` VARCHAR (50) NOT NULL,
race VARCHAR (50) NOT NULL,
power INT NOT NULL,
life INT NOT NULL
);

CREATE TABLE weapon (
weapon_id INT NOT NULL PRIMARY KEY,
`name` VARCHAR (50) NOT NULL,
property VARCHAR (50) NOT NULL,
power INT NOT NULL,
`level` INT NOT NULL
);

CREATE TABLE armor (
armor_id INT NOT NULL PRIMARY KEY,
`name` VARCHAR (50) NOT NULL,
property VARCHAR (50) NOT NULL,
power INT NOT NULL,
`level` INT NOT NULL
);

CREATE TABLE character_level (
character_level_id INT NOT NULL PRIMARY KEY,
level_number INT NOT NULL,
power INT NOT NULL
);

CREATE TABLE equipament (
equipament_id INT NOT NULL PRIMARY KEY,
armor_id INT NOT NULL,
weapon_id INT NOT NULL,
life VARCHAR (50) NOT NULL,
power VARCHAR (50) NOT NULL,
FOREIGN KEY (armor_id)
	REFERENCES armor(armor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (weapon_id)
	REFERENCES weapon(weapon_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE    
);

CREATE TABLE `character` (
character_id INT NOT NULL PRIMARY KEY,
user_id INT NOT NULL,
game_level_id INT NOT NULL,
character_level_id INT NOT NULL,
pet_id INT NOT NULL,
equipament_id INT NOT NULL,
`name` VARCHAR (50) NOT NULL UNIQUE,
gender VARCHAR (100) NOT NULL,
tipe_charac VARCHAR (150) NOT NULL,
`description` VARCHAR (500) NOT NULL,
life INT NOT NULL,
power INT NOT NULL,
FOREIGN KEY (user_id)
	REFERENCES `user`(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (game_level_id)
	REFERENCES game_level(game_level_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (character_level_id)
	REFERENCES character_level(character_level_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,    
FOREIGN KEY (pet_id)
	REFERENCES pet(pet_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (equipament_id)
	REFERENCES equipament(equipament_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

