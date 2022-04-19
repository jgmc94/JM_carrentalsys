--#1 Procedure created to inform the company about which vehicles are currently in maintenance
CREATE OR REPLACE PROCEDURE usp_GetVehiclesInMaintenance(p_VehicleStatusID IN CHAR)
IS

  v_VinNumber        CHAR(17);
  v_Make             VARCHAR2(20);
  v_Model            VARCHAR2(20);
  v_Color            VARCHAR2(10);
  v_PlateNumber      VARCHAR2(10);
  v_Mileage          NUMBER(6,0);
  v_TransmissionType VARCHAR2(30);
  vs_VehicleStatus   VARCHAR2(15);
  
  CURSOR  cur_VinNumber IS

  SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.MILEAGE,VEHICLE.TRANSMISSIONTYPE,
  VEHICLE_STATUS.VEHICLESTATUS
  FROM VEHICLE, VEHICLE_STATUS
  WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID = p_VehicleStatusID;
 
BEGIN
  
  OPEN cur_VinNumber;
  
  LOOP
  
      FETCH  cur_VinNumber INTO v_VinNumber,v_Make,v_Model,v_Color,v_PlateNumber,v_Mileage,v_TransmissionType,vs_VehicleStatus;
      
      EXIT WHEN cur_VinNumber%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Vehicles Currently In Maintenance: '||v_VinNumber|| ' ' ||v_Make|| ' ' ||v_Model|| ' '
      ||v_Color|| ' ' ||v_PlateNumber|| ' ' ||v_Mileage|| ' ' ||v_TransmissionType|| ' ' ||vs_VehicleStatus);
     
   END LOOP;
   
   CLOSE cur_VinNumber;
   
END usp_GetVehiclesInMaintenance; 

--Testing Stored procedure #1
SET SERVEROUTPUT ON;

EXECUTE usp_GetVehiclesInMaintenance('M1');

--#2 Procedure created to inform the company of vehicles in need of inspection that are not currently in maintenance
CREATE OR REPLACE PROCEDURE usp_VehiclesToMaintenance(p_VehicleStatusID IN CHAR)
IS

  v_VinNumber        CHAR(17);
  v_Make             VARCHAR2(20);
  v_Model            VARCHAR2(20);
  v_Color            VARCHAR2(10);
  v_PlateNumber      VARCHAR2(10);
  v_Mileage          NUMBER(6,0);
  v_TransmissionType VARCHAR2(30);
  v_AssignedAgencyID CHAR (3);
  vs_VehicleStatus   VARCHAR2(15);
  
  CURSOR  cur_VinNumber IS

  SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.MILEAGE,VEHICLE.TRANSMISSIONTYPE,
  VEHICLE.ASSIGNEDAGENCYID,VEHICLE_STATUS.VEHICLESTATUS
  FROM VEHICLE, VEHICLE_STATUS
  WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND NOT VEHICLE.VEHICLESTATUSID = p_VehicleStatusID
  AND MILEAGE > 100000;
 
BEGIN
  
  OPEN cur_VinNumber;
  
  LOOP
  
      FETCH  cur_VinNumber INTO 
      v_VinNumber,v_Make,v_Model,v_Color,v_PlateNumber,v_Mileage,v_TransmissionType,v_AssignedAgencyID,vs_VehicleStatus;
      
      EXIT WHEN cur_VinNumber%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Vehicles In Need of Maintenance: '||v_VinNumber|| ' ' ||v_Make|| ' ' ||v_Model|| ' '
      ||v_Color|| ' ' ||v_PlateNumber|| ' ' ||v_Mileage|| ' ' ||v_TransmissionType|| ' ' ||v_AssignedAgencyID|| ' '||vs_VehicleStatus);
     
   END LOOP;
   
   CLOSE cur_VinNumber;
   
END usp_VehiclesToMaintenance;

--Testing Stored procedure #2
SET SERVEROUTPUT ON;

EXECUTE usp_VehiclesToMaintenance('M1');

