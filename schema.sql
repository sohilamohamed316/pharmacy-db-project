CREATE DATABASE Pharmacy;
USE Pharmacy;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT,
    CategoryCode VARCHAR(10) NOT NULL UNIQUE,
    Status VARCHAR(10) DEFAULT 'ACTIVE'
);

CREATE TABLE Medicines(
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    ScientificName VARCHAR(100),
    SellingPrice FLOAT NOT NULL,
    CostPrice FLOAT NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Inventory(
    InventoryID INT PRIMARY KEY,
    BatchNumber INT NOT NULL,
    Quantity INT NOT NULL,
    Location VARCHAR(150),
    Status VARCHAR(100),
    MedicineID INT,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

CREATE TABLE Suppliers(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255)
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(30),
    Location VARCHAR(100),
    Phone VARCHAR(15),
    ManagerName VARCHAR(50)
);

CREATE TABLE Pharmacists(
    PharmacistID INT PRIMARY KEY,
    Name VARCHAR(75) NOT NULL,
    Phone VARCHAR(15),
    Salary INT NOT NULL,
    Gender CHAR(1),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(75) NOT NULL,
    Phone VARCHAR(15),
    Gender CHAR(1) NOT NULL,
    Address VARCHAR(75)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE NOT NULL,
    TotalAmount INT NOT NULL,
    PaymentMode VARCHAR(20),
    Discount FLOAT,
    PharmacistID INT,
    CustomerID INT,
    BranchID INT,
    FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Purchase (
    PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
    PurchaseDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    InvoiceNo VARCHAR(50),
    Status VARCHAR(20),
    SupplierID INT,
    PharmacistID INT,
    BranchID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
