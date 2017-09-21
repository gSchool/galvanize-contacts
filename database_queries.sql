<--1 galvanize_contacts=# select first_name, last_name from "User" where date_of_birth < '1/1/2000';
 first_name | last_name
------------+-----------
 Kyle       | Coberly
 Danny      | Fritz


<--2galvanize_contacts=# Select biography from "User" where biography like '%man%';
                              biography
----------------------------------------------------------------------
 Does the man have the moustache, or does the moustache have the man?
 Definitely a human instructor, not a robot



<--3
<-- select first_name, last_name, type, value from "User" join contact on contact.user_id="User".id where first_name='Danny';
first_name | last_name |   type    |           value
------------+-----------+-----------+---------------------------
 Danny      | Fritz     | email     | danny.fritz@galvanize.com
 Danny      | Fritz     | homephone | 0


<--4
<--galvanize_contacts=# select first_name from "User" where date_of_birth < '1/1/2000';
 first_name
------------
 Kyle
 Danny

<-- 5
<--galvanize_contacts=# select first_name, last_name, count(type) from "User" join contact on contact.user_id="User".id group by "User".first_name, "User".last_name;
first_name | last_name | count
------------+-----------+-------
 Roberto    | Ortega    |     1
 Danny      | Fritz     |     2
 Kyle       | Coberly   |     2
 CJ         | Reynolds  |     1
