
-- 문제1
-- TB_TEAM 생성
CREATE TABLE TB_TEAM(
	TEAM_ID		NUMBER(10) PRIMARY KEY,
	LOACTION 	VARCHAR2(10) NOT NULL,
	TEAM_NAME 	VARCHAR2(10) NOT NULL,
	TEAM_PHNUM 	VARCHAR2(15),
	HOMEPAGE 	VARCHAR2(60)
);

-- 시퀀스 생성
CREATE SEQUENCE TBID_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 10
MINVALUE 1
NOCYCLE
;


-- TB_PLAYER 생성
CREATE TABLE TB_PLAYER(
	PLAYER_NUM		NUMBER(10) PRIMARY KEY,
	PLAYER_NAME		VARCHAR2(10) NOT NULL,
	PLAYER_POSITION	VARCHAR2(10),
	PLAYER_HEIGHT	NUMBER(3),
	TEAM_ID			NUMBER(10) 
);

-- FK 생성
ALTER TABLE TB_PLAYER
ADD CONSTRAINTS ID_FK FOREIGN KEY (TEAM_ID)
REFERENCES TB_TEAM (TEAM_ID);

-- 문제2, TEAM_ID에 시퀀스 적용
INSERT INTO TB_TEAM VALUES 
(TBID_SEQ.nextval, '서울', 'KOIT', '010-1234-5678', 'WWW.KOIT.COM')
;

INSERT INTO TB_TEAM VALUES 
(TBID_SEQ.nextval, '인천', 'INIT', '010-3456-7890', 'WWW.INIT.COM')
;

SELECT*FROM TB_TEAM; 

-- 문제2
INSERT INTO TB_PLAYER VALUES
(1, 'YANG', '투수', 183, 1);
INSERT INTO TB_PLAYER VALUES
(2, 'KIM', '타자', 181, 1);
INSERT INTO TB_PLAYER VALUES
(3, 'LEE', '타자', 183, 1);
INSERT INTO TB_PLAYER VALUES
(4, 'PARK', '타자', 193, 1);
INSERT INTO TB_PLAYER VALUES
(5, 'RYONG', '포수', 220, 1);
INSERT INTO TB_PLAYER VALUES
(6, 'HEA', '타자', 189, 2);
INSERT INTO TB_PLAYER VALUES
(7, 'HAN', '투수', 190, 2);
INSERT INTO TB_PLAYER VALUES
(8, 'ANG', '타자', 169, 2);
INSERT INTO TB_PLAYER VALUES
(9, 'VANG', '타자', 199, 2);
INSERT INTO TB_PLAYER VALUES
(10, 'QUEN', '포수', 180, 2);

-- 문제4
SELECT 	tp.PLAYER_NUM , tp.PLAYER_NAME , tp.PLAYER_POSITION
	, 	tp.PLAYER_HEIGHT , tt.TEAM_NAME , tt.HOMEPAGE 
FROM 	TB_TEAM tt
LEFT OUTER JOIN TB_PLAYER tp ON tp.TEAM_ID = tt.TEAM_ID 
;

-- 문제5
DROP TABLE TB_PLAYER ;
DROP TABLE TB_TEAM ;

-- 문제6-1
-- LOACTIONS 테이블이 자식으로 COUNTRIES 테이블의 CONTRY_ID를 참조하고 있다. 

-- 문제6-2
-- COUNTRIES 테이블이 자식으로 REGIONS 테이블의 REGION_ID를 참조하고 있다.

-- 문제6-3
-- 기존에는 자식 테이블이 있으면 부모 테이블은 삭제가 안돼지만, 
-- 참조되는 부모 테이블에 대한 DELETE를 허용하여 사용 시 부모테이블의 값이 삭제되면 연쇄적으로 자식테이블의 값 역시 삭제된다.

-- 문제6-4
-- CASCADE와 같이 참조되는 부모 테이블에 대한 DELETE를 허용하지만
-- 부모테이블의 값이 삭제되면 참조되는 자식테이블의 값은 NULL값으로 설정된다.

-- 문제7
CREATE VIEW VIEW_EMP(emp_id, name, department_id, hire_date, dept_name)
	AS SELECT	e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_ID, e.HIRE_DATE, d.DEPARTMENT_NAME  
	   FROM 	EMPLOYEES e 
	   RIGHT OUTER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	   WHERE 	d.DEPARTMENT_ID = 20
;

SELECT * FROM VIEW_EMP ;
	   



















