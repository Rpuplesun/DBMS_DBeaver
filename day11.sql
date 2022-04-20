SELECT 	*
FROM 	EMPLOYEES e 
;

/*
 *  table 생성, 
 *  테이블 이름	: sample
 *  컬럼		: depNO 		/ NUMBER(20)
 * 			: deptName 		/ varchar2(15)
 *  		: deptLoc 		/ varchar2(15)
 * 			: deptManager 	/ varchar2(10)
 *  데이터 insert : 10, 기획실, 서울, 홍길동
 * 				: 20, 전산실, 부산, 김말똥
 * 				: 30, 영업부, 광주, null
 *  데이터 전체 select
 *  데이터 update : deptNo가 30인 부서를 50으로 수정
 * 				: deptName이 영업부인 deptLoc를 인천으로 수정 	  
 *  데이터 delete : deptName이 영업부인 데이터 삭제
 */

CREATE TABLE sample(
		depNO 		 	NUMBER(20) ,
 		deptName 		VARCHAR2(15) ,
 		deptLoc 		VARCHAR2(15) ,
 		deptManager 	VARCHAR2(10) );
 	
INSERT INTO SAMPLE VALUES (10, '기획실', '서울', '홍길동');
INSERT INTO SAMPLE VALUES (20, '전산실', '부산', '김말똥');
INSERT INTO SAMPLE VALUES (30, '영업부', '광주', null );

SELECT * FROM  SAMPLE s;

UPDATE SAMPLE SET DEPNO = 50
WHERE DEPNO = 30
;

UPDATE 	SAMPLE SET DEPTLOC = '인천'
WHERE 	DEPTNAME = '영업부'
;

DELETE	SAMPLE
WHERE 	DEPTNAME = '전산실'
;

SELECT  * FROM SAMPLE s ;

DELETE sample;

ROLLBACK;

COMMIT;

---------------------------------------------------------------------------------------------
-- not null
CREATE TABLE null_test(
	col1	varchar2(20) NOT NULL,
	col2	varchar2(20) NULL,
	col3	varchar2(30)
);

SELECT * FROM NULL_TEST ;

INSERT INTO NULL_TEST(col1, col2) VALUES ('aa', 'bb');
INSERT INTO NULL_TEST(col1) VALUES ('aa2');

--오류
--INSERT INTO NULL_TEST(col2) VALUES ('bb2');

-- unique
CREATE TABLE unique_test(
	col1	varchar2(20)	UNIQUE NOT NULL ,
	col2	varchar2(20)	UNIQUE ,
	col3	varchar2(20)	NOT NULL ,
	col4	varchar2(20)	NOT NULL ,
	CONSTRAINTS temp_unique UNIQUE(col3, col4)
);
-- 에러발생
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
	VALUES ('aa6', 'bb6', 'cc', 'dd');

-- 정상 insert
-- UNIQUE(col3, col4) : 컬럼 그들의 조합이 유일해야 한다.
-- 각각 컬럼 데이터의 유일함은 의미가 없고, 조합이 유일해야 한다.
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
	VALUES ('aa6', 'bb6', 'cc1', 'dd');
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
	VALUES ('aa7', 'bb7', 'cc6', 'dd');
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
	VALUES ('aa8', 'bb8', 'cc6', 'dd6');

SELECT * FROM UNIQUE_TEST;







 	
 	
 	
 	
 	
 	
 	