--#3 Procedure created to inform the company about which vehicles are currently reserved
CREATE OR REPLACE PROCEDURE usp_GetReservedVehicles(p_VehicleStatusID IN CHAR)
IS

  v_VinNumber        CHAR(17);
  v_Make             VARCHAR2(20);
  v_Model            VARCHAR2(20);
  v_Color            VARCHAR2(10);
  v_PlateNumber      VARCHAR2(10);
  v_DailyRentalCost  NUMBER(5,2);
  v_AssignedAgencyID CHAR(3);
  v_CurrentAgencyID  CHAR(3);
  v_VehicleType      CHAR(1);
  vs_VehicleStatus   VARCHAR2(15);
  
  CURSOR  cur_VinNumber IS

  SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.DAILYRENTALCOST,VEHICLE.ASSIGNEDAGENCYID,VEHICLE.CURRENTAGENCYID,VEHICLE.VEHICLETYPE,VEHICLE_STATUS.VEHICLESTATUS
  FROM VEHICLE, VEHICLE_STATUS
  WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID = p_VehicleStatusID;
 
BEGIN
  
  OPEN cur_VinNumber;
  
  LOOP
  
      FETCH  cur_VinNumber INTO v_VinNumber,v_Make,v_Model,v_Color,v_PlateNumber,v_DailyRentalCost,v_AssignedAgencyID,v_CurrentAgencyID,
      v_VehicleType,vs_VehicleStatus;
      
      EXIT WHEN cur_VinNumber%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Vehicles Currently Reserved: '||v_VinNumber|| ' ' ||v_Make|| ' ' ||v_Model|| ' ' ||v_Color|| ' ' ||v_PlateNumber|| ' ' 
      ||v_DailyRentalCost|| ' ' ||v_AssignedAgencyID|| ' ' ||v_CurrentAgencyID|| ' ' ||v_VehicleType|| ' ' ||vs_VehicleStatus);
     
   END LOOP;
   
   CLOSE cur_VinNumber;
   
END usp_GetReservedVehicles; 

--Testing stored procedure #3
SET SERVEROUTPUT ON;

EXECUTE usp_GetReservedVehicles('R1');

--#4 Procedure created to inform the company about vehicles already rented at the moment
CREATE OR REPLACE PROCEDURE usp_GetRentedVehicles(p_VehicleStatusID IN CHAR)
IS

  v_VinNumber        CHAR(17);
  v_Make             VARCHAR2(20);
  v_Model            VARCHAR2(20);
  v_Color            VARCHAR2(10);
  v_PlateNumber      VARCHAR2(10);
  v_DailyRentalCost  NUMBER(5,2);
  v_AssignedAgencyID CHAR(3);
  v_CurrentAgencyID  CHAR(3);
  v_VehicleType      CHAR(1);
  vs_VehicleStatus   VARCHAR2(15);
  
  CURSOR  cur_VinNumber IS

  SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.DAILYRENTALCOST,VEHICLE.ASSIGNEDAGENCYID,VEHICLE.CURRENTAGENCYID,VEHICLE.VEHICLETYPE,VEHICLE_STATUS.VEHICLESTATUS
  FROM VEHICLE, VEHICLE_STATUS
  WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID =  p_VehicleStatusID;

BEGIN
  
  OPEN cur_VinNumber;
  
  LOOP
  
      FETCH  cur_VinNumber INTO v_VinNumber,v_Make,v_Model,v_Color,v_PlateNumber,v_DailyRentalCost,v_AssignedAgencyID,v_CurrentAgencyID,
      v_VehicleType,vs_VehicleStatus;
      
      EXIT WHEN cur_VinNumber%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Vehicles Currently Rented: '||v_VinNumber|| ' ' ||v_Make|| ' ' ||v_Model|| ' ' ||v_Color|| ' ' ||v_PlateNumber|| ' ' 
      ||v_DailyRentalCost|| ' ' ||v_AssignedAgencyID|| ' ' ||v_CurrentAgencyID|| ' ' ||v_VehicleType|| ' ' ||vs_VehicleStatus);
     
   END LOOP;
   
   CLOSE cur_VinNumber;
   
END usp_GetRentedVehicles;

--Testing stored procedure #4
SET SERVEROUTPUT ON;

EXECUTE usp_GetRentedVehicles('R2');

