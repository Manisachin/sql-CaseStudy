/* student table   */
Create Table Student ( StudentID int primary key identity(1001,1),SName varchar(20) NOT NULL, DateOfBirth DATE,  EnrollmentDate DATE);
insert into Student values ( 'Mani', '2005-03-22' , '2024-06-18');
insert into Student values ( 'harish', '2004-10-08' , '2023-05-22'); 
insert into Student values ( 'hari', '2004-09-21' , '2024-05-12'); 
insert into Student values ( 'Mari', '2005-05-12' , '2023-04-08'); 
insert into Student values ( 'aslam', '2004-04-18' , '2024-07-30'); 
insert into Student values ( 'guna', '2005-07-06' , '2024-04-08');
insert into Student values ( 'irfan', '2005-12-22' , '2024-03-31'); 
select * from Student;

/* Course table   */
create table Course ( CourseID int primary key identity(101,1) , CourseName varchar(20) not null);
insert into course values('web development');
insert into course values('data science');
insert into course values('cloud computing');
insert into course values('ui/ux designer');
insert into course values('web development');
insert into course values('app development');
insert into course values('cloud computing');
select * from Course;

/* Enrollments Table   */
 create table Enrollment (EnrollmentID int primary key,StudentID int,CourseID int,  EnrollmentDate date foreign key (StudentID) references Student(StudentID),
foreign key (CourseID) references  Course(CourseID));
insert into Enrollment values(1,1001,101,'2024-06-18');
insert into Enrollment values(2,1002,102,'2023-05-22');
insert into Enrollment values(3,1003,103,'2024-05-12');
insert into Enrollment values(4,1004,104,'2023-04-08');
insert into Enrollment values(5,1005,105,'2024-07-30');
insert into Enrollment values(6,1006,106, '2024-04-08');
insert into Enrollment values(7,1007,107,'2024-03-31');
select * from Enrollment;

/* step 2 */
select  * from Student;
 
 /* step 3 */
select  Student.SName FROM Student  JOIN Enrollment  ON Student.StudentID = Enrollment.StudentID JOIN Course  ON Enrollment.CourseID = Course.CourseID WHERE Course.CourseName = 'web development'; 

/* step 4 */
select Course.CourseName, COUNT(Enrollment.StudentID) AS NumberOfStudents FROM Course  LEFT JOIN Enrollment  ON Course.CourseID = Enrollment.CourseID GROUP BY Course.CourseName;

/* step 5*/
select  Student.SName, COUNT(Enrollment.CourseID) AS NumberOfCourses FROM Student  JOIN Enrollment  ON Student. StudentID = Enrollment.StudentID GROUP BY Student.StudentID, Student.SName HAVING COUNT(Enrollment.CourseID) > 1;

/* step 6*/
 select Student.StudentID, Student.SName, Enrollment.EnrollmentDate from Student  JOIN Enrollment  on Student.StudentID = Enrollment.StudentID join Course on Enrollment.CourseID = Course.CourseID where Course.CourseName = 'Web Development';

 /* step 7*/
  SELECT s.* FROM Student s  JOIN Enrollment e1 ON s.StudentID = e1.StudentID JOIN Enrollment e2 ON s.StudentID = e2.StudentID 
JOIN Course c1 ON e1.CourseID = c1.CourseID JOIN Course c2 ON e2.CourseID = c2.CourseID
WHERE c1.CourseName = 'Cloud Computing' AND c2.CourseName = 'web development';

 /* step 8*/
 select  COUNT(*) as TotalEnrollments FROM Enrollment;