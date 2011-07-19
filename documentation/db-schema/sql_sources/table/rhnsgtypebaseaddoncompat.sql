-- created by Oraschemadoc Tue Jul 19 17:31:00 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNSGTYPEBASEADDONCOMPAT" 
   (	"BASE_ID" NUMBER NOT NULL ENABLE, 
	"ADDON_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "RHN_SGT_BAC_BID_FK" FOREIGN KEY ("BASE_ID")
	  REFERENCES "SPACEWALK"."RHNSERVERGROUPTYPE" ("ID") ENABLE, 
	 CONSTRAINT "RHN_SGT_BAC_AID_FK" FOREIGN KEY ("ADDON_ID")
	  REFERENCES "SPACEWALK"."RHNSERVERGROUPTYPE" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
