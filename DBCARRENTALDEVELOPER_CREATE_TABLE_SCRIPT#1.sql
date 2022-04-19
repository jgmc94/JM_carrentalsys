--Create CreditCard Table
CREATE TABLE Creditcard
(
    CardNum         NUMBER(16)     PRIMARY KEY,
    CardOwnerName   VARCHAR(50)    NOT NULL,
    ExpDate         DATE           NOT NULL
);

--Create Customer Table
CREATE TABLE Customer
(
    DriverLicenseNum    VARCHAR2(12)    PRIMARY KEY,
    DLExpDate           DATE            NOT NULL,
    FirstName           VARCHAR2(20)    NOT NULL,
    LastName            VARCHAR2(30)    NOT NULL,
    StreetAddress       VARCHAR2(30)    NOT NULL,
    City                VARCHAR2(20)    NOT NULL,
    State               CHAR(2)         NOT NULL,
    Country             VARCHAR2(15)    NOT NULL,
    ZipCode             VARCHAR2(8)     NOT NULL,
    DOB                 DATE            NOT NULL,
    MobileNumber        VARCHAR2(13)    NOT NULL,
    Email               VARCHAR2(50)    NOT NULL,
    CustomerType        CHAR(1)         NOT NULL
);

--Create Customer Creditcard Table
CREATE TABLE Customer_Creditcard
(
    CardNum        NUMBER(16)    NOT NULL,
    DriverLicense  VARCHAR2(12)  NOT NULL,
    
    CONSTRAINT  CardNum_FK
    FOREIGN KEY  (CardNum)
    REFERENCES  Creditcard(CardNum),
    
    CONSTRAINT DriverLicense_FK
    FOREIGN KEY (DriverLicense)
    REFERENCES  Customer(DriverLicenseNum)
);    

--Create EZPlus Table
CREATE TABLE EZPlus
(
    EZPlusNumber        NUMBER(4)  PRIMARY KEY,
    EZPlusEarnedPoints  NUMBER(3)  NOT NULL
); 

--Create Discount Table
CREATE TABLE Discount
(
    DiscountCode   CHAR(4)         PRIMARY KEY,
    DiscountDesc   VARCHAR2(100)   NOT NULL
);    

--Create Private Customer Table
CREATE TABLE Private_Customer
(
    PDriverLicenseNum    VARCHAR2(12)   PRIMARY KEY,
    DiscountCode         CHAR(4)        NOT NULL,
    EZPlusNumber         NUMBER(4)      NOT NULL,
    
    CONSTRAINT       PDriverLicenseNum_FK
    FOREIGN KEY      (PDriverLicenseNum)
    REFERENCES       Customer(DriverLicenseNum),
    
    CONSTRAINT       DiscountCode_FK
    FOREIGN KEY      (DiscountCode)
    REFERENCES       Discount(DiscountCode),
    
    CONSTRAINT       EZPlusNumber_FK
    FOREIGN KEY      (EZPlusNumber)
    REFERENCES       EZPlus(EZPlusNumber)
);    

--Create Corporate Customer Company Table
CREATE TABLE Corporate_Customer_Company
(
    CompanyID      CHAR(3)       PRIMARY KEY,
    CompanyName    VARCHAR2(20)  NOT NULL,
    ContactName    VARCHAR2(40)  NOT NULL,
    ContactNumber  VARCHAR2(13)  NOT NULL
); 

--Create Corporate Customer Table
CREATE TABLE Corporate_Customer
(
    CDriverLicenseNum    VARCHAR2(12)   PRIMARY KEY,
    CompanyID            CHAR(3)        NOT NULL,
    CorporateRate        NUMBER(4,2)    NOT NULL,
    
    CONSTRAINT       CDriverLicenseNum_FK
    FOREIGN KEY      (CDriverLicenseNum)
    REFERENCES       Customer(DriverLicenseNum),
    
    CONSTRAINT       CompanyID_FK
    FOREIGN KEY      (CompanyID)
    REFERENCES       Corporate_Customer_Company(CompanyID)
);    

