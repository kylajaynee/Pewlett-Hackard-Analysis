SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.to_date,
titles.from_date
INTO retirement_titles
FROM employees INNER JOIN titles
ON (employees.emp_no=titles.emp.no)
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.to_date,
titles.from_date
INTO unique_titles
FROM employees INNER JOIN titles
ON (employees.emp_no=titles.emp.no)
WHERE (dept_emp.to_date='9999-01-01')
ORDER BY employees.emp_no;

SELECT COUNT(employees.emp_no), employees.emp_no,
titles.title,
titles.to_date
INTO retiring_titles
FROM employees INNER JOIN titles
ON (employees.emp_no=titles.emp_no)
WHERE (titles.to_date='9999-01-01')
GROUP BY titles.title, employees.emp_no, titles.to_date
ORDER BY employees.emp_no;

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.to_date,
dept_emp.from_date,
titles.title
INTO mentorship_eligibility
FROM employees 
INNER JOIN dept_emp
ON (employees.emp_no=dept_emp.emp_no)
INNER JOIN titles
ON (employees.emp_no=titles.emp.no)
WHERE (dept_emp.to_date='9999-01-01')
AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;
