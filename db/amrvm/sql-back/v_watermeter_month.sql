CREATE VIEW v_watermeter_month
  AS
    SELECT
  /*水表编号*/
  阀温度.[通断控制器ID] AS watermeter_num,
  /*采集月份*/
  CONVERT ( VARCHAR ( 7 ), [日期时间], 120 ) AS collect_month,
  /*最小采集日期*/
  MIN(CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
  /*累计流量*/
  MAX (阀温度.[室温2] ) AS total_flow
FROM
  [阀温度]
GROUP BY
  阀温度.[通断控制器ID],
  CONVERT (
        VARCHAR ( 7 ),
        [日期时间],
        120
  );