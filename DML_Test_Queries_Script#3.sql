--Insert query for inserting new records to Vehicle Rental Category Table
INSERT INTO Vehicle_Rental_Category
(CategoryID,CategoryName,CategoryRate)
VALUES
(1111,'Van',15.50);

INSERT INTO Vehicle_Rental_Category
(CategoryID,CategoryName,CategoryRate)
VALUES
(2222,'SUV',12.50);

INSERT INTO Vehicle_Rental_Category
(CategoryID,CategoryName,CategoryRate)
VALUES
(3333,'Minivan',11.50);

INSERT INTO Vehicle_Rental_Category
(CategoryID,CategoryName,CategoryRate)
VALUES
(4444,'Van',17.50);

INSERT INTO Vehicle_Rental_Category
(CategoryID,CategoryName,CategoryRate)
VALUES
(5555,'Economy',10.50);
--End of first table insertion

--Insert query for inserting new records to Rental Agency Table
INSERT INTO Rental_Agency
(AgencyID,AgencyName,StreetAddress,City,State,Country,ZipCode,PhoneNumber)
VALUES
('A11','CarsRHere','1274 Gates Avenue','Brooklyn','NY','USA','11237','7184554545');

INSERT INTO Rental_Agency
(AgencyID,AgencyName,StreetAddress,City,State,Country,ZipCode,PhoneNumber)
VALUES
('A22','EZ Car Rental','304 3rd Avenue','Manhattan','NY','USA','10003','2122638549');

INSERT INTO Rental_Agency
(AgencyID,AgencyName,StreetAddress,City,State,Country,ZipCode,PhoneNumber)
VALUES
('A33','Varsity Vehicles','1577 Fresh Pond Road','Queens','NY','USA','11385','6318901122');

INSERT INTO Rental_Agency
(AgencyID,AgencyName,StreetAddress,City,State,Country,ZipCode,PhoneNumber)
VALUES
('A44','Carritos Bonitos','704 Calle Campeche','Puebla','PB','Mexico','72000','0445512345678');

INSERT INTO Rental_Agency
(AgencyID,AgencyName,StreetAddress,City,State,Country,ZipCode,PhoneNumber)
VALUES
('A55','CarsRUs','300 Adam Street','Brooklyn','NY','USA','11221','7183354545');
--End of second table insertion

--Insert query for inserting new records to Customer Table
INSERT INTO Customer
(DriverLicenseNum,DLExpDate,FirstName,LastName,StreetAddress,City,State,Country,ZipCode,DOB,MobileNumber,Email,CustomerType)
VALUES
('103856923','23-JAN-2022','John','Quarter','706 Hart Street','Brooklyn','NY','USA','11221','20-JAN-1993','6462337145','jq@gmail.com','P');

INSERT INTO Customer
(DriverLicenseNum,DLExpDate,FirstName,LastName,StreetAddress,City,State,Country,ZipCode,DOB,MobileNumber,Email,CustomerType)
VALUES
('111233444','06-JUN-2020','Sam','Dime','72 Cedar Street','Brooklyn','NY','USA','11221','09-MAR-1981','7188447222','sd@gmail.com','P');

INSERT INTO Customer
(DriverLicenseNum,DLExpDate,FirstName,LastName,StreetAddress,City,State,Country,ZipCode,DOB,MobileNumber,Email,CustomerType)
VALUES
('555123321','31-OCT-2024','Penny','Lejon','1574 Forest Avenue','Queens','NY','USA','11385','20-MAY-1972','7183342244','pennypenny@gmail.com','C');

INSERT INTO Customer
(DriverLicenseNum,DLExpDate,FirstName,LastName,StreetAddress,City,State,Country,ZipCode,DOB,MobileNumber,Email,CustomerType)
VALUES
('987996221','04-JAN-2022','Pearl','Quartz','300 DeKalb Avenue','Brooklyn','NY','USA','11221','27-APR-1997','3474456253','qpquartz@gmail.com','P');

INSERT INTO Customer
(DriverLicenseNum,DLExpDate,FirstName,LastName,StreetAddress,City,State,Country,ZipCode,DOB,MobileNumber,Email,CustomerType)
VALUES
('111222222','24-MAR-2027','Jay','Joe','12 University Place','Manhattan','NY','USA','10003','08-AUG-1994','2122332457','joe123@gmail.com','C');
--End of third table insertion

--Insert query for inserting new records to Reservation Status Table
INSERT INTO Reservation_Status
(ReservationStatusID,ReservationStatus)
VALUES
('A1','Confirmed');

