-- created by Oraschemadoc Tue Jul 19 17:30:45 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."QRTZ_JOB_DETAILS" 
   (	"JOB_NAME" VARCHAR2(200) NOT NULL ENABLE, 
	"JOB_GROUP" VARCHAR2(200) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(250), 
	"JOB_CLASS_NAME" VARCHAR2(250) NOT NULL ENABLE, 
	"IS_DURABLE" VARCHAR2(1) NOT NULL ENABLE, 
	"IS_VOLATILE" VARCHAR2(1) NOT NULL ENABLE, 
	"IS_STATEFUL" VARCHAR2(1) NOT NULL ENABLE, 
	"REQUESTS_RECOVERY" VARCHAR2(1) NOT NULL ENABLE, 
	"JOB_DATA" BLOB, 
	 PRIMARY KEY ("JOB_NAME", "JOB_GROUP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 LOB ("JOB_DATA") STORE AS (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)) 
 
/
