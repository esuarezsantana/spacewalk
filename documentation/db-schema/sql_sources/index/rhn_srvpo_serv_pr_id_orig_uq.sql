-- created by Oraschemadoc Tue Jul 19 17:31:24 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE UNIQUE INDEX "SPACEWALK"."RHN_SRVPO_SERV_PR_ID_ORIG_UQ" ON "SPACEWALK"."RHN_SERVICE_PROBE_ORIGINS" ("SERVICE_PROBE_ID", "ORIGIN_PROBE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
