-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

'root@localhost', 'RVU-PC-27', '8.4.6', '2025-08-25 06:25:06'

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:

create database DBlab0002;
use DBlab0002;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  
create table Departments(
departmentID varchar(20) primary key,
departmentname varchar(20),
HOD varchar(20),
contactemail varchar(30),
phonenumber varchar(15),
location varchar(30) );

desc Departments;

  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  
  create table courses(
  courseID varchar(10) primary key,
  coursename varchar(10),
  credits varchar(3),
  departmentID varchar(20),
  duration datetime,
  fee float(10,2) );
  
  desc courses;
  
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  
  create table students (
  studentID varchar(10) primary key,
  firstname varchar(10),
  lastname varchar(10),
  email varchar(30),
  DOB datetime,
  courseID varchar(10) );
  
  desc students;
  
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  
  create table faculty (
  facultyID varchar(10) primary key,
  facultyname varchar(15),
  departmentID varchar(20),
  qualification varchar(10),
  email varchar(30),
  phonenumber varchar(15) );
  
  
  desc faculty;
  
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
  
  create table enrollments (
  EnrollmentID varchar(10) primary key,
  studentID varchar(10),
  courseID varchar(10),
  semester varchar(5),
  Year varchar(10),
  grade varchar(3) );
  
  desc enrollments;
  
  
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output 

-- TABLE1: Departments
desc Departments;
departmentID	varchar(20)	NO	PRI		
departmentname	varchar(20)	YES			
HOD	varchar(20)	YES			
contactemail	varchar(30)	YES			
phonenumber	varchar(15)	YES			
location	varchar(30)	YES		



-- TABLE2: courses
desc courses;	
courseID	varchar(10)	NO	PRI		
coursename	varchar(10)	YES			
credits	varchar(3)	YES			
departmentID	varchar(20)	YES			
duration	datetime	YES			
fee	float(10,2)	YES


-- TABLE3: students
desc students;
studentID	varchar(10)	NO	PRI		
firstname	varchar(10)	YES			
lastname	varchar(10)	YES			
email	varchar(30)	YES			
DOB	datetime	YES			
courseID	varchar(10)	YES	


		
-- TABLE4: faculty
desc faculty;
facultyID	varchar(10)	NO	PRI		
facultyname	varchar(15)	YES			
departmentID	varchar(20)	YES			
qualification	varchar(10)	YES			
email	varchar(30)	YES			
phonenumber	varchar(15)	YES	


-- TABLE5: enrollments
desc enrollments;	
EnrollmentID	varchar(10)	NO	PRI		
studentID	varchar(10)	YES			
courseID	varchar(10)	YES			
semester	varchar(5)	YES			
Year	varchar(10)	YES			
grade	varchar(3)	YES				


-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table


-- TABLE1: Departments
alter table departments
add departmentroom varchar(10),
add departmentroomloc varchar(20);
desc departments;


-- TABLE2: courses
alter table courses
add courseroom varchar(10),
add courseroomno varchar(3);
desc courses;


-- TABLE3: students
alter table students
add preferedcourse varchar(10),
add gender varchar(10);
desc students;



-- TABLE4: faculty
alter table faculty
add address varchar(30),
add gender varchar(10);
desc faculty;


-- TABLE5: enrollments
alter table enrollments
add address varchar(30),
add gender varchar(10);
desc enrollments;


-- 02: Modify the existing column from each table


-- TABLE1: Departments
alter table departments
modify  column location varchar(60);
desc departments;


-- TABLE2: courses
alter table courses
modify column courseroomno INT(3);
desc courses;


-- TABLE3: students
alter table students
modify column preferedcourse varchar(60);
desc students;



-- TABLE4: faculty
alter table faculty
modify gender varchar(5);
desc faculty;


-- TABLE5: enrollments
alter table enrollments
modify gender varchar(5);
desc enrollments;



-- 03 change the datatypes


-- TABLE1: Departments
alter table departments
modify departmentroom INT;
desc departments;

-- TABLE2: courses
alter table courses
modify courseroom VARCHAR(20);
desc courses;

-- TABLE3: students
alter table students
modify gender CHAR(1);
desc students;

-- TABLE4: faculty
alter table faculty
modify gender CHAR(1);
desc faculty;

-- TABLE5: enrollments
alter table enrollments
modify gender CHAR(1);
desc enrollments;




-- 04: Rename a column


-- TABLE1: Departments
alter table departments
rename column departmentroomloc to departmentlocation;
desc departments;

-- TABLE2: courses
alter table courses
rename column courseroomno to course_room_number;
desc courses;

-- TABLE3: students
alter table students
rename column preferedcourse to preferred_course;
desc students;

-- TABLE4: faculty
alter table faculty
rename column address to faculty_address;
desc faculty;

-- TABLE5: enrollments
alter table enrollments
rename column address to enrollment_address;
desc enrollments;


-- 05: Drop a column

-- TABLE1: Departments
alter table departments
drop column departmentroom;
desc departments;

-- TABLE2: courses
alter table courses
drop column courseroom;
desc courses;

-- TABLE3: students
alter table students
drop column gender;
desc students;

-- TABLE4: faculty
alter table faculty
drop column gender;
desc faculty;

-- TABLE5: enrollments
alter table enrollments
drop column gender;
desc enrollments;


-- 06: Rename the table
alter table faculty rename to teachers;
desc teachers;



-- 07: describe the structure of the new table

desc departments;
desc courses;
desc students;
desc teachers;
desc enrollments;



/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/
-- Add a new column Address (VARCHAR(100)) to the Students table.
alter table students
add address VARCHAR(100);
desc students;

-- Add a column Gender (CHAR(1)) to the Students table.
alter table students
add SEX CHAR(1);
desc students;

-- Add a column JoiningDate (DATE) to the Faculty table.
alter table teachers
add joiningdate DATE;
desc teachers;

-- Modify the column CourseName in the Courses table to increase size from VARCHAR(50) to VARCHAR(100).
alter table courses
modify coursename VARCHAR(100);
desc courses;

-- Modify the column Location in the Departments table to VARCHAR(80).
alter table departments
modify location VARCHAR(80);
desc departments;

-- Rename the column Qualification in the Faculty table to Degree.
alter table teachers
change qualification degree VARCHAR(50);
desc teachers; 

-- Rename the table Faculty to Teachers.
alter table faculty
rename to teachers;
desc teachers;

-- Drop the column PhoneNumber from the Departments table.
alter table departments
drop column phonenumber;
desc departments;

-- Drop the column Email from the Students table.
alter table students
drop column email;
desc students;

-- Drop the column Duration from the Courses table.
alter table courses
drop column fee;
desc courses;





SHOW TABLES; -- Before dropping the table
show tables;

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

drop table courses;
drop table enrollments;

SHOW TABLES; -- After dropping the table Enrollement and Course

show tables;

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
