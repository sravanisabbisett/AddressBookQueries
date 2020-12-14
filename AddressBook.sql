
--UC1 creating addressBook database
Create database AddressBookService

--Use query is used to change the database which we are using
use AddressBookService


--UC2Create table in the addressbook database
Create table Person(
PersonId int identity(1,1) primary Key,
Firstname varchar(50) Not Null,
Lastname varchar(50) Not Null,
Address varchar(50),
City varchar(50),
Zip int,
MobileNumber varchar(10) unique,
EmailId varchar(50)
);

--UC3_Insert values in to table
Insert into Person(Firstname,Lastname,Address,City,Zip,MobileNumber,EmailId)
values('Sravani','Sabbisetti','GandhiChowk','Bantumilli',521324,'8712443377','sravani.sabbisetti1@gmail.com'),
('Rupika','Sabbisetti','Arunodayacolony','Hyderabad',500081,'9290815127','Rupika.sabbisetti@gmail.com'),
('Manju','Chedhalla','Madhapur','Hyderabad',500081,'9712443377','ManjuChedhalla@gmail.com'),
('Akhilesh','Sabbisetti','Perungudi','Chennai',567890,'7207321696','AkhileshSabbisetti@gmail.com'),
('Saraiya','Purkana','Krths','Bantumilli',521324,'9959582197','Saraiaya@gmail.com');

--Retrive all rows from person table
Select * from Person;
