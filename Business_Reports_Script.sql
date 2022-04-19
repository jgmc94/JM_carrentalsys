--VEHICLES CURRENTLY IN MAINTENANCE
SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.MILEAGE,VEHICLE.TRANSMISSIONTYPE,VEHICLE_STATUS.VEHICLESTATUS
FROM VEHICLE, VEHICLE_STATUS
WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID = 'M1';

--VEHICLES IN NEED OF A CHECK UP NOT CURRENTLY IN MAINTANENCE
SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.MILEAGE,VEHICLE.TRANSMISSIONTYPE,VEHICLE.ASSIGNEDAGENCYID,VEHICLE_STATUS.VEHICLESTATUS
FROM VEHICLE, VEHICLE_STATUS
WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND NOT VEHICLE.VEHICLESTATUSID = 'M1'
AND MILEAGE > 100000;

--VEHICLES CURRENTLY RESERVED
SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.DAILYRENTALCOST,VEHICLE.ASSIGNEDAGENCYID,VEHICLE.CURRENTAGENCYID,VEHICLE.VEHICLETYPE,VEHICLE_STATUS.VEHICLESTATUS
FROM VEHICLE, VEHICLE_STATUS
WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID = 'R1';

--VEHICLES ALREADY RENTED
SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.DAILYRENTALCOST,VEHICLE.ASSIGNEDAGENCYID,VEHICLE.CURRENTAGENCYID,VEHICLE.VEHICLETYPE,VEHICLE_STATUS.VEHICLESTATUS
FROM VEHICLE, VEHICLE_STATUS
WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID = 'R2';

--VEHICLES AVAILABLE
SELECT VEHICLE.VINNUMBER,VEHICLE.MAKE,VEHICLE.MODEL,VEHICLE.COLOR,VEHICLE.PLATENUMBER,VEHICLE.DAILYRENTALCOST,VEHICLE.ASSIGNEDAGENCYID,VEHICLE.CURRENTAGENCYID,VEHICLE.VEHICLETYPE,VEHICLE_STATUS.VEHICLESTATUS
FROM VEHICLE, VEHICLE_STATUS 
WHERE VEHICLE.VEHICLESTATUSID = VEHICLE_STATUS.VEHICLESTATUSID AND VEHICLE.VEHICLESTATUSID = 'A1';

--CANCELLED RESERVATIONS
SELECT RESERVATION.CONFIRMATIONID,RESERVATION.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,RESERVATION_STATUS.RESERVATIONSTATUS
FROM RESERVATION, CUSTOMER, RESERVATION_STATUS
WHERE RESERVATION.DRIVERLICENSENUM = CUSTOMER.DRIVERLICENSENUM AND RESERVATION_STATUS.RESERVATIONSTATUSID = RESERVATION.RESERVATIONSTATUSID 
AND RESERVATION.RESERVATIONSTATUSID = 'B3';

--COMPLETED RESERVATIONS
SELECT RESERVATION.CONFIRMATIONID,RESERVATION.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,RESERVATION_STATUS.RESERVATIONSTATUS
FROM RESERVATION, CUSTOMER, RESERVATION_STATUS
WHERE RESERVATION.DRIVERLICENSENUM = CUSTOMER.DRIVERLICENSENUM AND RESERVATION_STATUS.RESERVATIONSTATUSID = RESERVATION.RESERVATIONSTATUSID 
AND RESERVATION.RESERVATIONSTATUSID = 'A4';

--CONFIRMED RESERVATIONS
SELECT RESERVATION.CONFIRMATIONID,RESERVATION.DRIVERLICENSENUM,RESERVATION.PICKUPAGENCYID,RESERVATION.RENTALDATE,RESERVATION.RENTALTIME,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,RESERVATION_STATUS.RESERVATIONSTATUS 
FROM RESERVATION, CUSTOMER, RESERVATION_STATUS
WHERE RESERVATION.DRIVERLICENSENUM = CUSTOMER.DRIVERLICENSENUM AND RESERVATION_STATUS.RESERVATIONSTATUSID = RESERVATION.RESERVATIONSTATUSID 
AND RESERVATION.RESERVATIONSTATUSID = 'A5';

--EZPLUS EARNED 35% DISCOUNT
SELECT CUSTOMER.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,PRIVATE_CUSTOMER.EZPLUSNUMBER,EZPLUS.EZPLUSEARNEDPOINTS
FROM CUSTOMER, PRIVATE_CUSTOMER, EZPLUS
WHERE CUSTOMER.DRIVERLICENSENUM = PRIVATE_CUSTOMER.PDRIVERLICENSENUM AND PRIVATE_CUSTOMER.EZPLUSNUMBER = EZPLUS.EZPLUSNUMBER 
AND EZPLUSEARNEDPOINTS > 150;

--EZPLUS EARNED 30% DISCOUNT
SELECT CUSTOMER.DRIVERLICENSENUM,CUSTOMER.FIRSTNAME,CUSTOMER.LASTNAME,CUSTOMER.EMAIL,PRIVATE_CUSTOMER.EZPLUSNUMBER,EZPLUS.EZPLUSEARNEDPOINTS
FROM CUSTOMER, PRIVATE_CUSTOMER, EZPLUS
WHERE CUSTOMER.DRIVERLICENSENUM = PRIVATE_CUSTOMER.PDRIVERLICENSENUM AND PRIVATE_CUSTOMER.EZPLUSNUMBER = EZPLUS.EZPLUSNUMBER 
AND EZPLUSEARNEDPOINTS < 150 AND EZPLUSEARNEDPOINTS > 100;