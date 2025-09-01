
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: CHARAN M
-- USN: 1RUA24BCA0016
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

'root@localhost', 'RVU-PC-27', '8.4.6', '2025-09-01 11:23:42'


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 


create database DBlab0003;
use DBlab0003;

create table book (
bookID varchar(10) primary key,
bookname varchar(15),
bookauthor varchar(15),
prize decimal (4, 2 )
);


create table members (
memberID varchar(10) primary key,
membername varchar(15),
memberrole varchar(10)
);

-- Paste the Output below for the given command ( DESC TableName;) 

alter table book
rename column prize to price;
desc book;

alter table book
add available_copies varchar(10),
add total_copies varchar(10);
desc book;

alter table book
modify bookname varchar(100);
desc book;

desc members;
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

INSERT INTO book (bookID, bookname, bookauthor, price, available_copies, total_copies)
VALUES ('B001', '1984_The Black Swan', 'George Orwell', 9.99, 4, 10);



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from book;
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


INSERT INTO members (membername,memberrole,memberID)
VALUES ('David Lee' , 'platinum' , 'DAV001');

INSERT INTO members (membername,memberrole,memberID)
VALUES ('Emma Wilson', 'Silver', 'EMM002');





-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from members;

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

alter table book
add column publoc varchar(30);
desc book;

UPDATE book
SET available_copies = available_copies + 2,
    total_copies = total_copies + 2
WHERE bookname = '1984_The Black Swan';

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).



select * from book;
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


UPDATE members
SET memberrole = 'Gold'
WHERE membername = 'Emma Wilson';






-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from members;

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


DELETE FROM members
WHERE membername = 'David Lee';


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


select * from members;


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


CREATE TABLE borrowing (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    memberID VARCHAR(10),
    bookID VARCHAR(10),
    borrow_date DATE,
    FOREIGN KEY (memberID) REFERENCES members(memberID),
    FOREIGN KEY (bookID) REFERENCES book(bookID)
);



INSERT INTO borrowing (memberID, bookID, borrow_date)
VALUES ('EMM002', '102', '2024-06-01');


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM borrowing;



-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


SELECT m.membername
FROM borrowing b
JOIN members m ON b.memberID = m.memberID
WHERE b.bookID = '102';



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).






-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 
StudentCopy Lab 02 (1).sql
Displaying StudentCopy Lab 02 (1).sql.