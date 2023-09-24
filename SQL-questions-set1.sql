show databases;

create database SQL_questions_set1;

use SQL_questions_set1;

-- sample dataset-1

create table
    CITY (
        ID int,
        NAME VARCHAR(17),
        COUNTRYCODE VARCHAR(3),
        DISTRICT VARCHAR(20),
        POPULATION INT
    );

INSERT INTO CITY
VALUES (
        6,
        'Rotterdam',
        'NLD',
        'Zuid-Holland',
        593321
    );

INSERT INTO CITY
VALUES (
        3878,
        'Scottsdale',
        'USA',
        'Arizona',
        202705
    );

INSERT INTO CITY
VALUES (
        3965,
        'Corona',
        'USA',
        'California',
        124966
    );

INSERT INTO CITY
VALUES (
        3973,
        'Concord',
        'USA',
        'California',
        121780
    );

INSERT INTO CITY
VALUES (
        3977,
        'Cedar Rapids',
        'USA',
        'Iowa',
        120758
    );

INSERT INTO CITY
VALUES (
        3982,
        'Coral Springs',
        'USA',
        'Florida',
        117549
    );

INSERT INTO CITY
VALUES (
        4054,
        'Fairfield',
        'USA',
        'California',
        92256
    );

INSERT INTO CITY VALUES (4058, 'Boulder', 'USA', 'Colorado', 91238);

INSERT INTO CITY
VALUES (
        4061,
        'Fall River',
        'USA',
        'Massachusetts',
        90555
    );

-- Q1. Query all columns for all American cities in the CITY table with populations larger than 100000.The CountryCode for America is USA.

select * from CITY where COUNTRYCODE = 'USA' and POPULATION >100000;

-- Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000.The CountryCode for America is USA.

select * from CITY where COUNTRYCODE = 'USA' and POPULATION >120000;

-- Q3.Query all columns (attributes) for every row in the CITY table.

select * from CITY;

-- Q4. Query all columns for a city in CITY with the ID 1661.

select * from CITY where ID = 1661;

-- Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

select * from CITY where COUNTRYCODE = 'JPN';

-- Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

select NAME from CITY where COUNTRYCODE = 'JPN';

use bbm05xvu2haxbiscom8s;

-- sample dataset-2

create table
    STATION (
        ID int,
        CITY VARCHAR(21),
        STATE VARCHAR(2),
        LAT_N INT,
        LONG_W INT
    );

INSERT INTO STATION VALUES (794, 'Kissee Mills', 'MO', 139, 73);

INSERT INTO STATION VALUES (824, 'Loma Mar', 'CA', 48, 130);

INSERT INTO STATION VALUES (603, 'Sandy Hook', 'CT', 72, 148);

INSERT INTO STATION VALUES (478, 'Tipton', 'IN', 33, 97);

INSERT INTO STATION VALUES (619, 'Arlington', 'CO', 75, 92);

INSERT INTO STATION VALUES (711, 'Turner', 'AR', 50, 101);

INSERT INTO STATION VALUES (839, 'Slidell', 'LA', 85, 151);

INSERT INTO STATION VALUES (411, 'Negreet', 'LA', 98, 105);

INSERT INTO STATION VALUES (588, 'Glencoe', 'KY', 46, 136);

INSERT INTO STATION VALUES (665, 'Chelsea', 'IA', 98, 59);

INSERT INTO STATION VALUES (342, 'Chignik Lagoon', 'AK', 103, 153);

INSERT INTO STATION VALUES (733, 'Pelahatchie', 'MS', 38, 28);

INSERT INTO STATION VALUES (441, 'Hanna City', 'IL', 50, 136);

INSERT INTO STATION VALUES (811, 'Dorrance', 'KS', 102, 121);

INSERT INTO STATION VALUES (698, 'Albany', 'CA', 49, 80);

INSERT INTO STATION VALUES (325, 'Monument', 'KS', 70, 141);

INSERT INTO STATION VALUES (414, 'Manchester', 'MD', 73, 37);

INSERT INTO STATION VALUES (113, 'Prescott', 'IA', 39, 65);

INSERT INTO STATION VALUES (971, 'Graettinger', 'IA', 94, 150);

INSERT INTO STATION VALUES (266, 'Cahone', 'CO', 116, 127);

select * from STATION;

-- Q7. Query a list of CITY and STATE from the STATION table.

select CITY,STATE from STATION;

-- Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

select DISTINCT(CITY) from STATION where ID%2=0;

-- Q9. Find the difference between the total number of CITY entries in the table and the number of

-- distinct CITY entries in the table.

select
    COUNT(CITY) - COUNT(DISTINCT(CITY)) AS CONTRY_TOTAL_MINUS_DISTINT
from STATION;

-- Q10. Query the two cities in STATION with the shortest and longest CITY names, as well as their

-- respective lengths (i.e.: number of characters in the name). If there is more than one smallest or

-- largest city, choose the one that comes first when ordered alphabetically.

select
    CITY,
    LENGTH(CITY) AS CITY_LENGTH
from STATION
WHERE City = (
        select CITY
        from STATION
        ORDER BY
            LENGTH(CITY) DESC
        LIMIT 1
    ) OR City = (
        select CITY
        from STATION
        ORDER BY
            LENGTH(CITY) ASC
        LIMIT 1
    );

-- Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result

-- cannot contain duplicates.

