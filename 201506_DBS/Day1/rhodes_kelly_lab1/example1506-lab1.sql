-- Question 1:
-- Write a SQL statement to insert a new user into the users table. 
insert into users (userId, firstname, lastname, username, password, dob, userStatusId, userTypeId)

-- Write a SQL statement to return the new user (all columns) by filtering on the username.
from users 
where username = 'karhodes';

-- Question 3:
-- Write SQL to create 2 emails and 2 phone numbers for the new user.
insert into userPhone (userId, userPhone, userPhoneTypeId)
values ('abc', '407-212-1212', 1);

insert into userPhone (userId, userPhone, userPhoneTypeId)
values ('abc', '407-212-1213', 2);

select * 
from userPhone 
where userId = 'abc';

insert into userEmail (userId, userEmail, userEmailTypeId)
values ('abc', 'me@home.com', 1);

insert into userEmail (userId, userEmail, userEmailTypeId)
values ('abc', 'me@work.com', 2);

select * 
from userEmail 
where userId = 'abc';

-- Question 4:
-- Write SQL to select the user and their emails. 
-- Filter on userId. 
-- Select the following columns: userId, lastname, firstname, and userEmail
select users.userId, lastname, firstname, userEmail
where users.userId = 'abc';

-- Question 5:
-- Write SQL to select the new user and their phone numbers with the phone type. 
-- Filter on userId. 
-- Requires 2 joins. 
-- Select the following columns: userId, lastname, firstname, userPhone and userPhoneType.

-- Question 6:
-- Write a SQL statement to update the new user’s last name. Only update 1 user. 
-- Filter on userId. 
update users 
set lastname = 'NewName'
where userId = 'abc';

select * 
from users 
where userId = 'abc';

-- Question 7:
-- Write SQL to delete 1 phone from the new user
update userPhone
set userPhone = NULL
where userId = 'abc' and userPhoneTypeId = 1;

select * 
from userPhone 
where userId = 'abc';

-- Question 8:
-- Write SQL to update your new user’s occupation to “Computer Software Engineers”.
-- “Computer Software Engineers” is has occupationId of 187
update users
set occupationID = 187
where userId = 'abc';

select * 
from users 
where userId = 'abc';

-- Question 9:
-- Create a new user type called: “Totally Awesome”. 
insert into userType (userTypeId, userType)

-- Question 10:
-- Update your new user to the new userTypeId created in question 9

select * 
from users 
where userId = 'abc';