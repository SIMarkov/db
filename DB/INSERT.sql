insert into SUPPLIERS (SID, NAME, CITY) 
values (1, 'Trade', 'Plovdiv');
insert into SUPPLIERS (SID, NAME, CITY) 
values (2, 'New Horizon', 'Varna');
insert into SUPPLIERS (SID, NAME, CITY) 
values (3, 'Universal', 'Sofia');

insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT) 
values (101, 'Part 1', 'Blue', 30);
insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT) 
values (102, 'Part 2', 'Green', 50);
insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT) 
values (103, 'Part 3', 'Red', 70);

insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY) 
values (1, 101, 100);
insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY) 
values (1, 102, 200);
insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY) 
values (2, 102, 150);
insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY) 
values (2, 103, 300);
insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY) 
values (3, 101, 50);