SELECT DISTINCT(CITY)
FROM STATION
WHERE
    CITY LIKE ('a%')
    OR CITY LIKE ('e%')
    OR CITY LIKE ('i%')
    OR CITY LIKE ('o%')
    OR CITY LIKE ('u%');

-- Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot

-- contain duplicates.

SELECT DISTINCT(CITY)
FROM STATION
WHERE
    CITY LIKE ('%a')
    OR CITY LIKE ('%e')
    OR CITY LIKE ('%i')
    OR CITY LIKE ('%o')
    OR CITY LIKE ('%u');

-- Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot

-- contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE
    CITY NOT LIKE ('a%')
    AND CITY NOT LIKE ('e%')
    AND CITY NOT LIKE ('i%')
    AND CITY NOT LIKE ('o%')
    AND CITY NOT LIKE ('u%');

-- Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot

-- contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE
    CITY NOT LIKE ('%a')
    AND CITY NOT LIKE ('%e')
    AND CITY NOT LIKE ('%i')
    AND CITY NOT LIKE ('%o')
    AND CITY NOT LIKE ('%u');

-- Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end

-- with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE
    CITY NOT LIKE ('%a')
    OR CITY NOT LIKE ('a%')
    OR CITY NOT LIKE ('%e')
    OR CITY NOT LIKE ('e%')
    OR CITY NOT LIKE ('%i')
    OR CITY NOT LIKE ('i%')
    OR CITY NOT LIKE ('%o')
    OR CITY NOT LIKE ('o%')
    OR CITY NOT LIKE ('%u')
    OR CITY NOT LIKE ('u%');

-- Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with

-- vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE
    CITY NOT LIKE ('%a')
    AND CITY NOT LIKE ('a%')
    AND CITY NOT LIKE ('%e')
    AND CITY NOT LIKE ('e%')
    AND CITY NOT LIKE ('%i')
    AND CITY NOT LIKE ('i%')
    AND CITY NOT LIKE ('%o')
    AND CITY NOT LIKE ('o%')
    AND CITY NOT LIKE ('%u')
    AND CITY NOT LIKE ('u%');

create table
    Product(
        product_id int,
        product_name VARCHAR(50),
        unit_price int,
        constraint PK_product_id PRIMARY key (product_id)
    );

create table
    Sales(
        seller_id int,
        product_id int,
        buyer_id int,
        sale_date DATE,
        quantity int,
        price int,
        FOREIGN KEY (product_id) REFERENCES Product(product_id)
    );

insert into Product VALUES(1,'S8',1000);

insert into Product VALUES(2,'G4',800);

insert into Product VALUES(3,'iphone',1400);

select * from Product;

insert into `Sales` VALUES(1,1,1,'2019-01-21',2,2000);

insert into `Sales` VALUES(1,2,2,'2019-02-17',1,800);

insert into `Sales` VALUES(2,2,3,'2019-06-02',1,800);

insert into `Sales` VALUES(3,3,4,'2019-05-13',2,2800);

select * from `Sales`;

-- Q17.Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,

-- between 2019-01-01 and 2019-03-31 inclusive.

select
    pr.product_id,
    pr.product_name
from `Sales` sl
    inner join `Product` pr on sl.product_id = pr.product_id
where
    sale_date BETWEEN '2019-01-01' and '2019-03-31';

-- Q18.Write an SQL query to find all the authors that viewed at least one of their own articles.

-- Return the result table sorted by id in ascending order.

CREATE table
    Views(
        article_id int,
        author_id int,
        viewer_id int,
        view_date DATE
    );

INSERT into Views VALUES(1,3,5,'2019-08-01');

INSERT into Views VALUES(1,3,6,'2019-08-02');

INSERT into Views VALUES(2,7,7,'2019-08-01');

INSERT into Views VALUES(2,7,6,'2019-08-02');

INSERT into Views VALUES(4,7,1,'2019-07-22');

INSERT into Views VALUES(3,4,4,'2019-07-21');

INSERT into Views VALUES(3,4,4,'2019-07-21');

select DISTINCT author_id
from Views
where author_id = viewer_id
ORDER BY author_id;

-- Q19.Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal

-- places.

create Table
    Delivery(
        delivery_id int,
        customer_id int,
        order_date DATE,
        customer_pref_delivery_date date,
        CONSTRAINT PK_delivery_id PRIMARY KEY(delivery_id)
    );

INSERT INTO Delivery VALUES(1,1,'2019-08-01','2019-08-02');

INSERT INTO Delivery VALUES(2,5,'2019-08-02','2019-08-02');

INSERT INTO Delivery VALUES(3,1,'2019-08-11','2019-08-11');

INSERT INTO Delivery VALUES(4,3,'2019-08-24','2019-08-26');

INSERT INTO Delivery VALUES(5,4,'2019-08-21','2019-08-22');

INSERT INTO Delivery VALUES(6,2,'2019-08-11','2019-08-13');

SELECT COUNT(*)
FROM Delivery
WHERE
    order_date = customer_pref_delivery_date;

SELECT ROUND( (
            SELECT COUNT(*)
            FROM Delivery
            WHERE
                order_date = customer_pref_delivery_date
        ) * 100 / COUNT(*),
        2
    ) immediate_percentage
FROM Delivery;

-- Q20.Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.

-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a

-- tie

CREATE TABLE
    Ads(
        ad_id INT,
        user_id INT,
        action enum('Clicked', 'Viewed', 'Ignored'),
        CONSTRAINT PK_ad_iduser_id PRIMARY KEY (ad_id, user_id)
    );

