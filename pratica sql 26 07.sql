--questão 1
	SELECT u.id, u.name, c.name as city 
	FROM users u 
	JOIN cities c ON u."cityId" = c.id;

--questão 2

	SELECT t.id, u1.name as writer, u2.name as recipient, t.message 
	FROM testimonials t 
	JOIN users u1 ON t."writerId" = u1.id 
	JOIN users u2 ON t."recipientId" = u2.id;
	
--questão 3

	SELECT e."userId" as id, u.name, c.name as course, s.name as school, e."endDate" 
	FROM educations e
	JOIN users u ON e."userId" = u.id AND u.id = 30
	JOIN courses c ON e."courseId" = c.id
	JOIN schools s ON e."schoolId" = s.id
	WHERE e.status = 'finished';
	
--questão 4

	SELECT u.id as id, u.name as name, r.name as role, c.name as company, e."startDate" FROM experiences e
	JOIN users u ON e."userId" = u.id
	JOIN companies c on e."companyId" = c.id
	JOIN roles r ON e."roleId" = r.id
	WHERE u.id = 50 AND e."endDate" is null;
