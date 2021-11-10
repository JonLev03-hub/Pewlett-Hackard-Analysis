-- Create a list of employees ready to retire 
SELECT e.emp_no,e.first_name,e.last_name,ti.title,ti.to_date,ti.from_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1/1/1952' AND '12/31/1955')
order by emp_no;
select * from retirement_titles;

-- Use COUNT to retrieve the number of people per position
SELECT title,COUNT(title)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
SELECT retiring_titles;

-- Create the list for the mentor program
SELECT DISTINCT ON(d.emp_no,ti.emp_no)
d.to_date,d.from_date,e.emp_no,e.first_name,e.last_name,e.birth_date,ti.title
INTO temp_table
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1/1/1965' and '12/31/1965')
AND (d.to_date = ('9999-01-01'));
SELECT * FROM temp_table;