--Create Vehicle Rental Category Table
CREATE TABLE Vehicle_Rental_Category
(
    CategoryID     CHAR(4)       PRIMARY KEY,
    CategoryName   VARCHAR2(15)  NOT NULL,
    CategoryRate   NUMBER(4,2)   NOT NULL
);    

--Create Rental Agency Table
CREATE TABLE Rental_Agency
(
    AgencyID        CHAR(3)        PRIMARY KEY,
    AgencyName      VARCHAR2(20)   NOT NULL,
    StreetAddress   VARCHAR2(30)   NOT NULL,
    City            VARCHAR2(20)   NOT NULL,
    State           CHAR(2)        NOT NULL,
    Country         VARCHAR2(15)   NOT NULL,
    ZipCode         VARCHAR2(8)    NOT NULL,
    PhoneNumber     VARCHAR2(13)   NOT NULL
); 

--Create Vehicle Status
CREATE TABLE Vehicle_Status
(
    VehicleStatusID     CHAR(2)        PRIMARY KEY,
    VehicleStatus       VARCHAR2(15)   NOT NULL
);    

--Create Vehicle Table
CREATE TABLE Vehicle
(
    VinNumber           CHAR(17)       PRIMARY KEY,
    Make                VARCHAR2(20)   NOT NULL,
    Model               VARCHAR2(20)   NOT NULL,
    Year                DATE           NOT NULL,
    RentalCategoryID    CHAR(4)        NOT NULL,
    Color               VARCHAR2(10)   NOT NULL,
    PlateNumber         VARCHAR2(10)   NOT NULL,
    Mileage             NUMBER(6)      NOT NULL,
    TransmissionType    VARCHAR2(30)   NOT NULL,
    SeatCapacity        NUMBER(1)      NOT NULL,
    DailyRentalCost     NUMBER(5,2)    NOT NULL,
    VehicleStatusID     CHAR(2)        NOT NULL,
    AssignedAgencyID    CHAR(3)        NOT NULL,
    CurrentAgencyID     CHAR(3)        NOT NULL,
    VehicleType         CHAR(1)        NOT NULL,
    
    CONSTRAINT       RentalCategoryID_FK
    FOREIGN KEY      (RentalCategoryID)
    REFERENCES       Vehicle_Rental_Category(CategoryID),
    
    CONSTRAINT       VehicleStatusID_FK
    FOREIGN KEY      (VehicleStatusID)
    REFERENCES       Vehicle_Status(VehicleStatusID),
    
    CONSTRAINT       AssignedAgencyID_FK
    FOREIGN KEY      (AssignedAgencyID)
    REFERENCES       Rental_Agency(AgencyID),
    
    CONSTRAINT       CurrentAgencyID_FK
    FOREIGN KEY      (CurrentAgencyID)
    REFERENCES       Rental_Agency(AgencyID)
);

--Create Car Table
CREATE TABLE Car
(
    CVinNumber       CHAR(17)    PRIMARY KEY,
    TrunkCapacity    NUMBER(2)   NOT NULL,
    
    CONSTRAINT      CVinNumber_FK
    FOREIGN KEY     (CVinNumber)
    REFERENCES      Vehicle(VinNumber)
);  

--Create Minivan SUV Table
CREATE TABLE Minivan_SUV
(
    MVinNumber        CHAR(17)      PRIMARY KEY,
    TowingCapacity    NUMBER(5)     NOT NULL,
    IsAWD             VARCHAR2(3)   NOT NULL,
    
    CONSTRAINT      MVinNumber_FK
    FOREIGN KEY     (MVinNumber)
    REFERENCES      Vehicle(VinNumber)
);

--Create Van Table
CREATE TABLE Van
(
    VVinNumber       CHAR(17)     PRIMARY KEY,
    CargoCapacity    NUMBER(3)    NOT NULL,
    MaximumPayload   NUMBER(5)    NOT NULL,
    
    CONSTRAINT      VVinNumber_FK
    FOREIGN KEY     (VVinNumber)
    REFERENCES      Vehicle(VinNumber)
);

--Create Table Fuel Option
CREATE TABLE Fuel_Option
(
    FuelOptionID      CHAR(2)        PRIMARY KEY,
    FuelOptionDesc    VARCHAR2(50)   NOT NULL
);  

