-- Завдання 1
--Створіть базу даних Академія (Academy), яка міститиме
--інформацію про співробітників та внутрішній порядок академії.
--Опис бази даних знаходиться в кінці файлу.

-- Створення таблиці Кафедри (Departments)
CREATE TABLE Departments (
   Id SERIAL PRIMARY KEY,
   Financing MONEY NOT NULL DEFAULT 0,
   Name VARCHAR(100) UNIQUE NOT NULL
);

-- Додавання записів в таблицю Кафедри (Departments)
INSERT INTO Departments (Financing, Name) VALUES
    (50000.00, 'Математика'),
    (70000.00, 'Фізика'),
    (60000.00, 'Інформатика'),
    (80000.00, 'Мови'),
    (55000.00, 'Хімія');

--######################################
-- Створення таблиці Факультети (Faculties)
CREATE TABLE Faculties (
   Id SERIAL PRIMARY KEY,
   Dean VARCHAR(255) NOT NULL,
   Name VARCHAR(100) UNIQUE NOT NULL
);

-- Додавання записів в таблицю Факультети (Faculties)
INSERT INTO Faculties (Dean, Name) VALUES
    ('Іванов І.І.', 'Факультет природничих наук'),
    ('Петров П.П.', 'Факультет гуманітарних наук'),
    ('Сидоров С.С.', 'Факультет інформаційних технологій');


--#######################################
-- Створення таблиці Групи (Groups)
CREATE TABLE Groups (
   Id SERIAL PRIMARY KEY,
   Name VARCHAR(10) UNIQUE NOT NULL,
   Rating INT NOT NULL CHECK(Rating >= 0 AND Rating <= 5),
   Year INT NOT NULL CHECK(Year >= 1 AND Year <= 5),
   FacultyId INT REFERENCES Faculties(Id)
);

-- Додавання записів в таблицю Групи (Groups)
INSERT INTO Groups (Name, Rating, Year, FacultyId) VALUES
    ('Група-101', 4, 1, 1),
    ('Група-201', 5, 2, 2),
    ('Група-301', 3, 3, 3),
    ('Група-102', 4, 1, 1),
    ('Група-202', 5, 2, 2);
--#######################################

-- Створення таблиці Викладачі (Teachers)
CREATE TABLE Teachers (
  Id SERIAL PRIMARY KEY,
  EmploymentDate DATE NOT NULL CHECK(EmploymentDate >= '1990-01-01'),
  IsAssistant BOOLEAN NOT NULL DEFAULT FALSE,
  IsProfessor BOOLEAN NOT NULL DEFAULT FALSE,
  Name VARCHAR(255) NOT NULL,
  Position VARCHAR(255) NOT NULL,
  Premium MONEY NOT NULL DEFAULT 0,
  Salary MONEY NOT NULL CHECK(CAST(Salary AS NUMERIC) > 0.0), 
  Surname VARCHAR(255) NOT NULL,
  DepartmentId INT REFERENCES Departments(Id)
);

-- Додавання записів в таблицю Викладачі (Teachers)
INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname, DepartmentId) VALUES
    ('2000-01-15', TRUE, FALSE, 'Олег', 'Доцент', 2000.00, 60000.00, 'Коваленко', 1),
    ('1995-05-20', FALSE, TRUE, 'Марія', 'Професор', 3000.00, 80000.00, 'Петренко', 2),
    ('2008-11-10', TRUE, FALSE, 'Василь', 'Старший викладач', 1500.00, 55000.00, 'Іванов', 3),
    ('2015-03-25', FALSE, TRUE, 'Ольга', 'Професор', 2500.00, 70000.00, 'Сидорова', 4),
    ('2005-08-12', TRUE, FALSE, 'Ігор', 'Доцент', 1800.00, 65000.00, 'Козлов', 5);
