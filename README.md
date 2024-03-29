springboot 2.7 / jdk 1.8 / jsp + jstl 1.2 / maven / oracle

chart.js / excel.js / ag-grid 

Request for just 1 page working structure > all page open in index page by div
- 한개의 웹페이지에서 모든 페이지가 열리고 닫히는 형태로 요청되어 구축한 구조입니다.


source working on local oracle DB
> table script + menu data
-------------------------
CREATE TABLE "TB_WTM_IS_BS_CLASS"
   (	"CLS_ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"CLS_SC_CD" VARCHAR2(4), 
	"RESULT_CD" VARCHAR2(100), 
	"LD_CLS_CD" VARCHAR2(4), 
	"LD_CLS_NM" VARCHAR2(255), 
	"MD_CLS_CD" VARCHAR2(4), 
	"MD_CLS_NM" VARCHAR2(255), 
	"SD_CLS_CD" VARCHAR2(4), 
	"SD_CLS_NM" VARCHAR2(255), 
	"CLS_LABEL" VARCHAR2(6), 
	"CONFIDENCE" NUMBER(6,3), 
	"SCORE" NUMBER(6,3)
   );
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.CLS_ID IS '분류ID';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.CALL_ID IS '상담ID';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.CLS_SC_CD IS '분류구분코드';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.RESULT_CD IS '분류결과코드';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.LD_CLS_CD IS '대분류코드';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.LD_CLS_NM IS '대분류코드명';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.MD_CLS_CD IS '중분류코드';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.MD_CLS_NM IS '중분류코드명';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.SD_CLS_CD IS '소분류코드';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.SD_CLS_NM IS '소분류코드명';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.CLS_LABEL IS '분류라벨';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.CONFIDENCE IS '예측률';
COMMENT ON COLUMN TB_WTM_IS_BS_CLASS.SCORE IS '스코어';

CREATE TABLE "TB_WTM_IS_BS_KEYWORD" 
   (	"WORD_ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"RESULT_CD" VARCHAR2(6), 
	"KEYWORD" VARCHAR2(255), 
	"SCORE" NUMBER(6,3), 
	"COUNT" NUMBER(11,0), 
	"TAG" VARCHAR2(255)
   ) ;

CREATE TABLE "TB_WTM_IS_BS_NOTMATCH" 
   (	"ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"RESULT_CD" VARCHAR2(6), 
	"START_DT" DATE, 
	"END_DT" DATE
   ) ;

CREATE TABLE "TB_WTM_IS_BS_RELWORD" 
   (	"WORD_ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"RESULT_CD" VARCHAR2(6), 
	"KEYWORD" VARCHAR2(255), 
	"RWORD01" VARCHAR2(255), 
	"SCORE01" NUMBER(6,3), 
	"RWORD02" VARCHAR2(255), 
	"SCORE02" NUMBER(6,3), 
	"RWORD03" VARCHAR2(255), 
	"SCORE03" NUMBER(6,3), 
	"RWORD04" VARCHAR2(255), 
	"SCORE04" NUMBER(6,3), 
	"RWORD05" VARCHAR2(255), 
	"SCORE05" NUMBER(6,3)
   );

CREATE TABLE "TB_WTM_IS_BS_SENT" 
   (	"SENT_ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"CONTENT_ID" VARCHAR2(255), 
	"CONTENTS" VARCHAR2(1024), 
	"RESULT_CD" VARCHAR2(6), 
	"CLS_LABEL" VARCHAR2(255), 
	"CONFIDENCE" NUMBER, 
	"SCORE" NUMBER(38,0)
   ) ;

CREATE TABLE "TB_WTM_IS_BS_STOPWORD" 
   (	"PWORD_ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"RESULT_CD" VARCHAR2(6), 
	"KEYWORD" VARCHAR2(255), 
	"COUNT" NUMBER(6,3), 
	"DIC_TYPE" VARCHAR2(10)
   );

CREATE TABLE "TB_WTM_IS_BS_SUMM" 
   (	"SUMM_ID" NUMBER(11,0), 
	"CALL_ID" VARCHAR2(30), 
	"RESULT_CD" VARCHAR2(6), 
	"SUMM_STRING" VARCHAR2(4000)
   );

CREATE TABLE "TB_WTM_IS_CLSCODE" 
   (	"CSELTYPECD" VARCHAR2(12), 
	"CENTERCD" VARCHAR2(6), 
	"PARCSELTYPECD" VARCHAR2(12), 
	"CSELTYPENM" VARCHAR2(128), 
	"CSELTYPEORD" NUMBER(38,0), 
	"USEFG" VARCHAR2(1), 
	"CSELTYPEDEPTH" NUMBER(38,0), 
	"CSELTYPEDESC" VARCHAR2(512), 
	"REGUSERID" VARCHAR2(24), 
	"REGDT" DATE, 
	"MODUSERID" VARCHAR2(24), 
	"MODDT" DATE
   ) ;

