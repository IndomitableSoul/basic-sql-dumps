//Creating database
create database employeedetails;
show databases;
use employeedetails;
show tables;

//Creating tables
create table empTable 
(
EmployeeID int NOT NULL AUTO_INCREMENT,
Employee_Name varchar(255),
Phone_number varchar(255),
Address varchar(255),
Department varchar(255),
Gender char(1),
salary float,
Start_Date Date,
city varchar(255),
country varchar(255),
PRIMARY KEY (EmployeeID)
);
 desc empTable;
 //disabling foreign key by
 set foreign_key_checks=0;
insert into empTable (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ('Nikita', '9988998899','Patna','Engg', 'F', '30000.0', '2022-03-02', 'Pune', 'India');
insert into empTable (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ("Ritika", "9988998877", "Mumbai", "Engg", "F", '30000.0','2022-04-05', "pune", "India");

select * from empTable;
delete from empTable where EmployeeID = '3';

select * from empTable where Employee_Name = 'Kiran';

//
select salary as salary from empTable; 

alter table empTable rename column salary to salary;
create table salary as select EmployeeID,Employee_Name,salary from empTable;
describe salary;
select * from salary;

update empTable set salary = '35000' where Employee_Name = 'Adesh';

/*Group by,sum,count,avg,min,max*/
select sum(salary) from empTable where Gender = 'F' group by Gender;
select sum(salary) from empTable where Gender = 'M' group by Gender;

select count(*) from empTable where Gender = 'F';
select count(*) from empTable where Gender = 'M';

select count(*) from empTable group by Gender;

select avg(salary) from empTable where Gender = 'M' group by Gender;
select avg(salary) from empTable where Gender = 'F' group by Gender;

select min(salary) from empTable where Gender = 'M' group by Gender;
select max(salary) from empTable where Gender = 'M' group by Gender;

select min(salary) from empTable where Gender = 'F' group by Gender;
select max(salary) from empTable where Gender = 'F' group by Gender;

select * from empTable order by salary desc;
select * from empTable order by salary asc;
//
select * from empTable;
SELECT * FROM empTable WHERE Start_Date = '2022-03-02'; //> <

create view view1 as select Employee_Name , Department from empTable where city = "Pune";
select * from view1;

select * from empTable where country = "India" AND city = "Patna";
Select * from empTable where country = "America" OR city = "Mumbai";
select * from empTable where NOT city = "Patna";

select * from empTable limit 3;

select * from empTable where Employee_Name LIKE 'A%';
select * from empTable where Employee_Name LIKE '%a';
select * from empTable where Employee_Name LIKE '%ur%';
select * from empTable where Employee_Name LIKE '_n%';
select * from empTable where Employee_Name LIKE 'k__%';
select * from empTable where Employee_Name LIKE 'A%h';
select * from empTable where Employee_Name NOT LIKE 'A%';

select * from empTable where city in ('Pune','Mumbai');
select * from empTable where salary between 35000 AND 41000;

select EmployeeID as Id, Employee_Name as Name from empTable;
select * from empTable;

create table Orders(OrderId int Not Null, CustomerId int, OrderDate date);
create table Customers(CustomerId int Not Null, CustomerName varchar(255), country varchar(255),Mobile varchar(10));

/*Insert Select*/
create table emp(id int,name varchar(100),city varchar(100));
insert into emp(id, name, city) select EmployeeID,Employee_Name,city from empTable where country = 'India';
select * from emp;

//
SELECT * FROM employeedetails.Orders;
insert into Orders(OrderId,CustomerId,OrderDate) values('10308','2','2021-03-09');
insert into Orders(OrderId,CustomerId,OrderDate) values('10309','37','2022-05-05');
insert into Orders(OrderId,CustomerId,OrderDate) values('10310','77','2022-02-03');

/*Union - Combines the result-set of two or more select stmt */
SELECT OrderID FROM Orders UNION SELECT CustomerName FROM Customers;


SELECT * FROM employeedetails.Customers;
use employeedetails;
insert into Customers(CustomerId,CustomerName,country,Mobile) values('1','Nikita','India','9988997788');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('2','Simi','America','9977889988');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('3','Rani','India','9988779988');

/*Inner Join ==> Return matching values from both table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Left Join == Returns all records from left table and mathcing from the right table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Right Join == Returns all records from right table and mathcing from the left table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
Right JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Cross Join == Returns all records from both tables*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
CROSS JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/////////////////////////////////////////////////////////////////////////////////////////////////////

/* Indexes */
create index byCity on empTable(EmployeeID, Employee_Name, city);
select * from byCity;
ALTER TABLE empTable DROP INDEX byCity;
show indexes from empTable;
