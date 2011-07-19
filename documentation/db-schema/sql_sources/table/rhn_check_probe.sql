-- created by Oraschemadoc Tue Jul 19 17:31:04 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_CHECK_PROBE" 
   (	"PROBE_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"PROBE_TYPE" VARCHAR2(12) DEFAULT ('check') NOT NULL ENABLE, 
	"HOST_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"SAT_CLUSTER_ID" NUMBER(12,0) NOT NULL ENABLE, 
	 CONSTRAINT "CHKPB_PROBE_TYPE_CK" CHECK (probe_type='check') ENABLE, 
	 CONSTRAINT "RHN_CHKPB_PROBE_ID_PK" PRIMARY KEY ("PROBE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_CHKPB_HOST_ID_FK" FOREIGN KEY ("HOST_ID")
	  REFERENCES "SPACEWALK"."RHNSERVER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CHKPB_RECID_PROBE_TYP_FK" FOREIGN KEY ("PROBE_ID", "PROBE_TYPE")
	  REFERENCES "SPACEWALK"."RHN_PROBE" ("RECID", "PROBE_TYPE") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "RHN_CHKPB_SATCL_SAT_CL_ID_FK" FOREIGN KEY ("SAT_CLUSTER_ID")
	  REFERENCES "SPACEWALK"."RHN_SAT_CLUSTER" ("RECID") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
