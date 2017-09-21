QUERIES
++++++++++++++++++++++++++++++++++++++++

1.)

select first_name, last_name from "user" where date_of_birth < '1/1/2000' order by first_name desc;
 first_name | last_name
------------+-----------
 Kyle       | Coberly
 Danny      | Fritz
(2 rows)

2.)

galvanize_contacts=# select biography from "user" where biography like '%man%';
                              biography
----------------------------------------------------------------------
 Does the man have the moustache, or does the moustache have the man?
 Definitely a human instructor, not a robot
(2 rows)

3.)

select first_name, last_name, type, value from "user" join contact on contact.user_id="user".id where first_name='Danny';
 first_name | last_name | type  |           value
------------+-----------+-------+---------------------------
 Danny      | Fritz     | email | danny.fritz@galvanize.com
 Danny      | Fritz     | home  | 0
(2 rows)

4.)

galvanize_contacts=# select first_name from "user" where date_of_birth<'1/1/2000';
 first_name
------------
 Kyle
 Danny
(2 rows)

5.)

galvanize_contacts=# select first_name, last_name, count(type) from "user" join contact on contact.user_id="user".id group by "user".first_name, "user".last_name;
 first_name | last_name | count
------------+-----------+-------
 Danny      | Fritz     |     2
 Roberto    | Ortega    |     1
 Kyle       | Coberly   |     2
 CJ         | Reynolds  |     1
(4 rows)

6.)

galvanize_contacts=# alter table “User” add column is_human boolean;
ALTER TABLE

7.)

galvanize_contacts=# update “User” set is_human = true;
UPDATE 4
galvanize_contacts=# select * from "user";
 id | first_name | last_name | date_of_birth |                              biography                               | is_human
----+------------+-----------+---------------+----------------------------------------------------------------------+----------
 3  | Kyle       | Coberly   | 1961-02-18    | Web developer, business dork, amateur economist.                     | t
 4  | CJ         | Reynolds  | 2031-04-28    | Does the man have the moustache, or does the moustache have the man? | t
 6  | Roberto    | Ortega    | 2015-10-17    | LLamas age faster than people                                        | t
 5  | Danny      | Fritz     | 1805-09-15    | Definitely a human instructor, not a robot                           | f
(4 rows)

8.)

galvanize_contacts=# delete from "user" where is_human = true;
DELETE 3

galvanize_contacts=# select * from "user";
 id | first_name | last_name | date_of_birth |                 biography                  | is_human
----+------------+-----------+---------------+--------------------------------------------+----------
 5  | Danny      | Fritz     | 1805-09-15    | Definitely a human instructor, not a robot | f
(1 row)

9.)

galvanize_contacts=# drop table contact;
DROP TABLE
galvanize_contacts=# select * from contact;
ERROR:  relation "contact" does not exist
LINE 1: select * from contact;
                      ^
