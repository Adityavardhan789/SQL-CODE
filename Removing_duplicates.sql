use WILMINGTON;
CREATE TABLE Employee
    ( 
    [ID] INT identity(1,1), 
    [FirstName] Varchar(100), 
    [LastName] Varchar(100), 
    [Country] Varchar(100), 
    ) 
    GO 
    
    Insert into Employee ([FirstName],[LastName],[Country] )values('Raj','Gupta','India'),
                                ('Raj','Gupta','India'),
                                ('Mohan','Kumar','USA'),
								('Mohan','Kumar','USA'),
								('Mohan','Kumar','USA'),
								('Mohan','Kumar','USA'),
                                ('James','Barry','UK'),
                                ('James','Barry','UK'),
                                ('James','Barry','UK')

select * from Employee;

--select [FirstName],[LastName],[Country], 
--cte (Common table expression)

select [FirstName],[LastName],[Country], Count(*) from Employee
Group BY [FirstName],[LastName],[Country]
Having Count(*) > 1



Delete from Employee where ID not in (
Select MAX(ID) from Employee
Group BY [FirstName],[LastName],[Country])



With EmployeeCTE AS
(
Select *, ROW_NUMBER () Over(Partition by [FirstName],[LastName],[Country] Order by ID) as Row_Num
from Employee
)
delete from EmployeeCTE where Row_Num > 1

select * from Employee;
