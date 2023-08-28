              
DROP INDEX PK_BOARD;                
/* 커뮤니티 */                
DROP TABLE BOARD                
        CASCADE CONSTRAINTS;                
/* 커뮤니티 */                
CREATE TABLE BOARD (                
        SEQ NUMBER(8) NOT NULL,
        TITLE VARCHAR2(200) NOT NULL,
        CONTENTS CLOB, 
        DIV VARCHAR2(2), 
        READ_CNT NUMBER(8) DEFAULT 0,           
        REG_DT DATE DEFAULT SYSDATE,
        REG_ID VARCHAR2(20),
        MOD_DT DATE DEFAULT SYSDATE,
        MOD_ID VARCHAR2(20)
);                
COMMENT ON TABLE BOARD IS '커뮤니티';               
COMMENT ON COLUMN BOARD.SEQ IS '순번';                
COMMENT ON COLUMN BOARD.DIV IS '구분';                
COMMENT ON COLUMN BOARD.TITLE IS '제목';                
COMMENT ON COLUMN BOARD.CONTENTS IS '내용';               
COMMENT ON COLUMN BOARD.READ_CNT IS '조회수';                
COMMENT ON COLUMN BOARD.REG_DT IS '등록일';                
COMMENT ON COLUMN BOARD.REG_ID IS '등록자';                
COMMENT ON COLUMN BOARD.MOD_DT IS '수정일';                
COMMENT ON COLUMN BOARD.MOD_ID IS '수정자';                
CREATE UNIQUE INDEX PK_BOARD                
        ON BOARD (                
                SEQ ASC               
        );                
ALTER TABLE BOARD               
        ADD               
                CONSTRAINT PK_BOARD               
                PRIMARY KEY (               
                        SEQ               
                );                


--SEQUENCE
CREATE SEQUENCE board_seq;

--목록조회
SELECT A.*,B.*
FROM (
    SELECT TT1.rnum as num,
           TT1.title,
           TT1.div,
           TT1.read_cnt,
           --당일 등록이면 : 16:26 그렇치 않으면 2023/06/28
           DECODE( TO_CHAR(TT1.mod_dt,'YYYYMMDD'),TO_CHAR(sysdate,'YYYYMMDD')
                  ,TO_CHAR(TT1.mod_dt,'HH24:MI')
                  ,TO_CHAR(TT1.mod_dt,'YYYY/MM/DD') )mod_dt,
           TT1.mod_id,
           TT1.seq
    FROM (
        SELECT ROWNUM as rnum, t1.*
        FROM (
            SELECT *
            FROM board
            --WHERE 
            ORDER BY mod_dt DESC
        )t1
        WHERE ROWNUM <=10
    )TT1
    WHERE rnum >=1
)A
CROSS JOIN
(
SELECT COUNT(SEQ) totalCnt
FROM board
--WHERE 
)B
;

TRUNCATE TABLE BOARD;

INSERT INTO BOARD 
SELECT    ROWNUM AS SEQ,
   '제목_'||  lpad(ROWNUM,7,'0') AS TITLE,
   '내용_'||  lpad(ROWNUM,7,'0') AS CONTENTS,
     DECODE(MOD(ROWNUM,2),0,'10','20') AS DIV, 
   0,
   (SYSDATE - ROWNUM/(60*60)) REG_DT,
     'ADMIN' REG_ID,
   (SYSDATE - ROWNUM/(60*60)) MOD_DT,
   'ADMIN' MOD_ID
FROM DUAL T1
CONNECT BY level <=100000;
commit;