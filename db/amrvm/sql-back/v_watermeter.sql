
CREATE VIEW v_watermeter
  AS
    SELECT
  /*猪场名称*/
  DBO.CHINA_STR ( t.[小区] ) AS farm_name,
  /*集中器名称*/
  t.[小区] AS concentrator_name,
  /*集中器编号*/
  t.[集中器ID] AS concentrator_num,
  /*猪舍名称*/
  t.[楼栋名称] AS house_name,
  /*水表位置*/
  t.[热户姓名] AS room_name,
  /*水表用途*/
  CASE
  CHARINDEX( '水帘', t.[热户姓名] )
  WHEN 0 THEN
    DBO.CHINA_STR ( t.[楼栋名称] ) ELSE '水帘'
  END AS watermeter_type,
  /*水表编号*/
  RIGHT(t.[通断控制器ID],8) AS watermeter_num,
  /*水表状态*/
  t.[地址] AS watermeter_status,
  /*安装日期*/
  t.[备注] AS installed_time
FROM
  [基础信息] AS t;