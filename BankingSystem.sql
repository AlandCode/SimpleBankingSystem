
CREATE DATABASE OnlineBankingSystem;
GO

USE OnlineBankingSystem;
GO

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    Balance DECIMAL(18,2) DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    TransactionType VARCHAR(20) NOT NULL, -- Deposit / Withdraw / Transfer
    Amount DECIMAL(18,2) NOT NULL,
    TransactionDate DATETIME DEFAULT GETDATE(),
    Description VARCHAR(255),

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert Sample Users
INSERT INTO Users (Username, PasswordHash, FullName, Balance)
VALUES 
('aland', 'pass111', 'Ahmad Ali', 1000.00),
('ahmad001', 'pass123', 'Ahmad Ali', 1000.00),
('hewa.kurd', 'pass456', 'Hewa Bakir', 1500.00),
('belal33', 'pass789', 'belal Kamal', 750.00),
('ramyar01', 'pass000', 'Ramyar Hassan', 1200.00),
('mohammed','hhh22','Mohammed sallh',5000);

GO

-- Insert Sample Transactions
INSERT INTO Transactions (UserID, TransactionType, Amount, Description)
VALUES
(1, 'Deposit', 500, 'First deposit'),
(1, 'Withdraw', 100, 'ATM withdraw'),
(2, 'Deposit', 300, 'Salary');


-- View Users
SELECT * FROM Users;

-- View Transactions
SELECT * FROM Transactions;













----
USE OnlineBankingSystem;
GO

-- Delete all rows from both tables
DELETE FROM Transactions;
DELETE FROM Users;
GO

-- This resets the 