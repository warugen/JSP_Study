-- 보드 태이블 생성
DROP TABLE BOARD;

CREATE TABLE BOARD(
    NUM         NUMBER(5) PRIMARY KEY,      -- 글번호
    WRITER      VARCHAR2(30)    NOT NULL,   -- 글쓴이
    SUBJECT     VARCHAR2(100)   NOT NULL,   -- 글제목
    CONTENT     VARCHAR2(1000)  NOT NULL,   -- 글본문
    EMAIL       VARCHAR2(30),               -- 작성자 메일주소
    HIT         NUMBER(5)       DEFAULT 0,  -- 조회수
    PW          VARCHAR2(30)    NOT NULL,   -- 글삭제시 쓸 비밀번호
    REF         NUMBER(5)       NOT NULL,   -- 글그룹
    REF_STEP    NUMBER(5)       NOT NULL,       -- 같은 글 그룹끼리 출력 순서(원글:0)
    RE_LEVEL    NUMBER(5)       NOT NULL,       -- 답변글일 경우 들여쓰기 정도(원글:0)
    IP          VARCHAR2(20)    NOT NULL,   -- 작성자의 컴퓨터 IP주소
    RDATE       DATE            DEFAULT SYSDATE    -- 글쓴 시점(날짜 + 시간)
);

SELECT * FROM BOARD;

-- 글 갯수
SELECT COUNT(*) CNT FROM BOARD;

-- 글 목록(최신글이 맨 위로)
SELECT * FROM BOARD ORDER BY REF DESC;

-- 글쓰기
-- 글번호 가져오기
SELECT NVL(MAX(NUM),0)+1 FROM BOARD;
INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, REF_STEP, RE_LEVEL, IP) 
        VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '홍길동', '내가 홍길동이다', '아버지를 아버지라 못하는데 어찌해야 하나요?', 
                NULL, 111, (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.20.59');
UPDATE BOARD SET HIT = 100 WHERE NUM = 2;
-- 글번호로 글(DTO) 가져오기
SELECT * FROM BOARD WHERE NUM = 2;

-- HIT수 올리기
UPDATE BOARD SET HIT = HIT +1 WHERE NUM = 1;

-- 글 수정하기
UPDATE BOARD SET WRITER = '하하하', 
                SUBJECT = '혼자있고싶네요', 
                CONTENT = '모두 나가주세요...', 
                EMAIL = 'A@A.COM', 
                PW = 222 
        WHERE NUM = 1;

-- 글 삭제하기
DELETE FROM BOARD WHERE NUM = 1 AND PW = 222;


COMMIT;
















