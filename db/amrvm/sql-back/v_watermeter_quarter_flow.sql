CREATE VIEW v_watermeter_quarter_flow
  AS
    SELECT
  /*水表编号*/
  vwc1.watermeter_num,
  /*当季读数*/
  vwc1.total_flow AS count_cq,
  /*前季读数*/
  vwc2.total_flow AS count_yq,
  /*当季流量*/
  CASE

  WHEN (( vwc1.total_flow - vwc2.total_flow ) > 0 ) THEN
    ( vwc1.total_flow - vwc2.total_flow ) ELSE vwc1.total_flow
  END AS flow_quarter,
  /*当季季度*/
  vwc1.collect_quarter AS collect_cq,
  /*前季季度*/
  vwc2.collect_quarter AS collect_yq,
  /*当前年份*/
  DATENAME( YEAR, vwc1.collect_date ) AS collect_year
FROM
  v_watermeter_quarter AS vwc1
  LEFT JOIN v_watermeter_quarter AS vwc2 ON vwc1.watermeter_num = vwc2.watermeter_num
                                            AND datediff( quarter, vwc1.collect_date, vwc2.collect_date ) = - 1;