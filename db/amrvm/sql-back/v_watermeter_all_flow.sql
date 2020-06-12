CREATE VIEW v_watermeter_all_flow
  AS
    SELECT DISTINCT
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
  INNER JOIN v_watermeter_day_flow AS wdf ON w.watermeter_num = wdf.watermeter_num
  INNER JOIN v_watermeter_week_flow AS wwf ON wdf.watermeter_num = wwf.watermeter_num
                                              AND wdf.collect_week = wwf.collect_cw
  INNER JOIN v_watermeter_month_flow AS wmf ON wwf.watermeter_num = wmf.watermeter_num
                                               AND wdf.collect_month = wmf.collect_cm
  INNER JOIN v_watermeter_quarter_flow AS wqf ON wmf.watermeter_num = wqf.watermeter_num
                                                 AND wdf.collect_quarter = wqf.collect_cq
  INNER JOIN v_watermeter_year_flow AS wyf ON wqf.watermeter_num = wyf.watermeter_num
                                              AND wdf.collect_year = wyf.collect_cy
/*因为有的周会跨两个月份，所以这部分数据可能会重复，此问题通过连接条件已解决，数据量少，待进一步验证*/ /*WHERE
	wdf.watermeter_num = '24400028'
	AND wdf.collect_cd = '2017-11-24'
ORDER BY
	w.watermeter_num ASC,
	wdf.collect_cd DESC,
	wwf.collect_cw DESC*/
;