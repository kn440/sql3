DROP DATABASE IF EXISTS lesson3;
CREATE DATABASE IF NOT EXISTS lesson3; 
USE lesson3;

-- ПЕРВАЯ ЧАСТЬ
DROP TABLE IF EXISTS SALESPEOPLE;
CREATE TABLE SALESPEOPLE (
  snum INT UNSIGNED PRIMARY KEY NOT NULL,
  sname VARCHAR(20) NOT NULL,
  city VARCHAR(30),
  comm DECIMAL(4,2)
  );
INSERT INTO SALESPEOPLE (snum, sname, city,comm)
VALUES 
  ('1001','Peel','London','0.12'),('1002','Serres','San Jose','0.13'),('1004','Motika','London','0.11'),('1007','Rifkin','Barcelona','0.15'),('1003','Axelrod','New York','0.10');
SELECT * FROM SALESPEOPLE;

DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE CUSTOMERS (
  cnum INT UNSIGNED PRIMARY KEY NOT NULL,
  sname VARCHAR(20) NOT NULL,
  city VARCHAR(30),
  rating INT,
  snum INT
  );
INSERT INTO CUSTOMERS (cnum, sname, city,rating,snum)
VALUES 
('2001','Hoffman','London','100','1001'),
('2002','Giovanni','Rome','200','1003'),
('2003','Liu','SanJose','200','1002'),
('2004','Grass','Berlin','300','1002'),
('2006','Clemens','London','100','1001'),
('2008','Cisneros','SanJose','300','1007'),
('2007','Pereira','Rome','100','1004');
SELECT * FROM CUSTOMERS;

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS (
  onum  INT UNSIGNED PRIMARY KEY NOT NULL,
  amt DECIMAL(7,2),
  odate DATE,
  cnum INT,
  snum INT
  );
INSERT INTO ORDERS (onum,amt,odate,cnum,snum)
VALUES 
('3001','18.69','1990-03-10','2008','1007'),
('3003','767.19','1990-03-10','2001','1001'),
('3002','1900.10','1990-03-10','2007','1004'),
('3005','5160.45','1990-03-10','2003','1002'),
('3006','1098.16','1990-03-10','2008','1007'),
('3009','1713.23','1990-04-10','2002','1003'),
('3007','75.75','1990-04-10','2004','1002'),
('3008','4723.00','1990-05-10','2006','1001'),
('3010','1309.95','1990-06-10','2004','1002'),
('3011','9891.88','1990-06-10','2006','1001');
SELECT * FROM ORDERS;

-- 1/ Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm
FROM salespeople;

-- 2/ Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating,sname FROM CUSTOMERS WHERE city='SanJose';

-- 3/ Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum FROM orders;

-- 5/ Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT * FROM orders WHERE amt > 1000;

-- 6/ Напишите запрос который выбрал бы наименьшую сумму заказа.  (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) FROM orders;

-- 7/ Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM CUSTOMERS WHERE rating >100 AND NOT city ='Rome';

-- ВТОРАЯ ЧАСТЬ
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff (
  id INT AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(45), 
  last_name VARCHAR(45), 
  post VARCHAR(45), 
  seniority INT, 
  salary DECIMAL(8, 2), 
  age INT
);


INSERT  staff (first_name, last_name, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT * FROM staff;

-- 1/ Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM staff ORDER BY salary;
SELECT * FROM staff  ORDER BY salary DESC;

-- 3/ Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT last_name, post FROM staff  WHERE salary > 40000 GROUP BY last_name, post;



