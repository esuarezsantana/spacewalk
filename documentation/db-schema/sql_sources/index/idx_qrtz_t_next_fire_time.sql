-- created by Oraschemadoc Tue Jul 19 17:31:09 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE INDEX "SPACEWALK"."IDX_QRTZ_T_NEXT_FIRE_TIME" ON "SPACEWALK"."QRTZ_TRIGGERS" ("NEXT_FIRE_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
