CREATE DATABASE ding_bao;
USE ding_bao;

CREATE TABLE paper (
	pno CHAR(6) PRIMARY KEY,
	pna VARCHAR(20),
	ppr DECIMAL(5, 1)
);

CREATE TABLE cp (
	eno CHAR(4),
	pno CHAR(6),
	num INT DEFAULT 1,
	PRIMARY KEY (eno, pno)
);

CREATE TABLE customer (
	eno CHAR(4) PRIMARY KEY,
	cna VARCHAR(50),
	adr VARCHAR(100)
);

INSERT INTO paper (pno, pna, ppr) VALUES
('000001', '人民日报', 12.5),
('000002', '解放军报', 14.5),
('000003', '光明日报', 10.5),
('000004', '青年报', 11.5),
('000005', '扬子日报', 18.5);

INSERT INTO cp (eno, pno, num) VALUES
('0001', '000001', 2),
('0001', '000002', 4),
('0001', '000005', 6),
('0002', '000001', 2),
('0002', '000003', 2),
('0002', '000005', 2),
('0003', '000003', 2),
('0003', '000004', 4),
('0004', '000001', 1),
('0004', '000003', 3),
('0004', '000005', 2),
('0005', '000003', 4),
('0005', '000002', 1),
('0005', '000004', 3),
('0005', '000005', 5),
('0005', '000001', 4);

INSERT INTO customer (eno, cna, adr) VALUES
('0001', '李涛', '无锡市解放东路 123 号'),
('0002', '钱金浩', '无锡市人民西路 234 号 '),
('0003', '邓杰', '无锡市惠河路 432 号'),
('0004', '朱海红', '无锡市中山东路 432 号'),
('0005', '欧阳阳文', '无锡市中山东路 532 号');

CREATE VIEW c_p_n AS
SELECT
	c.eno,
	c.cna,
	p.pno,
	p.pna,
	cp.num
FROM
	customer c
JOIN
	cp ON c.eno = cp.eno
JOIN
	paper p ON cp.pno = p.pno;

CREATE OR REPLACE VIEW c_p_n AS
SELECT
	c.eno,
	c.cna,
	p.pno,
	p.pna,
	p.ppr,
	cp.num
FROM
	customer c
JOIN
	cp ON c.eno = cp.eno
JOIN
	paper p ON cp.pno = p.pno;

SELECT *
FROM c_p_n
WHERE pna = '人民日报';

UPDATE c_p_n
SET num = 5
WHERE eno = '0001' AND pna = '人民日报';

UPDATE c_p_n
SET pna = '日报人民'
WHERE pno = '000001';

DROP VIEW c_p_n;