--#5 Procedure created to inform the company about vehicles already rented at the moment
CREATE OR REPLACE PROCEDURE usp_GetAvailableVehicles(p_VehicleStatusID IN CHAR)
IS

  v_VinNumber        CHAR(17);
  v_Make             VARCHAR2(20);
  v_Model            VARCHAR2(20);
  v_Color            VARCHAR2(10);
  v_PlateNumber      VARCHAR2(10);
  v_DailyRentalCost  NUMBER(5,2);
  v_AssignedAgencyID CHAR(3);
  v_CurrentAgencyID  CHAR(3);
  v_VehicleType      CHAR(1);
  vs_VehicleStatus   VARCHAR2(15);
  
  CURSOR  cur_VinNumber IS

  SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.DAILYRENTALCOST,VEHICLE.ASSIGNEDAGENCYID,VEHICLE.CURRENTAGENCYID,VEHICLE.VEHICLETYPE,VEHICLE_STATUS.VEHICLESTATUS
  FROM VEHICLE, VEHICLE_STATUS 
  WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID =  p_VehicleStatusID;

BEGIN
  
  OPEN cur_VinNumber;
  
  LOOP
  
      FETCH  cur_VinNumber INTO v_VinNumber,v_Make,v_Model,v_Color,v_PlateNumber,v_DailyRentalCost,v_AssignedAgencyID,v_CurrentAgencyID,
      v_VehicleType,vs_VehicleStatus;
      
      EXIT WHEN cur_VinNumber%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Vehicles Currently Available: '||v_VinNumber|| ' ' ||v_Make|| ' ' ||v_Model|| ' ' ||v_Color|| ' ' ||v_PlateNumber|| ' ' 
      ||v_DailyRentalCost|| ' ' ||v_AssignedAgencyID|| ' ' ||v_CurrentAgencyID|| ' ' ||v_VehicleType|| ' ' ||vs_VehicleStatus);
     
   END LOOP;
   
   CLOSE cur_VinNumber;
   
END usp_GetAvailableVehicles;

--Testing stored procedure #5
SET SERVEROUTPUT ON;

EXECUTE usp_GetAvailableVehicles('A1');

--#6Procedure created to inform the company of cancelled reservations
CREATE OR REPLACE PROCEDURE usp_CancelledReservations(p_ReservationStatusID IN CHAR)
IS

  r_ConfirmationID           CHAR(5);
  r_DriverLicenseNum       CHAR(17);
  c_FirstName          VARCHAR2(20);
  c_LastName           VARCHAR2(30);
  c_Email              VARCHAR2(50);
  rs_ReservationStatus  VARCHAR2(10);
  
  CURSOR  cur_Confirmation IS

  SELECT RESERVATION.CONFIRMATIONID,RESERVATION.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,RESERVATION_STATUS.RESERVATIONSTATUS
  FROM RESERVATION, CUSTOMER, RESERVATION_STATUS
  WHERE RESERVATION.DRIVERLICENSENUM = CUSTOMER.DRIVERLICENSENUM AND RESERVATION_STATUS.RESERVATIONSTATUSID = RESERVATION.RESERVATIONSTATUSID 
  AND RESERVATION.RESERVATIONSTATUSID = p_ReservationStatusID;

BEGIN
  
  OPEN cur_Confirmation;
  
  LOOP
  
      FETCH  cur_Confirmation INTO r_ConfirmationID,r_DriverLicenseNum,c_FirstName,c_LastName,c_Email,rs_ReservationStatus;      
      
      EXIT WHEN cur_Confirmation%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Please email these cancellations: ' ||r_ConfirmationID|| ' ' 
      ||r_DriverLicenseNum|| ' ' ||c_FirstName|| ' ' ||c_LastName|| ' ' ||c_Email|| ' ' ||rs_ReservationStatus);
     
   END LOOP;
   
   CLOSE cur_Confirmation;
   
END usp_CancelledReservations;

--Testing stored procedure #6
SET SERVEROUTPUT ON;

EXECUTE USP_CANCELLEDRESERVATIONS('B3');

