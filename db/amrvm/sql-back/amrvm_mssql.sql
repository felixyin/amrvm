

/* Drop Tables*/

DROP TABLE gen_scheme;
DROP TABLE gen_table_column;
DROP TABLE gen_table;
DROP TABLE gen_template;

/* Drop Tables */
DROP TABLE sys_role_office;
DROP TABLE sys_user_role;
DROP TABLE sys_user;
DROP TABLE sys_office;
DROP TABLE sys_area;
DROP TABLE sys_dict;
DROP TABLE sys_log;
DROP TABLE sys_mdict;
DROP TABLE sys_role_menu;
DROP TABLE sys_menu;
DROP TABLE sys_role;

/* Drop Tables */
DROP TABLE test_data;
DROP TABLE test_data_child;
DROP TABLE test_data_main;
DROP TABLE test_tree;






/* Create Tables */

CREATE TABLE gen_scheme
(
	id varchar(64) NOT NULL,
	name varchar(200),
	category varchar(2000),
	package_name varchar(500),
	module_name varchar(30),
	sub_module_name varchar(30),
	function_name varchar(500),
	function_name_simple varchar(100),
	function_author varchar(100),
	gen_table_id varchar(200),
	create_by varchar(64),
	create_date datetime,
	update_by varchar(64),
	update_date datetime,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE gen_table
(
	id varchar(64) NOT NULL,
	name varchar(200),
	comments varchar(500),
	class_name varchar(100),
	parent_table varchar(200),
	parent_table_fk varchar(100),
	create_by varchar(64),
	create_date datetime,
	update_by varchar(64),
	update_date datetime,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE gen_table_column
(
	id varchar(64) NOT NULL,
	gen_table_id varchar(64),
	name varchar(200),
	comments varchar(500),
	jdbc_type varchar(100),
	java_type varchar(500),
	java_field varchar(200),
	is_pk char(1),
	is_null char(1),
	is_insert char(1),
	is_edit char(1),
	is_list char(1),
	is_query char(1),
	query_type varchar(200),
	show_type varchar(200),
	dict_type varchar(200),
	settings varchar(2000),
	sort decimal,
	create_by varchar(64),
	create_date datetime,
	update_by varchar(64),
	update_date datetime,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE gen_template
(
	id varchar(64) NOT NULL,
	name varchar(200),
	category varchar(2000),
	file_path varchar(500),
	file_name varchar(200),
	content text,
	create_by varchar(64),
	create_date datetime,
	update_by varchar(64),
	update_date datetime,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);



/* Create Indexes */

CREATE INDEX gen_scheme_del_flag ON gen_scheme (del_flag ASC);
CREATE INDEX gen_table_name ON gen_table (name ASC);
CREATE INDEX gen_table_del_flag ON gen_table (del_flag ASC);
CREATE INDEX gen_table_column_table_id ON gen_table_column (gen_table_id ASC);
CREATE INDEX gen_table_column_name ON gen_table_column (name ASC);
CREATE INDEX gen_table_column_sort ON gen_table_column (sort ASC);
CREATE INDEX gen_table_column_del_flag ON gen_table_column (del_flag ASC);
CREATE INDEX gen_template_del_falg ON gen_template (del_flag ASC);







/* Create Tables */

CREATE TABLE sys_area
(
	id varchar(64) NOT NULL,
	parent_id varchar(64) NOT NULL,
	parent_ids varchar(2000) NOT NULL,
	name varchar(100) NOT NULL,
	sort decimal(10,0) NOT NULL,
	code varchar(100),
	type char(1),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_dict
(
	id varchar(64) NOT NULL,
	value varchar(100) NOT NULL,
	label varchar(100) NOT NULL,
	type varchar(100) NOT NULL,
	description varchar(100) NOT NULL,
	sort decimal(10,0) NOT NULL,
	parent_id varchar(64) DEFAULT '0',
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_log
(
	id varchar(64) NOT NULL,
	type char(1) DEFAULT '1',
	title varchar(255) DEFAULT '',
	create_by varchar(64),
	create_date datetime,
	remote_addr varchar(255),
	user_agent varchar(255),
	request_uri varchar(255),
	method varchar(5),
	params text,
	exception text,
	PRIMARY KEY (id)
);


CREATE TABLE sys_mdict
(
	id varchar(64) NOT NULL,
	parent_id varchar(64) NOT NULL,
	parent_ids varchar(2000) NOT NULL,
	name varchar(100) NOT NULL,
	sort decimal(10,0) NOT NULL,
	description varchar(100),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_menu
(
	id varchar(64) NOT NULL,
	parent_id varchar(64) NOT NULL,
	parent_ids varchar(2000) NOT NULL,
	name varchar(100) NOT NULL,
	sort decimal(10,0) NOT NULL,
	href varchar(2000),
	target varchar(20),
	icon varchar(100),
	is_show char(1) NOT NULL,
	permission varchar(200),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_office
(
	id varchar(64) NOT NULL,
	parent_id varchar(64) NOT NULL,
	parent_ids varchar(2000) NOT NULL,
	name varchar(100) NOT NULL,
	sort decimal(10,0) NOT NULL,
	area_id varchar(64) NOT NULL,
	code varchar(100),
	type char(1) NOT NULL,
	grade char(1) NOT NULL,
	address varchar(255),
	zip_code varchar(100),
	master varchar(100),
	phone varchar(200),
	fax varchar(200),
	email varchar(200),
	USEABLE varchar(64),
	PRIMARY_PERSON varchar(64),
	DEPUTY_PERSON varchar(64),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_role
(
	id varchar(64) NOT NULL,
	office_id varchar(64),
	name varchar(100) NOT NULL,
	enname varchar(255),
	role_type varchar(255),
	data_scope char(1),
	is_sys varchar(64),
	useable varchar(64),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_role_menu
(
	role_id varchar(64) NOT NULL,
	menu_id varchar(64) NOT NULL,
	PRIMARY KEY (role_id, menu_id)
);


CREATE TABLE sys_role_office
(
	role_id varchar(64) NOT NULL,
	office_id varchar(64) NOT NULL,
	PRIMARY KEY (role_id, office_id)
);


CREATE TABLE sys_user
(
	id varchar(64) NOT NULL,
	company_id varchar(64) NOT NULL,
	office_id varchar(64) NOT NULL,
	login_name varchar(100) NOT NULL,
	password varchar(100) NOT NULL,
	no varchar(100),
	name varchar(100) NOT NULL,
	email varchar(200),
	phone varchar(200),
	mobile varchar(200),
	user_type char(1),
	photo varchar(1000),
	login_ip varchar(100),
	login_date datetime,
	login_flag varchar(64),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE sys_user_role
(
	user_id varchar(64) NOT NULL,
	role_id varchar(64) NOT NULL,
	PRIMARY KEY (user_id, role_id)
);



/* Create Indexes */

CREATE INDEX sys_area_parent_id ON sys_area (parent_id ASC);
/*CREATE INDEX sys_area_parent_ids ON sys_area (parent_ids ASC);*/
CREATE INDEX sys_area_del_flag ON sys_area (del_flag ASC);
CREATE INDEX sys_dict_value ON sys_dict (value ASC);
CREATE INDEX sys_dict_label ON sys_dict (label ASC);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag ASC);
CREATE INDEX sys_log_create_by ON sys_log (create_by ASC);
CREATE INDEX sys_log_request_uri ON sys_log (request_uri ASC);
CREATE INDEX sys_log_type ON sys_log (type ASC);
CREATE INDEX sys_log_create_date ON sys_log (create_date ASC);
CREATE INDEX sys_mdict_parent_id ON sys_mdict (parent_id ASC);
/*CREATE INDEX sys_mdict_parent_ids ON sys_mdict (parent_ids ASC);*/
CREATE INDEX sys_mdict_del_flag ON sys_mdict (del_flag ASC);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id ASC);
/*CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids ASC);*/
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag ASC);
CREATE INDEX sys_office_parent_id ON sys_office (parent_id ASC);
/*CREATE INDEX sys_office_parent_ids ON sys_office (parent_ids ASC);*/
CREATE INDEX sys_office_del_flag ON sys_office (del_flag ASC);
CREATE INDEX sys_office_type ON sys_office (type ASC);
CREATE INDEX sys_role_del_flag ON sys_role (del_flag ASC);
CREATE INDEX sys_role_enname ON sys_role (enname ASC);
CREATE INDEX sys_user_office_id ON sys_user (office_id ASC);
CREATE INDEX sys_user_login_name ON sys_user (login_name ASC);
CREATE INDEX sys_user_company_id ON sys_user (company_id ASC);
CREATE INDEX sys_user_update_date ON sys_user (update_date ASC);
CREATE INDEX sys_user_del_flag ON sys_user (del_flag ASC);






/* Create Tables */

CREATE TABLE test_data
(
	id varchar(64) NOT NULL,
	user_id varchar(64),
	office_id varchar(64),
	area_id varchar(64),
	name varchar(100),
	sex char(1),
	in_date smalldatetime,
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE test_data_child
(
	id varchar(64) NOT NULL,
	test_data_main_id varchar(64),
	name varchar(100),
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE test_data_main
(
	id varchar(64) NOT NULL,
	user_id varchar(64),
	office_id varchar(64),
	area_id varchar(64),
	name varchar(100),
	sex char(1),
	in_date smalldatetime,
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE test_tree
(
	id varchar(64) NOT NULL,
	parent_id varchar(64) NOT NULL,
	parent_ids varchar(2000) NOT NULL,
	name varchar(100) NOT NULL,
	sort decimal(10,0) NOT NULL,
	create_by varchar(64) NOT NULL,
	create_date datetime NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date datetime NOT NULL,
	remarks varchar(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);



/* Create Indexes */

CREATE INDEX test_data_del_flag ON test_data (del_flag ASC);
CREATE INDEX test_data_child_del_flag ON test_data_child (del_flag ASC);
CREATE INDEX test_data_main_del_flag ON test_data_main (del_flag ASC);
CREATE INDEX test_tree_del_flag ON test_tree (del_flag ASC);
CREATE INDEX test_data_parent_id ON test_tree (parent_id ASC);
/*CREATE INDEX test_data_parent_ids ON test_tree (parent_ids ASC);*/



CREATE FUNCTION CHINA_STR(@S NVARCHAR(100))
	RETURNS VARCHAR(100)
AS
	BEGIN
		WHILE PATINDEX('%[^吖-座]%', @S) > 0
			SET @S = STUFF(@S, PATINDEX('%[^吖-座]%', @S), 1, N'')
		RETURN @S
	END


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

CREATE VIEW v_watermeter_day
	AS
		SELECT
			/*水表编号*/
			阀温度.[通断控制器ID] AS watermeter_num,
			/*采集日期*/
			CONVERT ( CHAR ( 10 ), [日期时间], 120 ) AS collect_date,
			/*累计流量*/
			MAX (阀温度.[室温2] ) AS total_flow
		FROM
			[阀温度]
		GROUP BY
			阀温度.[通断控制器ID],
			CONVERT (
						CHAR ( 10 ),
						[日期时间],
						120);

CREATE VIEW v_watermeter_day_flow
	AS
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
																						AND datediff( DAY, vwc1.collect_date, vwc2.collect_date ) = - 1;

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

CREATE VIEW v_watermeter_quarter
	AS
		SELECT
			/*水表编号*/
			阀温度.[通断控制器ID] AS watermeter_num,
			/*采集季度*/
			DATENAME( quarter, [日期时间] ) AS collect_quarter,
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
					quarter,
					[日期时间]
			);
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

CREATE VIEW v_watermeter_year
	AS
		SELECT
			/*水表编号*/
			阀温度.[通断控制器ID] AS watermeter_num,
			/*采集月份*/
			CONVERT ( VARCHAR ( 4 ), [日期时间], 120 ) AS collect_year,
			/*最小采集日期*/
			MIN(CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
			/*累计流量*/
			MAX (阀温度.[室温2] ) AS total_flow
		FROM
			[阀温度]
		GROUP BY
			阀温度.[通断控制器ID],
			CONVERT ( VARCHAR ( 4 ), [日期时间], 120 );

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


-- prompt Loading GEN_SCHEME...
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.fy.erp.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.fy.erp.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.fy.erp.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 3 records loaded
-- prompt Loading GEN_TABLE...
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 4 records loaded
-- prompt Loading GEN_TABLE_COLUMN...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.fy.erp.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.fy.erp.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.fy.erp.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 46 records loaded
-- insert menu
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', 120, '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', 30, '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', 60, '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', 30, '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', 60, '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', 30, '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', 60, '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', 90, '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', 30, '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', 60, '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
commit;


-- ----------------------------
-- Records of [sys_area]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'1', N'0', N'0,', N'中国', N'10', N'100000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'2', N'1', N'0,1,', N'山东省', N'20', N'110000', N'2', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'3', N'2', N'0,1,2,', N'青岛市', N'30', N'370202', N'3', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:34:56.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'4', N'3', N'0,1,2,3,', N'市南区', N'40', N'370202', N'4', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:35:21.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'5', N'3', N'0,1,2,3,', N'市北区', N'50', N'370203', N'4', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:36:07.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'6', N'3', N'0,1,2,3,', N'崂山区', N'60', N'370212', N'4', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:36:32.000', NULL, N'1')
GO

COMMIT
GO






-- ----------------------------
-- Records of [sys_dict]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'02de20937efd468d9a91f37c35ce8d79', N'1', N'T/T', N'enmu_payment_type', N'付款方式', N'10', N'0', N'1', N'2017-11-03 09:18:06.000', N'1', N'2017-11-03 09:18:06.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'05188faab539432b92df929c54c80d93', N'1', N'状态xxx', N'status_parts_order', N'配件订单状态', N'10', N'0', N'1', N'2017-11-06 10:44:56.000', N'1', N'2017-11-06 10:44:56.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'0543141369ec4329b27e8b878271e5d0', N'1', N'阿里巴巴', N'enmu_customer_source', N'客户来源', N'10', N'0', N'1', N'2017-11-02 17:53:31.000', N'1', N'2017-11-02 17:53:31.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1', N'0', N'正常', N'del_flag', N'删除标记', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'10', N'yellow', N'黄色', N'color', N'颜色值', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'100', N'java.util.Date', N'Date', N'gen_java_type', N'Java类型', N'50', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'101', N'com.fy.erp.modules.sys.entity.User', N'User', N'gen_java_type', N'Java类型', N'60', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'102', N'com.fy.erp.modules.sys.entity.Office', N'Office', N'gen_java_type', N'Java类型', N'70', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'103', N'com.fy.erp.modules.sys.entity.Area', N'Area', N'gen_java_type', N'Java类型', N'80', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'104', N'Custom', N'Custom', N'gen_java_type', N'Java类型', N'90', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'105', N'1', N'会议通告', N'oa_notify_type', N'通知通告类型', N'10', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'105484a2a853439cbc3a6a7b67c1dcc1', N'2', N'海关放行', N'status_shipments', N'发货状态', N'20', N'0', N'1', N'2017-11-05 11:50:22.000', N'1', N'2017-11-05 11:50:38.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'106', N'2', N'奖惩通告', N'oa_notify_type', N'通知通告类型', N'20', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'107', N'3', N'活动通告', N'oa_notify_type', N'通知通告类型', N'30', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'108', N'0', N'草稿', N'oa_notify_status', N'通知通告状态', N'10', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'109', N'1', N'发布', N'oa_notify_status', N'通知通告状态', N'20', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'11', N'orange', N'橙色', N'color', N'颜色值', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'110', N'0', N'未读', N'oa_notify_read', N'通知通告状态', N'10', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'111', N'1', N'已读', N'oa_notify_read', N'通知通告状态', N'20', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'12', N'default', N'默认主题', N'theme', N'主题方案', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'13', N'cerulean', N'天蓝主题', N'theme', N'主题方案', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'14', N'readable', N'橙色主题', N'theme', N'主题方案', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'15', N'united', N'红色主题', N'theme', N'主题方案', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'16', N'flat', N'Flat主题', N'theme', N'主题方案', N'60', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'17', N'1', N'国家', N'sys_area_type', N'区域类型', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'171f5655ef4b42b9aa123864b5d54bbf', N'2', N'配件单', N'enum_send_items_type', N'发送配件类型', N'20', N'0', N'1', N'2017-11-06 10:49:45.000', N'1', N'2017-11-06 10:49:45.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'18', N'2', N'省份、直辖市', N'sys_area_type', N'区域类型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'18384fc19cab43a78b26c3d0d33f1541', N'13', N'订单完成', N'status_repair_order', N'三包状态', N'130', N'0', N'1', N'2017-11-23 11:01:44.000', N'1', N'2017-11-23 11:01:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'19', N'3', N'地市', N'sys_area_type', N'区域类型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1c121cc5fbbf44b9a1289a2fa7b94ce4', N'7', N'首付款审批未通过', N'status_sales_order', N'订单状态', N'8', N'0', N'1', N'2017-11-02 17:44:25.000', N'1', N'2017-11-15 15:16:32.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1e3359e38e19413288dd959963734818', N'1', N'新建订单', N'status_sales_order', N'订单状态', N'2', N'0', N'1', N'2017-11-02 17:37:10.000', N'1', N'2017-11-02 17:37:10.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1f3ba55386d5422992e5b396eabe7b62', N'4', N'配件审批通过', N'status_repair_order', N'三包状态', N'40', N'0', N'1', N'2017-11-22 16:28:29.000', N'1', N'2017-11-23 10:55:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2', N'1', N'删除', N'del_flag', N'删除标记', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'20', N'4', N'区县', N'sys_area_type', N'区域类型', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'21', N'1', N'公司', N'sys_office_type', N'机构类型', N'60', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2187d74f82dd488ca4f6de1e77cd554b', N'2', N'维修结束', N'status_repair_order', N'三包状态', N'20', N'0', N'1', N'2017-11-22 16:27:11.000', N'1', N'2017-11-22 16:27:11.000', N'三包状态', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'22', N'2', N'部门', N'sys_office_type', N'机构类型', N'70', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'23', N'3', N'小组', N'sys_office_type', N'机构类型', N'80', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'23a08e1f896941fdbfefab46e9b8bf5a', N'9', N'尾款已付', N'status_sales_order', N'订单状态', N'10', N'0', N'1', N'2017-11-02 17:45:22.000', N'1', N'2017-11-15 15:17:29.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'24', N'4', N'其它', N'sys_office_type', N'机构类型', N'90', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'25', N'1', N'综合部', N'sys_office_common', N'快捷通用部门', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'253da1a1b83a46be89369b87c9e72400', N'13', N'工资结算', N'status_sales_order', N'订单状态', N'14', N'0', N'1', N'2017-11-15 15:21:45.000', N'1', N'2017-11-15 15:21:45.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'26', N'2', N'开发部', N'sys_office_common', N'快捷通用部门', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'27', N'3', N'人力部', N'sys_office_common', N'快捷通用部门', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'28', N'1', N'一级', N'sys_office_grade', N'机构等级', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'29', N'2', N'二级', N'sys_office_grade', N'机构等级', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2951ad084a4a41268a906f3a6586c30a', N'2', N'DHL', N'enum_express_company', N'快递公司', N'20', N'0', N'1', N'2017-11-05 11:54:16.000', N'1', N'2017-11-06 10:41:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'29f2aeb218724d4a9aca94eaf3cc0103', N'0', N'废弃订单', N'status_sales_order', N'订单状态', N'1', N'0', N'1', N'2017-11-02 17:36:28.000', N'1', N'2017-11-02 17:36:28.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2c28aeb7aaac402ab3bab411f7271309', N'10', N'录入快递账单', N'status_repair_order', N'三包状态', N'100', N'0', N'1', N'2017-11-23 11:00:07.000', N'1', N'2017-11-23 11:00:07.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2ca83281fa12478fae3f17195bc1d36a', N'2', N'状态yyy', N'status_parts_order', N'配件订单状态', N'20', N'0', N'1', N'2017-11-06 10:45:23.000', N'1', N'2017-11-06 10:45:23.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'3', N'1', N'显示', N'show_hide', N'显示/隐藏', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'30', N'3', N'三级', N'sys_office_grade', N'机构等级', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'30fced72481340d298dae30f5ede7c42', N'15', N'工资结算审批未通过', N'status_sales_order', N'订单状态', N'16', N'0', N'1', N'2017-11-15 15:23:21.000', N'1', N'2017-11-15 15:23:21.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'31', N'4', N'四级', N'sys_office_grade', N'机构等级', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'311d1b17b01f4ea1bcb9fb4d2a544624', N'6', N'录入发货信息', N'status_repair_order', N'三包状态', N'60', N'0', N'1', N'2017-11-23 10:56:44.000', N'1', N'2017-11-23 10:56:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'32', N'1', N'所有数据', N'sys_data_scope', N'数据范围', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'33', N'2', N'所在公司及以下数据', N'sys_data_scope', N'数据范围', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'34', N'3', N'所在公司数据', N'sys_data_scope', N'数据范围', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'35', N'4', N'所在部门及以下数据', N'sys_data_scope', N'数据范围', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'35d168458ad546fea71ad7f38137a78b', N'3', N'生产计划审批通过', N'status_sales_order', N'订单状态', N'4', N'0', N'1', N'2017-11-02 17:42:29.000', N'1', N'2017-11-15 15:14:49.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'36', N'5', N'所在部门数据', N'sys_data_scope', N'数据范围', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'37', N'8', N'仅本人数据', N'sys_data_scope', N'数据范围', N'90', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'38', N'9', N'按明细设置', N'sys_data_scope', N'数据范围', N'100', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'39', N'1', N'系统管理', N'sys_user_type', N'用户类型', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'3b28f937a6ec48d79c96d4940f691e75', N'1', N'xx供应商', N'enmu_provider', N'供应商', N'10', N'0', N'1', N'2017-11-05 11:19:44.000', N'1', N'2017-11-09 13:23:58.000', N'供应商', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'3e2df9f4e46743cc8cf71d8032a045f9', N'2', N'D/D', N'enmu_payment_type', N'付款方式', N'20', N'0', N'1', N'2017-11-03 09:18:37.000', N'1', N'2017-11-03 09:18:37.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'4', N'0', N'隐藏', N'show_hide', N'显示/隐藏', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'40', N'2', N'部门经理', N'sys_user_type', N'用户类型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'41', N'3', N'普通用户', N'sys_user_type', N'用户类型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'41b56e8a9d674101993dd685bf1715f4', N'1', N'FOB', N'enmu_trading_type', N'贸易形势', N'1', N'0', N'1', N'2017-11-02 17:29:30.000', N'1', N'2017-11-02 19:26:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'42', N'basic', N'基础主题', N'cms_theme', N'站点主题', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'43', N'blue', N'蓝色主题', N'cms_theme', N'站点主题', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'44', N'red', N'红色主题', N'cms_theme', N'站点主题', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'45', N'article', N'文章模型', N'cms_module', N'栏目模型', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'46', N'picture', N'图片模型', N'cms_module', N'栏目模型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'46e6e5578b724b44b14607fd078b51e5', N'3', N'录入配件信息', N'status_repair_order', N'三包状态', N'25', N'0', N'1', N'2017-11-23 10:55:29.000', N'1', N'2017-11-23 10:55:29.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'47', N'download', N'下载模型', N'cms_module', N'栏目模型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'48', N'link', N'链接模型', N'cms_module', N'栏目模型', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'49', N'special', N'专题模型', N'cms_module', N'栏目模型', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'4d2ecc79d6e5405ea3fe2027cf1325a3', N'5', N'配件审批未通过', N'status_repair_order', N'三包状态', N'50', N'0', N'1', N'2017-11-22 16:29:20.000', N'1', N'2017-11-23 10:56:09.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'4edac554f5374b46922dbb11efce5ae1', N'10', N'尾款审批通过', N'status_sales_order', N'订单状态', N'11', N'0', N'1', N'2017-11-02 17:45:44.000', N'1', N'2017-11-15 15:19:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'5', N'1', N'是', N'yes_no', N'是/否', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'50', N'0', N'默认展现方式', N'cms_show_modes', N'展现方式', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'51', N'1', N'首栏目内容列表', N'cms_show_modes', N'展现方式', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'52', N'2', N'栏目第一条内容', N'cms_show_modes', N'展现方式', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'53', N'0', N'发布', N'cms_del_flag', N'内容状态', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'54', N'1', N'删除', N'cms_del_flag', N'内容状态', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'55', N'2', N'审核', N'cms_del_flag', N'内容状态', N'15', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'55b3a8ae5d264c86a778143e692bfacd', N'2', N'电放', N'enum_bill_lading_type', N'提单类型', N'20', N'0', N'1', N'2017-11-05 11:48:04.000', N'1', N'2017-11-05 11:48:04.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'55d63756504649958e7a103367bdeac3', N'5', N'首付款已付', N'status_sales_order', N'订单状态', N'6', N'0', N'1', N'2017-11-02 17:43:26.000', N'1', N'2017-11-15 15:15:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'56', N'1', N'首页焦点图', N'cms_posid', N'推荐位', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'57', N'2', N'栏目页文章推荐', N'cms_posid', N'推荐位', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'58', N'1', N'咨询', N'cms_guestbook', N'留言板分类', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'59', N'2', N'建议', N'cms_guestbook', N'留言板分类', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'6', N'0', N'否', N'yes_no', N'是/否', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'60', N'3', N'投诉', N'cms_guestbook', N'留言板分类', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'61', N'4', N'其它', N'cms_guestbook', N'留言板分类', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'62', N'1', N'公休', N'oa_leave_type', N'请假类型', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'628cea5d50984a23b384bff78bfc52b9', N'2', N'￥', N'price_unit', N'价格单位', N'20', N'0', N'1', N'2017-10-31 13:45:03.000', N'1', N'2017-10-31 13:45:03.000', N'￥', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'63', N'2', N'病假', N'oa_leave_type', N'请假类型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'63d9769eba3547708648a7b0be213c3a', N'1', N'销售货物', N'enum_shipments_type', N'货物类型', N'10', N'0', N'1', N'2017-11-06 10:51:46.000', N'1', N'2017-11-09 11:11:48.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'63f3181d4e944771b6ecd649671388e1', N'sales_order_process', N'销售订单流程', N'act_type', N'流程类型', N'30', N'0', N'1', N'2017-11-14 13:30:55.000', N'1', N'2017-11-14 13:30:55.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'64', N'3', N'事假', N'oa_leave_type', N'请假类型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'65', N'4', N'调休', N'oa_leave_type', N'请假类型', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'66', N'5', N'婚假', N'oa_leave_type', N'请假类型', N'60', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'66c9647c26d346378bd892c7759b5708', N'1', N'正本', N'enum_bill_type', N'提单类型', N'10', N'0', N'1', N'2017-11-06 10:50:35.000', N'1', N'2017-11-09 11:14:16.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'67', N'1', N'接入日志', N'sys_log_type', N'日志类型', N'30', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2013-06-03 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'68', N'2', N'异常日志', N'sys_log_type', N'日志类型', N'40', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2013-06-03 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'69', N'leave', N'请假流程', N'act_type', N'流程类型', N'10', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2013-06-03 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'6d6a0b064e80484fa9e399ed7834e2a6', N'2', N'人民币', N'unit_name', N'单位名称', N'20', N'0', N'1', N'2017-10-31 14:07:34.000', N'1', N'2017-10-31 14:07:34.000', N'人民币', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'6e13e8416cd54e91be8e45443c93163b', N'2', N'电话访客', N'enmu_customer_source', N'客户来源', N'20', N'0', N'1', N'2017-11-02 17:54:22.000', N'1', N'2017-11-02 17:54:22.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'7', N'red', N'红色', N'color', N'颜色值', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'70', N'test_audit', N'审批测试流程', N'act_type', N'流程类型', N'20', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2013-06-03 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'706ec31ab31b49a98c16dcb587420a86', N'2', N'新建生产计划', N'status_sales_order', N'订单状态', N'3', N'0', N'1', N'2017-11-02 17:41:52.000', N'1', N'2017-11-02 17:41:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'71', N'1', N'订单流程', N'act_category', N'流程分类', N'10', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2017-11-14 13:29:10.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'71125c32ac544864a00b8ac9e484a53a', N'2', N'三包货物', N'enum_shipments_type', N'货物类型', N'20', N'0', N'1', N'2017-11-06 10:52:05.000', N'1', N'2017-11-09 11:12:07.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'72', N'2', N'发货流程', N'act_category', N'流程分类', N'20', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2017-11-14 13:29:26.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'73', N'crud', N'增删改查', N'gen_category', N'代码生成分类', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'74', N'crud_many', N'增删改查（包含从表）', N'gen_category', N'代码生成分类', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'75', N'tree', N'树结构', N'gen_category', N'代码生成分类', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'76', N'=', N'=', N'gen_query_type', N'查询方式', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'7657ac576f984598bd071dff1872c6d5', N'1', N'美元', N'unit_name', N'单位名称', N'10', N'0', N'1', N'2017-10-31 14:06:58.000', N'1', N'2017-10-31 14:06:58.000', N'美元', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'77', N'!=', N'!=', N'gen_query_type', N'查询方式', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'78', N'&gt;', N'&gt;', N'gen_query_type', N'查询方式', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'79', N'&lt;', N'&lt;', N'gen_query_type', N'查询方式', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'8', N'green', N'绿色', N'color', N'颜色值', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'80', N'between', N'Between', N'gen_query_type', N'查询方式', N'50', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'81', N'like', N'Like', N'gen_query_type', N'查询方式', N'60', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'82', N'left_like', N'Left Like', N'gen_query_type', N'查询方式', N'70', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'83', N'right_like', N'Right Like', N'gen_query_type', N'查询方式', N'80', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'84', N'input', N'文本框', N'gen_show_type', N'字段生成方案', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'85', N'textarea', N'文本域', N'gen_show_type', N'字段生成方案', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'86', N'select', N'下拉框', N'gen_show_type', N'字段生成方案', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'87', N'checkbox', N'复选框', N'gen_show_type', N'字段生成方案', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'87bb86d8bf444589877e97636845b7e8', N'2', N'海运', N'enum_parts_order_type', N'发送方式', N'20', N'0', N'1', N'2017-11-06 10:43:35.000', N'1', N'2017-11-06 10:43:35.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'88', N'radiobox', N'单选框', N'gen_show_type', N'字段生成方案', N'50', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'89', N'dateselect', N'日期选择', N'gen_show_type', N'字段生成方案', N'60', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'9', N'blue', N'蓝色', N'color', N'颜色值', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'90', N'userselect', N'人员选择', N'gen_show_type', N'字段生成方案', N'70', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'91', N'officeselect', N'部门选择', N'gen_show_type', N'字段生成方案', N'80', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'92', N'areaselect', N'区域选择', N'gen_show_type', N'字段生成方案', N'90', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'925a6fe32e16457290b1c432093016e7', N'1', N'新建三包', N'status_repair_order', N'三包状态', N'10', N'0', N'1', N'2017-11-05 11:39:04.000', N'1', N'2017-11-05 11:39:04.000', N'三包状态', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'93', N'String', N'String', N'gen_java_type', N'Java类型', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'93bb91b5f89547fa9415577628f3f9fb', N'16', N'订单完成', N'status_sales_order', N'订单状态', N'17', N'0', N'1', N'2017-11-15 15:23:59.000', N'1', N'2017-11-15 15:23:59.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'94', N'Long', N'Long', N'gen_java_type', N'Java类型', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'946c2c74ffb34b47ba7e2c132e8d5a1b', N'2', N'yy供应商', N'enmu_provider', N'供应商', N'20', N'0', N'1', N'2017-11-05 11:20:14.000', N'1', N'2017-11-09 13:24:32.000', N'供应商', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'95', N'dao', N'仅持久层', N'gen_category', N'代码生成分类', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'96', N'1', N'男', N'sex', N'性别', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'97', N'2', N'女', N'sex', N'性别', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'98', N'Integer', N'Integer', N'gen_java_type', N'Java类型', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'99', N'Double', N'Double', N'gen_java_type', N'Java类型', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'9b3171f9f34c4896830f5685424ea2c1', N'1', N'开始发货', N'status_shipments', N'发货状态', N'10', N'0', N'1', N'2017-11-05 11:49:57.000', N'1', N'2017-11-05 11:49:57.000', N'发货状态', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'a60a1a824fae40a0b69b662a422cc6e3', N'1', N'三包单', N'enum_send_items_type', N'发送配件类型', N'10', N'0', N'1', N'2017-11-06 10:49:20.000', N'1', N'2017-11-06 10:49:20.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'a7a95d6e2149494cb0fd59c04afdc332', N'4', N'生产计划审批未通过', N'status_sales_order', N'订单状态', N'5', N'0', N'1', N'2017-11-02 17:42:58.000', N'1', N'2017-11-15 15:15:15.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'a86ec2b05e1e42d9b1348f602f0deffb', N'8', N'发货信息审批未通过', N'status_repair_order', N'三包状态', N'80', N'0', N'1', N'2017-11-23 10:58:19.000', N'1', N'2017-11-23 10:58:19.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b214e23477804b88bf7b67a9d5be346f', N'2', N'公共客户', N'enmu_customer_type', N'客户类型', N'20', N'0', N'1', N'2017-10-24 14:12:05.000', N'1', N'2017-11-02 17:52:48.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b419993ff9d1493e83f7aa962786a79b', N'1', N'$', N'price_unit', N'价格单位', N'10', N'0', N'1', N'2017-10-31 13:39:04.000', N'1', N'2017-10-31 13:43:03.000', N'$', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b49f91c287f949c795fabd4f2c89f4eb', N'7', N'发货信息审批通过', N'status_repair_order', N'三包状态', N'70', N'0', N'1', N'2017-11-23 10:57:46.000', N'1', N'2017-11-23 10:57:46.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b50ace8e628f41ad83538cb1b89c71b8', N'11', N'尾款审批未通过', N'status_sales_order', N'订单状态', N'12', N'0', N'1', N'2017-11-15 15:20:30.000', N'1', N'2017-11-15 15:20:30.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b722762593b34ff78330bc5906da789d', N'6', N'首付款审批通过', N'status_sales_order', N'订单状态', N'7', N'0', N'1', N'2017-11-02 17:43:58.000', N'1', N'2017-11-15 15:16:09.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'bc56b668634240ffb1265f47d69998cb', N'1', N'私有客户', N'enmu_customer_type', N'客户类型', N'10', N'0', N'1', N'2017-10-24 14:11:36.000', N'1', N'2017-11-02 17:52:17.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'bc5afe7e80524044b9a974c71c1f947f', N'2', N'电放', N'enum_bill_type', N'提单类型', N'20', N'0', N'1', N'2017-11-06 10:51:03.000', N'1', N'2017-11-09 11:14:32.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'bcfe29b18bd84a6ea374d583567a4716', N'2', N'CIF', N'enmu_trading_type', N'贸易形式', N'2', N'0', N'1', N'2017-11-02 17:30:09.000', N'1', N'2017-11-02 19:26:19.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'd1602225496640e0bb71011ee787f96c', N'1', N'维修', N'enum_solution_type', N'解决方案类型', N'10', N'0', N'1', N'2017-11-05 11:36:44.000', N'1', N'2017-11-05 11:36:44.000', N'解决方案类型', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'd167ec05e1b147118a0570558043ebe5', N'1', N'快递', N'enum_parts_order_type', N'发送方式', N'10', N'0', N'1', N'2017-11-06 10:42:59.000', N'1', N'2017-11-06 10:42:59.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'd81a95392cc64303bb2cac3da96ff71b', N'1', N'德邦物流', N'enum_express_company', N'快递公司', N'10', N'0', N'1', N'2017-11-06 10:39:50.000', N'1', N'2017-11-06 10:39:50.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'da772194abb54aff8323d93c810436a1', N'8', N'开始生产', N'status_sales_order', N'订单状态', N'9', N'0', N'1', N'2017-11-02 17:44:59.000', N'1', N'2017-11-15 15:17:17.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'da8076e9a77347028f40419af6a8a7bf', N'3', N'配件货物', N'enum_shipments_type', N'货物类型', N'30', N'0', N'1', N'2017-11-09 11:12:44.000', N'1', N'2017-11-09 11:12:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'e3154aefd1764102ba8a9c906f53d873', N'14', N'工资结算审批通过', N'status_sales_order', N'订单状态', N'15', N'0', N'1', N'2017-11-15 15:22:27.000', N'1', N'2017-11-15 15:22:42.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'e360ad2630804e5eb0cf43f96b0c4948', N'12', N'发货', N'status_sales_order', N'订单状态', N'13', N'0', N'1', N'2017-11-15 15:21:17.000', N'1', N'2017-11-15 15:21:17.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'ebfaaee6fdf145d48c9c816211e5d1a6', N'9', N'配件快递发货', N'status_repair_order', N'三包状态', N'90', N'0', N'1', N'2017-11-23 10:59:39.000', N'1', N'2017-11-23 10:59:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'eebef3adebea4c028fe6989851fca313', N'12', N'海关放行', N'status_repair_order', N'三包状态', N'120', N'0', N'1', N'2017-11-23 11:01:18.000', N'1', N'2017-11-23 11:01:18.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'f40e95a5617144e2b2784820f82c6989', N'1', N'正本', N'enum_bill_lading_type', N'提单类型', N'10', N'0', N'1', N'2017-11-05 11:47:42.000', N'1', N'2017-11-05 11:47:42.000', N'提单类型', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'f80ce2e90a4247c9a4dcb373aab1c52f', N'11', N'配件装箱发货', N'status_repair_order', N'三包状态', N'110', N'0', N'1', N'2017-11-23 11:00:30.000', N'1', N'2017-11-23 11:00:30.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'fff9e655b6e541edb99047fc594e032c', N'2', N'配件', N'enum_solution_type', N'解决方案类型', N'20', N'0', N'1', N'2017-11-05 11:37:11.000', N'1', N'2017-11-05 11:37:11.000', N'解决方案类型', N'0')
GO

COMMIT
GO


-- ----------------------------
-- Records of [sys_menu]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'0b2ebd4d639e4c2b83c2dd0764522f24', N'ba8092291b40482db8fe7fc006ea3d76', N'0,1,2,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', N'编辑', N'60', NULL, NULL, NULL, N'0', N'test:testData:edit', N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'0ca004d6b1bf4bcab9670a5060d82a55', N'79', N'0,1,2,79,3c92c17886944d0687e73e286cada573,', N'树结构', N'90', N'/test/testTree', NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'1', N'0', N'0,', N'功能菜单', N'0', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'10', N'3', N'0,1,2,3,', N'字典管理', N'30', N'/sys/dict/', NULL, N'th-list', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'11', N'10', N'0,1,2,3,10,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:dict:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'12', N'10', N'0,1,2,3,10,', N'修改', N'40', NULL, NULL, NULL, N'0', N'sys:dict:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'13', N'2', N'0,1,2,', N'机构用户', N'500', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'14', N'13', N'0,1,2,13,', N'区域管理', N'30', N'/sys/area/', NULL, N'th', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'15', N'14', N'0,1,2,13,14,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:area:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'16', N'14', N'0,1,2,13,14,', N'修改', N'40', NULL, NULL, NULL, N'0', N'sys:area:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'17', N'13', N'0,1,2,13,', N'机构管理', N'20', N'/sys/office/', NULL, N'th-large', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'18', N'17', N'0,1,2,13,17,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:office:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'19', N'17', N'0,1,2,13,17,', N'修改', N'40', NULL, NULL, NULL, N'0', N'sys:office:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'2', N'1', N'0,1,', N'管理后台根菜单', N'10000', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 13:03:51.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'20', N'13', N'0,1,2,13,', N'用户管理', N'10', N'/sys/user/index', NULL, N'user', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'21', N'20', N'0,1,2,13,20,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:user:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'22', N'20', N'0,1,2,13,20,', N'修改', N'40', NULL, NULL, NULL, N'0', N'sys:user:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'23', N'2', N'0,1,2,', N'关于帮助', N'900', NULL, NULL, NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'24', N'23', N'0,1,2,23', N'官方首页', N'10', N'http://erp.com', N'_blank', NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'2492e323fd42432da5a74396eb86beb5', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'设备维修管理', N'120', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:20:21.113', N'1', N'2017-12-01 13:20:21.113', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'24a4478af9b74e71963a5a18a29cdd24', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'集中器管理', N'90', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:20:05.966', N'1', N'2017-12-01 13:20:05.966', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'25', N'23', N'0,1,2,23', N'项目支持', N'50', N'http://erp.com/donation.html', N'_blank', NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'26', N'23', N'0,1,2,23', N'论坛交流', N'80', N'http://bbs.erp.com', N'_blank', NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'27', N'2', N'0,1,2,', N'我的面板', N'10', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 12:56:41.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'28', N'2', N'0,1,2,', N'个人信息', N'100', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 13:05:37.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'29', N'28', N'0,1,2,28,', N'个人信息', N'10', N'/sys/user/info', NULL, N'user', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'3', N'2', N'0,1,2,', N'系统设置', N'600', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'30', N'28', N'0,1,2,28,', N'修改密码', N'20', N'/sys/user/modifyPwd', NULL, N'lock', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'31', N'1', N'0,1,', N'内容管理', N'20000', NULL, NULL, NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-10-27 15:28:26.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'32', N'31', N'0,1,31,', N'栏目设置', N'300', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'33', N'32', N'0,1,31,32', N'栏目管理', N'30', N'/cms/category/', NULL, N'align-justify', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'34', N'33', N'0,1,31,32,33,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:category:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'35', N'33', N'0,1,31,32,33,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:category:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'36', N'32', N'0,1,31,32', N'站点设置', N'40', N'/cms/site/', NULL, N'certificate', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'37', N'36', N'0,1,31,32,36,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:site:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'38', N'36', N'0,1,31,32,36,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:site:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'39', N'32', N'0,1,31,32', N'切换站点', N'50', N'/cms/site/select', NULL, N'retweet', N'1', N'cms:site:select', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'3c92c17886944d0687e73e286cada573', N'79', N'0,1,2,79,', N'生成示例', N'20', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'4', N'3', N'0,1,2,3,', N'菜单管理', N'10', N'/sys/menu/', NULL, N'list-alt', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'40', N'31', N'0,1,31,', N'内容管理', N'100', NULL, NULL, NULL, N'1', N'cms:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'41', N'40', N'0,1,31,40,', N'内容发布', N'30', N'/cms/', NULL, N'briefcase', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'42', N'41', N'0,1,31,40,41,', N'文章模型', N'40', N'/cms/article/', NULL, N'file', N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'43', N'42', N'0,1,31,40,41,42,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:article:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'44', N'42', N'0,1,31,40,41,42,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:article:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'45', N'42', N'0,1,31,40,41,42,', N'审核', N'50', NULL, NULL, NULL, N'0', N'cms:article:audit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'46', N'41', N'0,1,31,40,41,', N'链接模型', N'60', N'/cms/link/', NULL, N'random', N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'4643591154b04e67863475d26fbee1df', N'd4b9ed224c0a4c1db8f6731646b8da00', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,', N'设备管理', N'30', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:16:22.330', N'1', N'2017-12-01 13:16:22.330', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'47', N'46', N'0,1,31,40,41,46,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:link:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'48', N'46', N'0,1,31,40,41,46,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:link:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'4855cf3b25c244fb8500a380db189d97', N'b1f6d1b86ba24365bae7fd86c5082317', N'0,1,2,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', N'查看', N'30', NULL, NULL, NULL, N'0', N'test:testDataMain:list,test:testDataMain:from,test:testDataMain:edit,test:testDataMain:delete', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 17:00:02.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'49', N'46', N'0,1,31,40,41,46,', N'审核', N'50', NULL, NULL, NULL, N'0', N'cms:link:audit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'5', N'4', N'0,1,2,3,4,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:menu:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'50', N'40', N'0,1,31,40,', N'评论管理', N'40', N'/cms/comment/?status=2', NULL, N'comment', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'51', N'50', N'0,1,31,40,50,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:comment:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'52', N'50', N'0,1,31,40,50,', N'审核', N'40', NULL, NULL, NULL, N'0', N'cms:comment:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'53', N'40', N'0,1,31,40,', N'公共留言', N'80', N'/cms/guestbook/?status=2', NULL, N'glass', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'54', N'53', N'0,1,31,40,53,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:guestbook:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'55', N'53', N'0,1,31,40,53,', N'审核', N'40', NULL, NULL, NULL, N'0', N'cms:guestbook:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'56', N'71', N'0,1,2,71,', N'文件管理', N'10', N'/../static/ckfinder/ckfinder.html', NULL, N'folder-open', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'57', N'56', N'0,1,2,27,40,56,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:ckfinder:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'58', N'56', N'0,1,2,27,40,56,', N'上传', N'40', NULL, NULL, NULL, N'0', N'cms:ckfinder:upload', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'59', N'56', N'0,1,2,27,40,56,', N'修改', N'50', NULL, NULL, NULL, N'0', N'cms:ckfinder:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'6', N'4', N'0,1,2,3,4,', N'修改', N'40', NULL, NULL, NULL, N'0', N'sys:menu:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'60', N'31', N'0,1,31,', N'统计分析', N'200', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'61', N'60', N'0,1,31,60,', N'信息量统计', N'30', N'/cms/stats/article', NULL, N'tasks', N'1', N'cms:stats:article', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'62', N'1', N'0,1,', N'CRM管理', N'200', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-10-27 15:32:46.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'63', N'2', N'0,1,2,', N'个人办公', N'300', NULL, NULL, NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 13:07:15.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'64', N'63', N'0,1,2,63,', N'请假办理', N'30', N'/oa/leave', NULL, N'leaf', N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'65', N'64', N'0,1,2,63,64,', N'查看', N'10', NULL, NULL, NULL, N'0', N'oa:leave:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'66', N'64', N'0,1,2,63,64,', N'修改', N'20', NULL, NULL, NULL, N'0', N'oa:leave:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'67', N'2', N'0,1,2,', N'日志查询', N'800', NULL, NULL, NULL, N'0', NULL, N'1', N'2013-06-03 08:00:00.000', N'1', N'2017-11-25 13:07:40.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'68', N'67', N'0,1,2,67,', N'日志查询', N'10', N'/sys/log', NULL, N'pencil', N'1', N'sys:log:view', N'1', N'2013-06-03 08:00:00.000', N'1', N'2013-06-03 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'69', N'2', N'0,1,2,', N'流程管理', N'700', NULL, NULL, NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 13:07:32.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'7', N'3', N'0,1,2,3,', N'角色管理', N'20', N'/sys/role/', NULL, N'lock', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'70', N'69', N'0,1,2,69,', N'流程管理', N'10', N'/act/process', NULL, N'road', N'1', N'act:process:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'71', N'2', N'0,1,2,', N'文件管理', N'400', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 13:05:23.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'72', N'69', N'0,1,2,69,', N'模型管理', N'20', N'/act/model', NULL, N'road', N'1', N'act:model:edit', N'1', N'2013-09-20 08:00:00.000', N'1', N'2013-09-20 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'73', N'63', N'0,1,2,63,', N'我的任务', N'10', N'/act/task/todo/', NULL, N'tasks', N'1', N'erp:erpSalesOrder:oaForm,erp:erpRepairOrder:oaForm', N'1', N'2013-09-24 08:00:00.000', N'1', N'2017-11-24 10:14:06.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'74', N'63', N'0,1,2,63,', N'审批测试', N'20', N'/oa/testAudit', NULL, NULL, N'1', N'oa:testAudit:view,oa:testAudit:edit', N'1', N'2013-09-24 08:00:00.000', N'1', N'2013-09-24 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'75', N'1', N'0,1,', N'在线演示', N'3000', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-10-08 08:00:00.000', N'1', N'2013-10-08 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'75151677488e49f2aaabd0291d3d7fac', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'水表管理', N'30', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:19:16.866', N'1', N'2017-12-01 13:19:16.866', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'79', N'2', N'0,1,2,', N'代码生成', N'1000', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-10-16 08:00:00.000', N'1', N'2017-10-24 14:24:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'8', N'7', N'0,1,2,3,7,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:role:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'80', N'79', N'0,1,2,79,', N'代码生成', N'10', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-10-16 08:00:00.000', N'1', N'2013-10-16 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'81', N'79', N'0,1,2,79,80,', N'生成方案配置', N'30', N'/gen/genScheme', NULL, NULL, N'1', N'gen:genScheme:view,gen:genScheme:edit', N'1', N'2013-10-16 08:00:00.000', N'1', N'2013-10-16 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'82', N'79', N'0,1,2,79,80,', N'业务表配置', N'20', N'/gen/genTable', NULL, NULL, N'1', N'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', N'1', N'2013-10-16 08:00:00.000', N'1', N'2013-10-16 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'83', N'79', N'0,1,79,80,', N'代码模板管理', N'90', N'/gen/genTemplate', NULL, NULL, N'1', N'gen:genTemplate:view,gen:genTemplate:edit', N'1', N'2013-10-16 08:00:00.000', N'1', N'2013-10-16 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'84', N'67', N'0,1,2,67,', N'连接池监视', N'20', N'/../druid', NULL, NULL, N'1', NULL, N'1', N'2013-10-18 08:00:00.000', N'1', N'2013-10-18 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'85', N'76', N'0,1,75,76,', N'行政区域', N'80', N'/../static/map/map-city.html', NULL, NULL, N'1', NULL, N'1', N'2013-10-22 08:00:00.000', N'1', N'2013-10-22 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'86', N'75', N'0,1,75,', N'组件演示', N'50', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-10-22 08:00:00.000', N'1', N'2013-10-22 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'87', N'86', N'0,1,75,86,', N'组件演示', N'30', N'/test/test/form', NULL, NULL, N'1', N'test:test:view,test:test:edit', N'1', N'2013-10-22 08:00:00.000', N'1', N'2013-10-22 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'88', N'2', N'0,1,2,', N'通知通告', N'200', N'', N'', N'', N'0', N'', N'1', N'2013-11-08 08:00:00.000', N'1', N'2017-12-02 09:13:01.563', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'89', N'88', N'0,1,2,88,', N'我的通告', N'10', N'/oa/oaNotify/self', NULL, NULL, N'1', NULL, N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'9', N'7', N'0,1,2,3,7,', N'修改', N'40', NULL, NULL, NULL, N'0', N'sys:role:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'90', N'88', N'0,1,2,88,', N'通告管理', N'20', N'/oa/oaNotify', NULL, NULL, N'1', N'oa:oaNotify:view,oa:oaNotify:edit', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'afab2db430e2457f9cf3a11feaa8b869', N'0ca004d6b1bf4bcab9670a5060d82a55', N'0,1,2,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', N'编辑', N'60', NULL, NULL, NULL, N'0', N'test:testTree:treeData,test:testTree:save,test:testTree:edit,test:testTree:delete', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 17:03:40.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'b1f6d1b86ba24365bae7fd86c5082317', N'79', N'0,1,2,79,3c92c17886944d0687e73e286cada573,', N'主子表', N'60', N'/test/testDataMain', NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'b7ba47f9d5584beb9840d291e9c78d4c', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'异常设备管理', N'150', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:20:37.423', N'1', N'2017-12-01 13:20:37.423', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'ba8092291b40482db8fe7fc006ea3d76', N'79', N'0,1,2,79,3c92c17886944d0687e73e286cada573,', N'单表', N'50', N'/test/testData', NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'c2e4d9082a0b4386884a0b203afe2c5c', N'0ca004d6b1bf4bcab9670a5060d82a55', N'0,1,2,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', N'查看', N'30', NULL, NULL, NULL, N'0', N'test:testTree:from,test:testTree:list', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 17:17:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'd15ec45a4c5449c3bbd7a61d5f9dd1d2', N'b1f6d1b86ba24365bae7fd86c5082317', N'0,1,2,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', N'编辑', N'60', NULL, NULL, NULL, N'0', N'test:testDataMain:edit', N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'd1f17c8ba6c74038aa9f11700a514057', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'采集器管理', N'60', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:19:44.500', N'1', N'2017-12-01 13:19:44.500', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'd4b9ed224c0a4c1db8f6731646b8da00', N'1', N'0,1,', N'设备管理', N'30000', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 10:59:28.696', N'1', N'2017-12-01 10:59:28.696', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'df7ce823c5b24ff9bada43d992f373e2', N'ba8092291b40482db8fe7fc006ea3d76', N'0,1,2,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', N'查看', N'30', NULL, NULL, NULL, N'0', N'test:testData:list,test:testData:form,test:testData:edit,test:testData:delete', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 16:59:03.000', NULL, N'0')
GO

COMMIT
GO



-- ----------------------------
-- Records of [sys_office]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'1', N'0', N'0,', N'山东省总公司', N'10', N'2', N'100000', N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'10', N'7', N'0,1,7,', N'销售部', N'30', N'3', N'200003', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'11', N'7', N'0,1,7,', N'工程部', N'40', N'3', N'200004', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'12', N'7', N'0,1,7,', N'历城区分公司', N'0', N'4', N'201000', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'13', N'12', N'0,1,7,12,', N'公司领导', N'10', N'4', N'201001', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'14', N'12', N'0,1,7,12,', N'财务部', N'20', N'4', N'201002', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'15', N'12', N'0,1,7,12,', N'市场部', N'30', N'4', N'201003', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'16', N'12', N'0,1,7,12,', N'技术部', N'40', N'4', N'201004', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'17', N'7', N'0,1,7,', N'历下区分公司', N'40', N'5', N'201010', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'18', N'17', N'0,1,7,17,', N'公司领导', N'10', N'5', N'201011', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'19', N'17', N'0,1,7,17,', N'综合部', N'20', N'5', N'201012', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'2', N'1', N'0,1,', N'公司领导', N'10', N'2', N'100001', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'20', N'17', N'0,1,7,17,', N'市场部', N'30', N'5', N'201013', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'21', N'17', N'0,1,7,17,', N'技术部', N'40', N'5', N'201014', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'22', N'7', N'0,1,7,', N'高新区分公司', N'50', N'6', N'201010', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'23', N'22', N'0,1,7,22,', N'公司领导', N'10', N'6', N'201011', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'24', N'22', N'0,1,7,22,', N'综合部', N'20', N'6', N'201012', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'25', N'22', N'0,1,7,22,', N'市场部', N'30', N'6', N'201013', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'26', N'22', N'0,1,7,22,', N'技术部', N'40', N'6', N'201014', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'3', N'1', N'0,1,', N'财务部', N'20', N'2', N'100002', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 11:09:31.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'4', N'1', N'0,1,', N'销售部', N'30', N'2', N'100003', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 11:08:30.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'5', N'1', N'0,1,', N'工程部', N'40', N'2', N'100004', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 11:08:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'6', N'1', N'0,1,', N'研发部', N'50', N'2', N'100005', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'7', N'1', N'0,1,', N'济南市分公司', N'20', N'3', N'200000', N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'8', N'7', N'0,1,7,', N'公司领导', N'10', N'3', N'200001', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'9', N'7', N'0,1,7,', N'综合部', N'20', N'3', N'200002', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

COMMIT
GO



-- ----------------------------
-- Records of [sys_role]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'2', N'会计角色', N'cj', N'user', N'5', N'0', N'1', N'1', N'2017-10-18 15:39:38.000', N'1', N'2017-11-16 10:40:21.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'1', N'2', N'系统管理员', N'admin', N'assignment', N'1', N'1', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-23 11:44:04.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'2', N'2', N'经理', N'jl', N'assignment', N'2', N'1', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-23 11:45:09.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'3', N'1', N'本公司管理员', N'a', N'assignment', N'3', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'4', N'1', N'部门管理员', N'b', N'assignment', N'4', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'2', N'业务员', N'ywy', N'user', N'8', N'0', N'1', N'1', N'2017-10-18 15:38:23.000', N'1', N'2017-11-23 09:11:17.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'5', N'1', N'本部门管理员', N'c', N'assignment', N'5', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'6', N'2', N'普通用户', N'pt', N'assignment', N'8', N'1', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 13:42:05.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'7', N'7', N'济南市管理员', N'e', N'assignment', N'9', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'2', N'操作员', N'czy', N'user', N'8', N'0', N'1', N'1', N'2017-10-18 15:39:05.000', N'1', N'2017-11-23 11:44:33.000', NULL, N'0')
GO

COMMIT
GO



-- ----------------------------
-- Records of [sys_role_menu]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'049c8cc8024042a8869696d70a159a16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'05b602a7e8a449449d26c1fa238db667')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'05f16d2f498d4e96a7039c3604646974')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'07b5edda57f84a378b39025dd62853f6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'07d0c69b149e4179a1f7c87803c94116')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'0d4915931b4c4fb3a5445835bf08d387')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'1d817ecd71b14ddebacaefae3b6ea496')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'27')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'28')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'29')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'2b683bd9cd144bf5a1434db42d67df79')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'30')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'31')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'32')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'34')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'35')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'36')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'37')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'38')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'3b0a9cf79f734592b1794b1c10f5f3cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'40')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'41')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'42')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'433218ee043e404885e1ac8bebbae3db')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'46')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'47')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'49')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'4c6c08c4b82e4cfc884be66af5e63520')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'4fb04189d8a444b499d4588fbf4e918d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'50')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'51')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'52')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'52249880a2d843259aff211461afe1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'53')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'54')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'56')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'57')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'57d61214e261447fabc499cd02cf665b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'58')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'59')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'5a28204146a442d99e4f6433ddcd814d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'5e71a0c87d954a998b11ef7266074673')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'60')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'60a56f7a192549698d6879f899366833')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'61')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'63183c8d7af44545be01c2ebf33cdc0a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'63b62ebabd644e5b98a11fab67c6782a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'6ecef1c2c7654f0eb95faaf808fa74f8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'71')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'973958606693485d88ce6c3a6c7e339f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'9c450f1d515847cebeb9ba4e9dbeb2fa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'9cadfc0a5d75492c8155135979ebe20f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'a0050fd2a38c49aca0bc40261f6d6ac2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'a41a2992d7274049a8c869f19ccb8d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'aa1c4d8515d946099282edd67dc0a3ac')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'ae7a504cd29a49eab5fb0014e3370342')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'b2a07f89f724402fba27bdc47ee32c17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'b3b636490c6041f3a0a8f534311d7c6a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'b9a23c69ca1c416191d488d7190c9204')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'be4c441293c14a039a1526918f060356')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'c066b733c52b49c99e3b74a7a3f430be')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'c8fcdb9f01e94885830c7d0f02718551')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'c9a8574a03ba488384dc68270e68b580')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'cb3544ea3d574e148aa3450ad29eee16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'd094fd60e9e74a85aa18193fb5095664')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'd54969876bc242868f2fdb768d51b088')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'd7d0f16ac4104e89a7970c8c8cca80f2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'd80dc4dd6fe24790a418a687c98a5f45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'd8939003bb21482eb19b950358cda5ef')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'de3a96ac346b40da922f9f69112f6194')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'e272507128c04b52b97c20682919a982')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'e64a6e168016411385b5bc24cc141142')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'e93e2f4f6ef943f6be8951ff1dd4080e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'ef199cd82be2481992006c7098f1584e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'f250c4af8858456b8afa6aa5d5a43d81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'f58ca893fbee483ebdf3ca4486f2adfa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'f66bed290a1a43b18490f8f27c147b26')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'f83ce9d381b44cf5bbb7d17273de5cb4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'fcdb6c45485849898013f2ee66aabb81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'ffebb3f39a224b5f8d82f65673debfff')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'03103468c51d40e7aaf1e519b015a068')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'036b65156a0d4851950784ccf01ebc05')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'0436bba53ecd4c69987028408c90338c')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'0493f61bf8884e5caf3c568daec28467')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'049c8cc8024042a8869696d70a159a16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'05b602a7e8a449449d26c1fa238db667')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'05f16d2f498d4e96a7039c3604646974')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'063ae8b76c3e41bdbe0b2203056bb2ed')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'06e45d50548247b89a12f52149513b6f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'07b016504c1c466c867cf60ccb91c45d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'07b5edda57f84a378b39025dd62853f6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'07d0c69b149e4179a1f7c87803c94116')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'0b2ebd4d639e4c2b83c2dd0764522f24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'0ca004d6b1bf4bcab9670a5060d82a55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'0d4915931b4c4fb3a5445835bf08d387')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'0f1923ca5c7b46409537196c47a0f299')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'10')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1047498532e04f0aa4276617abd1703a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'12')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'13')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'14')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'15')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'15f93498e170422a98dd2e2f147a4102')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'18')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'181515f050704695a29f9c6d63dff1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'19')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1972a3d586a44dfbb8793a687630bc4d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1ab3dbb88b764fbfaf9b80edb0f2c70e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1b6c732054c3461a8aa349aa7ef8116b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1d63012ae3584adc8d6d27d5a9c991fe')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1d817ecd71b14ddebacaefae3b6ea496')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1ead7348bc3c48fd957e3b5d0739cf26')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1f2ee21294714afcbcce56813c4cd721')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'1f6f60c8842b4babb49600b99bd59085')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'20')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'21')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'22')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'23')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'27')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'2731aa402a4a4a96b415875381865744')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'28')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'29')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'2b21ef9fd0db4eb9bd15bd23f7fe6462')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'2b683bd9cd144bf5a1434db42d67df79')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'2c120aee71ba422c8bcc8b8a74bbcc9d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'30')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'31')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'32')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'32706c88414a4a74ac2be0f4a067f784')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'32ec93aa01e74e42887f70cb79f4c144')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3349fbe4b337448093da4e613cf50ffe')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'34')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'35')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'36')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'37')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3751b5c0e6674d04ad5ed3f91db769ab')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'38')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'384bbe5e6d08488aba60942cc315f633')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'39437f44adc949918fe5cfd48ed14fe4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3b0a9cf79f734592b1794b1c10f5f3cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3bf016141ea0481dbc49b9c323ed8d33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3c92c17886944d0687e73e286cada573')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3df78c3653ae476cb1536de4f47d97a9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'3ef748f9fc8143f08b455cf73c7874c7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'40')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'41')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'42')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4246a4a7405c4df7a8206085ecb77f48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'42efd9ac7e3441e68488c2e3004a900d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'433218ee043e404885e1ac8bebbae3db')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'45c45ce333a9413fa74e7f616ec54824')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'45d936b0596244c3a70d0d1e70958928')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'46')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'47')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4855cf3b25c244fb8500a380db189d97')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'49')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'49d32850775949ee95e22f797c7e2307')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4a196d2b76534242a439151f36c14ff6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4a3afae0ee834347ae3a7d8de0badeda')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4c6c08c4b82e4cfc884be66af5e63520')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4e871497f6564aef973ab15169c5c822')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4ec1504664de43d7a95ae272bdf50ba1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4fb04189d8a444b499d4588fbf4e918d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'4fe1753b33164ad986382f7abaeea719')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'50')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'50f5140d522d4bf5a7b22389afb855b2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'51')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'51835c953a2546848500a6e7ab569537')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'51de2f0a6866497c87e78ae9c415ef43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'52')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'52249880a2d843259aff211461afe1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5267deb5f6084b248488192984acebbf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'53')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'54')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'54f52b533b9e463ea13bc9b9c06cc882')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5573e382f4f9435187abacbcb434bbaf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'56')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'57')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'572fc47c72f2490da5eaaee4e3b4ab22')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'57d61214e261447fabc499cd02cf665b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'58')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'58e1fb41286e4ae48def36db34e49901')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'59')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5a28204146a442d99e4f6433ddcd814d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5b0561c194044f07b0a72abd532ad25c')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5b9df47ab2af4f4f84c15c528dc2d095')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5c6d3d2cf9de42219a64ad8e1b08f9d4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5d8456a10da84d508fd0a2267609fa2a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'5e71a0c87d954a998b11ef7266074673')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'60')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'60a56f7a192549698d6879f899366833')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'61')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'621df1992e1d48fbb1eb1e5f1273135d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'63183c8d7af44545be01c2ebf33cdc0a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'63b62ebabd644e5b98a11fab67c6782a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'64')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'64e0b1cb04bf40ad9d522bd6527905df')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'65')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'66')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'67')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'68')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'68fee89c14fb49528e23210a2b2e7d20')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'6a2bb808d17e458e9f46dd27cd61363d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'6aa00d1ccc2349f6b2301c1ef48fb137')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'6ecef1c2c7654f0eb95faaf808fa74f8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'71')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'73c3a5c2bcf940ceb21e6528a117d533')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'74')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'74741329932844b58f6d15e19ca80922')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'75e6a44b9015478eb7fe37c0e8d36160')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'77ae1a82edbd446b9023c8d1732e77b5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'784a28ecee704c37afdcf6fcf73c7c95')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'784bc71f89d446ec8621fdab14c3b2b4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'78862cde46944424ac58121c75c788d5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'79')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'7ba6f20ebf7b4b53aa926181aa2dfbcc')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'7d6155e835e646dcb638278f793ab6b1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'80')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'82')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'84')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'846cdd9215d0495f934cad63a7f4dcd3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'85')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'86d986372df242a4a537091d01f2d13e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'88968dc050dc42df9e4e0093eb9b3158')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'8aac76f60c5b44aca33b699e9bf6ac83')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'901990a1fb9e47ce8937881f43710d11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'910562f816ea4268b27ad45f9c4d4e62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'930f20fa6d2d412188bd4d0145844ec8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'9599774570174d9f960e0cd52c4674b2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'969fa58be71e4872af8b583422d542e6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'973958606693485d88ce6c3a6c7e339f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'97d1806c8a3a4495843ece719d543c62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'97e896b22d9340558bc4b2b576dde9d2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'99b20c0ec6b2427abf594f1346611d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'9c450f1d515847cebeb9ba4e9dbeb2fa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'9cadfc0a5d75492c8155135979ebe20f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'9ded8d7767fe4ba08ecd09002e1b11cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'a0050fd2a38c49aca0bc40261f6d6ac2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'a41a2992d7274049a8c869f19ccb8d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'a5b9b00ef07849f4bb2ef1d1b052ed2f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'a9aa1d2226b44709890e8a074ca2a44a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'aa1c4d8515d946099282edd67dc0a3ac')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ac591ca7ff1a47868e0bb27288de466b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'accaae5e1e5641efbd31101db97c57c4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ad7e2de306e049af9abd5a094be45b5a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ae41d3330be14576975f767787739e39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ae7a504cd29a49eab5fb0014e3370342')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'afab2db430e2457f9cf3a11feaa8b869')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b1f6d1b86ba24365bae7fd86c5082317')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b21b34f62ed7484c9c9c2c9fa8a9c9de')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b2a07f89f724402fba27bdc47ee32c17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b3b636490c6041f3a0a8f534311d7c6a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b47d402a443a49e6adede55308107c4f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b4cf242ad7214cf294630b777b594acd')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b91bebd025f24589b653a00a31e9d1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'b9a23c69ca1c416191d488d7190c9204')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ba8092291b40482db8fe7fc006ea3d76')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'bb25a976433c420dbfec13caf977a5ec')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'bbaf9106246a43b2a16b6af6bbc87905')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'bd0b0d30479b4783aa8b277c725880c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'be4c441293c14a039a1526918f060356')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'be84805fa8af41e48b3f177e32b5d182')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'bf1fc0d189e44ab78f4f523350f92d48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'c066b733c52b49c99e3b74a7a3f430be')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'c16ebf95d07a4c969bfa2909cc100c1a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'c20fd5adc50948dc8b4d153a212471e0')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'c2e4d9082a0b4386884a0b203afe2c5c')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'c8fcdb9f01e94885830c7d0f02718551')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'c9a8574a03ba488384dc68270e68b580')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ca7ad19acae84562bc1e38967445fb24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'cb3544ea3d574e148aa3450ad29eee16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'cddd76f97fdc4cf7b710e32529c45d17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'cf2c1ddb2e3445358c78246430c3515f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'cf82cc46ab3b4f85a430e753302ed6d1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd094fd60e9e74a85aa18193fb5095664')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd15ec45a4c5449c3bbd7a61d5f9dd1d2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd318d549842b4eb699af09670fcca5d2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd54969876bc242868f2fdb768d51b088')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd7d0f16ac4104e89a7970c8c8cca80f2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd80dc4dd6fe24790a418a687c98a5f45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'd8939003bb21482eb19b950358cda5ef')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'de3a96ac346b40da922f9f69112f6194')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'df0a5325a58f46b68ca37ffcf03cee7a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'df7ce823c5b24ff9bada43d992f373e2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'dffd6a6da4054f128a3641b5c03a7489')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e1f28daf8ae7437e991631c8ecb7a933')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e272507128c04b52b97c20682919a982')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e44828208f0b4e6ab778cf2973b9f584')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e569e60e2391464cba453efc09de4319')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e64a6e168016411385b5bc24cc141142')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e7b2a6158a6d41ad9dbdf624690d4a5b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e8cbe506035442ada4f6ae42e4965cb7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'e93e2f4f6ef943f6be8951ff1dd4080e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ea52aa30435a412e8ad65d59d51fdfae')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'eb3e761a0fad4daf8bfa5e4edbd4292d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'eb67338c0b29403394320d27c6b94afd')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ed4fe7c8883e47f1a8232e3f4d9975c9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ee50d602b6c3451b8d7cfbd88e0e015f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ef199cd82be2481992006c7098f1584e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'efa0aaa96cf7471da23ccae6c08619e8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f11861590c464041afe2c0a0e3108004')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f14b43f512e8403d92921488fd5810a3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f250c4af8858456b8afa6aa5d5a43d81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f58ca893fbee483ebdf3ca4486f2adfa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f6042fd00acb424d85c3cf8f04ab7a44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f66bed290a1a43b18490f8f27c147b26')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f821b74bf02f41d1990aa74fa0b588d0')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f83ce9d381b44cf5bbb7d17273de5cb4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'f845e1865ca44ecfab2c3e1ba587f55d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'fcc9d1031a0c4d9eab649f5fb4ff893e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'fcdb6c45485849898013f2ee66aabb81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'fd0c95c55d76419796d9dbf31a963596')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ffb52f10d2c349fc97fcb5ef5089e440')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'1', N'ffebb3f39a224b5f8d82f65673debfff')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'03103468c51d40e7aaf1e519b015a068')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'049c8cc8024042a8869696d70a159a16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'05b602a7e8a449449d26c1fa238db667')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'05f16d2f498d4e96a7039c3604646974')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'07b5edda57f84a378b39025dd62853f6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'07d0c69b149e4179a1f7c87803c94116')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'0d4915931b4c4fb3a5445835bf08d387')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'0f1923ca5c7b46409537196c47a0f299')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'10')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1047498532e04f0aa4276617abd1703a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'12')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'13')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'14')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'15')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'15f93498e170422a98dd2e2f147a4102')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'18')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'19')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1972a3d586a44dfbb8793a687630bc4d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1ab3dbb88b764fbfaf9b80edb0f2c70e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1b6c732054c3461a8aa349aa7ef8116b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1d817ecd71b14ddebacaefae3b6ea496')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'1f2ee21294714afcbcce56813c4cd721')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'20')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'21')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'22')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'23')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'27')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'28')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'29')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'2b21ef9fd0db4eb9bd15bd23f7fe6462')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'2b683bd9cd144bf5a1434db42d67df79')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'30')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'31')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'32')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'32706c88414a4a74ac2be0f4a067f784')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'32ec93aa01e74e42887f70cb79f4c144')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'3349fbe4b337448093da4e613cf50ffe')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'34')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'35')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'36')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'37')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'38')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'384bbe5e6d08488aba60942cc315f633')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'3b0a9cf79f734592b1794b1c10f5f3cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'3bf016141ea0481dbc49b9c323ed8d33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'3df78c3653ae476cb1536de4f47d97a9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'40')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'41')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'42')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4246a4a7405c4df7a8206085ecb77f48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'42efd9ac7e3441e68488c2e3004a900d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'433218ee043e404885e1ac8bebbae3db')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'45c45ce333a9413fa74e7f616ec54824')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'45d936b0596244c3a70d0d1e70958928')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'46')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'47')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'49')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'49d32850775949ee95e22f797c7e2307')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4a196d2b76534242a439151f36c14ff6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4a3afae0ee834347ae3a7d8de0badeda')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4c6c08c4b82e4cfc884be66af5e63520')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4ec1504664de43d7a95ae272bdf50ba1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'4fb04189d8a444b499d4588fbf4e918d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'50')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'50f5140d522d4bf5a7b22389afb855b2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'51')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'51835c953a2546848500a6e7ab569537')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'51de2f0a6866497c87e78ae9c415ef43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'52')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'52249880a2d843259aff211461afe1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'53')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'54')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'56')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'57')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'572fc47c72f2490da5eaaee4e3b4ab22')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'57d61214e261447fabc499cd02cf665b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'58')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'58e1fb41286e4ae48def36db34e49901')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'59')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'5a28204146a442d99e4f6433ddcd814d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'5b0561c194044f07b0a72abd532ad25c')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'5b9df47ab2af4f4f84c15c528dc2d095')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'5e71a0c87d954a998b11ef7266074673')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'60')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'60a56f7a192549698d6879f899366833')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'61')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'621df1992e1d48fbb1eb1e5f1273135d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'63183c8d7af44545be01c2ebf33cdc0a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'63b62ebabd644e5b98a11fab67c6782a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'67')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'68')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'6a2bb808d17e458e9f46dd27cd61363d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'6aa00d1ccc2349f6b2301c1ef48fb137')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'6ecef1c2c7654f0eb95faaf808fa74f8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'71')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'73c3a5c2bcf940ceb21e6528a117d533')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'74741329932844b58f6d15e19ca80922')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'75e6a44b9015478eb7fe37c0e8d36160')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'784bc71f89d446ec8621fdab14c3b2b4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'79')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'7ba6f20ebf7b4b53aa926181aa2dfbcc')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'7d6155e835e646dcb638278f793ab6b1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'80')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'82')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'84')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'85')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'86d986372df242a4a537091d01f2d13e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'88968dc050dc42df9e4e0093eb9b3158')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'8aac76f60c5b44aca33b699e9bf6ac83')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'901990a1fb9e47ce8937881f43710d11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'930f20fa6d2d412188bd4d0145844ec8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'9599774570174d9f960e0cd52c4674b2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'973958606693485d88ce6c3a6c7e339f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'97e896b22d9340558bc4b2b576dde9d2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'99b20c0ec6b2427abf594f1346611d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'9c450f1d515847cebeb9ba4e9dbeb2fa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'9cadfc0a5d75492c8155135979ebe20f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'9ded8d7767fe4ba08ecd09002e1b11cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'a0050fd2a38c49aca0bc40261f6d6ac2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'a41a2992d7274049a8c869f19ccb8d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'aa1c4d8515d946099282edd67dc0a3ac')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ad7e2de306e049af9abd5a094be45b5a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ae41d3330be14576975f767787739e39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ae7a504cd29a49eab5fb0014e3370342')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'b2a07f89f724402fba27bdc47ee32c17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'b3b636490c6041f3a0a8f534311d7c6a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'b9a23c69ca1c416191d488d7190c9204')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'bb25a976433c420dbfec13caf977a5ec')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'bd0b0d30479b4783aa8b277c725880c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'be4c441293c14a039a1526918f060356')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'be84805fa8af41e48b3f177e32b5d182')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'bf1fc0d189e44ab78f4f523350f92d48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'c066b733c52b49c99e3b74a7a3f430be')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'c16ebf95d07a4c969bfa2909cc100c1a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'c20fd5adc50948dc8b4d153a212471e0')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'c8fcdb9f01e94885830c7d0f02718551')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'c9a8574a03ba488384dc68270e68b580')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ca7ad19acae84562bc1e38967445fb24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'cb3544ea3d574e148aa3450ad29eee16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'cf2c1ddb2e3445358c78246430c3515f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'cf82cc46ab3b4f85a430e753302ed6d1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'd094fd60e9e74a85aa18193fb5095664')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'd54969876bc242868f2fdb768d51b088')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'd7d0f16ac4104e89a7970c8c8cca80f2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'd80dc4dd6fe24790a418a687c98a5f45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'd8939003bb21482eb19b950358cda5ef')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'de3a96ac346b40da922f9f69112f6194')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'df0a5325a58f46b68ca37ffcf03cee7a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'dffd6a6da4054f128a3641b5c03a7489')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e1f28daf8ae7437e991631c8ecb7a933')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e272507128c04b52b97c20682919a982')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e44828208f0b4e6ab778cf2973b9f584')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e569e60e2391464cba453efc09de4319')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e64a6e168016411385b5bc24cc141142')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e7b2a6158a6d41ad9dbdf624690d4a5b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e8cbe506035442ada4f6ae42e4965cb7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'e93e2f4f6ef943f6be8951ff1dd4080e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ea52aa30435a412e8ad65d59d51fdfae')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ee50d602b6c3451b8d7cfbd88e0e015f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ef199cd82be2481992006c7098f1584e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f11861590c464041afe2c0a0e3108004')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f14b43f512e8403d92921488fd5810a3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f250c4af8858456b8afa6aa5d5a43d81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f58ca893fbee483ebdf3ca4486f2adfa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f6042fd00acb424d85c3cf8f04ab7a44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f66bed290a1a43b18490f8f27c147b26')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f821b74bf02f41d1990aa74fa0b588d0')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f83ce9d381b44cf5bbb7d17273de5cb4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'f845e1865ca44ecfab2c3e1ba587f55d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'fcc9d1031a0c4d9eab649f5fb4ff893e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'fcdb6c45485849898013f2ee66aabb81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'fd0c95c55d76419796d9dbf31a963596')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ffb52f10d2c349fc97fcb5ef5089e440')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'2', N'ffebb3f39a224b5f8d82f65673debfff')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'10')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'12')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'13')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'14')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'15')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'18')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'19')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'20')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'21')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'22')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'23')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'25')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'26')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'27')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'28')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'29')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'30')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'31')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'32')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'34')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'35')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'36')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'37')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'38')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'40')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'41')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'42')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'46')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'47')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'49')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'50')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'51')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'52')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'53')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'54')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'56')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'57')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'58')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'59')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'60')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'61')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'64')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'65')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'66')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'67')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'68')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'71')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'74')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'75')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'76')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'77')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'78')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'79')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'80')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'82')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'83')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'84')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'85')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'86')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'87')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'3', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'05b602a7e8a449449d26c1fa238db667')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'05f16d2f498d4e96a7039c3604646974')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'06e45d50548247b89a12f52149513b6f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'07b5edda57f84a378b39025dd62853f6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'1047498532e04f0aa4276617abd1703a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'27')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'28')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'29')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'30')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'31')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'32')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'32706c88414a4a74ac2be0f4a067f784')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'3349fbe4b337448093da4e613cf50ffe')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'34')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'35')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'36')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'37')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'38')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'3b0a9cf79f734592b1794b1c10f5f3cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'40')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'41')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'42')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'45c45ce333a9413fa74e7f616ec54824')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'45d936b0596244c3a70d0d1e70958928')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'46')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'47')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'49')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'4a196d2b76534242a439151f36c14ff6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'4fb04189d8a444b499d4588fbf4e918d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'50')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'51')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'51de2f0a6866497c87e78ae9c415ef43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'52')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'52249880a2d843259aff211461afe1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'53')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'54')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'56')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'57')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'57d61214e261447fabc499cd02cf665b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'58')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'59')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'60')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'61')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'63b62ebabd644e5b98a11fab67c6782a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'6ecef1c2c7654f0eb95faaf808fa74f8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'71')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'78862cde46944424ac58121c75c788d5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'7ba6f20ebf7b4b53aa926181aa2dfbcc')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'901990a1fb9e47ce8937881f43710d11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'99b20c0ec6b2427abf594f1346611d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'9ded8d7767fe4ba08ecd09002e1b11cf')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'a0050fd2a38c49aca0bc40261f6d6ac2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'a41a2992d7274049a8c869f19ccb8d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'aa1c4d8515d946099282edd67dc0a3ac')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'ae41d3330be14576975f767787739e39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'b2a07f89f724402fba27bdc47ee32c17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'b3b636490c6041f3a0a8f534311d7c6a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'b91bebd025f24589b653a00a31e9d1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'b9a23c69ca1c416191d488d7190c9204')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'c16ebf95d07a4c969bfa2909cc100c1a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'c8fcdb9f01e94885830c7d0f02718551')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'cf82cc46ab3b4f85a430e753302ed6d1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'd094fd60e9e74a85aa18193fb5095664')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'd54969876bc242868f2fdb768d51b088')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'd80dc4dd6fe24790a418a687c98a5f45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'e272507128c04b52b97c20682919a982')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'e569e60e2391464cba453efc09de4319')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'e7b2a6158a6d41ad9dbdf624690d4a5b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'e93e2f4f6ef943f6be8951ff1dd4080e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'ee50d602b6c3451b8d7cfbd88e0e015f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'f11861590c464041afe2c0a0e3108004')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'f14b43f512e8403d92921488fd5810a3')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'f58ca893fbee483ebdf3ca4486f2adfa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'f83ce9d381b44cf5bbb7d17273de5cb4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'fcdb6c45485849898013f2ee66aabb81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'fd0c95c55d76419796d9dbf31a963596')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'1047498532e04f0aa4276617abd1703a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'51de2f0a6866497c87e78ae9c415ef43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'64')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'65')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'66')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'74')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'901990a1fb9e47ce8937881f43710d11')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'c16ebf95d07a4c969bfa2909cc100c1a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'6', N'e569e60e2391464cba453efc09de4319')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'03103468c51d40e7aaf1e519b015a068')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'049c8cc8024042a8869696d70a159a16')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'05b602a7e8a449449d26c1fa238db667')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'05f16d2f498d4e96a7039c3604646974')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'063ae8b76c3e41bdbe0b2203056bb2ed')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'07b5edda57f84a378b39025dd62853f6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'0f1923ca5c7b46409537196c47a0f299')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'15f93498e170422a98dd2e2f147a4102')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'1972a3d586a44dfbb8793a687630bc4d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'1ab3dbb88b764fbfaf9b80edb0f2c70e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'1b6c732054c3461a8aa349aa7ef8116b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'1d63012ae3584adc8d6d27d5a9c991fe')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'1f2ee21294714afcbcce56813c4cd721')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'27')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'28')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'29')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'2b21ef9fd0db4eb9bd15bd23f7fe6462')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'2c120aee71ba422c8bcc8b8a74bbcc9d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'30')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'31')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'32')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'32706c88414a4a74ac2be0f4a067f784')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'32ec93aa01e74e42887f70cb79f4c144')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'3349fbe4b337448093da4e613cf50ffe')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'34')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'35')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'36')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'37')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'38')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'384bbe5e6d08488aba60942cc315f633')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'3bf016141ea0481dbc49b9c323ed8d33')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'3df78c3653ae476cb1536de4f47d97a9')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'40')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'41')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'42')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'4246a4a7405c4df7a8206085ecb77f48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'42efd9ac7e3441e68488c2e3004a900d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'43')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'45d936b0596244c3a70d0d1e70958928')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'46')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'47')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'49')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'49d32850775949ee95e22f797c7e2307')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'4a196d2b76534242a439151f36c14ff6')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'4a3afae0ee834347ae3a7d8de0badeda')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'4ec1504664de43d7a95ae272bdf50ba1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'4fb04189d8a444b499d4588fbf4e918d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'4fe1753b33164ad986382f7abaeea719')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'50')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'50f5140d522d4bf5a7b22389afb855b2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'51')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'51835c953a2546848500a6e7ab569537')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'52')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'52249880a2d843259aff211461afe1c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'53')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'54')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'54f52b533b9e463ea13bc9b9c06cc882')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'55')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'56')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'57')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'57d61214e261447fabc499cd02cf665b')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'58')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'58e1fb41286e4ae48def36db34e49901')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'59')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'5b0561c194044f07b0a72abd532ad25c')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'5b9df47ab2af4f4f84c15c528dc2d095')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'60')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'61')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'62')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'621df1992e1d48fbb1eb1e5f1273135d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'63')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'63b62ebabd644e5b98a11fab67c6782a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'69')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'6a2bb808d17e458e9f46dd27cd61363d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'6aa00d1ccc2349f6b2301c1ef48fb137')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'6ecef1c2c7654f0eb95faaf808fa74f8')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'70')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'71')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'72')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'73')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'73c3a5c2bcf940ceb21e6528a117d533')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'74741329932844b58f6d15e19ca80922')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'75e6a44b9015478eb7fe37c0e8d36160')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'784bc71f89d446ec8621fdab14c3b2b4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'7d6155e835e646dcb638278f793ab6b1')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'86d986372df242a4a537091d01f2d13e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'88')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'88968dc050dc42df9e4e0093eb9b3158')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'89')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'8aac76f60c5b44aca33b699e9bf6ac83')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'90')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'9599774570174d9f960e0cd52c4674b2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'97e896b22d9340558bc4b2b576dde9d2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'a0050fd2a38c49aca0bc40261f6d6ac2')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'a41a2992d7274049a8c869f19ccb8d8f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'aa1c4d8515d946099282edd67dc0a3ac')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'ad7e2de306e049af9abd5a094be45b5a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'ae41d3330be14576975f767787739e39')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'b2a07f89f724402fba27bdc47ee32c17')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'b3b636490c6041f3a0a8f534311d7c6a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'b9a23c69ca1c416191d488d7190c9204')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'bb25a976433c420dbfec13caf977a5ec')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'bd0b0d30479b4783aa8b277c725880c5')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'be84805fa8af41e48b3f177e32b5d182')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'bf1fc0d189e44ab78f4f523350f92d48')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'c20fd5adc50948dc8b4d153a212471e0')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'c8fcdb9f01e94885830c7d0f02718551')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'ca7ad19acae84562bc1e38967445fb24')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'cf2c1ddb2e3445358c78246430c3515f')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'd094fd60e9e74a85aa18193fb5095664')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'd80dc4dd6fe24790a418a687c98a5f45')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'df0a5325a58f46b68ca37ffcf03cee7a')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'dffd6a6da4054f128a3641b5c03a7489')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'e1f28daf8ae7437e991631c8ecb7a933')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'e272507128c04b52b97c20682919a982')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'e8cbe506035442ada4f6ae42e4965cb7')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'e93e2f4f6ef943f6be8951ff1dd4080e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'f58ca893fbee483ebdf3ca4486f2adfa')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'f6042fd00acb424d85c3cf8f04ab7a44')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'f821b74bf02f41d1990aa74fa0b588d0')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'f83ce9d381b44cf5bbb7d17273de5cb4')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'f845e1865ca44ecfab2c3e1ba587f55d')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'fcc9d1031a0c4d9eab649f5fb4ff893e')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'fcdb6c45485849898013f2ee66aabb81')
GO

