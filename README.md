springboot 2.7 / jdk 1.8 / jsp + jstl 1.2 / maven / oracle
chart.js / excel.js / ag-grid 

Request for just 1 page working structure > all page open in parent page by div
- 한개의 웹페이지에서 모든 페이지가 열리고 닫히는 형태로 요청되어 구축한 구조입니다.


source working on local oracle DB > only table script, data not include
oracle table script start
-------------------------
CREATE TABLE TB_WTM_IS_BS_CLASS"
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