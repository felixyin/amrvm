CREATE VIEW v_watermeter_week
  AS
    SELECT
  /*水表编号*/
  阀温度.[通断控制器ID] AS watermeter_num,
  /*采集月份*/
  DATENAME( week, [日期时间] ) AS collect_week,
  /*最小采集日期*/
  MIN (
      CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
  /*累计流量*/
  MAX (阀温度.[室温2] ) AS total_flow
FROM
  [阀温度]
GROUP BY
  阀温度.[通断控制器ID],
  DATENAME(
      week,
      [日期时间]);