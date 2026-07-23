-- ==========================================
-- HR Analytics Project
-- ==========================================


-- ==========================================
-- DATA UNDERSTANDING
-- ==========================================

Select * from employee 
limit 10;
-- Total Records
select count(*) from employee;


-- ==========================================
-- DATA CLEANING
-- ==========================================

-- NULL Values Check 

SELECT *
FROM employee
WHERE Education IS NULL
   OR JoiningYear IS NULL
   OR City IS NULL
   OR PaymentTier IS NULL
   OR Age IS NULL
   OR Gender IS NULL
   OR EverBenched IS NULL
   OR ExperienceInCurrentDomain IS NULL
   OR LeaveOrNot IS NULL;
   
   -- Duplicate check 
   
   SELECT Education,
       JoiningYear,
       City,
       PaymentTier,
       Age,
       Gender,
       EverBenched,
       ExperienceInCurrentDomain,
       LeaveOrNot,
       COUNT(*) AS duplicate_count
FROM employee
GROUP BY Education,
         JoiningYear,
         City,
         PaymentTier,
         Age,
         Gender,
         EverBenched,
         ExperienceInCurrentDomain,
         LeaveOrNot
HAVING COUNT(*) > 1;

-- DISTINCT Check

select distinct education from employee;

select distinct gender from employee;

select distinct city from employee;

select distinct PaymentTier from employee;

select distinct EverBenched from employee;

select distinct LeaveOrNot from employee;

-- Invalid Values Check

select min(age) as min_age,
max(age) as max_age
From employee;

select min(ExperienceInCurrentDomain) as min_exp,
max(ExperienceInCurrentDomain) as max_exp
From employee;

select min(JoiningYear) as First_year,
max(JoiningYear) as Last_year
From employee;

-- ==========================================
-- DATA ANALYSIS
-- ==========================================
 
 -- Q1: Employees Stayed VS Left
 
 Select LeaveOrNot , count(*) AS Total_employees
 from employee
 group by LeaveOrNot;
 
 -- Q2:  Education Distribution
 
 Select Education, count(*) AS Total_employees
 from employee
 Group by Education;
 
 -- Q3: City Distribution
 
 Select City, count(*) AS Total_employees
 from employee
 Group by City;
 
 -- Q4: Gender Distribution
 
 Select Gender, count(*) AS Total_employees
 from employee
 Group by Gender;
 
 -- Q5: Payment Tier Distribution
 
 Select PaymentTier, count(*) AS Total_employees
 from employee
 Group by PaymentTier;
 
 -- Q6: EverBenched Distribution
 
 Select EverBenched, count(*) AS Total_employees
 from employee
 Group by EverBenched ;
 
 -- Q7: Average Age by Education
 
 Select Education, Round(Avg(age),2)
 AS Average_Age
 From employee
 Group by Education
 Order by Average_Age desc;
 
 -- Q8: Average Experience by Education
 
 Select Education, Round(Avg(ExperienceInCurrentDomain),2)
 AS Avg_Exp
 From employee
 group by Education Order by Avg_Exp desc;
 
 -- Q9: Average Age by City
 
 Select City, Round(Avg(age),2) AS Average_Age
 From employee
 Group by City Order by Average_Age desc;
 
 -- Q10: Attrition by Education
 
 Select education, count(*) as Employees_left
 from employee
 where LeaveOrNot = 1 
 group by Education;
 
 -- Q11: Attrition by Gender
 
 Select gender, count(*) as Employees_left
 from employee   where LeaveOrNot = 1 
 group by gender;
 
 -- Q12: Average Experience of Employees Who left
 
 Select Round(Avg(ExperienceInCurrentDomain),2) AS Avg_Exp
 From employee Where LeaveOrNot = 1;
 
 -- Q13 Average Age of Employees Who left
 
  Select Round(Avg(Age),2) AS Avg_Age
 From employee Where LeaveOrNot = 1;
 
 -- Q14: Average Experience by Gender 
 
 SELECT Gender,
       ROUND(AVG(ExperienceInCurrentDomain), 2) AS Avg_Exp
FROM employee
GROUP BY Gender;