INSERT INTO Ads VALUES(1,1,'Clicked');

INSERT INTO Ads VALUES(2,2,'Clicked');

INSERT INTO Ads VALUES(3,3,'Viewed');

INSERT INTO Ads VALUES(5,5,'Ignored');

INSERT INTO Ads VALUES(1,7,'Ignored');

INSERT INTO Ads VALUES(2,7,'Viewed');

INSERT INTO Ads VALUES(3,5,'Clicked');

INSERT INTO Ads VALUES(1,4,'Viewed');

INSERT INTO Ads VALUES(2,11,'Viewed');

INSERT INTO Ads VALUES(1,2,'Clicked');

SELECT ad_id, COUNT(action)
FROM Ads
WHERE action = 'Clicked'
GROUP BY ad_id, action;

SELECT COUNT(action) + (
        SELECT COUNT(action)
        from Ads
        where action = 'Viewed'
        GROUP BY
            ad_id,
            action
    )
from Ads
where action = 'Clicked'
GROUP BY ad_id, action;

SELECT ad_id, COUNT(action)
from Ads
where action = 'Viewed'
GROUP BY ad_id, action;

SELECT
    ad_id,
    COUNT(action) OVER (PARTITION BY action) AS ACTION_COUNT
FROM Ads;

SELECT
    TC.click_action_count,
    vc.click_viewed_count
FROM (
        SELECT
            ad_id,
            COUNT(action) AS click_action_count
        FROM Ads
        WHERE
            action = 'Clicked'
        GROUP BY
            ad_id,
            action
    ) TC (
        SELECT
            ad_id,
            COUNT(action) AS click_viewed_count
        from Ads
        where action = 'Viewed'
        GROUP BY
            ad_id,
            action
    ) VC

select count(action) 

-- Q21.Write an SQL query to find the team size of each of the employees.

-- Return result table in any order

CREATE TABLE
    Employee(
        employee_id int,
        team_id int,
        CONSTRAINT PK_employee_id PRIMARY KEY (employee_id)
    );

INSERT INTO Employee VALUES(1,8);

INSERT INTO Employee VALUES(2,8);

INSERT INTO Employee VALUES(3,8);

INSERT INTO Employee VALUES(4,7);

INSERT INTO Employee VALUES(5,9);

INSERT INTO Employee VALUES(6,9);

SELECT
    employee_id,
    COUNT(team_id) OVER (PARTITION BY team_id) AS team_size
FROM Employee
ORDER BY employee_id;

-- Q22.Write an SQL query to find the type of weather in each country for November 2019.

-- The type of weather is:

-- ● Cold if the average weather_state is less than or equal 15,

-- ● Hot if the average weather_state is greater than or equal to 25, and

-- ● Warm otherwise.

create Table
    Countries(
        country_id INT,
        country_name VARCHAR(30),
        CONSTRAINT PK_country_id PRIMARY KEY(country_id)
    );

CREATE TABLE
    Weather(
        country_id INT,
        weather_state INT,
        day DATE,
        CONSTRAINT PK_country_id_day PRIMARY KEY(country_id, day)
    );

INSERT INTO Countries VALUES(2,'USA');

INSERT INTO Countries VALUES(3,'Australia');

INSERT INTO Countries VALUES(7,'Peru');

INSERT INTO Countries VALUES(5,'China');

INSERT INTO Countries VALUES(8,'Morocco');

INSERT INTO Countries VALUES(9,'Spain');

SELECT * FROM Countries;

INSERT INTO Weather VALUES(2,15,'2019-11-01');

INSERT INTO Weather VALUES(2,12,'2019-10-28');

INSERT INTO Weather VALUES(2,12,'2019-10-27');

INSERT INTO Weather VALUES(3,-2,'2019-11-10');

INSERT INTO Weather VALUES(3,0,'2019-11-11');

INSERT INTO Weather VALUES(3,3,'2019-11-12');

INSERT INTO Weather VALUES(5,16,'2019-11-07');

INSERT INTO Weather VALUES(5,18,'2019-11-09');

INSERT INTO Weather VALUES(5,21,'2019-11-23');

INSERT INTO Weather VALUES(7,25,'2019-11-28');

INSERT INTO Weather VALUES(7,22,'2019-12-01');

INSERT INTO Weather VALUES(7,20,'2019-12-02');

INSERT INTO Weather VALUES(8,25,'2019-11-05');

INSERT INTO Weather VALUES(8,27,'2019-11-15');

INSERT INTO Weather VALUES(8,31,'2019-11-25');

INSERT INTO Weather VALUES(9,7,'2019-10-23');

INSERT INTO Weather VALUES(9,3,'2019-12-23');

SELECT
    Countries.country_name,
    CASE
        WHEN weather_state <= 15 THEN 'COLD'
        WHEN weather_state >= 25 THEN 'HOT'
        ELSE 'WARM'
    END AS weather_type
FROM Countries
    INNER JOIN Weather ON Countries.country_id = Weather.country_id
WHERE
    Weather.day BETWEEN '2019-11-01' AND '2019-11-30'
GROUP BY
    Countries.country_name;

-- Q23.Write an SQL query to find the average selling price for each product. average_price should be

-- rounded to 2 decimal places.

