CREATE VIEW v_watermeter_all_flow_v2
  AS
    WITH day_flow AS (
    SELECT
      /*水表编号*/
      vwc1.watermeter_num,
      /*当日读数*/
      vwc1.total_flow AS count_cd,
      /*前日读数*/
      vwc2.total_flow AS count_yd,
      /*当日流量*/
      CASE

      WHEN (( vwc1.total_flow - vwc2.total_flow ) > 0 ) THEN
        ( vwc1.total_flow - vwc2.total_flow ) ELSE vwc1.total_flow
      END AS flow_day,
      /*当日日期*/
      vwc1.collect_date AS collect_cd,
      /*前日日期*/
      vwc2.collect_date AS collect_yd,
      /*当前周数*/
      DATENAME( week, vwc1.collect_date ) AS collect_week,
      /*当前月份*/
      CONVERT ( VARCHAR ( 7 ), vwc1.collect_date, 120 ) AS collect_month,
      /*当前季度*/
      DATENAME( quarter, vwc1.collect_date ) AS collect_quarter,
      /*当前年份*/
      DATENAME( YEAR, vwc1.collect_date ) AS collect_year
    FROM
      v_watermeter_day AS vwc1
      LEFT JOIN v_watermeter_day AS vwc2 ON vwc1.watermeter_num = vwc2.watermeter_num
                                            AND datediff( DAY, vwc1.collect_date, vwc2.collect_date ) = - 1
),
    week_flow AS (
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
                                               AND datediff( week, vwc1.collect_date, vwc2.collect_date ) = - 1
  ),
    month_flow AS (
      SELECT
        /*水表编号*/
        vwc1.watermeter_num,
        /*当月读数*/
        vwc1.total_flow AS count_cm,
        /*前月读数*/
        vwc2.total_flow AS count_ym,
        /*当月流量*/
        CASE

        WHEN (( vwc1.total_flow - vwc2.total_flow ) > 0 ) THEN
          ( vwc1.total_flow - vwc2.total_flow ) ELSE vwc1.total_flow
        END AS flow_month,
        /*当月月份*/
        vwc1.collect_month AS collect_cm,
        /*前月月份*/
        vwc2.collect_month AS collect_ym,
        /*当前季度*/
        DATENAME( quarter, vwc1.collect_date ) AS collect_quarter,
        /*当前年份*/
        DATENAME( YEAR, vwc1.collect_date ) AS collect_year
      FROM
        v_watermeter_month AS vwc1
        LEFT JOIN v_watermeter_month AS vwc2 ON vwc1.watermeter_num = vwc2.watermeter_num
                                                AND datediff( MONTH, vwc1.collect_date, vwc2.collect_date ) = - 1
  ),
    quarter_flow AS (
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
                                                  AND datediff( quarter, vwc1.collect_date, vwc2.collect_date ) = - 1
  ),
    year_flow AS (
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
                                               AND datediff( YEAR, vwc1.collect_date, vwc2.collect_date ) = - 1
  ) SELECT DISTINCT
      /*猪场名称*/
      w.farm_name,
      /*集中器名称*/
      w.concentrator_name,
      /*集中器编号*/
      w.concentrator_num,
      /*猪舍名称*/
      w.house_name,
      /*水表位置*/
      w.room_name,
      /*水表用途*/
      w.watermeter_type,
      /*水表编号*/
      w.watermeter_num,
      /*水表状态*/
      w.watermeter_status,
      /*安装日期*/
      w.installed_time,
      /*当日表数*/
      wdf.count_cd,
      /*当日日期*/
      wdf.collect_cd,
      /*当日流量*/
      wdf.flow_day,
      /*当周表数*/
      wwf.count_cw,
      /*当周周数*/
      wwf.collect_cw,
      /*当周流量*/
      wwf.flow_week,
      /*当月表数*/
      wmf.count_cm,
      /*当月月份*/
      wmf.collect_cm,
      /*当月流量*/
      wmf.flow_month,
      /*当季表数*/
      wqf.count_cq,
      /*当季季度*/
      wqf.collect_cq,
      /*当季流量*/
      wqf.flow_quarter,
      /*当年表数*/
      wyf.count_cy,
      /*当年年份*/
      wyf.collect_cy,
      /*当年流量*/
      wyf.flow_year
    FROM
      v_watermeter AS w
      INNER JOIN day_flow AS wdf ON w.watermeter_num = wdf.watermeter_num
      INNER JOIN week_flow AS wwf ON wdf.watermeter_num = wwf.watermeter_num
                                     AND wdf.collect_week = wwf.collect_cw
      INNER JOIN month_flow AS wmf ON wwf.watermeter_num = wmf.watermeter_num
                                      AND wdf.collect_month = wmf.collect_cm
      INNER JOIN quarter_flow AS wqf ON wmf.watermeter_num = wqf.watermeter_num
                                        AND wdf.collect_quarter = wqf.collect_cq
      INNER JOIN year_flow AS wyf ON wqf.watermeter_num = wyf.watermeter_num
                                     AND wdf.collect_year = wyf.collect_cy /*因为有的周会跨两个月份，所以这部分数据可能会重复，此问题通过连接条件已解决，数据量少，待进一步验证*/
/*WHERE
	wdf.watermeter_num = '24400028'
	AND wdf.collect_cd = '2017-11-24'
ORDER BY
	w.watermeter_num ASC,
	wdf.collect_cd DESC,
	wwf.collect_cw DESC*/
;