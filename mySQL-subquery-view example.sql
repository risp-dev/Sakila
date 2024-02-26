CREATE TABLE `employee` (
`employee_id` int NOT NULL AUTO_INCREMENT, 
`last_name` varchar(45) DEFAULT NULL, 
`first_name` varchar(45) DEFAULT NULL, 
`salary` int DEFAULT NULL,
`department_id` int DEFAULT NULL,
PRIMARY KEY (`employee_id`))
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into employee (`last_name`, `first_name`, `salary`, `department_id`)
values
('Smith', 'John', 145000.00, 100),
('Dale', 'Peter', 155000.00, 102),
('Garrahan', 'Susan', 195000.00, 100),
('Garrahan', 'Mary', 94000.00, 102),
('Fies', 'Julia', 92000.00, 101),
('Belle', 'Mary', 115000.00, 101);

CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `building` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into department (`department_id`, `dept_name`, `manager_id`, `budget`, `building`)
values
(100, 'Sales', 23, 240000.00, 'CentralPark'),
(101, 'Accounting', 56, 130000.00, 'CentralPark'),
(102, 'IT', 34, 150000.00, 'Oblivious');

SELECT 
    dept_name, budget
FROM
    department
WHERE
    budget = (SELECT 
            MAX(budget)
        FROM
            department);


#create view sbq as select dept_name, building from department;
select dept_name, building from sbq;
select dept_name, building from sbq
order by dept_name;