CREATE TABLE
    Prices(
        product_id INT,
        start_date DATE,
        end_date DATE,
        price INT,
        CONSTRAINT PK_product_id_start_date_end_date PRIMARY KEY(
            product_id,
            start_date,
            end_date
        )
    );

CREATE TABLE
    UnitsSold(
        product_id INT,
        purchase_date DATE,
        units INT
    );

INSERT INTO Prices VALUES(1,'2019-02-17','2019-02-28',5);

INSERT INTO Prices VALUES(1,'2019-03-01','2019-03-22',20);

INSERT INTO Prices VALUES(2,'2019-02-01','2019-02-20',15);

INSERT INTO Prices VALUES(2,'2019-02-21','2019-03-31',30);

-- TRUNCATE TABLE Prices;

INSERT INTO UnitsSold VALUES(1,'2019-02-25',100);

INSERT INTO UnitsSold VALUES(1,'2019-03-01',15);

INSERT INTO UnitsSold VALUES(2,'2019-02-10',200);

INSERT INTO UnitsSold VALUES(2,'2019-03-22',30);

SELECT
    PR.product_id,
    ROUND(
        SUM(PR.price * U.units) / SUM(U.units),
        2
    ) average_price
FROM Prices PR
    JOIN UnitsSold U ON PR.product_id = U.product_id AND U.purchase_date BETWEEN PR.start_date AND PR.end_date
GROUP BY PR.product_id;

-- Q24.Write an SQL query to report the first login date for each player.

-- Return the result table in any order.

CREATE TABLE
    Activity(
        player_id INT,
        device_id INT,
        event_date DATE,
        games_played INT,
        CONSTRAINT PK_player_id_event_date PRIMARY KEY(player_id, event_date)
    );

INSERT INTO Activity VALUES(1, 2, '2016-03-01', 5);

INSERT INTO Activity VALUES(1, 2, '2016-05-02', 6);

INSERT INTO Activity VALUES(2, 3, '2017-06-25', 1);

INSERT INTO Activity VALUES(3, 1, '2016-03-02', 0);

INSERT INTO Activity VALUES(3, 4, '2018-07-03', 5);

SELECT
    TMP.player_id,
    TMP.event_date
FROM (
        SELECT
            *,
            ROW_NUMBER() over(
                PARTITION BY player_id
                ORDER BY
                    event_date ASC
            ) AS ROW_NUM
        FROM Activity
    ) TMP
WHERE TMP.ROW_NUM = 1;

-- Q25.Write an SQL query to report the device that is first logged in for each player.

-- Return the result table in any order.

SELECT
    TMP.player_id,
    TMP.device_id
FROM (
        SELECT
            *,
            ROW_NUMBER() over(
                PARTITION BY player_id
                ORDER BY
                    event_date ASC
            ) AS ROW_NUM
        FROM Activity
    ) TMP
WHERE TMP.ROW_NUM = 1;

-- Q26.Write an SQL query to get the names of products that have at least 100 units ordered in February 2020

-- and their amount.

CREATE TABLE
    Products(
        product_id INT,
        product_name VARCHAR(50),
        product_category VARCHAR(50),
        CONSTRAINT PK_product_id PRIMARY KEY(product_id)
    );

CREATE TABLE
    Orders(
        product_id INT,
        order_date DATE,
        unit INT
    );

INSERT INTO Products VALUES(1, "Leetcode Solutions", "Book");

INSERT INTO Products VALUES(2, "Jewels of Stringology","Book");

INSERT INTO Products VALUES(3, "HP", "Laptop");

INSERT INTO Products VALUES(4, "Lenovo", "Laptop");

INSERT INTO Products VALUES(5, "Leetcode Kit ", "T-shir");

INSERT INTO Orders VALUES(1, '2020-02-05', 60);

INSERT INTO Orders VALUES(1, '2020-02-10', 70);

INSERT INTO Orders VALUES(2, '2020-01-18', 30);

INSERT INTO Orders VALUES(2, '2020-02-11', 80);

INSERT INTO Orders VALUES(3, '2020-02-17', 2);

INSERT INTO Orders VALUES(3, '2020-02-24', 3);

INSERT INTO Orders VALUES(4, '2020-03-01', 20);

INSERT INTO Orders VALUES(4, '2020-03-04', 30);

INSERT INTO Orders VALUES(4, '2020-03-04', 60);

INSERT INTO Orders VALUES(5, '2020-02-25', 50);

INSERT INTO Orders VALUES(5, '2020-02-27', 50);

INSERT INTO Orders VALUES(5, '2020-03-01', 50);

SELECT
    PRO.product_name,
    SUM(ORD.unit) AS unit
FROM Products PRO
    INNER JOIN Orders ORD ON PRO.product_id = ORD.product_id
WHERE
    ORD.order_date between '2020-02-01' AND '2020-02-29'
GROUP BY ORD.product_id
HAVING SUM(ORD.unit) >= 100;

-- Q27.Write an SQL query to find the users who have valid emails.

-- A valid e-mail has a prefix name and a domain where:

-- ● The prefix name is a string that may contain letters (upper or lower case), digits, underscore

-- '_', period '.', and/or dash '-'. The prefix name must start with a letter.

-- ● The domain is '@leetcode.com'.

CREATE TABLE
    Users(
        user_id int,
        name varchar(50),
        mail varchaR(100),
        CONSTRAINT PK_user_id PRIMARY KEY(user_id)
    );

INSERT INTO Users VALUES(1, 'Winston','winston@leetcode.com');

