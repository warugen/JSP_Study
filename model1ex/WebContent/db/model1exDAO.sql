-- ★ 고객(CUSTOMER) 관련

-- 1. 회원가입시 ID 중복체크
SELECT * FROM CUSTOMER WHERE CID = 'AAA';

-- 2. 회원가입 
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH )
    VALUES ('AAA', '111', '홍길동', '010-9999-9999', 'HONG@HONG.COM', '서울시 종로구', 'M', '2020-02-01');
    
SELECT * FROM CUSTOMER;

COMMIT;

-- 3. 로그인할 때 (ID/PW)
SELECT * FROM CUSTOMER WHERE CID='AAA' and CPW='111';
-- 4. ID로 DTO 가져오기
SELECT * FROM CUSTOMER WHERE CID='AAA';
-- 5. 회원정보 수정
UPDATE CUSTOMER SET CPW='111',
                CNAME='엑스맨',
                CTEL = '010-9999-1111',
                CEMAIL='a@a.com',
                CADDRESS='서울시 용산구',
                CBIRTH=to_date('1972-01-12','yyyy-mm-dd'),
                CGENDER = 'm'
        WHERE CID='AAA';
        
SELECT * FROM CUSTOMER;

-- 6. 회원리스트 보기(PAGE단위로 startRow, endRow)
SELECT * FROM CUSTOMER ORDER BY CID;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM CUSTOMER ORDER BY CID) A)
WHERE RN BETWEEN 1 AND 3;

-- 7. 등록된 회원 명수 가져오기
SELECT COUNT(*) FROM CUSTOMER;


-- ★ 도서(BOOK) 관련
-- 1.책등록
-- 이미지를 모두 등록한경우
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.nextval, '이것이 자바다', 20000, 'NOTHING.JPG', 'noImg.png', '딱좋아!', 10);
    
SELECT * FROM BOOK;

-- 2.책목록(TOP-N) 페이징처리용
SELECT * FROM BOOK ORDER BY bRDATE DESC; -- 1단계(listBoard())

SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY bRDATE DESC) A; -- 2단계
-- 3단계
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOOK ORDER BY bRDATE DESC) A)
    WHERE RN BETWEEN 1 AND 3; --  최종 TOP-N 구문 ((listBoard(s , e))

-- 3.등록된 책 갯수
SELECT COUNT(*) FROM BOOK;

-- 4.bID로 책 가져오기
SELECT * FROM BOOK WHERE bID = '1';


COMMIT;

-- ★ 게시판(FILEBOARD) 관련
-- 1. 글목록 (startRow, endRow)
SELECT * FROM FILEBOARD ORDER BY fREF DESC, fRE_STEP;

SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                (SELECT F.*, C.CNAME, C.CEMAIL FROM FILEBOARD F, CUSTOMER C
                    WHERE F.CID=C.CID ORDER BY fREF DESC, fRE_STEP) A)
        WHERE RN BETWEEN 1 AND 10;

-- 2. 등록된 글 갯수
SELECT COUNT(*) FROM FILEBOARD;

-- 3. 원글 쓰기
INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP) 
        VALUES (FILEBOARD_SEQ.nextval, 'AAA', '내가 홍길동이다', '아버지를 아버지라 못하는데 어찌해야 하나요?', 
                NULL, '111', FILEBOARD_SEQ.CURRVAL, 0, 0, '192.168.20.59');

-- 4. 답변글 쓰기전 STEP ⓐ 수행(REF가 같고 원글의 RE_STEP보다 많은 경우 RE_STEP++)
UPDATE FILEBOARD SET fRE_STEP = fRE_STEP + 1 WHERE fREF = 3 AND fRE_STEP > 0;
SELECT * FROM FILEBOARD WHERE fREF= 3;
-- 4. 답변글 쓰기
INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP)
    VALUES (FILEBOARD_SEQ.nextval, 'EEE', '답 3-1', '', NULL, '111', 3, 1, 1, '127.0.0.9');

SELECT * FROM FILEBOARD ORDER BY fREF DESC, fRE_STEP;

-- 5-1. 조회수 올리기
UPDATE FILEBOARD SET fHIT = fHIT + 1 WHERE fNUM = 1;

-- 5-2. 글 상세보기(글 번호로 DTO 가져오기)
SELECT F.*, CNAME, CEMAIL FROM FILEBOARD F, CUSTOMER C
    WHERE F.CID = C.CID AND fNUM = 3;

-- 6. 글 수정하기
UPDATE FILEBOARD SET fSUBJECT = '바뀐제목', fCONTENT = '바뀐내용', fFILENAME = NULL, fPW = '111', fIP = '192.168.0.77'
    WHERE fNUM = 3;
    SELECT * FROM FILEBOARD WHERE fNUM = 3;

SELECT * FROM FILEBOARD WHERE fNUM = 3;

-- 7. 글삭제
DELETE FROM FILEBOARD WHERE fNUM = 4 AND fPW = '111';



COMMIT;





