CREATE TABLE "TB_WTM_IS_CODE" 
   (	"GROUP_CD" VARCHAR2(100), 
	"GROUP_NM" VARCHAR2(100), 
	"CODE" VARCHAR2(100), 
	"NAME" VARCHAR2(50), 
	"USE_YN" VARCHAR2(1), 
	"SORT_ORDER" NUMBER, 
	"REG_DT" DATE, 
	"REG_USER_ID" VARCHAR2(100), 
	"MOD_DT" DATE, 
	"MOD_USER_ID" VARCHAR2(100)
   );

CREATE TABLE "TB_WTM_IS_DICTIONARIES"
(	"DIC_ID" NUMBER(11,0),
"DIC_NAME" VARCHAR2(100),
"DIC_TYPE" VARCHAR2(100),
"DIC_DESC" VARCHAR2(500),
"KEYWORD" VARCHAR2(100),
"USE_YN" VARCHAR2(1),
"SORT_ORDER" NUMBER,
"REG_DT" DATE,
"REG_USER_ID" VARCHAR2(100),
"MOD_DT" DATE,
"MOD_USER_ID" VARCHAR2(100)
) ;

CREATE TABLE "TB_WTM_IS_SESS"
(	"SESS_ID" NUMBER(11,0),
"CALL_ID" VARCHAR2(30),
"STT_ID" VARCHAR2(30),
"REC_ID" VARCHAR2(30),
"AGENT_ID" VARCHAR2(11),
"AGENT_NM" VARCHAR2(20),
"BLNT_BRNO" VARCHAR2(4),
"CUST_ID" VARCHAR2(255),
"GNDR_CD" VARCHAR2(4),
"AGE_CD" VARCHAR2(4),
"CUST_SC_CD" VARCHAR2(4),
"INOUT_SC_CD" VARCHAR2(4),
"CHANNEL_SC_CD" VARCHAR2(4),
"CALL_START_DT" DATE,
"CALL_END_DT" DATE,
"ANA_STATUS" VARCHAR2(6),
"ANA_COMP_DT" DATE,
"MUTE_COUNT" NUMBER,
"MUTE_TIME" NUMBER,
"SENT_CLS_CD" VARCHAR2(6),
"SENT_CLS_PT" NUMBER(4,2)
) ;

COMMENT ON COLUMN TB_WTM_IS_SESS.SESS_ID IS '세션ID';
COMMENT ON COLUMN TB_WTM_IS_SESS.CALL_ID IS '상담ID';
COMMENT ON COLUMN TB_WTM_IS_SESS.STT_ID IS 'STT_ID';
COMMENT ON COLUMN TB_WTM_IS_SESS.REC_ID IS '녹취ID';
COMMENT ON COLUMN TB_WTM_IS_SESS.AGENT_ID IS '상담사사번';
COMMENT ON COLUMN TB_WTM_IS_SESS.AGENT_NM IS '상담사이름';
COMMENT ON COLUMN TB_WTM_IS_SESS.BLNT_BRNO IS '지점코드';
COMMENT ON COLUMN TB_WTM_IS_SESS.CUST_ID IS '고객ID';
COMMENT ON COLUMN TB_WTM_IS_SESS.GNDR_CD IS '성별코드';
COMMENT ON COLUMN TB_WTM_IS_SESS.AGE_CD IS '연령대코드';
COMMENT ON COLUMN TB_WTM_IS_SESS.CUST_SC_CD IS '회원구분코드';
COMMENT ON COLUMN TB_WTM_IS_SESS.INOUT_SC_CD IS '매체구분코드';
COMMENT ON COLUMN TB_WTM_IS_SESS.CHANNEL_SC_CD IS '채널구분코드';
COMMENT ON COLUMN TB_WTM_IS_SESS.CALL_START_DT IS '콜시작시간';
COMMENT ON COLUMN TB_WTM_IS_SESS.CALL_END_DT IS '콜종료시간';
COMMENT ON COLUMN TB_WTM_IS_SESS.ANA_STATUS IS '분석상태';
COMMENT ON COLUMN TB_WTM_IS_SESS.ANA_COMP_DT IS '분석완료시간';
COMMENT ON COLUMN TB_WTM_IS_SESS.MUTE_COUNT IS '묵음 갯수';
COMMENT ON COLUMN TB_WTM_IS_SESS.MUTE_TIME IS '묵음 시간';
COMMENT ON COLUMN TB_WTM_IS_SESS.SENT_CLS_CD IS '긍부정구분코드';

CREATE TABLE "TB_WTM_STAT_CLASS"
(	"ID" NUMBER(11,0),
"YEAR" NUMBER(11,0),
"MONTH" NUMBER(11,0),
"WEEK" NUMBER(11,0),
"DAY" NUMBER(11,0),
"HOUR" NUMBER(11,0),
"MINUTE" NUMBER(11,0),
"CLS_LABEL" VARCHAR2(6),
"SENT_CLS_CD" VARCHAR2(6),
"BLNT_BRNO" VARCHAR2(4),
"INOUT_SC_CD" VARCHAR2(4),
"CHANNEL_SC_CD" VARCHAR2(4),
"COUNT" NUMBER(11,0),
"DIV" VARCHAR2(2)
);

