/*
DROP DATABASE IF EXISTS sql_course;
CREATE DATABASE sql_course;
CREATE TABLE job_applied (
	job_id INT,
	application_sent_date DATE,
	custom_resume BOOLEAN,
	resume_file_name VARCHAR(255),
	cover_letter_sent BOOLEAN,
	cover_letter_file_name VARCHAR(255),
	status VARCHAR (50)
);
*/
/*
INSERT INTO job_applied
			(job_id,
			application_sent_date,
			custom_resume,
			resume_file_name,
			cover_letter_sent,
			cover_letter_file_name,
			status)
VALUES
	(1,
	'2024-02-01',
	true,
	'resume_01.pdf',
	true,
	'cover_letter_01.pdf',
	'submitted'),
	(2,
	'2024-02-02',
	false,
	'resume_02.pdf',
	false,
	NULL,
	'interview scheduled')
	(3,
	'2024-02-03',
	true,
	'resume_03.pdf',
	true,
	'cover_letter _03.pdf',
	'ghosted'),
	(4,
	'2024-02-04',
	true,
	'resume_04.pdf',
	false,
	NULL,
	'submitted'),
	(5,
	'2024-02-05',
	false,
	'resume_05.pdf',
	true,
	'cover_letter_05.pdf',
	'rejected');
*/
CREATE DATABASE testdb;
SELECT datname FROM pg_database;
DROP DATABASE IF EXISTS testdb;

CREATE TABLE copy_job_applied AS
SELECT *
FROM job_applied;

SELECT * FROM copy_job_applied;
DROP TABLE copy_job_applied;
TRUNCATE TABLE copy_job_applied;
