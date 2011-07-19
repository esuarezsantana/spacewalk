-- created by Oraschemadoc Tue Jul 19 17:31:05 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_MULTI_SCOUT_THRESHOLD" 
   (	"PROBE_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"SCOUT_WARNING_THRESHOLD_IS_ALL" CHAR(1) DEFAULT ('1') NOT NULL ENABLE, 
	"SCOUT_CRIT_THRESHOLD_IS_ALL" CHAR(1) DEFAULT ('1') NOT NULL ENABLE, 
	"SCOUT_WARNING_THRESHOLD" NUMBER(12,0), 
	"SCOUT_CRITICAL_THRESHOLD" NUMBER(12,0), 
	 CONSTRAINT "RHN_MSTHR_PROBE_ID_PK" PRIMARY KEY ("PROBE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