INSERT INTO Users VALUES(2, 'Jonathan','jonathanisgreat');

INSERT INTO Users VALUES(3, 'Annabelle','bella-@leetcode.com');

INSERT INTO Users VALUES(4, 'Sally','sally.come@leetcode.com');

INSERT INTO Users VALUES(5, 'Marwan','quarz#2020@leetcode.com');

INSERT INTO Users VALUES(6, 'David','david69@gmail.com');

INSERT INTO Users VALUES(7, 'Shapiro','.shapo@leetcode.com');

TRUNCATE Users;

SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z0-9][a-zA-Z0-9_.-]*@leetcode.com'

--  Q28.Write an SQL query to report the customer_id and customer_name of customers who have spent at

-- least $100 in each month of June and July 2020.

CREATE TABLE
    Customers1(
        customer_id int,
        name varchar(50),
        country varchar(50),
        CONSTRAINT PK_customer_id PRIMARY KEY(customer_id)
    );

CREATE TABLE
    Product1(
        product_id INT,
        description VARCHAR(50),
        price int,
        CONSTRAINT PK_product_id PRIMARY KEY(product_id)
    );

CREATE TABLE
    Orders1(
        order_id int,
        customer_id int,
        product_id int,
        order_date date,
        quantity int,
        CONSTRAINT PK_order_id PRIMARY KEY(order_id)
    );

INSERT INTO Customers1 VALUES(1, 'Winston', 'USA');

INSERT INTO Customers1 VALUES(2, 'Jonathan', 'Peru');

INSERT INTO Customers1 VALUES(3, 'Jonathan', 'Peru');

insert into Product1 VALUES(10, 'LC Phone', 300);

insert into Product1 VALUES(20, 'LC T-Shirt', 10);

insert into Product1 VALUES(30, 'LC Book ', 45);

insert into Product1 VALUES(40, 'LC Keychain', 2);

INSERT INTO Orders1 VALUES(1, 1, 10, '2020-06-10', 1);

INSERT INTO Orders1 VALUES(2, 1, 20, '2020-07-01', 1);

INSERT INTO Orders1 VALUES(3, 1, 30, '2020-07-08', 2);

INSERT INTO Orders1 VALUES(4, 2, 10, '2020-06-15', 2);

INSERT INTO Orders1 VALUES(5, 2, 40, '2020-07-01', 10);

INSERT INTO Orders1 VALUES(6, 3, 20, '2020-06-24', 2);

INSERT INTO Orders1 VALUES(7, 3, 30, '2020-06-25', 2);

INSERT INTO Orders1 VALUES(9, 3, 30, '2020-05-08', 3);

SELECT *
FROM Orders1
WHERE
    order_date BETWEEN '2020-06-01' AND '2020-06-30'
    OR '2020-05-01'
    AND '2020-06-31';

SELECT
    CUS.customer_id,
    CUS.name,
    ORD.order_date,
    PRO.price
FROM Customers1 AS CUS
    INNER JOIN Orders1 AS ORD ON CUS.customer_id = ORD.customer_id
    INNER JOIN Product1 AS PRO ON ORD.product_id = PRO.product_id
WHERE
    ORD.order_date BETWEEN '2020-06-01' AND '2020-06-30'
    AND '2020-05-01'
    AND '2020-05-31'
HAVING PRO.price >= 100;

;

-- Q29.Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

CREATE TABLE
    TVProgram(
        program_date date,
        content_id int,
        channel varchar(20),
        CONSTRAINT PK_program_date_content_id PRIMARY KEY (program_date, content_id)
    );

CREATE TABLE
    Content(
        content_id varchar(10),
        title varchar(50),
        Kids_content enum('Y', 'N'),
        content_type varchar(20),
        CONSTRAINT PK_content_id PRIMARY KEY (content_id)
    );

INSERT INTO TVProgram VALUES('2020-06-10 08:00', 1 ,'LC-Channel');

INSERT INTO TVProgram VALUES('2020-05-11 12:00', 2 ,'LC-Channel');

INSERT INTO TVProgram VALUES('2020-05-12 12:00', 3 ,'LC-Channel');

INSERT INTO TVProgram VALUES('2020-05-13 14:00', 4 ,'Disney Ch');

INSERT INTO TVProgram VALUES('2020-06-18 14:00', 4 ,'Disney Ch');

INSERT INTO TVProgram VALUES('2020-07-15 16:00', 5 ,'Disney Ch');

INSERT INTO Content VALUES(1, 'Leetcode Movie', 'N', 'Movies');

INSERT INTO Content VALUES(2, 'Alg. for Kids', 'Y', 'Series');

INSERT INTO Content VALUES(3, 'Database Sols', 'N', 'Series');

INSERT INTO Content VALUES(4, 'Aladdin', 'y', 'Movies');

INSERT INTO Content VALUES(5, 'Cinderella', 'Y', 'Movies');

SELECT CON.title
FROM TVProgram AS TV
    INNER JOIN Content AS CON ON TV.content_id = CON.content_id
WHERE (
        TV.program_date BETWEEN '2020-06-01' and '2020-06-30'
    )
    AND(CON.Kids_content = 'Y')
    AND CON.content_type = 'Movies';

-- Q30.Write an SQL query to find the npv of each query of the Queries table.

CREATE TABLE NPV( id int, year int, npv inT );

CREATE TABLE Queries(id int, year int);

