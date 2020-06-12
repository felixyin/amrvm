CREATE VIEW v_watermeter_year_flow
  AS
    SELECT
  /*水表编号*/
  vwc1.watermeter_num,
  /*当年读数*/
  vwc1.total_flow AS count_cy,
  /*前年读数*/
  vwc2.total_flow AS count_yy,
  /*当年流量*/
  CASE

  WHEN (( vwc1.total_flow - vwc2.total_flow ) > 0 ) THEN
    ( vwc1.total_flow - vwc2.total_flow ) ELSE vwc1.total_flow
  END AS flow_year,
  /*当年年份*/
  vwc1.collect_year AS collect_cy,
  /*前年年份*/
  vwc2.collect_year AS collect_yy
FROM
  v_watermeter_year AS vwc1
  LEFT JOIN v_watermeter_year AS vwc2 ON vwc1.watermeter_num = vwc2.watermeter_num
                                         AND datediff( YEAR, vwc1.collect_date, vwc2.collect_date ) = - 1;