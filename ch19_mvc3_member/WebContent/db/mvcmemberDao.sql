DROP TABLE MVC_MEMEBER;

CREATE TABLE MVC_MEMBER (
    mId         VARCHAR2(30) PRIMARY KEY,
    mPw         VARCHAR2(30)    NOT NULL,
    mName       VARCHAR2(30)    NOT NULL,
    mEmail      VARCHAR2(30),
    mPhoto      VARCHAR2(30)    DEFAULT 'NOTHING.JPG' NOT NULL,
    mBirth      DATE,
    mAddress    VARCHAR2(300),
    mRdate      DATE            DEFAULT SYSDATE
);

-- mId 중복체크
SELECT COUNT(*) FROM MVC_MEMBER WHERE mID = 'aaa';

-- 회원가입 (mId, mPw, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
INSERT INTO MVC_MEMBER (mId, mPw, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('aaa', '111', '홍길동', 'hong@hong.com', 'NOTHING.JPG', null, '서울시 종로구');

-- 로그인(mID, mPW)
SELECT * FROM MVC_MEMBER WHERE mID = 'aaa' AND mPW = '111';  -- 아이디나 비번이 틀린경우

SELECT * FROM MVC_MEMBER WHERE mID = 'aaa'; -- 아이디FAIL과 비번 FAIL을 나눌 경우

-- 세션에 넣기 위해 mId로 MEMBER DTO 가져오기
SELECT * FROM MVC_MEMBER WHERE mID = 'aaa';

-- 회원정보수정
UPDATE MVC_MEMBER SET mPW = '222',
                    mNAME = '고길동',
                    mPHOTO = 'NOTHING.JPG',
                    mBIRTH = '1990/09/09',
                    mADDRESS = '경기도 성남시'
        WHERE mID = 'aaa';

-- 회원목록 출력 (startRow, endRow)
SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC;

SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC) A) 
WHERE RN BETWEEN 1 AND 3;


COMMIT;

SELECT * FROM MVC_MEMBER WHERE mID = 'bbb';









