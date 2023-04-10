#question_3



SELECT AVG(age)
FROM dareit.students;




42.6666666666666667






create Cloud SQL instance

Go go GCP Console and find Cloud SQL.
Click CREATE INSTANCE
Now we will need to fill in some information about the Instance( create a Postgre SQL instance)

ADD:
Instance ID = dareit-pg (please note the the instance-id needs to be unique within the GCP project)
Password - whatever password you want to the admin user. If you forget it, don’t worry, you can change it later from GCP console.
database version - that is the version of the engine - choose PostgreSQL 14
configuration to start - deployment

customise the instance. Choose Connections

We want our instance to have Public IP - it means that this instance will have an IP the is unique across the whole Internet. And then choose ADD NETWORK under the Authorised Networks section. That way we will be able to add an IP from which packets will be allowed to the Database Instance

Google the ip ddress
https://whatismyipaddress.com/

comnections : Public IP
my network: my IP

SAVE
Click on your instance, under the General you will be presented with information about how to connect to the instance. You will need the Public IP Address . So copy that address.
-----------------------
Let’s now use Dbeaver to connect to the database
Open Dbeaver, on the left hand side in the white space use right click to and then choose Create New Folder

Choose PostgreSQL. Because that is the type of the database engine that we will be connecting to.

you need to  supply some information about the instance/host.
host - that is the Public IP of the Cloud SQL instance
Database - that is the database name to which we will be connecting
Port - 5432 - this is the port that is used for connecting to Postgres database
Username - postgres that is the deafult name of the user created on the instance.
Password - the password that you provided for the admin user when you were creating the instance.


﻿Once you added all info you can try to test the connection.
 
 
 in case of problem
 check;
 the public IP of the instance
verify that you current IP (what is my IP result) hasn’t changed since you added it to the Authorised networks on the Cloud SQL Instance
confirm that the password for the postgres user is correct.


Now we will create a schema in the databa

Right click on the Schemas
Type in the name of the schema.
schema name: dareit
database: posgres
owner: cloudsql..

DATABASE

Paste the below SQL code in the editor:
The script created a table called students, that has five columns which can contain different data types.
id - int - so only numbers
lastName - varchar(255) - text that has 255 characters
firstName - varchar(255) - text that has 255 characters
email - varchar(255) - text that has 255 characters
city - varchar(255) - text that has 255 characters

CREATE TABLE students (
    id int,
    lastName varchar(255),
    firstName varchar(255),
    email varchar(255),
    city varchar(255)
);

press the orange arrow on the left had side of the screenshot to execute the script.

Refresh the schema in order to be able to see the newly created Table in the Navigator.

INSERT query. Right click on the table and choose Generate SQL and the INSERT
A new popup will appear copy the script. Open a new script editor and paste it there.

INSERT INTO dareit.students
(id, lastname, firstname, email, city)
VALUES(0, '', '', '', '');

The values are still empty so, lets fill it in with information.  (just use your name)

INSERT INTO dareit.students
(id, lastname, firstname, email, city)
VALUES(0, 'Martyna','Lewinska', 'myemail@gmail.com', 'Lodnon');

Once ready execute the script.

select data from the students table. 

select * from dareit.students
UPDATE statement
UPDATE dareit.students
SET  city='London'
where id=0



Add one more column to the students table called age with type int
Add 5 more rows to the table with some proper data. So information about 5 more students
Prepare a query that will answer the question what is average age of the students in the class?
Extract to txt data from the students tabl
Create a new folder in your cloud_challenge repo with name task_5 , commit the txt file there. Add a readme.md with the answer to question from point 3.




