-- Завдання 2
--Для бази даних Академія створіть такі запити:

-- 5. Вивести прізвища професорів, ставка яких перевищує 1050.

SELECT Surname, Salary
FROM Teachers
WHERE Salary::numeric > 1050;

-- Salary::numeric, ::numeric означає, що ми хочемо привести 
--тип даних стовпця Salary до числового типу numeric. 
--Це дозволяє уникнути помилки порівняння між різними типами даних.

--SELECT Surname, Salary
--FROM Teachers
--WHERE Salary > 1050; 
-- так виводило помилку
