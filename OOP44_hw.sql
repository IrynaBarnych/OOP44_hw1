-- Завдання 2
--Для бази даних Академія створіть такі запити:

--3. Вивести для викладачів їх прізвища, відсоток ставки по
-- відношенню до надбавки та відсоток ставки по відношенню 
-- до зарплати (сума ставки та надбавки)

SELECT 
    Surname AS "прізвища викладачів",
    Premium / Salary * 100 AS "відсоток ставки по відношенню до надбавки",
    (Salary + Premium) / Salary * 100 AS "відсоток ставки по відношенню до зарплати (сума ставки та надбавки)"
FROM Teachers;