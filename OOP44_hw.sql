-- Завдання 2
--Для бази даних Академія створіть такі запити:

-- 4. Вивести таблицю факультетів одним полем у такому форматі: 
-- «The dean of faculty [faculty] is [dean].».

SELECT 
    'The dean of faculty ' || Name || ' is ' || Dean AS FacultyInfo
FROM Faculties;