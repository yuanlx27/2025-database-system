CREATE DATABASE jxgl;
USE jxgl;

CREATE TABLE student (
	sno CHAR(7) PRIMARY KEY,
	sname VARCHAR(20) NOT NULL,
	sage INT,
	ssex CHAR(2),
	sdept VARCHAR(10)
);

INSERT INTO student (sno, sname, sage, ssex, sdept) VALUES
('2005001', '钱横', 18, '男', 'Cs'),
('2005002', '王林', 19, '女', 'Cs'),
('2005003', '李民', 20, '男', 'Is'),
('2005004', '赵欣然', 16, '女', 'Ma');

CREATE TABLE course (
	cno INT PRIMARY KEY,
	cname VARCHAR(20) NOT NULL,
	cpno INT,
	ccredit INT
);

INSERT INTO course (cno, cname, cpno, ccredit) VALUES
(1, '数据库系统', 5, 4),
(2, '数学分析', NULL, 2),
(3, '信息系统导论', 1, 3),
(4, '操作系统原理', 6, 3),
(5, '数据结构', 7, 4),
(6, '数据处理基础', NULL, 4),
(7, 'C语言', 6, 3);

CREATE TABLE sc (
	sno CHAR(7),
	cno INT,
	grade INT,
	PRIMARY KEY (sno, cno),
	FOREIGN KEY (sno) REFERENCES student(sno),
	FOREIGN KEY (cno) REFERENCES course(cno)
);

INSERT INTO sc (sno, cno, grade) VALUES
('2005001', 1, 87),
('2005001', 2, 67),
('2005001', 3, 90),
('2005002', 2, 95),
('2005003', 3, 88);
