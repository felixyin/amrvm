ALTER TABLE iot_watermeter_vpt
  ADD create_by VARCHAR(64) NULL;

ALTER TABLE iot_watermeter_vpt
  ADD create_date DATETIME NULL;

ALTER TABLE iot_watermeter_vpt
  ADD update_by VARCHAR(64) NULL;

ALTER TABLE iot_watermeter_vpt
  ADD update_date DATETIME NULL;

ALTER TABLE iot_watermeter_vpt
  ADD remarks VARCHAR(255);

ALTER TABLE iot_watermeter_vpt
  ADD del_flag CHAR(1) DEFAULT '0'  NULL;
