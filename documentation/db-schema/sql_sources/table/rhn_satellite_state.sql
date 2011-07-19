-- created by Oraschemadoc Tue Jul 19 17:31:07 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_SATELLITE_STATE" 
   (	"SATELLITE_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"LAST_CHECK" DATE, 
	"PROBE_COUNT" NUMBER(10,0), 
	"PCT_OK" NUMBER(10,2), 
	"PCT_WARNING" NUMBER(10,2), 
	"PCT_CRITICAL" NUMBER(10,2), 
	"PCT_UNKNOWN" NUMBER(10,2), 
	"PCT_PENDING" NUMBER(10,2), 
	"RECENT_STATE_CHANGES" NUMBER(10,0), 
	"IMMINENT_PROBES" NUMBER(10,0), 
	"MAX_EXEC_TIME" NUMBER(10,2), 
	"MIN_EXEC_TIME" NUMBER(10,2), 
	"AVG_EXEC_TIME" NUMBER(10,2), 
	"MAX_LATENCY" NUMBER(10,2), 
	"MIN_LATENCY" NUMBER(10,2), 
	"AVG_LATENCY" NUMBER(10,2), 
	 CONSTRAINT "RHN_SATST_SAT_ID_PK" PRIMARY KEY ("SATELLITE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
