
 --   회원가입 테이블 MODEL1EX
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    CID     VARCHAR2(50) PRIMARY KEY,
    CPW     VARCHAR2(50) NOT NULL,
    CNAME   VARCHAR2(50)    NOT NULL,
    CTEL    VARCHAR2(50)    NOT NULL,
    CEMAIL  VARCHAR2(50),
    CADDRESS    VARCHAR2(250),
    CGENDER VARCHAR2(10)    NOT NULL,
    CBIRTH  DATE    NOT NULL,
    CRDATE  DATE    DEFAULT SYSDATE
);

-- 1. 회원가입시 ID 중복체크
SELECT * FROM CUSTOMER WHERE CID = 'AAA';

-- 2. 회원가입 
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH )
    VALUES ('AAA', '111', '홍길동', '010-9999-9999', 'HONG@HONG.COM', '서울시 종로구', 'M', '2020-02-01');
    
SELECT * FROM CUSTOMER;

COMMIT;

-- 3. 로그인할 때 (ID/PW)
SELECT * FROM CUSTOMER WHERE CID='aaa' and CPW='111';
-- 4. ID로 DTO 가져오기
SELECT * FROM CUSTOMER WHERE CID='aaa';
-- 5. 회원정보 수정
UPDATE CUSTOMER SET CPW='111',
                CNAME='엑스맨',
                CTEL = '010-9999-1111',
                CEMAIL='a@a.com',
                CADDRESS='서울시 용산구',
                CBIRTH=to_date('1972-01-12','yyyy-mm-dd'),
                CGENDER = 'm'
        WHERE CID='aaa';
        
SELECT * FROM CUSTOMER;
