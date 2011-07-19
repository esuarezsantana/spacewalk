-- created by Oraschemadoc Tue Jul 19 17:31:03 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNVERSIONINFO" 
   (	"LABEL" VARCHAR2(64) NOT NULL ENABLE, 
	"NAME_ID" NUMBER NOT NULL ENABLE, 
	"EVR_ID" NUMBER NOT NULL ENABLE, 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_VERSIONINFO_NID_FK" FOREIGN KEY ("NAME_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGENAME" ("ID") ENABLE, 
	 CONSTRAINT "RHN_VERSIONINFO_EID_FK" FOREIGN KEY ("EVR_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGEEVR" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
