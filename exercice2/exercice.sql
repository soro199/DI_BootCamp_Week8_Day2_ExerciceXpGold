/*Create a table named students with the following fields:
    - student_id: SERIAL PRIMARY KEY
    - last_name: VARCHAR (100) NOT NULL
    - first_name: VARCHAR (50) NOT NULL
    - birth_date: DATE NOT NULL*/
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    last_name VARCHAR (100) NOT NULL,
    first_name VARCHAR (50) NOT NULL,
    birth_date DATE NOT NULL
);

/*Insert the following data into the students table:
    - last_name: Benichou
    - first_name: Marc
    - birth_date: 02/11/1998
    - last_name: Cohen
    - first_name: Yann
    - birth_date: 03/12/2010
    - last_name: Benichou
    - first_name: Léa
    - birth_date: 27/07/1987
    - last_name: Dux
    - first_name: Amélia
    - birth_date: 07/04/1996
    - last_name: Grez
    - first_name: David
    - birth_date: 14/06/2003
    - last_name: Simpson
    - first_name: Omer
    - birth_date: 03/10/1980
    - last_name: Konate
    - first_name: Mamadou
    - birth_date: 01/10/1999*/
INSERT INTO students (last_name, first_name, birth_date)
VALUES ('Marc', 'Bénichou', '1998-11-02'),
('Yann', 'Cohen', '2010-12-03'),
('Léa', 'Bénichou', '1987-07-27'),
('Amélia', 'Dux', '1996-04-07'),
('David', 'Grez', '2003-06-14'),
('Omer', 'Simpson', '1980-10-03'),
('Mamadou', 'Konate', '199-10-01'); /* Replace the values with your own */


/*Select all the students from the students table.*/
SELECT * FROM students;


/*Select all the students from the students tabble in first_name and last_name.*/
SELECT first_name, last_name FROM students;


/* Select students from the students table where id is equal to 2.*/
SELECT * FROM students WHERE student_id = 2;


/* Select students from the students table where last_name is equal to Benichou and first_name is equal to Marc.*/
SELECT * FROM students WHERE last_name = 'Benichou' AND first_name = 'Marc';

/* Select students from the students table where last_name is equal to Benichou or first_name is equal to Marc.*/
SELECT * FROM students WHERE last_name = 'Benichou' OR first_name = 'Marc';

/* Select students from the students table  where first_name contains an a.*/
SELECT * FROM students WHERE first_name LIKE '%a%';

/* Select students from the students table where first_name starts with a.*/
SELECT * FROM students WHERE first_name LIKE 'a%';

/* Select students from the students table where first_name ends with a.*/
SELECT * FROM students WHERE first_name LIKE '%a';


SELECT * FROM students WHERE first_name LIKE '_a%';



SELECT * FROM students WHERE student_id IN (1, 3);


SELECT * FROM students WHERE birth_date >= '2000-01-01';

--Option Update

UPDATE students
SET birth_date = '02/11/1998'
WHERE (last_name = 'Léa' AND first_name = 'Bénichou') OR (last_name = 'Marc' AND first_name = 'Bénichou');

UPDATE students
SET last_name = 'Guez'
WHERE first_name = 'David';


--Option Delete

DELETE FROM students
WHERE (last_name = 'Léa' AND first_name = 'Bénichou');


-- Count how many students are in the table.

SELECT COUNT(*) FROM students;


-- Count how many students were born after 1/01/2000.

SELECT COUNT(*) 
FROM students 
WHERE birth_date > '2000-01-01';


--Add a column to the student table called math_grade.

ALTER TABLE students ADD COLUMN math_grade FLOAT;


--Add 80 to the student which id is 1.

UPDATE students SET math_grade = 80 WHERE student_id = 1;



--Add 90 to the students which have ids of 2 or 4.

UPDATE students SET math_grade = 90 WHERE student_id IN (2, 4);


--Add 40 to the student which id is 6.

UPDATE students SET math_grade = 40 WHERE student_id = 6;

--Count how many students have a grade bigger than 83

SELECT COUNT(*) FROM students WHERE math_grade > 83;

--Add another student named ‘Omer Simpson’ with the same birth_date as the one already in the table. Give him a grade of 70.

INSERT INTO students (last_name,first_name, birth_date, math_grade)
VALUES ('Omer', 'Simpson', (SELECT birth_date FROM students WHERE last_name = 'Omer' AND first_name = 'Simpson'), 70);


/*Now, in the table, ‘Omer Simpson’ should appear twice. It’s the same student, although he received 2 different grades because he retook the math exam.
Bonus: Count how many grades each student has.
Tip: You should display the first_name, last_name and the number of grades of each student. If you followed the instructions above correctly, all the students should have 1 math grade, except Omer Simpson which has 2.
Tip : Use an alias called total_grade to fetch the grades.
Hint : Use GROUP BY.*/

SELECT first_name, last_name, COUNT(*) AS total_grade
FROM students
GROUP BY first_name, last_name;



--Find the sum of all the students grades.

SELECT SUM(math_grade) AS total_grades
FROM students;



select * from students
drop table students
truncate table students
