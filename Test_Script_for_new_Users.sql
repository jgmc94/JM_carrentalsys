--Select Statement Test for new user
SELECT *
FROM DBCARRENTALDEVELOPER.Vehicle
WHERE SeatCapacity >= 4;

--Delete Statement Test for new user
DELETE FROM DBCARRENTALDEVELOPER.Vehicle
WHERE VinNumber = '11ZZ3333AA1212BBB';

--Create New Table Test for new user
CREATE TABLE NewTable
(
    IDNum         NUMBER(16)     PRIMARY KEY,
    Name          VARCHAR2(30)    NOT NULL,
    Desc          VARCHAR2(50)    NOT NULL
);