INSERT INTO Reservation_Status
(ReservationStatusID,ReservationStatus)
VALUES
('A2','Confirmed');

INSERT INTO Reservation_Status
(ReservationStatusID,ReservationStatus)
VALUES
('A3','Cancelled');

INSERT INTO Reservation_Status
(ReservationStatusID,ReservationStatus)
VALUES
('A4','Completed');

INSERT INTO Reservation_Status
(ReservationStatusID,ReservationStatus)
VALUES
('A5','Confirmed');
--end of fourth table insertion

--Insert query for inserting new records to Reservation Table
INSERT INTO Reservation
(ConfirmationID,DriverLicenseNum,CategoryID,AgencyID,PickUpAgencyID,DropOffAgencyID,RentalDate,RentalTime,ReturnDate,ReturnTime,
 ReservationStatusID,EstimatedCost)
VALUES
('AAAAA','111222222','1111','A33','A33','A33','12-DEC-2017',0930,'12-DEC-2017',2030,'A5',170.50);

INSERT INTO Reservation
(ConfirmationID,DriverLicenseNum,CategoryID,AgencyID,PickUpAgencyID,DropOffAgencyID,RentalDate,RentalTime,ReturnDate,ReturnTime,
 ReservationStatusID,EstimatedCost)
VALUES
('BBBBB','111233444','2222','A33','A33','A22','11-DEC-2017',0930,'12-DEC-2017',0930,'A4',300.00);

INSERT INTO Reservation
(ConfirmationID,DriverLicenseNum,CategoryID,AgencyID,PickUpAgencyID,DropOffAgencyID,RentalDate,RentalTime,ReturnDate,ReturnTime,
 ReservationStatusID,EstimatedCost)
VALUES
('CCCCC','555123321','3333','A11','A11','A11','15-DEC-2017',0700,'15-DEC-2017',1030,'A2',40.25);

INSERT INTO Reservation
(ConfirmationID,DriverLicenseNum,CategoryID,AgencyID,PickUpAgencyID,DropOffAgencyID,RentalDate,RentalTime,ReturnDate,ReturnTime,
 ReservationStatusID,EstimatedCost)
VALUES
('DDDDD','987996221','4444','A55','A55','A55','11-DEC-2017',0600,'16-DEC-2017',0600,'A3',0.00);

INSERT INTO Reservation
(ConfirmationID,DriverLicenseNum,CategoryID,AgencyID,PickUpAgencyID,DropOffAgencyID,RentalDate,RentalTime,ReturnDate,ReturnTime,
 ReservationStatusID,EstimatedCost)
VALUES
('EEEEE','103856923','5555','A11','A11','A33','12-MAR-2017',0930,'13-MAR-2017',1230,'A5',283.50);
--End of fifth table insertion

--Select statement#1
SELECT *
FROM Customer
WHERE DriverLicenseNum = 111222222;
--End of Select statement 1

--Select Statement#2
SELECT FirstName, Email
FROM Customer
GROUP BY Email, FirstName;
--End of Select Statement 2

--Select Statement#3
SELECT *
FROM Reservation
WHERE CategoryID = 3333;
--End of Select Statement 3

--Update Statement #1
UPDATE Rental_Agency
SET AgencyName = 'Carros Rentables',
    StreetAddress = '705 Calle Cinco de Mayo',
    City = 'Hidalgo',
    State = 'PC',
    Country = 'Mexico',
    ZipCode = '72600',
    PhoneNumber = '0521212546674'
WHERE AgencyID = 'A44';

SELECT *
FROM Rental_Agency
WHERE AgencyID = 'A44';
--End of Update Statement 1

--Update Statement #2
UPDATE Reservation
SET DriverLicenseNum = '111222222',
    CategoryID = '1111',
    DropOffAgencyID = 'A33',
    RentalDate = '04-SEP-2017',
    ReturnDate = '05-SEP-2017',
    ReservationStatusID = 'A5',
    EstimatedCost = 372
WHERE ConfirmationID = 'DDDDD';   

SELECT *
FROM Reservation
WHERE ConfirmationID = 'DDDDD';
--End of Update Statement #2

--Delete Statement #1
DELETE FROM Reservation_Status
WHERE ReservationStatusID = 'A1';

SELECT *
FROM Reservation_Status;
--End of Delete Statement 1

--Delete Statement #2
DELETE FROM Reservation
WHERE ConfirmationID = 'CCCCC';

SELECT *
FROM Reservation;
--End of Delete Statement 2