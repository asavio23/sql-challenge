CREATE TABLE Employees (
    Emp_no INT PRIMARY KEY,
    Emp_title_id VARCHAR(5) NOT NULL,
    Birth_date DATE,
    First_name VARCHAR(30) NOT NULL,
    Last_name VARCHAR(30) NOT NULL,
    Sex VARCHAR(1),
    Hire_date DATE,
    FOREIGN KEY (Emp_title_id) REFERENCES Titles(Tile_id)
);

CREATE TABLE Departments (
    Dept_no CHAR(5) PRIMARY KEY,
    Dept_name VARCHAR(30) UNIQUE NOT NULL 
);

CREATE TABLE Titles (
    Tile_id VARCHAR(5) PRIMARY KEY,
    Tile VARCHAR(30) NOT NULL
);

CREATE TABLE Salaries (
    Emp_no INT NOT NULL,
    Salary INT NOT NULL,
    FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

CREATE TABLE Dept_managers (
    Dept_no CHAR(5),
    Emp_no INT,
    FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no),
    FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

CREATE TABLE Dept_emp (
    Emp_no INT,
    Dept_no CHAR(4),
    FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no),
    FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no)
);