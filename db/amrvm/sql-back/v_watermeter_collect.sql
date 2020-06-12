CREATE VIEW v_watermeter_collect
  AS
    SELECT
  /*水表编号*/
  阀温度.[通断控制器ID] AS watermeter_num,
  /*采集时间*/
  [日期时间] AS collect_time,
  /*累计流量*/
  阀温度.[室温2] AS total_flow
FROM
  [阀温度];