CREATE VIEW v_watermeter_week_flow
  AS
    SELECT
  /*水表编号*/
  vwc1.watermeter_num,
  /*当周读数*/
  vwc1.total_flow AS count_cw,
  /*前周读数*/
  vwc2.total_flow AS count_yw,
  /*当周流量*/
  CASE

  WHEN (( vwc1.total_flow - vwc2.total_flow ) > 0 ) THEN
    ( vwc1.total_flow - vwc2.total_flow ) ELSE vwc1.total_flow
  END AS flow_week,
  /*当周周数*/
  vwc1.collect_week AS collect_cw,
  /*前周周数*/
  vwc2.collect_week AS collect_yw,
  /*当前月份*/
  CONVERT ( VARCHAR ( 7 ), vwc1.collect_date, 120 ) AS collect_month,
  /*当前季度*/
  DATENAME( quarter, vwc1.collect_date ) AS collect_quarter,
  /*当前年份*/
  DATENAME( YEAR, vwc1.collect_date ) AS collect_year
FROM
  v_watermeter_week AS vwc1
  LEFT JOIN v_watermeter_week AS vwc2 ON vwc1.watermeter_num = vwc2.watermeter_num
                                         AND datediff( week, vwc1.collect_date, vwc2.collect_date ) = - 1;