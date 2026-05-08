-- SELECT
SELECT * FROM Pharmacists;
SELECT * FROM Customers;
SELECT * FROM Inventory;

-- FILTER
SELECT * FROM Pharmacists WHERE Gender='M';
SELECT * FROM Categories WHERE CategoryName LIKE 'A%';
SELECT * FROM Inventory WHERE Quantity IN (50,60,75);

-- UPDATE
UPDATE Pharmacists SET Phone='01025234412' WHERE PharmacistID=4;

-- DELETE
DELETE FROM Sales WHERE SaleID=3;

-- ORDER BY
SELECT * FROM Medicines ORDER BY CostPrice;

-- AGGREGATE
SELECT SUM(Salary) FROM Pharmacists;
SELECT COUNT(*) FROM Branches;

-- GROUP BY
SELECT PaymentMode, SUM(TotalAmount)
FROM Sales
GROUP BY PaymentMode;

-- JOIN
SELECT Medicines.MedicineName, Categories.CategoryName
FROM Medicines
INNER JOIN Categories
ON Medicines.CategoryID = Categories.CategoryID;
