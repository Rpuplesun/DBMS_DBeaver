SELECT *
FROM EMPLOYEES e 
;

-- unique
CREATE TABLE UNIQUE_TEST2(
	col1	varchar2(20),
	col2	varchar2(20),
	CONSTRAINTS temp_unique2 UNIQUE(col1, col2)
);
SELECT * FROM UNIQUE_TEST2;

INSERT INTO UNIQUE_TEST2 (col1, col2)
	VALUES ('aa', 'bb');
INSERT INTO UNIQUE_TEST2 (col1, col2)
	VALUES ('aa', 'cc');
INSERT INTO UNIQUE_TEST2 (col1, col2)
	VALUES ('aa', 'dd');
INSERT INTO UNIQUE_TEST2 (col1, col2)
	VALUES ('aa', 'ee');

-- check : 주어진 값만 허용하는 조건
CREATE TABLE CHECK_test(
	gender varchar2(10) NOT NULL
	CONSTRAINTS check_gender CHECK (gender IN('남성', '여성'))
);

SELECT * FROM CHECK_TEST;

INSERT INTO CHECK_TEST VALUES ('남성');
INSERT INTO CHECK_TEST VALUES ('M'); --오류

-- PK
CREATE TABLE primary_key(
	student_id	number(10) PRIMARY KEY,
	name		varchar2(20)
);

-- 아웃라인 방식
CREATE TABLE primary_key2(
	student_id	number(10),
	name		varchar2(20),
	CONSTRAINTS student_pk PRIMARY KEY(student_id)
);

-- 테이블 생성 후 기본키를 생성하는 방법
CREATE TABLE primary_key3(
	student_id	number(10),
	name		varchar2(20)
);

ALTER TABLE PRIMARY_KEY3 
ADD CONSTRAINTS student_pk3 PRIMARY KEY(student_id);

-- FK
-- 테이블 생성과 외래키 지정 동시에
CREATE TABLE foreign_key(
	department_id number(4),
	CONSTRAINTS dept_fk FOREIGN KEY (department_id)
	REFERENCES departments (department_id)
);

-- 테이블 생성하고 나서 외래키를 지정하는 방법
CREATE TABLE foreign_key2(
	department_id number(4)
);

ALTER TABLE FOREIGN_KEY2 
ADD CONSTRAINTS dept_fk2 FOREIGN KEY (department_id)
REFERENCES departments (department_id)
;

CREATE TABLE daddy(
	idx		number(10),
	mID		number(10) PRIMARY key
);

CREATE TABLE daughter(
	idx		number(10) PRIMARY KEY,
	mID		number(10),
	CONSTRAINTS FK_DA FOREIGN KEY(mID)
	REFERENCES daddy(mID) ON DELETE cascade
);

INSERT INTO daddy VALUES (1, 10);
INSERT INTO daddy VALUES (2, 20);
INSERT INTO daddy VALUES (3, 30);

SELECT * FROM daddy;

SELECT * FROM DAUGHTER;
INSERT INTO DAUGHTER VALUES (100, 10);
INSERT INTO DAUGHTER VALUES (101, 10);
INSERT INTO DAUGHTER VALUES (102, 20);
INSERT INTO DAUGHTER VALUES (103, 30);

DELETE FROM DADDY WHERE idx = 2;

-- daughter2
CREATE TABLE daughter2(
	idx		number(10) PRIMARY KEY,
	mID		number(10),
	CONSTRAINTS FK_DA2 FOREIGN KEY(mID)
	REFERENCES daddy(mID) ON DELETE SET NULL 
);

INSERT INTO DAUGHTER2 VALUES (100, 10);
INSERT INTO DAUGHTER2 VALUES (101, 10);
INSERT INTO DAUGHTER2 VALUES (103, 30);

SELECT * FROM DAUGHTER2;

DELETE FROM DADDY WHERE idx = 1;