INSERT INTO NPV VALUES(1, 2018, 100);

INSERT INTO NPV VALUES(7, 2020, 30);

INSERT INTO NPV VALUES(13, 2019, 40);

INSERT INTO NPV VALUES(1, 2019, 113);

INSERT INTO NPV VALUES(2, 2008, 121);

INSERT INTO NPV VALUES(3, 2009, 12);

INSERT INTO NPV VALUES(11, 2020, 99);

INSERT INTO NPV VALUES(7, 2019, 0);

INSERT INTO `Queries` VALUES(1,2019);

/* 2023-09-14 20:46:11 [152 ms] */

INSERT INTO `Queries` VALUES(2,2008);

/* 2023-09-14 20:46:12 [167 ms] */

INSERT INTO `Queries` VALUES(3,2009);

/* 2023-09-14 20:46:13 [154 ms] */

INSERT INTO `Queries` VALUES(7,2018);

/* 2023-09-14 20:46:14 [153 ms] */

INSERT INTO `Queries` VALUES(7,2019);

/* 2023-09-14 20:46:15 [155 ms] */

INSERT INTO `Queries` VALUES(7,2020);

/* 2023-09-14 20:46:16 [165 ms] */

INSERT INTO `Queries` VALUES(13,2019);

SELECT
    QUE.id,
    QUE.YEAR,
    CASE
        WHEN NPV.npv IS NULL THEN 0
        ELSE NPV.npv
    END AS NPV
FROM NPV AS NPV
    RIGHT JOIN `Queries` AS QUE ON QUE.id = NPV.id AND QUE.year = NPV.year;

-- Q31.Write an SQL query to find the npv of each query of the Queries table

SELECT
    QUE.id,
    QUE.YEAR,
    CASE
        WHEN NPV.npv IS NULL THEN 0
        ELSE NPV.npv
    END AS NPV
FROM NPV AS NPV
    RIGHT JOIN `Queries` AS QUE ON QUE.id = NPV.id AND QUE.year = NPV.year;

-- Q32.Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just

-- show null.

-- Return the result table in any order

CREATE TABLE
    Employees(
        id int,
        name varchar(20),
        CONSTRAINT PK_id PRIMARY KEY (id)
    );

CREATE TABLE
    EmployeeUNI(
        id int,
        unique_id int,
        CONSTRAINT PK_id_unique_id PRIMARY KEY(id, unique_id)
    );

INSERT INTO Employees VALUES(1,'Alice');

INSERT INTO Employees VALUES(7,'Bob');

INSERT INTO Employees VALUES(11,'Meir');

INSERT INTO Employees VALUES(90,'Winston');

INSERT INTO Employees VALUES(3,'Jonathan');

INSERT INTO EmployeeUNI VALUES(3,1);

INSERT INTO EmployeeUNI VALUES(11,2);

INSERT INTO EmployeeUNI VALUES(90,3);

SELECT
    EMPUNI.unique_id,
    EMP.name
FROM Employees AS EMP
    LEFT JOIN EmployeeUNI AS EMPUNI ON EMPUNI.unique_id = EMP.id;

-- Q33.Write an SQL query to report the distance travelled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users

-- travelled the same distance, order them by their name in ascending order.

CREATE TABLE Users32( id int, name varchar(50) );

CREATE TABLE Rides( id int, user_id int, distance int ) ;

INSERT INTO Users32
VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Alex'), (4, 'Donald'), (7, 'Lee'), (13, 'Jonathan'), (19, 'Elvis');

INSERT INTO Rides
VALUES (1, 1, 123), (2, 2, 317), (3, 3, 222), (4, 7, 100), (5, 13, 312), (6, 19, 50), (7, 7, 120), (8, 19, 400), (9, 7, 230);

SELECT
    USR.name,
    SUM(RI.distance) travelled_distance
FROM Users32 USR
    INNER JOIN Rides RI ON USR.id = RI.user_id
GROUP BY RI.user_id

-- Q34.Write an SQL query to get the names of products that have at least 100 units ordered in February 2020

-- and their amount.

-- Return result table in any order.

CREATE TABLE
    Products34(
        product_id int,
        product_name varchar(50),
        product_category varchaR(20),
        CONSTRAINT PK_product_id PRIMARY KEY(product_id)
    );

CREATE TABLE
    Orders34(
        product_id int,
        order_date date,
        unit inT,
        CONSTRAINT FK_product_id FOREIGN KEY(product_id) REFERENCES Products34(product_id)
    );

