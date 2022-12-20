-- Traer el FirstName y LastName de Person.Person cuando el FirstName sea Mark.
select FirstName, LastName from Person.Person where FirstName = 'Mark';

--¿Cuántas filas hay dentro de Person.Person?
select count(*) as 'Filas' from Person.Person; 

--Traer las 100 primeras filas de Production.Product donde el ListPrice no es 0
select top 100 * from Production.Product where ListPrice <> 0;

--Traer todas las filas de de HumanResources.vEmployee donde los apellidos de los empleados empiecen con una letra inferior a “D”
select * from HumanResources.vEmployee where LastName like '[E-Z]%';

--¿Cuál es el promedio de StandardCost para cada producto donde StandardCost es mayor a $0.00? (Production.Product)
select ProductID, Name, AVG(StandardCost) as 'Promedio' from Production.Product where StandardCost > 0 group by ProductID, Name;

--En la tabla Person.Person ¿cuántas personas están asociadas con cada tipo de persona (PersonType)?
select PersonType, count(*) as 'Cantidad de Personas' from Person.Person group by PersonType;

--Traer todas las filas y columnas de Person.StateProvince donde el CountryRegionCode sea CA.
select * from Person.StateProvince where CountryRegionCode = 'CA';

--¿Cuántos productos en Production.Product hay que son rojos (red) y cuántos que son negros (black)?
select Color, count(*) as 'Cantidad de productos' from Production.Product where Color in ('Red', 'Black') group by Color;

--¿Cuál es el valor promedio de Freight por cada venta? (Sales.SalesOrderHeader) donde la venta se dio en el TerriotryID 4?
select SalesOrderID, AVG(Freight) as 'Valor Promedio' from Sales.SalesOrderHeader where TerritoryID = 4 group by SalesOrderID;

--Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido sea Lopez, Martin o Wood, y sus nombres empiecen con 
--cualquier letra entre la C y la L.
select * from Sales.vIndividualCustomer where LastName in ('Lopez', 'Martin', 'Wood') and FirstName like '[C-L]%';

--Devolver el FirstName y LastName de Sales.vIndividualCustomer donde el apellido sea Smith, renombra las columnas en español.
select FirstName as 'Nombre', LastName as 'Apellido' from Sales.vIndividualCustomer where LastName = 'Smith';

--Usando Sales.vIndividualCustomer traer a todos los clientes que tengan el CountryRegionCode de Australia ó todos los clientes
--que tengan un celular (Cell) y en EmailPromotion sea 0.
select * from Sales.vIndividualCustomer where CountryRegionName = 'Australia' or PhoneNumberType = 'Cell' and EmailPromotion = 0;

--¿Que tan caro es el producto más caro, por ListPrice, en la tabla Production.Product?
select * from Production.Product order by ListPrice desc;

--¿Cuáles son las ventas por territorio para todas las filas de Sales.SalesOrderHeader? 
--Traer sólo los territorios que se pasen de $10 millones en ventas históricas, traer el total de las ventas y el TerritoryID.
select TerritoryID, count(*) as 'Total Ventas', sum(TotalDue) as 'Total $' 
from Sales.SalesOrderHeader group by TerritoryID having sum(TotalDue) > 10000000;

--Usando la query anterior, hacer un join hacia Sales.SalesTerritory y reemplazar el TerritoryID con el nombre del territorio. 
select Sales.SalesTerritory.Name, count(*) as 'Total Ventas', sum(TotalDue) as 'Total $'
from Sales.SalesOrderHeader
inner join Sales.SalesTerritory on  Sales.SalesTerritory.TerritoryID = Sales.SalesOrderHeader.TerritoryID
group by Sales.SalesTerritory.Name
having sum(TotalDue) > 10000000;

--Traer todos los empleados de HumanResources.vEmployeeDepartment que sean del departamento de “Executive”, “Tool Design”,
--y “Engineering”. Cuáles son las dos formas de hacer esta consulta.
select * from HumanResources.vEmployeeDepartment where Department in ('Executive', 'Tool Design', 'Engineering');

select * from HumanResources.vEmployeeDepartment 
where Department = 'Executive' or Department = 'Tool Design'or Department = 'Engineering';

--Usando HumanResources.vEmployeeDepartment traer a todos los empleados que hayan empezado entre el primero de Julio del 2010 y 
--el 30 de Junio del 2012. Hay dos posibilidades para hacer esta consulta. Hacer ambas.
select * from HumanResources.vEmployeeDepartment where StartDate between '2010-07-01' and '2012-06-30';

select * from HumanResources.vEmployeeDepartment where StartDate > '2010-07-01' and StartDate <'2012-06-30';

--Traer todas las filas de Sales.SalesOrderHeader donde exista un vendedor (SalesPersonID) 
select * from Sales.SalesOrderHeader where SalesPersonID <> '';

--¿Cuántas filas en Person.Person no tienen NULL en MiddleName?
select count(*) as 'Cantidad de filas' from Person.Person where MiddleName != '';

