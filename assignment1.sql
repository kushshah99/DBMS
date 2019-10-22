#1
select Fname,Bdate,Address from EMPLOYEE where Dno=(select Dnumber from DEPARTMENT WHERE Dname='Administration');
#2
select SUM(Salary),MAX(Salary),MIN(Salary),AVG(Salary) from EMPLOYEE where Dno = (select Dnumber from DEPARTMENT WHERE Dname='Research') group by Dno;
#3
select COUNT(*) from EMPLOYEE where Dno = (select Dnumber from DEPARTMENT WHERE Dname='Administration') group by Dno;
#4
select Pname,Pnumber,COUNT(WORKS_ON.Essn) as no_of_employees  FROM PROJECT INNER JOIN WORKS_ON WHERE PROJECT.Pnumber=WORKS_ON.Pno group by WORKS_ON.Pno;
#5
select Pname,Pnumber,Plocation,COUNT(WORKS_ON.Essn) as no_of_employees  FROM PROJECT INNER JOIN WORKS_ON WHERE PROJECT.Pnumber=WORKS_ON.Pno and Dnum=5  group by WORKS_ON.Pno;
#6
select Pnumber,Dnum,EMPLOYEE.Lname,EMPLOYEE.Address FROM PROJECT JOIN DEPARTMENT ON PROJECT.Dnum=DEPARTMENT.Dnumber JOIN EMPLOYEE ON DEPARTMENT.Mgr_ssn=EMPLOYEE.Ssn WHERE Plocation='Houston';
#7 Retrieve a list of employees and the projects they are working on, ordered by department and, within each department, ordered alphabetically by the first name then by last name.
select Fname,Lname,Pname from EMPLOYEE e
join WORKS_ON w ON w.Essn=e.Ssn
join PROJECT p ON p.Pnumber=w.Pno
join DEPARTMENT d ON d.Dnumber=p.Dnum
ORDER BY Dname,Fname,Lname;
#8
select Fname,Lname FROM EMPLOYEE WHERE Super_ssn is NULL;
#9
Select Fname,Lname from EMPLOYEE WHERE Super_ssn in (select Ssn FROM EMPLOYEE WHERE Super_ssn='987654321');
#10
select Dname,Fname,Lname,Salary From DEPARTMENT d
JOIN EMPLOYEE e ON d.Mgr_ssn=e.Ssn; 
#11
select e.Fname,e.Lname,e1.Fname supervisor_fname,e1.Lname supervisor_lname,e.Salary salary FROM EMPLOYEE e JOIN EMPLOYEE e1 ON e.Super_ssn =e1.Ssn where e.Dno = (select Dnumber FROM DEPARTMENT where Dname="Research" );
#12)
select Pname,Dname,COUNT(*) count ,SUM(Hours) hours FROM PROJECT p JOIN DEPARTMENT d ON d.Dnumber=p.Dnum
JOIN WORKS_ON w ON p.Pnumber=w.Pno  group by Pname;
#13)	Retrieve the project name, controlling department name, number of employees, and total hours worked per week on the project for each project with more than one employee working on it.
select Pname,Dname,COUNT(*) count ,SUM(Hours) hours FROM PROJECT p JOIN DEPARTMENT d ON d.Dnumber=p.Dnum
JOIN WORKS_ON w ON p.Pnumber=w.Pno  group by Pname having count>1;
#14
select Fname,Lname FROM EMPLOYEE e
JOIN WORKS_ON w ON w.Essn=e.Ssn
join PROJECT p On w.Pno=p.Pnumber
where Dnum = 5 group by Fname having count(*)=(SELECT count(*) FROM PROJECT where PROJECT.Dnum=5);
#15Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.
SELECT Fname,Lname From EMPLOYEE join WORKS_ON ON EMPLOYEE.Ssn=WORKS_ON.Essn where Hours>10 and Pno=(SELECT Pnumber FROM PROJECT WHERE Pname='ProductX');
#16
SELECT Fname from EMPLOYEE join DEPENDENT ON DEPENDENT.Essn=EMPLOYEE.Ssn WHERE Dependent_name=Fname;
#17Find the names of all employees who are directly supervised by ‘Franklin Wong’.
SELECT Fname,Lname From EMPLOYEE WHERE Super_ssn=(Select Ssn from EMPLOYEE WHERE Fname='Franklin' and Lname='Wong');
#18 For each project, list the project name and the total hours per week (by all employees) spent on that project.
select Pname,SUM(Hours) FROM PROJECT join WORKS_ON ON PROJECT.Pnumber=WORKS_ON.Pno GROUP BY Pno;
#19
select AVG(Salary) from EMPLOYEE WHERE Sex='F';