--CALL VIEWS
SELECT *
FROM VEHICLES_IN_MAINTENANCE
WHERE VEHICLESTATUSID = 'M1';

SELECT *
FROM VEHICLES_TO_MAINTAIN
WHERE NOT VEHICLESTATUSID = 'M1' AND MILEAGE > 100000;

SELECT *
FROM VEHICLE_STATUS_VIEW
WHERE VEHICLESTATUSID = 'R2'; -- R1 R2 A1

SELECT *
FROM RESERVATION_STATUS_VIEW
WHERE RESERVATIONSTATUSID = 'A3'; --A3 A4 A5 

SELECT *
FROM EARNED_DISCOUNTS
WHERE EZPLUSEARNEDPOINTS > 150;

SELECT *
FROM EARNED_DISCOUNTS
WHERE EZPLUSEARNEDPOINTS < 150 AND EZPLUSEARNEDPOINTS > 100;