CREATE TABLE "TB_WTM_STAT_KEYWORD"
(	"ID" NUMBER(11,0),
"YEAR" NUMBER(11,0),
"MONTH" NUMBER(11,0),
"WEEK" NUMBER(11,0),
"DAY" NUMBER(11,0),
"HOUR" NUMBER(11,0),
"MINUTE" NUMBER(11,0),
"CLS_LABEL" VARCHAR2(6),
"KEYWORD" VARCHAR2(255),
"INOUT_SC_CD" VARCHAR2(4),
"CHANNEL_SC_CD" VARCHAR2(4),
"COUNT" NUMBER(11,0),
"DIV" VARCHAR2(2)
) ;

CREATE TABLE "TB_WTM_STAT_SENTIMENT"
(	"ID" NUMBER(11,0),
"YEAR" NUMBER(11,0),
"MONTH" NUMBER(11,0),
"WEEK" NUMBER(11,0),
"DAY" NUMBER(11,0),
"HOUR" NUMBER(11,0),
"MINUTE" NUMBER(11,0),
"AGENT_ID" VARCHAR2(11),
"SENT_CLS_CD" VARCHAR2(6),
"COUNT" NUMBER(11,0),
"DIV" VARCHAR2(2),
"AGENT_NM" VARCHAR2(100)
);

CREATE TABLE "TB_WTM_STAT_STOPWORD"
(	"ID" NUMBER(11,0),
"YEAR" NUMBER(11,0),
"MONTH" NUMBER(11,0),
"WEEK" NUMBER(11,0),
"DAY" NUMBER(11,0),
"HOUR" NUMBER(11,0),
"MINUTE" NUMBER(11,0),
"DIC_TYPE" VARCHAR2(10),
"KEYWORD" VARCHAR2(255),
"INOUT_SC_CD" VARCHAR2(4),
"CHANNEL_SC_CD" VARCHAR2(4),
"COUNT" NUMBER(11,0),
"DIV" VARCHAR2(2)
);

CREATE TABLE "TM_SSO_USR_INF"
(	"SSO_ID" VARCHAR2(100),
"USR_NM" VARCHAR2(100),
"BLNT_BRNO" VARCHAR2(100),
"HLFC_DSCD" VARCHAR2(100)
);

CREATE TABLE "WISETM_ACTION_HISTORY"
(	"ACTION_ID" NUMBER(11,0),
"ACTION_DT" DATE,
"ACTION_TYPE" VARCHAR2(50),
"RESOURCE_ID" NUMBER(11,0),
"RESOURCE_TYPE" VARCHAR2(20),
"ACTION_MSG" VARCHAR2(500),
"ACTION_USER" VARCHAR2(100),
"PARAMS" VARCHAR2(4000),
"USER_IP" VARCHAR2(15)
);

CREATE TABLE "WISETM_MENU_INFO"
(	"MENU_ID" VARCHAR2(100),
"MENU_NAME" VARCHAR2(100),
"MENU_URL" VARCHAR2(100),
"UPPER_MENU_ID" VARCHAR2(100),
"MENU_ORDER" NUMBER(*,0),
"CRE_DT" TIMESTAMP (6) DEFAULT sysdate,
"CRE_USER" VARCHAR2(100),
"MOD_DT" TIMESTAMP (6),
"MOD_USER" VARCHAR2(100),
CONSTRAINT "WISETM_MENU_INFO_PK" PRIMARY KEY ("MENU_ID")
) ;

CREATE TABLE "WISETM_USERAUTH_MENU"
(	"MENU_ID" VARCHAR2(100),
"USER_AUTH" VARCHAR2(10),
CONSTRAINT "WISETM_USERAUTH_MENU_PK" PRIMARY KEY ("MENU_ID", "USER_AUTH")
)  ;


CREATE TABLE "WISETM_USER_INFO"
(	"USER_ID" VARCHAR2(10) NOT NULL ENABLE,
"USER_PW" VARCHAR2(500),
"USER_NAME" VARCHAR2(100),
"USER_EMAIL" VARCHAR2(500),
"USER_AUTH" VARCHAR2(10),
"CRE_DT" TIMESTAMP (6) DEFAULT sysdate,
"CRE_USER" VARCHAR2(100),
"MOD_DT" TIMESTAMP (6),
"MOD_USER" VARCHAR2(100),
"LOGIN_FAIL_CNT" NUMBER(38,0) DEFAULT 0,
"USE_YN" VARCHAR2(1) DEFAULT 'N',
"ACTIVE_YN" VARCHAR2(1) DEFAULT 'N',
"INIT_YN" VARCHAR2(1) DEFAULT 'N',
"PW_CHG_DT" DATE,
"ALARM_YN" VARCHAR2(1) DEFAULT 'N',
"BLNT_BRNO" VARCHAR2(4),
"HLFC_DSCD" VARCHAR2(1),
PRIMARY KEY ("USER_ID")
) ;

CREATE SEQUENCE SEQ_TB_WTM_IS_DICTIONARIES;
CREATE SEQUENCE SEQ_WISETM_ACTION_HISTORY;
