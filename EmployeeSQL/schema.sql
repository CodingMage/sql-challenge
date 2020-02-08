CREATE TABLE departments (
    dept_no varchar(30)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    birth_date varchar(30)   NOT NULL,
    first_name varchar(20)   NOT NULL,
    last_name varchar(20)   NOT NULL,
    gender varchar(5)   NOT NULL,
    hire_date varchar(30)   NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(30)   NOT NULL,
    from_date varchar(30)   NOT NULL,
    to_date varchar(30)   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(30)   NOT NULL,
    emp_no int   NOT NULL,
    from_date varchar(30)   NOT NULL,
    to_date varchar(30)   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    from_date varchar(30)   NOT NULL,
    to_date varchar(30)   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar(30)   NOT NULL,
    from_date varchar(30)   NOT NULL,
    to_date varchar(30)   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);


