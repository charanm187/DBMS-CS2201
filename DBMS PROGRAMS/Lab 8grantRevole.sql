-- Lab Experiment 08:
-- Creating,deleting and managing users
-- grant and revoke privileges to users
-- ----------------------------------------------------------------------------------
-- STUDENT NAME: CHARAN M
-- USN: 1RUA24BCA0016
-- SECTION: A
-- ----------------------------------------------------------------------------------
SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command and comment the output by /* Output */.
'root@localhost', 'RVU-PC-27', '8.4.6', '2025-11-03 06:31:08'


-- ----------------------------------------------------------------------------------
create database Labexperiment8;
use Labexperiment8;


-- Task 1 : Creating a user

-- creating 5 different users with 5 different passwords
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'Password@1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'Password@2';
CREATE USER 'user3'@'localhost' IDENTIFIED BY 'Password@3';
CREATE USER 'user4'@'localhost' IDENTIFIED BY 'Password@4';
CREATE USER 'user5'@'localhost' IDENTIFIED BY 'Password@5';



-- Task 2 : Alter / Changing the password
ALTER USER 'user1'@'localhost' IDENTIFIED BY 'NewPass@1';
ALTER USER 'user2'@'localhost' IDENTIFIED BY 'NewPass@2';
ALTER USER 'user3'@'localhost' IDENTIFIED BY 'NewPass@3';
ALTER USER 'user4'@'localhost' IDENTIFIED BY 'NewPass@4';
ALTER USER 'user5'@'localhost' IDENTIFIED BY 'NewPass@5';


-- Task 3 : Privileges
GRANT ALL PRIVILEGES ON college.* TO 'user1'@'localhost';
GRANT SELECT, INSERT ON college.* TO 'user2'@'localhost';
GRANT SELECT ON college.* TO 'user3'@'localhost';
GRANT UPDATE, DELETE ON college.* TO 'user4'@'localhost';
GRANT CREATE, DROP ON college.* TO 'user5'@'localhost';


FLUSH PRIVILEGES;



-- Task 4 : Switch the user from root to another (NOT DONE)


-- Task 5 : Revoking all permissions (grant must exist for that user for revoke to work)
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user1'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user2'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user3'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user4'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user5'@'localhost';

FLUSH PRIVILEGES;

-- Task 6 : Drop user
DROP USER 'user1'@'localhost';
DROP USER 'user2'@'localhost';
DROP USER 'user3'@'localhost';
DROP USER 'user4'@'localhost';
DROP USER 'user5'@'localhost';