--#7 Procedure created to inform the company of completed reservations
CREATE OR REPLACE PROCEDURE usp_CompletedReservations(p_ReservationStatusID IN CHAR)
IS

  r_ConfirmationID           CHAR(5);
  r_DriverLicenseNum       CHAR(17);
  c_FirstName          VARCHAR2(20);
  c_LastName           VARCHAR2(30);
  c_Email              VARCHAR2(50);
  rs_ReservationStatus  VARCHAR2(10);
  
  CURSOR  cur_Confirmation IS

  SELECT RESERVATION.CONFIRMATIONID,RESERVATION.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,RESERVATION_STATUS.RESERVATIONSTATUS
  FROM RESERVATION, CUSTOMER, RESERVATION_STATUS
  WHERE RESERVATION.DRIVERLICENSENUM = CUSTOMER.DRIVERLICENSENUM AND RESERVATION_STATUS.RESERVATIONSTATUSID = RESERVATION.RESERVATIONSTATUSID 
  AND RESERVATION.RESERVATIONSTATUSID = p_ReservationStatusID;
 
BEGIN
  
  OPEN cur_Confirmation;
  
  LOOP
  
      FETCH  cur_Confirmation INTO r_ConfirmationID,r_DriverLicenseNum,c_FirstName,c_LastName,c_Email,rs_ReservationStatus;      
      
      EXIT WHEN cur_Confirmation%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Please email a thank you: ' ||r_ConfirmationID|| ' ' 
      ||r_DriverLicenseNum|| ' ' ||c_FirstName|| ' ' ||c_LastName|| ' ' ||c_Email|| ' ' ||rs_ReservationStatus);
     
   END LOOP;
   
   CLOSE cur_Confirmation;
   
END usp_CompletedReservations;

--Testing stored procedure #7
SET SERVEROUTPUT ON;

EXECUTE USP_COMPLETEDRESERVATIONS('A4');

--#8 Procedure created to inform the company of confirmed reservations
CREATE OR REPLACE PROCEDURE usp_ConfirmedReservations(p_ReservationStatusID IN CHAR)
IS

  r_ConfirmationID          CHAR(5);
  r_DriverLicenseNum       CHAR(17);
  r_PickUpAgencyID          CHAR(3);
  r_RentalDate                 DATE;
  r_RentalTime          NUMBER(4,0);    
  c_FirstName          VARCHAR2(20);
  c_LastName           VARCHAR2(30);
  c_Email              VARCHAR2(50);
  rs_ReservationStatus VARCHAR2(10);
  
  CURSOR  cur_Confirmation IS

  SELECT RESERVATION.CONFIRMATIONID,RESERVATION.DRIVERLICENSENUM,RESERVATION.PICKUPAGENCYID,RESERVATION.RENTALDATE,RESERVATION.RENTALTIME,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,RESERVATION_STATUS.RESERVATIONSTATUS 
  FROM RESERVATION, CUSTOMER, RESERVATION_STATUS
  WHERE RESERVATION.DRIVERLICENSENUM = CUSTOMER.DRIVERLICENSENUM AND RESERVATION_STATUS.RESERVATIONSTATUSID = RESERVATION.RESERVATIONSTATUSID 
  AND RESERVATION.RESERVATIONSTATUSID =  p_ReservationStatusID;

BEGIN
  
  OPEN cur_Confirmation;
  
  LOOP
  
      FETCH  cur_Confirmation INTO r_ConfirmationID,r_DriverLicenseNum,r_PickUpAgencyID,r_RentalDate,r_RentalTime,
      c_FirstName,c_LastName,c_Email,rs_ReservationStatus;      
      
      EXIT WHEN cur_Confirmation%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Please inform of confirmation: ' ||r_ConfirmationID|| ' ' ||r_DriverLicenseNum|| ' ' ||r_PickUpAgencyID|| ' '
      ||r_RentalDate|| ' ' ||r_RentalTime|| ' ' ||c_FirstName|| ' ' ||c_LastName|| ' ' ||c_Email|| ' ' ||rs_ReservationStatus);
     
   END LOOP;
   
   CLOSE cur_Confirmation;
   
END usp_ConfirmedReservations;

--Testing stored procedure #8
SET SERVEROUTPUT ON;

EXECUTE USP_CONFIRMEDRESERVATIONS('A5');