-- Q15: Average Age by Payment Tier

SELECT PaymentTier,
       ROUND(AVG(Age), 2) AS Avg_Age
FROM employee
GROUP BY PaymentTier;

-- Q16: Employees Count by Experience 

SELECT ExperienceInCurrentDomain,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY ExperienceInCurrentDomain
ORDER BY ExperienceInCurrentDomain;
 
 -- Q17: Employees Count by Joining Year
 
SELECT JoiningYear,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY JoiningYear
ORDER BY JoiningYear;

-- Q18: Employees Count by Age

SELECT Age,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY Age Order by Age;

-- Q19: Employees Count by Experience and Gender

SELECT ExperienceInCurrentDomain,
       Gender,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY ExperienceInCurrentDomain, Gender
ORDER BY ExperienceInCurrentDomain, Gender;

-- Q20: Employees Count by Education and Gender

SELECT Education,
       Gender,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY Education, Gender
ORDER BY Education, Gender;

-- Q21: Employees Count by City and Gender

SELECT City, Gender,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY City, Gender
ORDER BY City, Gender;

-- Q22: Employees Count by Payment Tier and Gender
 
 SELECT PaymentTier,
       Gender,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY PaymentTier, Gender
ORDER BY PaymentTier, Gender;
 
 -- Q23: Employees Count by Education and Payment Tier
 
SELECT PaymentTier,
       Education,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY PaymentTier, Education
ORDER BY PaymentTier, Education; 
 
 -- Q23: Employees Count by Education and Payment Tier
 
 SELECT PaymentTier,
       Education,
       COUNT(*) AS Total_Employees
FROM employee
GROUP BY PaymentTier, Education
ORDER BY PaymentTier, Education;
 
-- Q24: Employees Who Left by Education

SELECT Education,
       COUNT(*) AS Employees_Left
FROM employee
WHERE LeaveOrNot = 1
GROUP BY Education;

-- Q25: Employees Who Left by City

SELECT City,
       COUNT(*) AS Employees_Left
FROM employee
WHERE LeaveOrNot = 1
GROUP BY City;

-- Q26: Employees Who Left by Payment Tier

SELECT PaymentTier,
       COUNT(*) AS Employees_Left
FROM employee
WHERE LeaveOrNot = 1
GROUP BY PaymentTier;

-- Q27: Employees Who Left by Experience

SELECT experienceincurrentdomain,
COUNT(*) AS Employees_Left
FROM employee
WHERE LeaveOrNot = 1
GROUP BY experienceincurrentdomain
ORDER BY experienceincurrentdomain;

-- Q28: Employees Who Left by Gender

SELECT Gender,
       COUNT(*) AS Employees_Left
FROM employee
WHERE LeaveOrNot = 1
GROUP BY Gender;

-- Q29: Employees Who Stayed by Gender

SELECT Gender,
       COUNT(*) AS Employees_Stayed
FROM employee
WHERE LeaveOrNot = 0
GROUP BY Gender;

-- Q30: Employees Who Stayed by Education

SELECT Education,
       COUNT(*) AS Employees_Stayed
FROM employee
WHERE LeaveOrNot = 0
GROUP BY Education;

-- Q31: Employees Who Stayed by City

SELECT City,
       COUNT(*) AS Employees_Stayed
FROM employee
WHERE LeaveOrNot = 0
GROUP BY City;

-- Q32: Employees Who Stayed by Payment Tier

SELECT PaymentTier,
       COUNT(*) AS Employees_Stayed
FROM employee
WHERE LeaveOrNot = 0
GROUP BY PaymentTier;

-- Q33: Average Age by Gender

SELECT Gender,
       ROUND(AVG(Age), 2) AS Avg_Age
FROM employee
GROUP BY Gender;

-- Q34: Average Experience by Payment Tier

SELECT PaymentTier,
       ROUND(AVG(ExperienceInCurrentDomain), 2) AS Avg_Experience
FROM employee
GROUP BY PaymentTier;

-- Q35: Average Age by Education

SELECT Education,
       ROUND(AVG(Age), 2) AS Avg_Age
FROM employee
GROUP BY Education;