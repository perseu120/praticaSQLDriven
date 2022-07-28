--questão 01

-- SELECT COUNT(e."endDate") as currentExperiences 
-- FROM experiences e;

-- questão 02

-- SELECT "userId" as id, COUNT("userId") as educations
-- FROM educations
-- GROUP BY "userId";

--questão 03

-- SELECT u.name as writer, COUNT(te.id) as testimonailCount FROM users u
-- JOIN testimonials te ON u.id = te."writerId"
-- WHERE u.id = 435
-- GROUP BY u.name;

--questão 04

SELECT MAX(j.salary) AS maximumSalary , r.name AS role FROM jobs j
JOIN roles r on j."roleId" = r.id
WHERE j.active = true
GROUP BY r.name
ORDER BY maximumSalary ASC;

