
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



