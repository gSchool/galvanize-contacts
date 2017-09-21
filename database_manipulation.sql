
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
