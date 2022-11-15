use CrudeOil

-- view table and records

select * from Crude_Oil_Prod

-- record of years under review

select  distinct (Year) from Crude_Oil_Prod

--- add an identifier to the records
alter table Crude_Oil_Prod add Identifier int primary key identity(1,1) 

--- view updated record
select * from Crude_Oil_Prod

-- how many recors are in the table?
select count(Year) from Crude_Oil_Prod

-- total yearly production per barrel
select Year, sum(Total_Production_barrel)  Yearly_Production 
from Crude_Oil_Prod
group by Year

-- display Yearly Production in ascending order
select Year, sum(Total_Production_barrel)  Yearly_Production 
from Crude_Oil_Prod
group by Year
order  by Year

-- what is the highest  and lowest crude oil production 
select max(Total_Production_barrel),
min(Total_Production_barrel)
from Crude_Oil_Prod



-- what is the highest  and lowest crude oil production per year
select Year, 
max(Total_Production_barrel)  max_Yearly_Production,
min(Total_Production_barrel) min_yearly_production
from Crude_Oil_Prod
group by Year

-- year with highest crude oil production
select YEAR,Total_Production_barrel from Crude_Oil_Prod
where Total_Production_barrel = 2880000

-- year with lowest crude oil production
select YEAR,Total_Production_barrel from Crude_Oil_Prod
where Total_Production_barrel = 940000


-- average yearly production
select YEAR, avg(Total_Production_barrel) Average_Production from Crude_Oil_Prod
group by YEAR


--- change the dataype of Total Price to int
alter table Crude_Oil_Prod alter column Total_Price int not null


 -- Yearly production and sales
select Year,
sum(Total_Production_barrel)  Yearly_Production, 
sum(cast(Total_Price as bigint)) "Yearly_Sales" --- cast is used for large sum
from Crude_Oil_Prod
group by Year
order by Yearly_Sales





