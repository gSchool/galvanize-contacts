# Galvanize Contacts

Follow these steps:

* Create a database named `galvanize_contacts`
* Create a role called `galvanize_admin` with the password `galvanize_P@$$w0rd`
    * Remove all permissions on tables in this database from the role `public`
    * Give the `usage` permission on tables in this database back to the role `public`
    * Change the default privileges for your database superuser to grant insert, select, update, and delete rights to `galvanize_admin` on tables
    * Change the default prilileges for your database superuser to grant all privileges on sequences to `galvanize_admin`

Dump the roles the `pg_dumpall -r` command and overwite `database_roles.sql` with it.

* Create a new table called `User` with the following properties (use appropriate data types):
    * `id`
    * `first_name`
    * `last_name`
    * `date_of_birth`
    * `biography`
* Create a new table called `Contact` with the following properties (use appropriate data types):
    * `id`
    * `type`
    * `value`
    * `user_id`, which is a foreign key of `User` which cascades on delete
* Create a few `User`s:
    * Kyle Coberly, born on 2/18/1961. Web app developer, business dork, amateur economist.
    * CJ Reynolds, born on 4/28/2031. Does the man have the moustache, or does the moustache have the man?
    * Danny Fritz, initialized on 9/15/1805. Definitely a human instructor, not a robot.
    * Roberto Ortega, born on 10/17/2015. Llamas age faster than people.
* Create a few `Contact`s:
    * Each `User` has an email address, which is their first name, a dot, then their last name at galvanize.com
    * Kyle also has a mobile phone number, which 911.
    * Danny has a home phone number, which 0.

Dump the schema WITH the data overwrite `database_dump.sql` with it.

Write the queries for the following:

* Return the first name and last name of everyone born in the 21st century, in reverse alphabetical order
* Return the biographies of everyone whose biography contains the word "man"
* Return first name, last name, and each contact type and contact value for Danny Fritz
* Return the first names of Kyle and Danny using only one `WHERE` clause
* Return a list of every user with a count of how many contacts they each have

Add these queries to `database_queries.sql`.

Write the queries for the following:

* Add a field to the `User` table called `is_human` with the appropriate data type
* Set `is_human` for all Users except Danny to `true`
* Delete all human users
* Drop the `Contact` table

Execute these queries, then add the queries you wrote to `database_manipulation.sql`

---

Add and commit all 4 files, and then pull request them back to this repo.