INSERT INTO Products34
VALUES (
        1,
        'Leetcode Solutions',
        'BooK'
    ), (
        2,
        'Jewels of Stringology',
        'Book'
    ), (3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');

-- Q35.Write an SQL query to:

-- ● Find the name of the user who has rated the greatest number of movies. In case of a tie,

-- return the lexicographically smaller user name.

-- ● Find the movie name with the highest average rating in February 2020. In case of a tie, return

-- the lexicographically smaller movie name.

create table
    Movies35(
        movie_id int,
        title varchar(20),
        CONSTRAINT PK_movie_id
    );

CREATE table Users35(user_id int,name varchar(20));

CREATE TABLE
    MovieRating35(
        movie_id int,
        user_id int,
        rating int,
        created_at date
    );

-- Q36.Write an SQL query to report the distance travelled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users

-- travelled the same distance, order them by their name in ascending order.

CREATE TABLE Users36( id int, name varchar(20));

CREATE TABLE Rides36(id int, user_id int, distance int ) ;

INSERT INTO Users36
VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Alex'), (4, 'Donald'), (7, 'Lee'), (13, 'Jonathan'), (19, 'Elvis');

INSERT INTO Rides36
VALUES (1, 1, 120), (2, 2, 317), (3, 3, 222), (4, 7, 100), (5, 13, 312), (6, 19, 5);

SELECT
    U.name,
    SUM(R.distance) AS travelled_distance
FROM Users36 AS U
    INNER JOIN Rides36 AS R ON U.id = R.user_id
GROUP BY R.id
ORDER BY
    travelled_distance DESC,
    U.name;

-- Q37 Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just

-- show null.

-- Return the result table in any order.

create table Employees37(id int, name varchar(20));

create table EmployeeUNI37(id int, unique_id int);

INSERT INTO Employees37
VALUES (1, 'Alice'), (7, 'Bob'), (11, 'Meir'), (90, 'Winston'), (3, 'Jonathan');

insert into EmployeeUNI37 VALUES (3, 1), (11, 2), (90, 3) ;

select UNI.unique_id, emp.name
from Employees37 as emp
    LEFT JOIN EmployeeUNI37 AS UNI ON emp.id = UNI.unique_id;

-- Q38 Write an SQL query to find the id and the name of all students who are enrolled in departments that no

-- longer exist.

-- Return the result table in any order.

create table Departments38(id int, name varchar(40));

CREATE TABLE Students38(id int, name varchar(20),department_id INT);

INSERT INTO Departments38
VALUES (1, 'Electrical Engineering'), (7, 'Computer Engineering'), (13, 'Business Administration');

INSERT INTO Students38
VALUES (23, 'Alice', 1), (1, 'Bob', 7), (5, 'Jennifer', 13), (2, 'John', 14), (4, 'Jasmine', 77), (3, 'Steve', 74), (6, 'Luis', 1), (8, 'Jonathan', 7), (7, 'Daiana', 33), (11, 'Madelynn', 1);

select id, name
from Students38
WHERE department_id NOT IN (
        SELECT id
        FROM Departments38
    );

-- Q39.Write an SQL query to report the number of calls and the total call duration between each pair of

-- distinct persons (person1, person2) where person1 < person2.

create Table Calls39(from_id int, to_id int, duration int) ;

insert into Calls39
VALUES (1, 2, 59), (2, 1, 11), (1, 3, 20), (3, 4, 100), (3, 4, 200), (3, 4, 200), (4, 3, 499);

select
    from_id as person1,
    to_id as person2,
    count(*) as call_count,
    sum(duration) as call_duration
from(
        select *
        from Calls39
        union all
        select
            to_id,
            from_id,
            duration
        from Calls39
    ) s
where from_id < to_id
group by person1, person2;

-- Q40.Write an SQL query to find the average selling price for each product. average_price should be

-- rounded to 2 decimal places.

-- Return the result table in any order.

CREATE TABLE
    Prices40(
        product_id int,
        start_date date,
        end_date date,
        price int,
        CONSTRAINT PK_product_id_date_end_date PRIMARY KEY(
            product_id,
            start_date,
            end_date
        )
    );

CREATE TABLE
    UnitsSold40(
        product_id int,
        purchase_date date,
        units int
    );

INSERT INTO Prices40
VALUES (
        1,
        '2019-02-17',
        '2019-02-28',
        5
    ), (
        1,
        '2019-03-01',
        '2019-03-22',
        20
    ), (
        2,
        '2019-02-01',
        '2019-02-20',
        15
    ), (
        2,
        '2019-02-21',
        '2019-03-31',
        30
    );

INSERT INTO UnitsSold40
VALUES (1, '2019-02-25', 100), (1, '2019-03-01', 15), (2, '2019-02-10', 200), (2, '2019-03-22', 30);

select
    p.product_id,
    SUM(u.units * p.price) / sum(u.units) average_price
from Prices40 p
    inner join UnitsSold40 u on p.product_id = u.product_id and u.purchase_date BETWEEN p.start_date and p.end_date
GROUP BY p.product_id;

--     Q41.Write an SQL query to report the number of cubic feet of volume the inventory occupies in each

-- warehouse.

-- Return the result table in any order.

CREATE table
    Warehouse41(
        name varchar(20),
        product_id int,
        units int,
        CONSTRAINT PK_name_product_id PRIMARY KEY(name, product_id)
    );

CREATE TABLE
    Products41(
        product_id int,
        product_name varchar(20),
        Width int,
        Length int,
        Height int,
        CONSTRAINT PK_product_id PRIMARY KEY(product_id)
    );

INSERT INTO Warehouse41
VALUES ('LCHouse1', 1, 1), ('LCHouse1', 2, 10), ('LCHouse1', 3, 5), ('LCHouse2', 1, 2), ('LCHouse2', 2, 2), ('LCHouse3', 4, 1);

INSERT INTO Products41
VALUES (1, 'LC - TV', 5, 50, 40), (2, 'LC - KeyChain', 5, 5, 5), (3, 'LC - Phone', 2, 10, 10), (4, 'LC - T - Shirt', 4, 10, 20);

SELECT
    W.name warehouse_name,
    sum(
        P.`Length` * P.`Width` * P.`Height` * W.units
    ) VOLUME
FROM Products41 P
    INNER JOIN Warehouse41 W ON P.product_id = W.product_id
GROUP BY W.name;

-- Q42.Write an SQL query to report the difference between the number of apples and oranges sold each day.

-- Return the result table ordered by sale_date.

CREATE TABLE
    Sales42(
        sale_date date,
        fruit VARCHAR(20),
        sold_num int,
        CONSTRAINT PK_sale_date_fruit PRIMARY KEY(sale_date, fruit)
    );

INSERT INTO Sales42
VALUES ('2020-05-01', 'apples', 10), ('2020-05-01', 'oranges', 8), ('2020-05-02', 'apples', 15), ('2020-05-02', 'oranges', 15), ('2020-05-03', 'apples', 20), ('2020-05-03', 'oranges', 0), ('2020-05-04', 'apples', 15), ('2020-05-04', 'oranges', 16);

SELECT
    A.sale_date,
    A.sold_num - O.sold_num diff
FROM Sales42 AS O
    INNER JOIN Sales42 A ON A.sale_date = O.sale_date
WHERE
    A.fruit = 'apples'
    AND O.fruit = 'oranges';

-- Q43.Write an SQL query to report the fraction of players that logged in again on the day after the day they

-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players

-- that logged in for at least two consecutive days starting from their first login date, then divide that

-- number by the total number of players.

CREATE TABLE
    Activity43(
        player_id int,
        device_id int,
        event_date date,
        games_played int,
        CONSTRAINT PK_player_id_event_date PRIMARY KEY(player_id, event_date)
    );

INSERT INTO Activity43
VALUES (1, 2, '2016-03-01', 5), (1, 2, '2016-03-02', 6), (2, 3, '2017-06-25', 1), (3, 1, '2016-03-02', 0), (3, 4, '2018-07-03', 5);

with cte as(
        select
            player_id,
            event_date as curr_date,
            lead(event_date) over(
                partition by player_Id
                order by
                    event_date
            ) as next_date
        from Activity43
    )
select
    round(
        100.0 * count(
            distinct case
                when datediff(next_date, curr_date) = 1 then 1
                else null
            end
        ) / count(distinct player_id),
        2
    ) as fraction
from cte;

-- Q44.Write an SQL query to report the managers with at least five direct reports.

create table
    Employee44(
        id int,
        name varchar(30),
        department varchar(5),
        managerId int,
        constraint PK_id PRIMARY key(id)
    );

truncate table Employee44;

INSERT into Employee44
VALUES (101, 'John', 'A', Null), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101), (104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

with emp_count44 as (
        select
            DISTINCT e.`managerId`,
            count(*) as report_id_count
        from Employee44 e
        group by
            e.`managerId`
        having
            report_id_count >= 5
    )
select m.name
from emp_count44 r
    INNER join Employee44 m on m.id = r.managerId;

-- Q45.Write an SQL query to report the respective department name and number of students majoring in

-- each department for all departments in the Department table (even ones with no current students).

-- Return the result table ordered by student_number in descending order. In case of a tie, order them by

-- dept_name alphabetically.

create table
    Student45(
        student_id int,
        student_name varchar(50),
        gender varchar(5),
        dept_id int,
        PRIMARY KEY(student_id)
    );

create table
    Department45(
        dept_id int,
        dept_name varchar(50),
        PRIMARY key(dept_id)
    );

insert into Student45
VALUES (1, 'Jack', 'M', 1), (2, 'Jane', 'F', 1), (3, 'Mark', 'M', 2)

insert into Department45
values (1, 'Engineering'), (2, 'Science'), (3, 'Law')

select D.dept_name from Department45 D;

SELECT
    D.dept_name,
    COUNT(S.dept_id) student_number
FROM Student45 S
    RIGHT JOIN Department45 D ON S.dept_id = D.dept_id
GROUP BY S.dept_id;

-- Q46.Write an SQL query to report the customer ids from the Customer table that bought all the products in

-- the Product table.

CREATE TABLE Customer46(customer_id int, product_key int);

CREATE TABLE Product46(product_key INT PRIMARY KEY) 

INSERT INTO Customer46 VALUES (1, 5), (2, 6), (3, 5), (3, 6), (1, 6) 

INSERT INTO Product46 VALUES(5),(6);

SELECT C.customer_id
FROM Customer46 C
    INNER JOIN Product46 P ON C.product_key = P.product_key
GROUP BY C.customer_id
HAVING COUNT(C.customer_id) = 2

-- Q47.Write an SQL query that reports the most experienced employees in each project. In case of a tie,

-- report all employees with the maximum number of experience years.

-- Return the result table in any order.

CREATE TABLE
    Project47 (
        project_id int,
        employee_id int,
        PRIMARY key (project_id, employee_id)
    );

create Table
    Employee47 (
        employee_id int,
        name varchar(50),
        experience_years int,
        PRIMARY key(employee_id)
    );

INSERT INTO Project47 VALUES(1,1), (1,2), (1,3), (2,1), (2,4) ;

INSERT INTO Employee47
VALUES (1, 'Khaled', 3), (2, 'Ali', 2), (3, 'John', 3), (4, 'Doe', 2),

SELECT
    P.project_id,
    E.employee_id
FROM Project47 P
    INNER JOIN Employee47 E ON P.employee_id = E.employee_id
WHERE E.experience_years = (
        SELECT MAX(E.experience_years)
        FROM Employee47 E
    )

