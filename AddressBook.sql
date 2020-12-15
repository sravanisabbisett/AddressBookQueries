
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
State varchar(50),
Zip int,
MobileNumber varchar(10) unique,
EmailId varchar(50)
);


--UC3_Insert values in to table
Insert into Person(Firstname,Lastname,Address,City,State,Zip,MobileNumber,EmailId)
values('Sravani','Sabbisetti','GandhiChowk','Bantumilli','AndhraPradesh',521324,'8712443377','sravani.sabbisetti1@gmail.com'),
('Rupika','Sabbisetti','Arunodayacolony','Hyderabad','Telangana',500081,'9290815127','Rupika.sabbisetti@gmail.com'),
('Manju','Chedhalla','Madhapur','Hyderabad','Telangana',500081,'9712443377','ManjuChedhalla@gmail.com'),
('Akhilesh','Sabbisetti','Perungudi','Chennai','Tamilnadu',567890,'7207321696','AkhileshSabbisetti@gmail.com'),
('Saraiya','Purkana','Krths','Bantumilli','AndhraPradesh',521324,'9959582197','Saraiaya@gmail.com');

--Retrive all rows from person table
Select * from Person

--UC4_Update data using person name
update Person
set State='karnataka'
where Firstname='Akhilesh'

--UC5_Delete data using Firstname
delete from Person
Where Firstname='Akhilesh';

--UC6_Retrive data using city or state
Select * from Person
where City='Bantumilli' or State='AndhraPradesh';

--UC7_CountPersons in persons table
Select Count(State) as CountPersons from Person
where City='Bantumilli' and State='AndhraPradesh';

--UC8_Sort persons alphabetically by FirstName on basis of City
Select * from Person
where City='Hyderabad'
order by Firstname desc;

Select Count(City) as CountCity,State,City from Person
Group by City,State;


--UC9--Creating table addressBook type to main the relation ship
Create table AddressBookType(
ABId int identity(1,1) primary key,
PersonType varchar(20) ,
AddressBookName varchar(50)
);


Insert into AddressBookType(PersonType,AddressBookName)
values('Friends','FriendsAddressBook'),
('Family','FamilyAddressBook'),
('Profession','ProfessionAddressBook');

--UC11 Adding one Person both Profession and friend
Create table PersondAddressBook(
PersonId int,
AddressBookId int
constraint PersonAddressBook_fk Foreign Key(PersonId) references Person(PersonId),
constraint PersonAddressBook_fk1 Foreign key(AddressBookId) references AddressBookType(ABId)
)

Select * from Person

Insert Into PersondAddressBook(PersonId,AddressBookId)
values(1,2),
(2,3),
(3,1),
(4,1),
(5,3);

Insert into Person(Firstname,Lastname,Address,City,State,Zip,MobileNumber,EmailId)
values('MounikaS','Mekala','GandhiChowk','Bantumilli','AndhraPradesh',521324,'8706543218','Mounisha.sabbisetti1@gmail.com');

--Declaring variable and selecting and saving tje result in the variable
DECLARE @AddressBookFriend AS int
select @AddressBookFriend=ABId from AddressBookType where PersonType='Friends';


Declare @AddressBookFamily as int
Select @AddressBookFamily=ABId from AddressBookType where PersonType='Family';

Declare @AddressBookProfession as int
Select @AddressBookProfession=ABId from AddressBookType where PersonType='Profession';


DECLARE @mylastinsertId AS int
SELECT @mylastinsertId= @@IDENTITY 


Insert into PersondAddressBook(PersonId,AddressBookId)
Values(@mylastinsertId,@AddressBookFriend);

Insert into PersondAddressBook(PersonId,AddressBookId)
Values(@mylastinsertId,@AddressBookProfession);

Select * from PersondAddressBook
--truncate used to delete the rows in the table and remains the table structure same
truncate table PersonAddressBook;

--UC10 Count the Person type
Select Count(AddressBookId) as Persons,AddressBookId from PersondAddressBook
Group by AddressBookId

Select Count(AddressBookId) as Persons,PersonType from  PersondAddressBook p
inner join AddressBookType a on p.AddressBookId=a.ABId
Group by PersonType;


--UC13_Curd operations
Select * from Person
where City='Bantumilli' or State='AndhraPradesh';

Select Count(State) as CountPersons from Person
where City='Bantumilli' and State='AndhraPradesh';

Select * from Person
where City='Hyderabad'
order by Firstname desc;

