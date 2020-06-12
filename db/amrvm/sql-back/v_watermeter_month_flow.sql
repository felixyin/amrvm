CREATE VIEW v_watermeter_month_flow
  AS
    SELECT
  /*水表编号*/
  vwc1.watermeter_num,
  /*当月读数*/
  vwc1.total_flow                      AS count_cm,
  /*前月读数*/
  vwc2.total_flow                      AS count_ym,
  /*当月流量*/
  CASE

  WHEN ((vwc1.total_flow - vwc2.total_flow) > 0)
    THEN
      (vwc1.total_flow - vwc2.total_flow)
  ELSE vwc1.total_flow
  END                                  AS flow_month,
  /*当月月份*/
  vwc1.collect_month                   AS collect_cm,
  /*前月月份*/
  vwc2.collect_month                   AS collect_ym,
  /*当前季度*/
  DATENAME(QUARTER, vwc1.collect_date) AS collect_quarter,
  /*当前年份*/
  DATENAME(YEAR, vwc1.collect_date)    AS collect_year
FROM
  v_watermeter_month AS vwc1
  LEFT JOIN v_watermeter_month AS vwc2
    ON vwc1.watermeter_num = vwc2.watermeter_num AND datediff(MONTH, vwc1.collect_date, vwc2.collect_date) = -1;