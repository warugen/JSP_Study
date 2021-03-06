-- MEMBER 태이블 생성

DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
    ID      VARCHAR2(30)    PRIMARY KEY,
    PW      VARCHAR2(30)    NOT NULL,
    NAME    VARCHAR2(30)    NOT NULL,
    EMAIL   VARCHAR2(30),
    BIRTH   DATE            NOT NULL,
    RDATE   DATE            NOT NULL,
    ADDRESS VARCHAR2(200)
);

SELECT * FROM MEMBER;

-- 1. 회원가입시 아이디 중복체크
SELECT * FROM MEMBER WHERE ID = 'aaa';

-- 2. 회원가입 SQL
INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS)
    VALUES ('aaa','111', '홍길동', null, '1990-01-01', SYSDATE, '서울시 종로구');

COMMIT;

-- 3. 로그인할때 (ID/PW)
SELECT * FROM MEMBER WHERE ID = 'aaa';

-- 4. ID로 DTO 가져오기
SELECT * FROM MEMBER WHERE ID = 'aaa';

-- 5. 회원정보 수정
UPDATE MEMBER SET PW = '111', NAME = '김길동', EMAIL = 'a@a.com', BIRTH = '1992-01-01', ADDRESS='서울시 용산구'
    WHERE ID = 'aaa';

-- 6. 회원 리스트 가져오기
SELECT * FROM MEMBER;