INSERT INTO [dbo].[sys_role_menu]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'ffb52f10d2c349fc97fcb5ef5089e440')
GO

COMMIT
GO



-- ----------------------------
-- Records of [sys_role_office]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'10')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'11')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'12')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'13')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'14')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'15')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'16')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'17')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'18')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'19')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'20')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'21')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'22')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'23')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'24')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'25')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'26')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'7')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'8')
GO

INSERT INTO [dbo].[sys_role_office]  VALUES (N'7', N'9')
GO

COMMIT
GO




-- ----------------------------
-- Records of [sys_user]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'0aa58273376a47978e6add548f29f2ca', N'1', N'5', N'caozuoyuan', N'cff79affd3428a483704882dacdbcab6b97b4434b9cfd4f1170ae124', N'00004', N'操作员', NULL, NULL, NULL, N'3', NULL, N'0:0:0:0:0:0:0:1', N'2017-12-01 15:51:34.766', N'1', N'1', N'2017-11-13 11:34:47.000', N'1', N'2017-11-14 11:04:57.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'1', N'1', N'2', N'thinkgem', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0001', N'系统管理员', N'thinkgem@163.com', N'8675', N'8675', N'1', N'', N'0:0:0:0:0:0:0:1', N'2017-12-03 20:17:37.123', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-12-02 10:05:53.600', N'最高管理员', N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'10', N'7', N'11', N'jn_jsb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0010', N'济南技术部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'11', N'12', N'13', N'lc_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0011', N'济南历城领导', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'12', N'12', N'18', N'lx_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0012', N'济南历下领导', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'13', N'22', N'23', N'gx_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0013', N'济南高新领导', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'2', N'1', N'2', N'sd_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0002', N'管理员', NULL, NULL, NULL, NULL, NULL, N'0:0:0:0:0:0:0:1', N'2017-10-30 18:01:39.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'3', N'1', N'3', N'jingli', N'e77042f69aac3bfc2a2606209283ca2785cb808cdc35789bbf794202', N'0003', N'经理', NULL, NULL, NULL, N'2', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-24 15:07:56.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-17 09:55:14.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'4', N'1', N'4', N'xiaoshoujingli', N'7935f3dd780e98875d2cce060994513199e784c423a8486b2cb01826', N'0004', N'销售经理', NULL, NULL, NULL, N'2', NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:40:17.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'5', N'1', N'5', N'caozuoyuanjingli', N'9ca540b52738ba909c16e82d13c7027f1fb062c6fb8f586d1f6cc0e5', N'0005', N'操作员经理', NULL, NULL, NULL, N'2', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-16 20:44:24.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:41:30.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'6', N'1', N'6', N'sd_yfb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0006', N'研发部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'7', N'7', N'8', N'jn_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0007', N'济南领导', NULL, NULL, NULL, NULL, NULL, N'0:0:0:0:0:0:0:1', N'2017-11-14 11:19:49.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'734d64bc07ae40e3ab23d79fbcbab27d', N'1', N'3', N'kuaiji', N'439a70565b6e57942d87736c101ee8b2d59d15969ece2fe2229c62fb', N'00003', N'会计', NULL, NULL, NULL, N'3', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-21 10:31:13.000', N'1', N'1', N'2017-11-13 11:34:07.000', N'1', N'2017-11-14 11:04:03.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'8', N'7', N'9', N'jn_zhb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0008', N'济南综合部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'8a18d1e909894ac38aee74ab8e959731', N'1', N'4', N'yewuyuan', N'92494836ea06660c401197ba4c8f5209e092bafc6ece3815fb2c1dda', N'00002', N'业务员', NULL, NULL, NULL, N'3', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-24 16:15:36.000', N'1', N'1', N'2017-11-13 11:33:36.000', N'1', N'2017-11-14 11:03:39.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'9', N'7', N'10', N'jn_scb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0009', N'济南市场部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'b3b68e02299944c89eb9657b30ff7bdb', N'1', N'2', N'ceshi', N'8f10946f809ae19ae28b8fadf9ee3e4ff8571d4399bdaeb96023c197', N'0001', N'娴嬭瘯', N'ceshi@ceshi.com', N'18888888888', N'18888888888', N'3', N'/amrvm/userfiles/1/images/photo/2017/11/timg.jpg', NULL, NULL, N'1', N'1', N'2017-11-30 18:07:24.826', N'1', N'2017-11-30 18:07:24.826', N'ceshi', N'1')
GO

