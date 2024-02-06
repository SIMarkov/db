CREATE TABLE SUPPLIERS (
    SID CHAR(8) PRIMARY KEY,
    NAME VARCHAR(30) NOT NULL,
    CITY VARCHAR(20) NOT NULL
)

CREATE TABLE PARTS (
    PART_ID INT PRIMARY KEY,
    PART_NAME VARCHAR(30) NOT NULL,
    COLOR VARCHAR(10),
    WEIGHT DECIMAL(6,3)
)

CREATE TABLE SUPPLIERS_PARTS (
    SID CHAR(8),
    PART_ID INT NOT NULL,
    QUANTITY INT NOT NULL,
    FOREIGN KEY (SID) REFERENCES SUPPLIERS(SID),
    FOREIGN KEY (PART_ID) REFERENCES PARTS(PART_ID)
)
