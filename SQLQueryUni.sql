USE UniversityDB
go


 -- أسماء الطلاب الذين تاريخ ميلادهم بعد سنة 2000.

select StudentID,FirstName,LastName,BirthDate from Students
where BirthDate > '2000-01-01' ;




--اعرض المواد التي تحتوي على أكثر من 3 ساعات دراسية.

select * 
from Courses
where Credits > 3



-- اعرض إجمالي عدد الطلاب في الجامعة.

select count(StudentID) from Students




--احسب متوسط المعدل التراكمي للطلاب في قسم "Computer Science".

select d.DepartmentName
,AVG(S.GPA) as Average_GPA
from Students s
join Departments d
on s.DepartmentID = d.DepartmentID
where D.DepartmentID = 1
group by d.DepartmentName



--اعرض أعلى معدل تراكمي بين جميع الطلاب.

select 
top 1 GPA
from Students 




--اعرض عدد أعضاء هيئة التدريس في كل قسم.

select Count(p.ProfessorID) as total_Prof,d.DepartmentName from Professors p
join Departments d
on 
p.DepartmentID = d.DepartmentID
group by d.DepartmentName



--اعرض أسماء الطلاب مع أسماء الأقسام التي ينتمون إليها.

select s.FirstName,s.LastName ,d.DepartmentName
from Students s
join Departments d
on
s.DepartmentID = d.DepartmentID
order by d.DepartmentName




--اعرض أسماء الطلاب مع المواد الدراسية التي سجلوها باستخدام جدول Enrollments.

select s.FirstName,s.LastName ,c.CourseName
from Students s
join Enrollments E
on
s.StudentID = E.StudentID
join Courses c
on
e.CourseID = c.CourseID
order by c.CourseName


--احسب إجمالي الرسوم الدراسية المدفوعة من جميع الطلاب لكل قسم.

select Sum(p.Amount) as "Total Amount" , d.DepartmentName
from Payments p
join Students s
on p.StudentID = s.StudentID
join Departments d
on s.DepartmentID = d.DepartmentID
Group by D.DepartmentName


--اعرض بيانات الطلاب الذين سجلوا في أكثر من 3 مواد.

select s.StudentID,
       s.FirstName,
       s.LastName,
    COUNT(e.CourseID) AS Total_Courses
from Students s
join Enrollments E
on
s.StudentID = E.StudentID
join Courses c
on
e.CourseID = c.CourseID
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(e.CourseID) > 3
ORDER BY Total_Courses DESC;

---اعرض قائمة بأكثر 3 مواد عليها تسجيل طلابي مرتفع.

SELECT TOP 3
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS Total_Enrollments
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY Total_Enrollments DESC;













