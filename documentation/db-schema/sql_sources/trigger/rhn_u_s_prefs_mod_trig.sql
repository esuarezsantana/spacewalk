-- created by Oraschemadoc Tue Jul 19 17:31:34 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_U_S_PREFS_MOD_TRIG" 
before insert or update on rhnUserServerPrefs
for each row
begin
        :new.modified := sysdate;
        :new.value := upper(:new.value);
end;
ALTER TRIGGER "SPACEWALK"."RHN_U_S_PREFS_MOD_TRIG" ENABLE
 
/
