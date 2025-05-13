create database librarydb;
use librarydb;


CREATE TABLE Customer (
    customerID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    email VARCHAR(50),
    phone VARCHAR(15),
    username VARCHAR(20) UNIQUE,
    password VARCHAR(20)
);
CREATE TABLE Card(
  cardID INT,
  status VARCHAR(1) CHECK ((status = 'A') OR (status = 'B')),
  fines INT,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));
  CREATE TABLE Employee(
  employeeID INT,
  name VARCHAR(40),
  employeeAddress VARCHAR(50),
  phone INT(9),
  password VARCHAR(20),
  userName VARCHAR(10),
  paycheck INT (8),
  branchName VARCHAR(40),
  cardNumber INT,
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID));
drop table Branch;
CREATE TABLE Branch(
  name VARCHAR(40),
  address VARCHAR(50),
  phone INT(9),
  CONSTRAINT Branch_PK PRIMARY KEY (name));
CREATE TABLE Location (
  address VARCHAR(50),
  CONSTRAINT Location_PK PRIMARY KEY (address)
);
CREATE TABLE Rent (
  cardID INT,
  itemID VARCHAR(6),
  appropriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (cardID, itemID)
);
CREATE TABLE Book (
  ISBN VARCHAR(13),
  bookID VARCHAR(6),
  state VARCHAR(10),
  availability VARCHAR(1) CHECK (availability IN ('A', 'O')),
  debtCost INT,
  lostCost INT,
  address VARCHAR(50),
  CONSTRAINT Book_PK PRIMARY KEY (ISBN, bookID),
  CONSTRAINT Book_FK_Location FOREIGN KEY (address) REFERENCES Location(address)
);
CREATE TABLE Video (
  title VARCHAR(100),
  year INT,
  videoID VARCHAR(6),
  state VARCHAR(10),
  availability VARCHAR(1) CHECK (availability IN ('A', 'O')),
  debtCost INT,
  lostCost INT,
  address VARCHAR(50),
  CONSTRAINT Video_PK PRIMARY KEY (title, year, videoID),
  CONSTRAINT Video_FK_Location FOREIGN KEY (address) REFERENCES Location(address)
);
DROP TABLE Customer;
CREATE TABLE Customer(
  customerID INT,
  name VARCHAR(40),
  customerAddress VARCHAR(50),
  phone INT(9),
  password VARCHAR(20),
  userName VARCHAR(10),
  dateSignUp DATE,
  cardNumber INT,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID));
  

SELECT * FROM Card;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Location;
SELECT * FROM Book;
SELECT * FROM Video;
SELECT * FROM Rent;



ALTER TABLE Card
MODIFY COLUMN cardID INT AUTO_INCREMENT;

ALTER TABLE Customer
ADD CONSTRAINT Customer_FK
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Card
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Branch
FOREIGN KEY (branchName)
REFERENCES Branch(name);

ALTER TABLE Branch
ADD CONSTRAINT Branch_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Book
ADD CONSTRAINT Book_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Video
ADD CONSTRAINT Video_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Card
FOREIGN KEY (cardID)
REFERENCES Card(cardID);


INSERT INTO Card (cardID, status, fines) VALUES
  (101, 'A', 0),
  (102, 'A', 0),
  (103, 'A', 0),
  (104, 'A', 0),
  (105, 'A', 0),
  (106, 'A', 0),
  (107, 'B', 50),
  (108, 'B', 10),
  (109, 'B', 25.5),
  (110, 'B', 15.25),
  (151, 'A', 0),
  (152, 'A', 0),
  (153, 'A', 0),
  (154, 'A', 0),
  (155, 'A', 0);
  INSERT INTO Card (cardID, status, fines) VALUES
  (202, 'A', 0);

  
INSERT INTO Branch (name, address, phone) VALUES
('ARCHEOLOGY', 'ARCHEOLOGY ROAD', 645645645),
('CHEMISTRY', 'CHEMISTRY ROAD', 622622622),
('COMPUTING', 'COMPUTING ROAD', 644644644),
('PHYSICS', 'PHYSICS ROAD', 666666666);

INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', STR_TO_DATE('12-05-2018', '%d-%m-%Y'), 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', STR_TO_DATE('10-05-2018', '%d-%m-%Y'), 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', STR_TO_DATE('21-06-2017', '%d-%m-%Y'), 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', STR_TO_DATE('05-12-2016', '%d-%m-%Y'), 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', STR_TO_DATE('09-08-2016', '%d-%m-%Y'), 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', STR_TO_DATE('30-04-2017', '%d-%m-%Y'), 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', STR_TO_DATE('28-02-2018', '%d-%m-%Y'), 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', STR_TO_DATE('15-01-2016', '%d-%m-%Y'), 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', STR_TO_DATE('25-03-2016', '%d-%m-%Y'), 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', STR_TO_DATE('01-09-2017', '%d-%m-%Y'), 110);
INSERT INTO Customer VALUES (11, 'RAO', 'DOWNTOWN', 659647589, 'rao123', 'ra2', STR_TO_DATE('10-06-2019', '%d-%m-%Y'), 205);

INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 'ARCHEOLOGY', 101);
INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 'ARCHEOLOGY', 102);
INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 'ARCHEOLOGY', 103);
INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 'COMPUTING', 104);
INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 'CHEMISTRY', 105);


INSERT INTO Location VALUES ('ARCHEOLOGY ROAD');
INSERT INTO Location VALUES ('CHEMISTRY ROAD');
INSERT INTO Location VALUES ('COMPUTING ROAD');
INSERT INTO Location VALUES ('PHYSICS ROAD');

INSERT INTO Book VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS ROAD');
INSERT INTO Book VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CHEMISTRY ROAD');

INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('COMPUTING MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('PHYSICS, MOST BORING SH*T', 2018, 'V1PH18', 'NEW', 'A', 1, 5, 'PHYSICS ROAD');

INSERT INTO Rent (cardID, itemID, appropriationDate, returnDate)
VALUES  (101, 'B2A123', '2018-05-10', '2018-05-20'),
(102, 'B1Z123', '2018-05-10', '2018-05-25'),
(104, 'V1JA15', '2018-05-01', '2018-05-21'),
(105, 'V1DI00', '2018-05-02', '2018-05-25'),
(154, 'B1L321', '2018-05-04', '2018-05-26'),
(155, 'V1CH16', '2018-04-29', '2018-05-29');


#customer
DELIMITER $$

CREATE PROCEDURE loginCustomer_library(IN user VARCHAR(20), IN pass VARCHAR(20))
BEGIN
    DECLARE passAux VARCHAR(20);
    DECLARE userExists INT DEFAULT 0;

  
    SELECT COUNT(*) INTO userExists
    FROM customer
    WHERE username = user;

    
    IF userExists = 0 THEN
        SELECT 'Username does not exist' AS result;
    ELSE
       
        SELECT password INTO passAux
        FROM customer
        WHERE username = user;

       
        IF passAux = pass THEN
            SELECT CONCAT('User ', user, ' login successful') AS result;
        ELSE
            SELECT 'Incorrect password' AS result;
        END IF;
    END IF;
END $$

DELIMITER ;

CALL loginCustomer_library('tom4', 'tom123');
CALL loginCustomer_library('bob','bob123');

#employee
DELIMITER $$

CREATE PROCEDURE loginEmployee_library(IN user VARCHAR(20), IN pass VARCHAR(20))
BEGIN
    DECLARE passAux VARCHAR(20);
    DECLARE userExists INT DEFAULT 0;

    
    SELECT COUNT(*) INTO userExists
    FROM employee
    WHERE username = user;

    
    IF userExists = 0 THEN
        SELECT 'Username does not exist' AS result;
    ELSE
      
        SELECT password INTO passAux
        FROM employee
        WHERE username = user;

        
        IF passAux = pass THEN
            SELECT CONCAT('User ', user, ' login successful') AS result;
        ELSE
            SELECT 'Incorrect password' AS result;
        END IF;
    END IF;
END $$

DELIMITER ;

CALL loginEmployee_library('username123', 'password123');

SET @username = 'ro11';
SET @password = 'ross123';

CALL loginEmployee_library(@username, @password);

#customer trigger
DELIMITER $$

CREATE TRIGGER addCardCusto_libraryy
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
  INSERT INTO card (cardID, status, fines)
  VALUES (NEW.cardNumber, 'A', 0);
END $$

DELIMITER ;

SHOW TRIGGERS;
SELECT MAX(cardID) FROM Card;
INSERT INTO Customer 
VALUES (12, 'LISA', 'NEW CITY', 699699699, 'lisa123', 'li12', STR_TO_DATE('15-06-2022', '%d-%m-%Y'), 300);
SELECT * FROM Card WHERE cardID = 300;
SELECT * FROM Customer WHERE customerID = 12;




DROP TRIGGER IF EXISTS addCardEmp_library;




#employee trigger
DELIMITER $$

CREATE TRIGGER addCardEmp_libraryy
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
  INSERT INTO card (cardID, status, fines)
  VALUES (NEW.cardNumber, 'A', 0);
END $$

DELIMITER ; 
INSERT INTO Employee 
VALUES (216, 'LILY', 'GREEN STREET', 601601601, 'lily123', 'li16', 1500, 'PHYSICS', 301);
SELECT * FROM Card WHERE cardID = 301;
SELECT * FROM Employee WHERE employeeID = 216;



DELIMITER $$

#Cursor customer
CREATE PROCEDURE listAllCustomers()
BEGIN

    DECLARE done INT DEFAULT FALSE;
    DECLARE c_id INT;
    DECLARE c_name VARCHAR(40);
    DECLARE c_address VARCHAR(50);
    DECLARE c_phone INT;
    
 
    DECLARE customer_cursor CURSOR FOR
        SELECT customerID, name, customerAddress, phone FROM Customer;

    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN customer_cursor;


    customer_loop: LOOP
        FETCH customer_cursor INTO c_id, c_name, c_address, c_phone;

      
        IF done THEN
            LEAVE customer_loop;
        END IF;

       
        SELECT CONCAT('Customer: ', c_id, ' - ', c_name, ', ', c_address, ', Phone: ', c_phone) AS customer_info;

    END LOOP;

    
    CLOSE customer_cursor;
END $$

DELIMITER ;

CALL listAllCustomers();

#cursor employee
DELIMITER $$

CREATE PROCEDURE listAllEmployees()
BEGIN
    
    DECLARE done INT DEFAULT FALSE;
    DECLARE e_id INT;
    DECLARE e_name VARCHAR(40);
    DECLARE e_branch VARCHAR(40);
    DECLARE e_phone INT;

    
    DECLARE emp_cursor CURSOR FOR
        SELECT employeeID, name, branchName, phone FROM Employee;


    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    
    OPEN emp_cursor;


    emp_loop: LOOP
        FETCH emp_cursor INTO e_id, e_name, e_branch, e_phone;

 
        IF done THEN
            LEAVE emp_loop;
        END IF;

	
        SELECT CONCAT('Employee: ', e_id, ' - ', e_name, ', Branch: ', e_branch, ', Phone: ', e_phone) AS employee_info;

    END LOOP;


    CLOSE emp_cursor;
END $$

DELIMITER ;
select * from Employee;
CALL listAllEmployees();
















































  

