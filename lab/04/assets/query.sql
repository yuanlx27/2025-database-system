USE jxgl;

SELECT sno, sname
FROM student
WHERE sage > 23 AND ssex = '男';

SELECT DISTINCT sname
FROM student s JOIN sc ON s.sno = sc.sno
WHERE s.ssex = '女';

SELECT cno
FROM course
WHERE cno NOT IN (
	SELECT sc.cno
	FROM sc JOIN student s ON sc.sno = s.sno
	WHERE s.sname = '王林'
);

SELECT sno
FROM sc GROUP BY sno
HAVING COUNT(DISTINCT cno) >= 2;

SELECT c.cno, c.cname
FROM course c JOIN sc ON c.cno = sc.cno GROUP BY c.cno
HAVING COUNT(DISTINCT sc.sno) = (SELECT COUNT(*) FROM student);

SELECT sc.sno, AVG(sc.grade) AS avg_grade
FROM sc JOIN course c ON sc.cno = c.cno
WHERE c.ccredit = 3 GROUP BY sc.sno
HAVING COUNT(DISTINCT sc.cno) = (
	SELECT COUNT(*)
	FROM course
	WHERE ccredit = 3
);