--#9 Procedure created to award 35% discount to private cutomers
CREATE OR REPLACE PROCEDURE usp_EZPlusEarned35(p_EZPlusEarnedPoints IN NUMBER)
IS

  c_DriverLicenseNum    VARCHAR2(12);
  c_FirstName           VARCHAR2(20);
  c_LastName            VARCHAR2(30);
  c_Email               VARCHAR2(50);
  pc_EZPlusNumber       NUMBER(4,0);
  e_EZPlusEarnedPoints  NUMBER(3,0);
  
  CURSOR  cur_DriverLicenseNum IS

  SELECT CUSTOMER.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,PRIVATE_CUSTOMER.EZPLUSNUMBER,EZPLUS.EZPLUSEARNEDPOINTS
  FROM CUSTOMER, PRIVATE_CUSTOMER, EZPLUS
  WHERE CUSTOMER.DRIVERLICENSENUM = PRIVATE_CUSTOMER.PDRIVERLICENSENUM AND PRIVATE_CUSTOMER.EZPLUSNUMBER = EZPLUS.EZPLUSNUMBER 
  AND EZPLUSEARNEDPOINTS > p_EZPlusEarnedPoints;
 
BEGIN
  
  OPEN cur_DriverLicenseNum;
  
  LOOP
  
      FETCH  cur_DriverLicenseNum INTO c_DriverLicenseNum,c_FirstName,c_LastName,c_Email,pc_EZPlusNumber,e_EZPlusEarnedPoints;      
      
      EXIT WHEN cur_DriverLicenseNum%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Please reward 35% discount: ' ||c_DriverLicenseNum|| ' ' ||c_FirstName|| ' ' ||c_LastName|| ' ' ||c_Email|| ' '
      ||pc_EZPlusNumber|| ' '||e_EZPlusEarnedPoints);
     
   END LOOP;
   
   CLOSE cur_DriverLicenseNum;
   
END usp_EZPlusEarned35;

--Testing stored procedure #9
SET SERVEROUTPUT ON;

EXECUTE USP_EZPLUSEARNED35(150);

--#10 Procedure created to award 30% discount to private cutomers
CREATE OR REPLACE PROCEDURE usp_EZPlusEarned30(p1_EZPlusEarnedPoints IN NUMBER, p2_EZPlusEarnedPoints IN NUMBER)
IS

  c_DriverLicenseNum    VARCHAR2(12);
  c_FirstName           VARCHAR2(20);
  c_LastName            VARCHAR2(30);
  c_Email               VARCHAR2(50);
  pc_EZPlusNumber       NUMBER(4,0);
  e_EZPlusEarnedPoints  NUMBER(3,0);
  
  CURSOR  cur_DriverLicenseNum IS

  SELECT CUSTOMER.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,PRIVATE_CUSTOMER.EZPLUSNUMBER,EZPLUS.EZPLUSEARNEDPOINTS
  FROM CUSTOMER, PRIVATE_CUSTOMER, EZPLUS
  WHERE CUSTOMER.DRIVERLICENSENUM = PRIVATE_CUSTOMER.PDRIVERLICENSENUM AND PRIVATE_CUSTOMER.EZPLUSNUMBER = EZPLUS.EZPLUSNUMBER 
  AND EZPlus.EZPlusEarnedPoints > p1_EZPlusEarnedPoints AND EZPlus.EZPlusEarnedPoints < p2_EZPlusEarnedPoints;

BEGIN
  
  OPEN cur_DriverLicenseNum;
  
  LOOP
  
      FETCH  cur_DriverLicenseNum INTO c_DriverLicenseNum,c_FirstName,c_LastName,c_Email,pc_EZPlusNumber,e_EZPlusEarnedPoints;      
      
      EXIT WHEN cur_DriverLicenseNum%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Please reward 30% discount: ' ||c_DriverLicenseNum|| ' ' ||c_FirstName|| ' ' ||c_LastName|| ' ' ||c_Email|| ' '
      ||pc_EZPlusNumber|| ' '||e_EZPlusEarnedPoints);
     
   END LOOP;
   
   CLOSE cur_DriverLicenseNum;
   
END usp_EZPlusEarned30;

--Testing stored procedure #10
SET SERVEROUTPUT ON;

EXECUTE USP_EZPLUSEARNED30(100,150);