--Create Table Reservation Status
CREATE TABLE Reservation_Status
(
    ReservationStatusID    CHAR(2)        PRIMARY KEY,
    ReservationStatus      VARCHAR2(10)   NOT NULL
);   

--Create Reservation Table
CREATE TABLE Reservation
(
    ConfirmationID       CHAR(5)        PRIMARY KEY,
    DriverLicenseNum     VARCHAR2(12)   NOT NULL,
    CategoryID           CHAR(4)        NOT NULL,
    AgencyID             CHAR(3)        NOT NULL,
    PickUpAgencyID       CHAR(3)        NOT NULL,
    DropOffAgencyID      CHAR(3)        NOT NULL,
    RentalDate           DATE           NOT NULL,
    RentalTime           NUMBER(4)      NOT NULL,
    ReturnDate           DATE           NOT NULL,
    ReturnTime           NUMBER(4)      NOT NULL,
    ReservationStatusID  CHAR(2)        NOT NULL,
    EstimatedCost        NUMBER(5,2)    NOT NULL,
    
    CONSTRAINT       DriverLicenseNum_FK
    FOREIGN KEY      (DriverLicenseNum)
    REFERENCES       Customer(DriverLicenseNum),
    
    CONSTRAINT       CategoryID_FK
    FOREIGN KEY      (CategoryID)
    REFERENCES       Vehicle_Rental_Category(CategoryID),
    
    CONSTRAINT       AgencyID_FK
    FOREIGN KEY      (AgencyID)
    REFERENCES       Rental_Agency(AgencyID),
    
    CONSTRAINT       PickUpAgencyID_FK
    FOREIGN KEY      (PickUpAgencyID)
    REFERENCES       Rental_Agency(AgencyID),
    
    CONSTRAINT       DropOffAgencyID_FK
    FOREIGN KEY      (DropOffAgencyID)
    REFERENCES       Rental_Agency(AgencyID),
    
    CONSTRAINT       ReservationStatusID_FK
    FOREIGN KEY      (ReservationStatusID)
    REFERENCES       Reservation_Status(ReservationStatusID)
);

--Create Rental Table
CREATE TABLE Rental
(
    RentalAgencyNumber       CHAR(5)        PRIMARY KEY,
    DriverLicenseNum         VARCHAR2(12)   NOT NULL,
    VinNumber                CHAR(17)       NOT NULL,
    AgencyID                 CHAR(3)        NOT NULL,
    PickUpAgencyID           CHAR(3)        NOT NULL,
    DropOffAgencyID          CHAR(3)        NOT NULL,
    PickUpDate               DATE           NOT NULL,
    PickUpTime               NUMBER(4)      NOT NULL,
    DropOffDate              DATE           NOT NULL,
    DropOffTime              NUMBER(4)      NOT NULL,
    PickUpOdometerValue      NUMBER(6)      NOT NULL,
    DropOffOdometerValue     NUMBER(6)      NOT NULL,
    FuelOptionID             CHAR(2)        NOT NULL,
    InsuranceCost            NUMBER(5,2)    NOT NULL,
    
    CONSTRAINT        DLN_FK
    FOREIGN KEY       (DriverLicenseNum)
    REFERENCES        Customer(DriverLicenseNum),
    
    CONSTRAINT        VN_FK
    FOREIGN KEY       (VinNumber)
    REFERENCES        Vehicle(VinNumber),
    
    CONSTRAINT        AID_FK
    FOREIGN KEY       (AgencyID)
    REFERENCES        Rental_Agency(AgencyID),
    
    CONSTRAINT        PUAID_FK
    FOREIGN KEY       (PickUpAgencyID)
    REFERENCES        Rental_Agency(AgencyID),
    
    CONSTRAINT        DOAID_FK
    FOREIGN KEY       (DropOffAgencyID)
    REFERENCES        Rental_Agency(AgencyID),
    
    CONSTRAINT        FuelOptionID_FK
    FOREIGN KEY       (FuelOptionID)
    REFERENCES        Fuel_Option(FuelOptionID)
);    