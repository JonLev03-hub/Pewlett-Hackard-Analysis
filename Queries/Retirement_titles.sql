SELECT e.emp_no,e.first_name,e.last_name,ti.title,ti.to_date,ti.from_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1/1/1952' AND '12/31/1955')
order by emp_no;
select * from retirement_titles