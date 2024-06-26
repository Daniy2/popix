-- Creazione del database popix
DROP DATABASE IF EXISTS popix;
CREATE DATABASE popix;
USE popix;

-- Creazione della tabella User
CREATE TABLE User (
    Email VARCHAR(100) PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('admin', 'user') NOT NULL
);

-- Creazione della tabella Product
CREATE TABLE Product (
    IdProduct VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(100) not null,
    Description TEXT not null,
    Cost DECIMAL(10, 2) not null,
    Pieces_in_stock INT not null,
    Image_src MEDIUMBLOB not null,
    Brand VARCHAR(100) not null,
    Figure VARCHAR(100) not null
);

-- Creazione della tabella Order (order è proibita in sql, quindi si chiamerà Ord)
CREATE TABLE Ord (
    IdOrder INT PRIMARY KEY AUTO_INCREMENT,
    Date DATETIME not null,
    Subtotal DECIMAL(10, 2) not null,
    Status VARCHAR(50) ,
    Customer VARCHAR(100) not null,
    FOREIGN KEY (Customer) REFERENCES User(Email) ON DELETE CASCADE
);

-- Creazione della tabella OrderDetails
CREATE TABLE OrderDetails (
    IdOrder INT not null,
    IdProduct VARCHAR(5) not null,
    Quantity INT not null,
    Price DECIMAL(10,2) not null,
    PRIMARY KEY (IdOrder, IdProduct),
    FOREIGN KEY (IdOrder) REFERENCES Ord(IdOrder) ON DELETE CASCADE,
    FOREIGN KEY (IdProduct) REFERENCES Product(IdProduct) ON DELETE CASCADE
);
