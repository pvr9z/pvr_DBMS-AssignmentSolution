Create Database if not exists `travel_otg` ;
use `travel_otg`;

-- 1) create two tables PASSENGER and PRICE 

create table passenger(Passenger_name varchar(50),
 Category varchar(50),
 Gender varchar(10),
 Boarding_City varchar(50),
 Destination_City varchar(50),
 Distance int,
 Bus_Type varchar(50));
 
 create table PRICE(Bus_Type varchar(50), Distance int, Price int);
 
 -- 2) Insert the following data in the tables
 
 insert into Passenger values('Sejal', 'AC', 'F' , 'Bengaluru', 'Chennai', 350, 'Sleeper');
 insert into Passenger values('Anmol', 'Non-AC', 'M' , 'Mumbai', 'Hyderabad', 700, 'Sitting');
 insert into Passenger values('Pallavi', 'AC', 'F' , 'Panaji', 'Bengaluru', 600, 'Sleeper');
 insert into Passenger values('Khusboo', 'AC', 'F' , 'Chennai', 'Mumbai', 1500, 'Sleeper');
 insert into Passenger values('Udit', 'Non-AC', 'M' , 'Trivandrum', 'Panaji', 1000, 'Sleeper');
 insert into Passenger values('Ankur', 'AC', 'M' , 'Nagpur', 'Hyderabad', 500, 'Sitting');
 insert into Passenger values('Hemant', 'Non-AC', 'M' , 'Panaji', 'Mumbai', 700, 'Sleeper');
 insert into Passenger values('Manish', 'Non-AC', 'M' , 'Hyderabad', 'Bengaluru', 500, 'Sitting');
 insert into Passenger values('Piyush', 'AC', 'M' , 'Pune', 'Nagpur', 700, 'Sitting');
 
 insert into Price  values('Sleeper', 350, 770);
 insert into Price  values('Sleeper', 500, 1100);
 insert into Price  values('Sleeper', 600, 1320);
 insert into Price  values('Sleeper', 700, 1540);
 insert into Price  values('Sleeper', 1000, 2200);
 insert into Price  values('Sleeper', 1200, 2640);
 insert into Price  values('Sleeper', 350, 434);
 insert into Price  values('Sitting', 500, 620);
 insert into Price  values('Sitting', 500, 620);
 insert into Price  values('Sitting', 600, 744);
 insert into Price  values('Sitting', 700, 868);
 insert into Price  values('Sitting', 1000, 1240);
 insert into Price  values('Sitting', 1200, 1488);
 insert into Price  values('Sitting', 1500, 1860);
 
 -- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s? 
 select Gender, count(Gender)  from Passenger where Distance >=600 group by Gender;
 
 -- 4) Find the minimum ticket price for Sleeper Bus?
 select Min(price) from Price where Bus_Type = 'sleeper';
 
 -- 5) Select passenger names whose names start with character 'S'
 select passenger_name from passenger where Passenger_name like 'S%';
 
 -- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City,
 -- Bus_Type, Price in the output
 
 select p.Passenger_name, p.Boarding_City , p.Destination_City, p.Bus_Type, price.Price from passenger p inner join price on p.Distance = price.Distance and p.Bus_Type = price.Bus_Type group by p.passenger_name;

-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s 

select p.passenger_name, pr.price from passenger p inner join price pr on p.Distance = pr.distance and p.Bus_Type = pr.Bus_Type where p.Bus_Type = 'sitting' and p.Distance = 1000;

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? 

select pr.bus_type, pr.price from passenger p , price pr where p.Passenger_name = 'Pallavi' and p.Distance = pr.Distance;

-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order 

select distinct distance from passenger group by distance  having count(Distance)=1 order by Distance desc;

-- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables 

select passenger_name, (distance / (select sum(distance) from passenger) *100) as Percentage_of_distance from passenger;

-- 11) Display the distance, price in three categories in table Price

select distance, price,
CASE
    WHEN price > 1000 THEN 'Expensive'
    WHEN price > 500 and price < 1000 THEN 'Average Cost'
    ELSE 'Cheap'
    
END as Price_category
from price; 
