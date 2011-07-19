-- created by Oraschemadoc Tue Jul 19 17:30:56 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNPACKAGERECOMMENDS" 
   (	"PACKAGE_ID" NUMBER NOT NULL ENABLE, 
	"CAPABILITY_ID" NUMBER NOT NULL ENABLE, 
	"SENSE" NUMBER DEFAULT (0) NOT NULL ENABLE, 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_PKG_REC_PACKAGE_FK" FOREIGN KEY ("PACKAGE_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGE" ("ID") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "RHN_PKG_REC_CAPABILITY_FK" FOREIGN KEY ("CAPABILITY_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGECAPABILITY" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
