-- created by Oraschemadoc Tue Jul 19 17:31:06 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_QUANTA" 
   (	"QUANTUM_ID" VARCHAR2(10) NOT NULL ENABLE, 
	"BASIC_UNIT_ID" VARCHAR2(20), 
	"DESCRIPTION" VARCHAR2(200), 
	"LAST_UPDATE_USER" VARCHAR2(40), 
	"LAST_UPDATE_DATE" DATE, 
	 CONSTRAINT "RHN_QNTA0_QUANTUM_ID_PK" PRIMARY KEY ("QUANTUM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
