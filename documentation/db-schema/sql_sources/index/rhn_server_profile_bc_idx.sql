-- created by Oraschemadoc Tue Jul 19 17:31:22 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE INDEX "SPACEWALK"."RHN_SERVER_PROFILE_BC_IDX" ON "SPACEWALK"."RHNSERVERPROFILE" ("BASE_CHANNEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