COMMIT
GO



-- ----------------------------
-- Records of [sys_user_role]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'0aa58273376a47978e6add548f29f2ca', N'ff4d8daf37404a72a688a72ebf7b43dd')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'1', N'1')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'10', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'11', N'3')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'12', N'4')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'13', N'5')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'14', N'6')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'2', N'1')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'3', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'4', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'4', N'4c125b95bcac49478be0f9d52185e7c4')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'5', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'5', N'ff4d8daf37404a72a688a72ebf7b43dd')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'6', N'5')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'7', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'7', N'7')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'734d64bc07ae40e3ab23d79fbcbab27d', N'084e586c6ad8478da6db0155809248b1')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'8', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'8a18d1e909894ac38aee74ab8e959731', N'4c125b95bcac49478be0f9d52185e7c4')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'9', N'1')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'b3b68e02299944c89eb9657b30ff7bdb', N'ff4d8daf37404a72a688a72ebf7b43dd')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'cd6c4f9b3ec046b3870f25b75e53e010', N'1')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'cd6c4f9b3ec046b3870f25b75e53e010', N'2')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'e79787baf5cf481fb7faf52a2e00ce5c', N'1')
GO

INSERT INTO [dbo].[sys_user_role]  VALUES (N'e79787baf5cf481fb7faf52a2e00ce5c', N'2')
GO

COMMIT
GO