--Traer SalesPersonID y TotalDue de Sales.SalesOrderHeader por todas las ventas que no tienen valores vacíos en SalesPersonID
--y TotalDue excede $70000
select SalesPersonID, TotalDue from Sales.SalesOrderHeader where SalesPersonID <> '' and TotalDue > 70000;

--Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido empiece con R
select * from Sales.vIndividualCustomer where LastName like 'R%';

--Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido termine con R
select * from Sales.vIndividualCustomer where LastName like '%R';

--Usando Production.Product encontrar cuántos productos están asociados con cada color. Ignorar las filas donde el color no tenga 
--datos (NULL). Luego de agruparlos, devolver sólo los colores que tienen al menos 20 productos en ese color.
select Color, count(*) as 'Cantidad' from Production.Product where Color <> '' group by Color having count(*) > 19;

--Hacer un join entre Production.Product y Production.ProductInventory sólo cuando los productos aparecen en ambas tablas. 
--Hacerlo sobre el ProductID. Production.ProductInventory tiene la cantidad de cada producto, si se vende cada producto con un 
--ListPrice mayor a cero, ¿cuánto dinero se ganaría? 
select * from Production.Product inner join Production.ProductInventory
on Production.Product.ProductID = Production.ProductInventory.ProductID;

--Traer FirstName y LastName de Person.Person. Crear una tercera columna donde se lea “Promo 1” si el EmailPromotion es 0, 
--“Promo 2” si el valor es 1 o “Promo 3” si el valor es 2
select FirstName, LastName, EmailPromotion, case when EmailPromotion = 0 then 'Promo 1' when EmailPromotion = 1 then 'Promo 2'
else 'Promo 3'end as 'EmailPromotion' from Person.Person;

--Traer el BusinessEntityID y SalesYTD de Sales.SalesPerson, juntarla con Sales.SalesTerritory de tal manera que Sales.SalesPerson 
--devuelva valores aunque no tenga asignado un territorio. Traes el nombre de Sales.SalesTerritory.
select BusinessEntityID, Sales.SalesPerson.SalesYTD, Sales.SalesPerson.TerritoryID, Sales.SalesTerritory.Name from Sales.SalesPerson
left join Sales.SalesTerritory on Sales.SalesPerson.TerritoryID = Sales.SalesTerritory.TerritoryID;

--Usando el ejemplo anterior, vamos a hacerlo un poco más complejo. Unir Person.Person para traer también el nombre y apellido.
--Sólo traer las filas cuyo territorio sea “Northeast” o “Central”.
select Person.Person.BusinessEntityID, FirstName, LastName, Sales.SalesPerson.SalesYTD, Sales.SalesPerson.TerritoryID, 
Sales.SalesTerritory.Name from Sales.SalesPerson
left join Sales.SalesTerritory on Sales.SalesPerson.TerritoryID = Sales.SalesTerritory.TerritoryID 
inner join Person.Person on Person.Person.BusinessEntityID = Sales.SalesPerson.BusinessEntityID 
where Sales.SalesTerritory.Name in ('Central', 'Northeast');

--Usando Person.Person y Person.Password hacer un INNER JOIN trayendo FirstName, LastName y PasswordHash.
select FirstName, LastName, PasswordHash from Person.Person
inner join Person.Password on Person.Person.BusinessEntityID = Person.Password.BusinessEntityID;

--Traer el título de Person.Person. Si es NULL devolver “No hay título”.
select *, 
     case when Title is null then 'No hay titulo'  
	 else Title end as 'Title' 
from Person.Person;

--Si MiddleName es NULL devolver FirstName y LastName concatenados, con un espacio de por medio. Si MiddeName no es NULL devolver 
--FirstName, MiddleName y LastName concatenados, con espacios de por medio.
select
    case when MiddleName = '' then CONCAT(FirstName,' ',LastName)
    else CONCAT(FirstName,' ',MiddleName,' ',LastName) end as 'Name'
from Person.Person;

--Usando Production.Product si las columnas MakeFlag y FinishedGoodsFlag son iguales, que devuelva NULL
select *,
    case when MakeFlag = FinishedGoodsFlag then 'Null' 
    else 'Not Null' end as 'MakeFlag_FinishedGoodsFlag' 
from Production.Product;

--Usando Production.Product si el valor en color no es NULL devolver “Sin color”. Si el color sí está, devolver el color. 
--Se puede hacer de dos maneras, desarrollar ambas.
select *,
    case when Color = 'Null' then 'Sin color'
    else Color end as 'Color'
from Production.Product;

--Usando Person.Person y Person.Password hacer un INNER JOIN trayendo FirstName, LastName y PasswordHash.
select FirstName, LastName, PasswordHash from Person.Person 
inner join Person.Password on Person.Person.BusinessEntityID = Person.Password.BusinessEntityID;

--Fuente https://www.linkedin.com/pulse/ejercicios-sql-server-rocio-lopez/?originalSubdomain=es
--DataBase https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks