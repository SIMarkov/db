/*	изтриване на всички детайли с тегло под 50;*/
DELETE FROM PARTS WHERE PARTS.WEIGHT < 50;

/*	заявка, която връща като резултат име и цвят (само това) на всички детайли;*/
SELECT PART_NAME, COLOR FROM PARTS;

/*	заявка, която връща имената на детайлите, които са доставени в количество, по-голямо от 100;*/
SELECT PART_NAME FROM PARTS 
JOIN SUPPLIERS_PARTS ON PARTS.PART_ID = SUPPLIERS_PARTS.PART_ID 
WHERE QUANTITY > 100;

/*	заявка, която връща като резултат общото доставено количество за една определена част;*/
SELECT SUM(QUANTITY) AS TOTAL_QUANTITY FROM SUPPLIERS_PARTS 
WHERE PART_ID = 102;

/*	заявка, която връща като резултат име на доставчик и броят доставки, които е направил;*/
SELECT SUPPLIERS.NAME, COUNT(SUPPLIERS_PARTS.SID) AS NUM_DELIVERIES 
FROM SUPPLIERS 
JOIN SUPPLIERS_PARTS ON SUPPLIERS.SID = SUPPLIERS_PARTS.SID 
GROUP BY SUPPLIERS.NAME

/*	да се разшири предната заявка, като се изведат само тези доставчици, които са направили над 3 доставки;*/
SELECT SUPPLIERS.NAME, COUNT(SUPPLIERS_PARTS.SID) AS NUM_DELIVERIES 
FROM SUPPLIERS 
JOIN SUPPLIERS_PARTS ON SUPPLIERS.SID = SUPPLIERS_PARTS.SID 
GROUP BY SUPPLIERS.NAME
HAVING COUNT(SUPPLIERS_PARTS.SID) > 3 

/*	заявка, която връща като резултат наименувание на детайл, цвят, тегло и доставено количество за най – тежкия и най – лекия детайл;*/
SELECT PARTS.PART_NAME, PARTS.COLOR, PARTS.WEIGHT, SUM(SUPPLIERS_PARTS.QUANTITY) AS DELIVERED_QUANTITY 
FROM PARTS 
JOIN SUPPLIERS_PARTS ON PARTS.PART_ID = SUPPLIERS_PARTS.PART_ID 
WHERE PARTS.WEIGHT = (SELECT MAX(WEIGHT) FROM PARTS) OR PARTS.WEIGHT = (SELECT MIN(WEIGHT) FROM PARTS)
GROUP BY PARTS.PART_ID, PARTS.PART_NAME, PARTS.COLOR, PARTS.WEIGHT

/*	заявка, която връща като резултат информация за всички доставчици, без значение дали имат направена доставка;*/
SELECT SUPPLIERS.SID, SUPPLIERS.NAME, SUPPLIERS.CITY, SUPPLIERS_PARTS.QUANTITY, PARTS.PART_NAME, PARTS.COLOR 
FROM SUPPLIERS 
LEFT JOIN SUPPLIERS_PARTS ON SUPPLIERS.SID = SUPPLIERS_PARTS.SID 
LEFT JOIN PARTS ON SUPPLIERS_PARTS.PART_ID = PARTS.PART_ID;

/*	заявка, която връща като резултат име на детайл, цвят и общото доставено количество*/
SELECT PARTS.PART_NAME, PARTS.COLOR, SUM(SUPPLIERS_PARTS.QUANTITY) AS TOTAL_QUANTITY 
FROM PARTS
JOIN SUPPLIERS_PARTS ON PARTS.PART_ID = SUPPLIERS_PARTS.PART_ID 
GROUP BY PARTS.PART_NAME, PARTS.COLOR;