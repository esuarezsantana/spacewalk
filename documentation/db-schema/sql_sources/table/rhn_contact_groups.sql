-- created by Oraschemadoc Tue Jul 19 17:31:05 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_CONTACT_GROUPS" 
   (	"RECID" NUMBER NOT NULL ENABLE, 
	"CONTACT_GROUP_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"STRATEGY_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"ACK_WAIT" NUMBER(4,0) NOT NULL ENABLE, 
	"ROTATE_FIRST" CHAR(1) NOT NULL ENABLE, 
	"LAST_UPDATE_USER" VARCHAR2(40) NOT NULL ENABLE, 
	"LAST_UPDATE_DATE" DATE NOT NULL ENABLE, 
	"NOTIFICATION_FORMAT_ID" NUMBER(12,0) DEFAULT (4) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_CNTGP_RECID_NOTZERO" CHECK (recid > 0) ENABLE, 
	 CONSTRAINT "RHN_CNTGP_ACK_WAIT_CK" CHECK ( ack_wait < 20160 ) ENABLE, 
	 CONSTRAINT "RHN_CNTGP_ROTATE_F_CK" CHECK (rotate_first in ('0','1')) ENABLE, 
	 CONSTRAINT "RHN_CNTGP_RECID_PK" PRIMARY KEY ("RECID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_CNTGP_CSTMR_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "SPACEWALK"."WEB_CUSTOMER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CNTGP_STRAT_STRATEGY_ID_FK" FOREIGN KEY ("STRATEGY_ID")
	  REFERENCES "SPACEWALK"."RHN_STRATEGIES" ("RECID") ENABLE, 
	 CONSTRAINT "RHN_NTFMT_CNTGP_ID_FK" FOREIGN KEY ("NOTIFICATION_FORMAT_ID")
	  REFERENCES "SPACEWALK"."RHN_NOTIFICATION_FORMATS" ("RECID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
