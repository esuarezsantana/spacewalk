-- created by Oraschemadoc Tue Jul 19 17:31:00 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNSET" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"LABEL" VARCHAR2(32) NOT NULL ENABLE, 
	"ELEMENT" NUMBER NOT NULL ENABLE, 
	"ELEMENT_TWO" NUMBER, 
	"ELEMENT_THREE" NUMBER, 
	 CONSTRAINT "RHN_SET_USER_LABEL_ELEM_UNQ" UNIQUE ("USER_ID", "LABEL", "ELEMENT", "ELEMENT_TWO", "ELEMENT_THREE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_SET_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SPACEWALK"."WEB_CONTACT" ("ID") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
