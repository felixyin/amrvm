


-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_article]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_article]
GO

CREATE TABLE [dbo].[cms_article] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [category_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [title] varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [link] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [color] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [image] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [keywords] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [description] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [weight] int DEFAULT ((0)) NULL,
  [weight_date] datetime NULL,
  [hits] int DEFAULT ((0)) NULL,
  [posid] varchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [custom_content_view] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [view_config] text COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_article_data]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_article_data]
GO

CREATE TABLE [dbo].[cms_article_data] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [content] text COLLATE Chinese_PRC_CI_AS NULL,
  [copyfrom] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [relation] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [allow_comment] char(1) COLLATE Chinese_PRC_CI_AS NULL
)
GO


-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_category]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_category]
GO

CREATE TABLE [dbo].[cms_category] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_ids] varchar(2000) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [site_id] varchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT ('1') NULL,
  [office_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [module] varchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [image] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [href] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [target] varchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [description] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [keywords] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [sort] int DEFAULT ((30)) NULL,
  [in_menu] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('1') NULL,
  [in_list] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('1') NULL,
  [show_modes] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NULL,
  [allow_comment] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_audit] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [custom_list_view] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [custom_content_view] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [view_config] text COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_comment]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_comment]
GO

CREATE TABLE [dbo].[cms_comment] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [category_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [content_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [title] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [content] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [ip] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NOT NULL,
  [audit_user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [audit_date] datetime NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_guestbook]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_guestbook]
GO

CREATE TABLE [dbo].[cms_guestbook] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [type] char(1) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [content] varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [email] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [phone] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [workunit] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ip] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [re_user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [re_date] datetime NULL,
  [re_content] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_link]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_link]
GO

CREATE TABLE [dbo].[cms_link] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [category_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [title] varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [color] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [image] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [href] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [weight] int DEFAULT ((0)) NULL,
  [weight_date] datetime NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cms_site]') AND type IN ('U'))
	DROP TABLE [dbo].[cms_site]
GO

CREATE TABLE [dbo].[cms_site] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [title] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [logo] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [domain] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [description] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [keywords] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [theme] varchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT ('default') NULL,
  [copyright] text COLLATE Chinese_PRC_CI_AS NULL,
  [custom_index_view] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[gen_scheme]') AND type IN ('U'))
	DROP TABLE [dbo].[gen_scheme]
GO

CREATE TABLE [dbo].[gen_scheme] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [category] varchar(2000) COLLATE Chinese_PRC_CI_AS NULL,
  [package_name] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [module_name] varchar(30) COLLATE Chinese_PRC_CI_AS NULL,
  [sub_module_name] varchar(30) COLLATE Chinese_PRC_CI_AS NULL,
  [function_name] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [function_name_simple] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [function_author] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [gen_table_id] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[gen_table]') AND type IN ('U'))
	DROP TABLE [dbo].[gen_table]
GO

CREATE TABLE [dbo].[gen_table] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [comments] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [class_name] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [parent_table] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [parent_table_fk] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[gen_table_column]') AND type IN ('U'))
	DROP TABLE [dbo].[gen_table_column]
GO

CREATE TABLE [dbo].[gen_table_column] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [gen_table_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [comments] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [jdbc_type] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [java_type] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [java_field] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [is_pk] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_null] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_insert] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_edit] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_list] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_query] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [query_type] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [show_type] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [dict_type] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [settings] varchar(2000) COLLATE Chinese_PRC_CI_AS NULL,
  [sort] decimal(18) NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[gen_template]') AND type IN ('U'))
	DROP TABLE [dbo].[gen_template]
GO

CREATE TABLE [dbo].[gen_template] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [category] varchar(2000) COLLATE Chinese_PRC_CI_AS NULL,
  [file_path] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [file_name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [content] text COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] datetime NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[oa_leave]') AND type IN ('U'))
	DROP TABLE [dbo].[oa_leave]
GO

CREATE TABLE [dbo].[oa_leave] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [process_instance_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [start_time] datetime NULL,
  [end_time] datetime NULL,
  [leave_type] varchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [reason] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [apply_time] datetime NULL,
  [reality_start_time] datetime NULL,
  [reality_end_time] datetime NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[oa_notify]') AND type IN ('U'))
	DROP TABLE [dbo].[oa_notify]
GO

CREATE TABLE [dbo].[oa_notify] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [type] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [title] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [content] varchar(2000) COLLATE Chinese_PRC_CI_AS NULL,
  [files] varchar(2000) COLLATE Chinese_PRC_CI_AS NULL,
  [status] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[oa_notify_record]') AND type IN ('U'))
	DROP TABLE [dbo].[oa_notify_record]
GO

CREATE TABLE [dbo].[oa_notify_record] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [oa_notify_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [read_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NULL,
  [read_date] smalldatetime NULL
)
GO


-- ----------------------------
-- Table structure for OA_TEST_AUDIT
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[OA_TEST_AUDIT]') AND type IN ('U'))
	DROP TABLE [dbo].[OA_TEST_AUDIT]
GO

CREATE TABLE [dbo].[OA_TEST_AUDIT] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PROC_INS_ID] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [USER_ID] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [OFFICE_ID] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [POST] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [AGE] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [EDU] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [CONTENT] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [OLDA] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [OLDB] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [OLDC] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [NEWA] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [NEWB] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [NEWC] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [ADD_NUM] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [EXE_DATE] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [HR_TEXT] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [LEAD_TEXT] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [MAIN_LEAD_TEXT] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_area]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_area]
GO

CREATE TABLE [dbo].[sys_area] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_ids] varchar(2000) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [sort] decimal(10) NOT NULL,
  [code] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [type] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Records of [sys_area]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'1', N'0', N'0,', N'中国', N'10', N'100000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'2', N'1', N'0,1,', N'山东�?', N'20', N'110000', N'2', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'3', N'2', N'0,1,2,', N'青岛�?', N'30', N'370202', N'3', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:34:56.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'4', N'3', N'0,1,2,3,', N'市南�?', N'40', N'370202', N'4', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:35:21.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'5', N'3', N'0,1,2,3,', N'市北�?', N'50', N'370203', N'4', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:36:07.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_area]  VALUES (N'6', N'3', N'0,1,2,3,', N'崂山�?', N'60', N'370212', N'4', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:36:32.000', NULL, N'1')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_country
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_country]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_country]
GO

CREATE TABLE [dbo].[sys_country] (
  [id] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [aname] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [zh_name] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [code] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [update_by] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [update_date] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL
)
GO


-- ----------------------------
-- Records of [sys_country]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'0191be570c6b4537b62c922e86a29f99', N'abc123', N'测试abc', N'ab', N'1', N'2017/11/6 11:00:26', N'1', N'2017/11/6 11:03:30', N'这是�?个测试的例子', N'1')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'1', N'Afghanistan', N'阿富�?', N'AF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'10', N'Argentina', N'阿根�?', N'AR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'100', N'India', N'印度', N'IN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'101', N'Indonesia', N'印度尼西�?', N'ID', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'102', N'Iran (Islamic Republic of)', N'Iran (Islamic Republic of)', N'IR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'103', N'Iraq', N'伊拉�?', N'IQ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'104', N'Ireland', N'爱尔�?', N'IE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'105', N'Isle of Man', N'英国属地曼岛', N'IM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'106', N'Israel', N'以色�?', N'IL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'107', N'Italy', N'意大�?', N'IT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'108', N'Jamaica', N'牙买�?', N'JM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'109', N'Japan', N'日本', N'JP', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'11', N'Armenia', N'亚美尼亚', N'AM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'110', N'Jordan', N'约旦', N'JO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'111', N'Kazakhstan', N'哈萨�?', N'KZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'112', N'Kenya', N'肯尼�?', N'KE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'113', N'Kiribati', N'吉尔巴斯', N'KI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'114', N'Kuwait', N'科威�?', N'KW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'115', N'Kyrgyzstan', N'吉尔吉斯', N'KG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'116', N'Lao People''s Democratic Republic', N'Lao People''s Democratic Republic', N'LA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'117', N'Latvia', N'拉脱维亚', N'LV', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'118', N'Lebanon', N'黎巴�?', N'LB', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'119', N'Lesotho', N'莱索�?', N'LS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'12', N'Aruba', N'阿鲁�?', N'AW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'120', N'Liberia', N'利比里亚', N'LR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'121', N'Libyan Arab Jamahiriya', N'利比�?', N'LY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'122', N'Liechtenstein', N'列支敦士�?', N'LI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'123', N'Lithuania', N'立陶�?', N'LT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'124', N'Luxembourg', N'卢森�?', N'LU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'125', N'Macau', N'澳门地区', N'MO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'126', N'Madagascar', N'马达加斯�?', N'MG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'127', N'Malawi', N'马拉�?', N'MW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'128', N'Malaysia', N'马来西亚', N'MY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'129', N'Maldives', N'马尔代夫', N'MV', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'13', N'Australia', N'澳大利亚', N'AU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'130', N'Mali', N'马里', N'ML', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'131', N'Malta', N'马尔�?', N'MT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'132', N'Marshall Islands', N'马绍尔群�?', N'MH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'133', N'Martinique', N'马提尼克�?', N'MQ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'134', N'Mauritania', N'毛里塔尼�?', N'MR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'135', N'Mauritius', N'毛里求斯', N'MU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'136', N'Mayotte', N'马约�?', N'YT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'137', N'Mexico', N'墨西�?', N'MX', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'138', N'Micronesia', N'密克罗尼西亚', N'FM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'139', N'Moldova', N'摩尔多瓦', N'MD', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'14', N'Austria', N'奥地�?', N'AT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'140', N'Monaco', N'摩纳�?', N'MC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'141', N'Mongolia', N'外蒙�?', N'MN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'142', N'Montenegro', N'Montenegro', N'MNE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'143', N'Montserrat', N'蒙特色纳', N'MS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'144', N'Morocco', N'摩洛�?', N'MA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'145', N'Mozambique', N'莫桑比克', N'MZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'146', N'Myanmar', N'缅甸', N'MM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'147', N'Namibia', N'那米比亚', N'NA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'148', N'Nauru', N'瑙鲁', N'NR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'149', N'Nepal', N'尼泊�?', N'NP', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'15', N'Azerbaijan', N'阿塞拜疆', N'AZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'150', N'Netherlands', N'荷兰', N'NL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'151', N'Netherlands Antilles', N'荷兰安的列斯群岛', N'AN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'152', N'New Caledonia', N'新加勒多尼亚', N'NC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'153', N'New Zealand', N'新西�?', N'NZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'154', N'Nicaragua', N'尼加拉瓜', N'NI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'155', N'Niger', N'尼日�?', N'NE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'156', N'Nigeria', N'尼日利亚', N'NG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'157', N'Niue', N'纽鄂�?', N'NU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'158', N'Norfolk Island', N'诺福克岛', N'NF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'159', N'North Korea', N'朝鲜', N'KP', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'16', N'Bahamas', N'巴哈�?', N'BS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'160', N'Northern Mariana Islands', N'北马里亚纳群�?', N'MP', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'161', N'Norway', N'挪威', N'NO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'162', N'Oman', N'阿曼', N'OM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'163', N'Pakistan', N'巴基斯坦', N'PK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'164', N'Palau', N'帛琉', N'PW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'165', N'Palestine', N'巴勒斯坦', N'PS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'166', N'Panama', N'巴拿�?', N'PA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'167', N'Papua New Guinea', N'巴布亚新几内�?', N'PG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'168', N'Paraguay', N'巴拉�?', N'PY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'169', N'Peru', N'秘鲁', N'PE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'17', N'Bahrain', N'巴林', N'BH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'170', N'Philippines', N'菲律宾共和国', N'PH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'171', N'Pitcairn', N'皮特凯恩�?', N'PN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'172', N'Poland', N'波兰', N'PL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'173', N'Portugal', N'葡萄�?', N'PT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'174', N'Puerto Rico', N'波多黎各', N'PR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'175', N'Qatar', N'卡塔�?', N'QA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'176', N'Reunion', N'Reunion', N'RE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'177', N'Romania', N'罗马尼亚', N'RO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'178', N'Russian Federation', N'俄罗斯联�?', N'RU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'179', N'Rwanda', N'卢旺�?', N'RW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'18', N'Bangladesh', N'孟加拉国', N'BD', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'180', N'Saint Kitts and Nevis', N'圣吉斯和尼维�?', N'KN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'181', N'Saint Lucia', N'圣卢西亚', N'LC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'182', N'Saint Vincent and the Grenadines', N'圣文森和格林纳丁�?', N'VC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'183', N'Samoa', N'美属萨摩�?', N'WS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'184', N'San Marino', N'San Marino', N'SM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'185', N'Sao Tome and Principe', N'圣多美和普林西比', N'ST', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'186', N'Saudi Arabia', N'沙特阿拉�?', N'SA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'187', N'Senegal', N'塞内加尔', N'SN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'188', N'Serbia', N'塞尔维亚共和�?', N'SRB', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'189', N'Seychelles', N'塞锡尔群�?', N'SC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'19', N'Barbados', N'巴巴多斯', N'BB', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'190', N'Sierra Leone', N'塞拉利昂', N'SL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'191', N'Singapore', N'新加�?', N'SG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'192', N'Slovakia (Slovak Republic)', N'斯洛伐克（斯洛伐克人的共和国�?', N'SK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'193', N'Slovenia', N'斯洛文尼�?', N'SI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'194', N'Solomon Islands', N'索罗门群�?', N'SB', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'195', N'Somalia', N'索马�?', N'SO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'196', N'South Africa', N'南非', N'ZA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'197', N'South Korea', N'韩国', N'KR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'198', N'Spain', N'西班�?', N'ES', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'199', N'Sri Lanka', N'斯里兰卡', N'LK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'2', N'Albania', N'阿尔巴尼�?', N'AL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'20', N'Belarus', N'白俄罗斯', N'BY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'200', N'St. Helena', N'圣海伦娜', N'SH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'201', N'St. Pierre and Miquelon', N'圣皮埃尔和密克罗', N'PM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'202', N'Sudan', N'苏丹', N'SD', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'203', N'Suriname', N'苏里�?', N'SR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'204', N'Svalbard and Jan Mayen Islands', N'冷岸和央麦恩群岛', N'SJ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'205', N'Swaziland', N'斯威士兰', N'SZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'206', N'Sweden', N'瑞典', N'SE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'207', N'Switzerland', N'瑞士', N'CH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'208', N'Syrian Arab Republic', N'叙利�?', N'SY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'209', N'Taiwan', N'台湾地区', N'TW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'21', N'Belgium', N'比利�?', N'BE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'210', N'Tajikistan', N'塔吉�?', N'TJ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'211', N'Tanzania', N'坦桑尼亚', N'TZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'212', N'Thailand', N'泰国', N'TH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'213', N'The former Yugoslav Republic of Macedonia', N'前马其顿南斯拉夫共和�?', N'MK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'214', N'Togo', N'多哥', N'TG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'215', N'Tokelau', N'托克�?', N'TK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'216', N'Tonga', N'汤加', N'TO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'217', N'Trinidad and Tobago', N'千里达托贝哥共和�?', N'TT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'218', N'Tunisia', N'北非共和�?', N'TN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'219', N'Turkey', N'土�?�其', N'TR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'22', N'Belize', N'伯利兹城', N'BZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'220', N'Turkmenistan', N'土库�?', N'TM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'221', N'Turks and Caicos Islands', N'土克斯和�?科斯群岛', N'TC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'222', N'Tuvalu', N'图瓦�?', N'TV', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'223', N'Uganda', N'乌干�?', N'UG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'224', N'Ukraine', N'乌克�?', N'UA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'225', N'United Arab Emirates', N'阿拉伯联合酋长国', N'AE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'226', N'United Kingdom', N'英国', N'UK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'227', N'United States', N'美国', N'US', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'228', N'United States Minor Outlying Islands', N'美国小离�?', N'UM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'229', N'Uruguay', N'乌拉�?', N'UY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'23', N'Benin', N'贝宁', N'BJ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'230', N'Uzbekistan', N'乌兹别克斯坦', N'UZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'231', N'Vanuatu', N'瓦努阿图', N'VU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'232', N'Vatican City State (Holy See)', N'梵蒂�?(罗马教廷)', N'VA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'233', N'Venezuela', N'委内瑞拉', N'VE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'234', N'Vietnam', N'越南', N'VN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'235', N'Virgin Islands (British)', N'维尔京群�?(英国)', N'VG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'236', N'Virgin Islands (U.S.)', N'维尔京群�?(美国)', N'VI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'237', N'Wallis And Futuna Islands', N'沃利斯和富图纳群�?', N'WF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'238', N'Western Sahara', N'西撒哈拉', N'EH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'239', N'Yemen', N'也门', N'YE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'24', N'Bermuda', N'百慕�?', N'BM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'240', N'Yugoslavia', N'南斯拉夫', N'YU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'241', N'Zambia', N'赞比�?', N'ZM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'242', N'Zimbabwe', N'津巴布韦', N'ZW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'25', N'Bhutan', N'不丹', N'BT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'26', N'Bolivia', N'玻利维亚', N'BO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'27', N'Bosnia and Herzegovina', N'波斯尼亚和黑塞哥维那', N'BA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'28', N'Botswana', N'博茨瓦纳', N'BW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'29', N'Bouvet Island', N'布维�?', N'BV', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'2a95513e4d8f46b594dd83e3422c7ecb', N'test2', N'测试2', N'tt', N'1', N'2017/11/6 11:09:08', N'1', N'2017/11/6 11:09:36', N'测试�?个国�?2', N'1')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'3', N'Algeria', N'阿尔及利�?', N'DZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'30', N'Brazil', N'巴西', N'BR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'31', N'British Indian Ocean Territory', N'英属印度洋领�?', N'IO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'32', N'Brunei Darussalam', N'文莱达鲁萨兰�?', N'BN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'33', N'Bulgaria', N'保加利亚', N'BG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'34', N'Burkina Faso', N'布基纳法�?', N'BF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'35', N'Burundi', N'布隆�?', N'BI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'36', N'Cambodia', N'柬埔�?', N'KH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'37', N'Cameroon', N'�?麦隆', N'CM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'38', N'Canada', N'加拿�?', N'CA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'39', N'Cape Verde', N'佛得�?', N'CV', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'4', N'American Samoa', N'萨摩�?', N'AS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'40', N'Cayman Islands', N'�?曼群�?', N'KY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'41', N'Central African Republic', N'中非共和�?', N'CF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'42', N'Chad', N'乍得', N'TD', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'43', N'Chile', N'智利', N'CL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'44', N'China', N'中国', N'CN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'45', N'Christmas Island', N'圣延�?', N'CX', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'46', N'Cocos (Keeling) Islands', N'科科斯群�?', N'CC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'47', N'Colombia', N'哥伦比亚', N'CO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'48', N'Comoros', N'科摩�?', N'KM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'49', N'Congo', N'刚果', N'CG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'5', N'Andorra', N'安道尔共和国', N'AD', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'50', N'Congo, The Democratic Republic Of The', N'刚果民主共和�?', N'ZR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'51', N'Cook Islands', N'库克群岛', N'CK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'52', N'Costa Rica', N'哥斯达黎�?', N'CR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'53', N'Cote D''Ivoire', N'Cote D''Ivoire', N'CI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'54', N'Croatia (local name: Hrvatska)', N'克罗地亚', N'HR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'55', N'Cuba', N'古巴', N'CU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'56', N'Cyprus', N'塞浦路斯', N'CY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'57', N'Czech Republic', N'捷克', N'CZ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'58', N'Denmark', N'丹麦', N'DK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'59', N'Djibouti', N'吉布�?', N'DJ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'6', N'Angola', N'安哥�?', N'AO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'60', N'Dominica', N'多米尼克�?', N'DM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'61', N'Dominican Republic', N'多米尼加共和�?', N'DO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'62', N'East Timor', N'东帝�?', N'TP', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'63', N'Ecuador', N'厄瓜多尔', N'EC', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'64', N'Egypt', N'埃及', N'EG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'65', N'El Salvador', N'萨尔瓦多', N'SV', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'66', N'Equatorial Guinea', N'赤道几内�?', N'GQ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'67', N'Eritrea', N'厄立特里亚国', N'ER', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'68', N'Estonia', N'爱沙尼亚', N'EE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'69', N'Ethiopia', N'埃塞俄比�?', N'ET', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'7', N'Anguilla', N'安圭�?', N'AI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'70', N'Falkland Islands (Malvinas)', N'福克兰群�?', N'FK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'71', N'Faroe Islands', N'法罗群岛', N'FO', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'72', N'Fiji', N'斐济', N'FJ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'73', N'Finland', N'芬兰', N'FI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'74', N'France', N'法国', N'FR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'75', N'France Metropolitan', N'法国大都�?', N'FX', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'76', N'French Guiana', N'法属圭亚�?', N'GF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'77', N'French Polynesia', N'法属玻里尼西�?', N'PF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'78', N'French Southern Territories', N'French Southern Territories', N'TF', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'79', N'Gabon', N'加蓬', N'GA', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'8', N'Antarctica', N'南极�?', N'AQ', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'80', N'Gambia', N' 冈比�?', N'GM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'81', N'Georgia', N'格鲁吉亚', N'GE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'82', N'Germany', N'德国', N'DE', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'83', N'Ghana', N'加纳', N'GH', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'84', N'Gibraltar', N'直布罗陀', N'GI', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'85', N'Greece', N'希腊', N'GR', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'86', N'Greenland', N'格陵�?', N'GL', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'87', N'Grenada', N'格林纳达', N'GD', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'88', N'Guadeloupe', N'瓜德罗普�?', N'GP', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'89', N'Guam', N'关岛', N'GU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'9', N'Antigua and Barbuda', N'安提瓜和巴布�?', N'AG', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'90', N'Guatemala', N'危地马拉', N'GT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'91', N'Guinea', N'几内�?', N'GN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'92', N'Guinea-Bissau', N'几内亚比�?', N'GW', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'93', N'Guyana', N'圭亚�?', N'GY', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'94', N'Haiti', N'海地', N'HT', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'95', N'Heard and Mc Donald Islands', N'Heard and Mc Donald Islands', N'HM', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'96', N'Honduras', N'洪都拉斯', N'HN', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'97', N'Hong Kong', N'香港', N'HK', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'98', N'Hungary', N'匈牙�?', N'HU', NULL, NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_country]  VALUES (N'99', N'Iceland', N'冰岛', N'IS', NULL, NULL, NULL, NULL, NULL, N'0')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dict]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dict]
GO

CREATE TABLE [dbo].[sys_dict] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [value] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [label] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [type] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [description] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [sort] decimal(10) NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Records of [sys_dict]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'02de20937efd468d9a91f37c35ce8d79', N'1', N'T/T', N'enmu_payment_type', N'付款方式', N'10', N'0', N'1', N'2017-11-03 09:18:06.000', N'1', N'2017-11-03 09:18:06.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'05188faab539432b92df929c54c80d93', N'1', N'状�?�xxx', N'status_parts_order', N'配件订单状�??', N'10', N'0', N'1', N'2017-11-06 10:44:56.000', N'1', N'2017-11-06 10:44:56.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'0543141369ec4329b27e8b878271e5d0', N'1', N'阿里巴巴', N'enmu_customer_source', N'客户来源', N'10', N'0', N'1', N'2017-11-02 17:53:31.000', N'1', N'2017-11-02 17:53:31.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1', N'0', N'正常', N'del_flag', N'删除标记', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'10', N'yellow', N'黄色', N'color', N'颜色�?', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_dict]  VALUES (N'105484a2a853439cbc3a6a7b67c1dcc1', N'2', N'海关放行', N'status_shipments', N'发货状�??', N'20', N'0', N'1', N'2017-11-05 11:50:22.000', N'1', N'2017-11-05 11:50:38.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'106', N'2', N'奖惩通告', N'oa_notify_type', N'通知通告类型', N'20', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'107', N'3', N'活动通告', N'oa_notify_type', N'通知通告类型', N'30', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'108', N'0', N'草稿', N'oa_notify_status', N'通知通告状�??', N'10', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'109', N'1', N'发布', N'oa_notify_status', N'通知通告状�??', N'20', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'11', N'orange', N'橙色', N'color', N'颜色�?', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'110', N'0', N'未读', N'oa_notify_read', N'通知通告状�??', N'10', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'111', N'1', N'已读', N'oa_notify_read', N'通知通告状�??', N'20', N'0', N'1', N'2013-11-08 08:00:00.000', N'1', N'2013-11-08 08:00:00.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_dict]  VALUES (N'171f5655ef4b42b9aa123864b5d54bbf', N'2', N'配件�?', N'enum_send_items_type', N'发�?�配件类�?', N'20', N'0', N'1', N'2017-11-06 10:49:45.000', N'1', N'2017-11-06 10:49:45.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'18', N'2', N'省份、直辖市', N'sys_area_type', N'区域类型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'18384fc19cab43a78b26c3d0d33f1541', N'13', N'订单完成', N'status_repair_order', N'三包状�??', N'130', N'0', N'1', N'2017-11-23 11:01:44.000', N'1', N'2017-11-23 11:01:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'19', N'3', N'地市', N'sys_area_type', N'区域类型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1c121cc5fbbf44b9a1289a2fa7b94ce4', N'7', N'首付款审批未通过', N'status_sales_order', N'订单状�??', N'8', N'0', N'1', N'2017-11-02 17:44:25.000', N'1', N'2017-11-15 15:16:32.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1e3359e38e19413288dd959963734818', N'1', N'新建订单', N'status_sales_order', N'订单状�??', N'2', N'0', N'1', N'2017-11-02 17:37:10.000', N'1', N'2017-11-02 17:37:10.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'1f3ba55386d5422992e5b396eabe7b62', N'4', N'配件审批通过', N'status_repair_order', N'三包状�??', N'40', N'0', N'1', N'2017-11-22 16:28:29.000', N'1', N'2017-11-23 10:55:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2', N'1', N'删除', N'del_flag', N'删除标记', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'20', N'4', N'区县', N'sys_area_type', N'区域类型', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'21', N'1', N'公司', N'sys_office_type', N'机构类型', N'60', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2187d74f82dd488ca4f6de1e77cd554b', N'2', N'维修结束', N'status_repair_order', N'三包状�??', N'20', N'0', N'1', N'2017-11-22 16:27:11.000', N'1', N'2017-11-22 16:27:11.000', N'三包状�??', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'22', N'2', N'部门', N'sys_office_type', N'机构类型', N'70', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'23', N'3', N'小组', N'sys_office_type', N'机构类型', N'80', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'23a08e1f896941fdbfefab46e9b8bf5a', N'9', N'尾款已付', N'status_sales_order', N'订单状�??', N'10', N'0', N'1', N'2017-11-02 17:45:22.000', N'1', N'2017-11-15 15:17:29.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'24', N'4', N'其它', N'sys_office_type', N'机构类型', N'90', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'25', N'1', N'综合�?', N'sys_office_common', N'快捷通用部门', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'253da1a1b83a46be89369b87c9e72400', N'13', N'工资结算', N'status_sales_order', N'订单状�??', N'14', N'0', N'1', N'2017-11-15 15:21:45.000', N'1', N'2017-11-15 15:21:45.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'26', N'2', N'�?发部', N'sys_office_common', N'快捷通用部门', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'27', N'3', N'人力�?', N'sys_office_common', N'快捷通用部门', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'28', N'1', N'�?�?', N'sys_office_grade', N'机构等级', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'29', N'2', N'二级', N'sys_office_grade', N'机构等级', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2951ad084a4a41268a906f3a6586c30a', N'2', N'DHL', N'enum_express_company', N'快�?�公�?', N'20', N'0', N'1', N'2017-11-05 11:54:16.000', N'1', N'2017-11-06 10:41:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'29f2aeb218724d4a9aca94eaf3cc0103', N'0', N'废弃订单', N'status_sales_order', N'订单状�??', N'1', N'0', N'1', N'2017-11-02 17:36:28.000', N'1', N'2017-11-02 17:36:28.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2c28aeb7aaac402ab3bab411f7271309', N'10', N'录入快�?�账�?', N'status_repair_order', N'三包状�??', N'100', N'0', N'1', N'2017-11-23 11:00:07.000', N'1', N'2017-11-23 11:00:07.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'2ca83281fa12478fae3f17195bc1d36a', N'2', N'状�?�yyy', N'status_parts_order', N'配件订单状�??', N'20', N'0', N'1', N'2017-11-06 10:45:23.000', N'1', N'2017-11-06 10:45:23.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'3', N'1', N'显示', N'show_hide', N'显示/隐藏', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'30', N'3', N'三级', N'sys_office_grade', N'机构等级', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'30fced72481340d298dae30f5ede7c42', N'15', N'工资结算审批未�?�过', N'status_sales_order', N'订单状�??', N'16', N'0', N'1', N'2017-11-15 15:23:21.000', N'1', N'2017-11-15 15:23:21.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'31', N'4', N'四级', N'sys_office_grade', N'机构等级', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'311d1b17b01f4ea1bcb9fb4d2a544624', N'6', N'录入发货信息', N'status_repair_order', N'三包状�??', N'60', N'0', N'1', N'2017-11-23 10:56:44.000', N'1', N'2017-11-23 10:56:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'32', N'1', N'�?有数�?', N'sys_data_scope', N'数据范围', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'33', N'2', N'�?在公司及以下数据', N'sys_data_scope', N'数据范围', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'34', N'3', N'�?在公司数�?', N'sys_data_scope', N'数据范围', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'35', N'4', N'�?在部门及以下数据', N'sys_data_scope', N'数据范围', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'35d168458ad546fea71ad7f38137a78b', N'3', N'生产计划审批通过', N'status_sales_order', N'订单状�??', N'4', N'0', N'1', N'2017-11-02 17:42:29.000', N'1', N'2017-11-15 15:14:49.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'36', N'5', N'�?在部门数�?', N'sys_data_scope', N'数据范围', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'37', N'8', N'仅本人数�?', N'sys_data_scope', N'数据范围', N'90', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'38', N'9', N'按明细设�?', N'sys_data_scope', N'数据范围', N'100', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'39', N'1', N'系统管理', N'sys_user_type', N'用户类型', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'3b28f937a6ec48d79c96d4940f691e75', N'1', N'xx供应�?', N'enmu_provider', N'供应�?', N'10', N'0', N'1', N'2017-11-05 11:19:44.000', N'1', N'2017-11-09 13:23:58.000', N'供应�?', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'3e2df9f4e46743cc8cf71d8032a045f9', N'2', N'D/D', N'enmu_payment_type', N'付款方式', N'20', N'0', N'1', N'2017-11-03 09:18:37.000', N'1', N'2017-11-03 09:18:37.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'4', N'0', N'隐藏', N'show_hide', N'显示/隐藏', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'40', N'2', N'部门经理', N'sys_user_type', N'用户类型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'41', N'3', N'普�?�用�?', N'sys_user_type', N'用户类型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_dict]  VALUES (N'46e6e5578b724b44b14607fd078b51e5', N'3', N'录入配件信息', N'status_repair_order', N'三包状�??', N'25', N'0', N'1', N'2017-11-23 10:55:29.000', N'1', N'2017-11-23 10:55:29.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'47', N'download', N'下载模型', N'cms_module', N'栏目模型', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'48', N'link', N'链接模型', N'cms_module', N'栏目模型', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'49', N'special', N'专题模型', N'cms_module', N'栏目模型', N'50', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'4d2ecc79d6e5405ea3fe2027cf1325a3', N'5', N'配件审批未�?�过', N'status_repair_order', N'三包状�??', N'50', N'0', N'1', N'2017-11-22 16:29:20.000', N'1', N'2017-11-23 10:56:09.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'4edac554f5374b46922dbb11efce5ae1', N'10', N'尾款审批通过', N'status_sales_order', N'订单状�??', N'11', N'0', N'1', N'2017-11-02 17:45:44.000', N'1', N'2017-11-15 15:19:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'5', N'1', N'�?', N'yes_no', N'�?/�?', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'50', N'0', N'默认展现方式', N'cms_show_modes', N'展现方式', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'51', N'1', N'首栏目内容列�?', N'cms_show_modes', N'展现方式', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'52', N'2', N'栏目第一条内�?', N'cms_show_modes', N'展现方式', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'53', N'0', N'发布', N'cms_del_flag', N'内容状�??', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'54', N'1', N'删除', N'cms_del_flag', N'内容状�??', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'55', N'2', N'审核', N'cms_del_flag', N'内容状�??', N'15', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'55b3a8ae5d264c86a778143e692bfacd', N'2', N'电放', N'enum_bill_lading_type', N'提单类型', N'20', N'0', N'1', N'2017-11-05 11:48:04.000', N'1', N'2017-11-05 11:48:04.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'55d63756504649958e7a103367bdeac3', N'5', N'首付款已�?', N'status_sales_order', N'订单状�??', N'6', N'0', N'1', N'2017-11-02 17:43:26.000', N'1', N'2017-11-15 15:15:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'56', N'1', N'首页焦点�?', N'cms_posid', N'推荐�?', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'57', N'2', N'栏目页文章推�?', N'cms_posid', N'推荐�?', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'58', N'1', N'咨询', N'cms_guestbook', N'留言板分�?', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'59', N'2', N'建议', N'cms_guestbook', N'留言板分�?', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'6', N'0', N'�?', N'yes_no', N'�?/�?', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'60', N'3', N'投诉', N'cms_guestbook', N'留言板分�?', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'61', N'4', N'其它', N'cms_guestbook', N'留言板分�?', N'40', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'62', N'1', N'公休', N'oa_leave_type', N'请假类型', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'628cea5d50984a23b384bff78bfc52b9', N'2', N'�?', N'price_unit', N'价格单位', N'20', N'0', N'1', N'2017-10-31 13:45:03.000', N'1', N'2017-10-31 13:45:03.000', N'�?', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'63', N'2', N'病假', N'oa_leave_type', N'请假类型', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'63d9769eba3547708648a7b0be213c3a', N'1', N'�?售货�?', N'enum_shipments_type', N'货物类型', N'10', N'0', N'1', N'2017-11-06 10:51:46.000', N'1', N'2017-11-09 11:11:48.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'63f3181d4e944771b6ecd649671388e1', N'sales_order_process', N'�?售订单流�?', N'act_type', N'流程类型', N'30', N'0', N'1', N'2017-11-14 13:30:55.000', N'1', N'2017-11-14 13:30:55.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_dict]  VALUES (N'6d6a0b064e80484fa9e399ed7834e2a6', N'2', N'人民�?', N'unit_name', N'单位名称', N'20', N'0', N'1', N'2017-10-31 14:07:34.000', N'1', N'2017-10-31 14:07:34.000', N'人民�?', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'6e13e8416cd54e91be8e45443c93163b', N'2', N'电话访客', N'enmu_customer_source', N'客户来源', N'20', N'0', N'1', N'2017-11-02 17:54:22.000', N'1', N'2017-11-02 17:54:22.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'7', N'red', N'红色', N'color', N'颜色�?', N'10', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'70', N'test_audit', N'审批测试流程', N'act_type', N'流程类型', N'20', N'0', N'1', N'2013-06-03 08:00:00.000', N'1', N'2013-06-03 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'706ec31ab31b49a98c16dcb587420a86', N'2', N'新建生产计划', N'status_sales_order', N'订单状�??', N'3', N'0', N'1', N'2017-11-02 17:41:52.000', N'1', N'2017-11-02 17:41:52.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_dict]  VALUES (N'75', N'tree', N'树结�?', N'gen_category', N'代码生成分类', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
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

INSERT INTO [dbo].[sys_dict]  VALUES (N'8', N'green', N'绿色', N'color', N'颜色�?', N'20', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'80', N'between', N'Between', N'gen_query_type', N'查询方式', N'50', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'81', N'like', N'Like', N'gen_query_type', N'查询方式', N'60', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'82', N'left_like', N'Left Like', N'gen_query_type', N'查询方式', N'70', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'83', N'right_like', N'Right Like', N'gen_query_type', N'查询方式', N'80', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'84', N'input', N'文本�?', N'gen_show_type', N'字段生成方案', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'85', N'textarea', N'文本�?', N'gen_show_type', N'字段生成方案', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'86', N'select', N'下拉�?', N'gen_show_type', N'字段生成方案', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'87', N'checkbox', N'复�?�框', N'gen_show_type', N'字段生成方案', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'87bb86d8bf444589877e97636845b7e8', N'2', N'海运', N'enum_parts_order_type', N'发�?�方�?', N'20', N'0', N'1', N'2017-11-06 10:43:35.000', N'1', N'2017-11-06 10:43:35.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'88', N'radiobox', N'单�?�框', N'gen_show_type', N'字段生成方案', N'50', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'89', N'dateselect', N'日期选择', N'gen_show_type', N'字段生成方案', N'60', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'9', N'blue', N'蓝色', N'color', N'颜色�?', N'30', N'0', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'90', N'userselect', N'人员选择', N'gen_show_type', N'字段生成方案', N'70', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'91', N'officeselect', N'部门选择', N'gen_show_type', N'字段生成方案', N'80', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'92', N'areaselect', N'区域选择', N'gen_show_type', N'字段生成方案', N'90', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'925a6fe32e16457290b1c432093016e7', N'1', N'新建三包', N'status_repair_order', N'三包状�??', N'10', N'0', N'1', N'2017-11-05 11:39:04.000', N'1', N'2017-11-05 11:39:04.000', N'三包状�??', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'93', N'String', N'String', N'gen_java_type', N'Java类型', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'93bb91b5f89547fa9415577628f3f9fb', N'16', N'订单完成', N'status_sales_order', N'订单状�??', N'17', N'0', N'1', N'2017-11-15 15:23:59.000', N'1', N'2017-11-15 15:23:59.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'94', N'Long', N'Long', N'gen_java_type', N'Java类型', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'946c2c74ffb34b47ba7e2c132e8d5a1b', N'2', N'yy供应�?', N'enmu_provider', N'供应�?', N'20', N'0', N'1', N'2017-11-05 11:20:14.000', N'1', N'2017-11-09 13:24:32.000', N'供应�?', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'95', N'dao', N'仅持久层', N'gen_category', N'代码生成分类', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'96', N'1', N'�?', N'sex', N'性别', N'10', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'97', N'2', N'�?', N'sex', N'性别', N'20', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'98', N'Integer', N'Integer', N'gen_java_type', N'Java类型', N'30', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'99', N'Double', N'Double', N'gen_java_type', N'Java类型', N'40', N'0', N'1', N'2013-10-28 08:00:00.000', N'1', N'2013-10-28 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'9b3171f9f34c4896830f5685424ea2c1', N'1', N'�?始发�?', N'status_shipments', N'发货状�??', N'10', N'0', N'1', N'2017-11-05 11:49:57.000', N'1', N'2017-11-05 11:49:57.000', N'发货状�??', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'a60a1a824fae40a0b69b662a422cc6e3', N'1', N'三包�?', N'enum_send_items_type', N'发�?�配件类�?', N'10', N'0', N'1', N'2017-11-06 10:49:20.000', N'1', N'2017-11-06 10:49:20.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'a7a95d6e2149494cb0fd59c04afdc332', N'4', N'生产计划审批未�?�过', N'status_sales_order', N'订单状�??', N'5', N'0', N'1', N'2017-11-02 17:42:58.000', N'1', N'2017-11-15 15:15:15.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'a86ec2b05e1e42d9b1348f602f0deffb', N'8', N'发货信息审批未�?�过', N'status_repair_order', N'三包状�??', N'80', N'0', N'1', N'2017-11-23 10:58:19.000', N'1', N'2017-11-23 10:58:19.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b214e23477804b88bf7b67a9d5be346f', N'2', N'公共客户', N'enmu_customer_type', N'客户类型', N'20', N'0', N'1', N'2017-10-24 14:12:05.000', N'1', N'2017-11-02 17:52:48.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b419993ff9d1493e83f7aa962786a79b', N'1', N'$', N'price_unit', N'价格单位', N'10', N'0', N'1', N'2017-10-31 13:39:04.000', N'1', N'2017-10-31 13:43:03.000', N'$', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b49f91c287f949c795fabd4f2c89f4eb', N'7', N'发货信息审批通过', N'status_repair_order', N'三包状�??', N'70', N'0', N'1', N'2017-11-23 10:57:46.000', N'1', N'2017-11-23 10:57:46.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b50ace8e628f41ad83538cb1b89c71b8', N'11', N'尾款审批未�?�过', N'status_sales_order', N'订单状�??', N'12', N'0', N'1', N'2017-11-15 15:20:30.000', N'1', N'2017-11-15 15:20:30.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'b722762593b34ff78330bc5906da789d', N'6', N'首付款审批�?�过', N'status_sales_order', N'订单状�??', N'7', N'0', N'1', N'2017-11-02 17:43:58.000', N'1', N'2017-11-15 15:16:09.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'bc56b668634240ffb1265f47d69998cb', N'1', N'私有客户', N'enmu_customer_type', N'客户类型', N'10', N'0', N'1', N'2017-10-24 14:11:36.000', N'1', N'2017-11-02 17:52:17.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'bc5afe7e80524044b9a974c71c1f947f', N'2', N'电放', N'enum_bill_type', N'提单类型', N'20', N'0', N'1', N'2017-11-06 10:51:03.000', N'1', N'2017-11-09 11:14:32.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'bcfe29b18bd84a6ea374d583567a4716', N'2', N'CIF', N'enmu_trading_type', N'贸易形式', N'2', N'0', N'1', N'2017-11-02 17:30:09.000', N'1', N'2017-11-02 19:26:19.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'd1602225496640e0bb71011ee787f96c', N'1', N'维修', N'enum_solution_type', N'解决方案类型', N'10', N'0', N'1', N'2017-11-05 11:36:44.000', N'1', N'2017-11-05 11:36:44.000', N'解决方案类型', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'd167ec05e1b147118a0570558043ebe5', N'1', N'快�??', N'enum_parts_order_type', N'发�?�方�?', N'10', N'0', N'1', N'2017-11-06 10:42:59.000', N'1', N'2017-11-06 10:42:59.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'd81a95392cc64303bb2cac3da96ff71b', N'1', N'德邦物流', N'enum_express_company', N'快�?�公�?', N'10', N'0', N'1', N'2017-11-06 10:39:50.000', N'1', N'2017-11-06 10:39:50.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'da772194abb54aff8323d93c810436a1', N'8', N'�?始生�?', N'status_sales_order', N'订单状�??', N'9', N'0', N'1', N'2017-11-02 17:44:59.000', N'1', N'2017-11-15 15:17:17.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'da8076e9a77347028f40419af6a8a7bf', N'3', N'配件货物', N'enum_shipments_type', N'货物类型', N'30', N'0', N'1', N'2017-11-09 11:12:44.000', N'1', N'2017-11-09 11:12:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'e3154aefd1764102ba8a9c906f53d873', N'14', N'工资结算审批通过', N'status_sales_order', N'订单状�??', N'15', N'0', N'1', N'2017-11-15 15:22:27.000', N'1', N'2017-11-15 15:22:42.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'e360ad2630804e5eb0cf43f96b0c4948', N'12', N'发货', N'status_sales_order', N'订单状�??', N'13', N'0', N'1', N'2017-11-15 15:21:17.000', N'1', N'2017-11-15 15:21:17.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'ebfaaee6fdf145d48c9c816211e5d1a6', N'9', N'配件快�?�发�?', N'status_repair_order', N'三包状�??', N'90', N'0', N'1', N'2017-11-23 10:59:39.000', N'1', N'2017-11-23 10:59:39.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'eebef3adebea4c028fe6989851fca313', N'12', N'海关放行', N'status_repair_order', N'三包状�??', N'120', N'0', N'1', N'2017-11-23 11:01:18.000', N'1', N'2017-11-23 11:01:18.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'f40e95a5617144e2b2784820f82c6989', N'1', N'正本', N'enum_bill_lading_type', N'提单类型', N'10', N'0', N'1', N'2017-11-05 11:47:42.000', N'1', N'2017-11-05 11:47:42.000', N'提单类型', N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'f80ce2e90a4247c9a4dcb373aab1c52f', N'11', N'配件装箱发货', N'status_repair_order', N'三包状�??', N'110', N'0', N'1', N'2017-11-23 11:00:30.000', N'1', N'2017-11-23 11:00:30.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict]  VALUES (N'fff9e655b6e541edb99047fc594e032c', N'2', N'配件', N'enum_solution_type', N'解决方案类型', N'20', N'0', N'1', N'2017-11-05 11:37:11.000', N'1', N'2017-11-05 11:37:11.000', N'解决方案类型', N'0')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_log]
GO

CREATE TABLE [dbo].[sys_log] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [type] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('1') NULL,
  [title] varchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_date] datetime NULL,
  [remote_addr] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [user_agent] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [request_uri] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [method] varchar(5) COLLATE Chinese_PRC_CI_AS NULL,
  [params] text COLLATE Chinese_PRC_CI_AS NULL,
  [exception] text COLLATE Chinese_PRC_CI_AS NULL
)
GO


-- ----------------------------
-- Records of [sys_log]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'1dd0714fa3f64f5ab907ac1927aa393a', N'1', N'系统登录', N'1', N'2017-12-01 15:52:32.470', N'0:0:0:0:0:0:0:1', N'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E)', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'2d6bfe9600964a6f855e5254ec938f3e', N'1', N'绯荤粺鐧诲綍', N'1', N'2017-11-30 17:24:04.233', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'318da47cb13d4c3eb9e60b29522097ba', N'1', N'系统登录', N'0aa58273376a47978e6add548f29f2ca', N'2017-12-01 15:51:34.883', N'0:0:0:0:0:0:0:1', N'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E)', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'5a6e15ad10f1410ca2faba406f903692', N'1', N'系统登录', N'1', N'2017-12-02 09:59:12.966', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'5c57f436cb004830b89d6b04d511557b', N'1', N'系统登录', N'1', N'2017-12-01 09:15:13.843', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'63a30cf083fb4c8e8d8152619510d22e', N'1', N'系统登录', N'1', N'2017-12-03 19:30:06.926', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'69ae45f5d9bc4a05b201fa720d392924', N'1', N'系统登录', N'1', N'2017-12-01 11:14:34.356', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'6fbe6de1c7014ae4a522a891d3226d18', N'1', N'系统登录', N'1', N'2017-11-30 18:40:27.976', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'6ffc7d49aa8743fa85982449c558db10', N'1', N'系统登录', N'1', N'2017-12-01 09:52:44.330', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'757851b9138f4daf94f95ba393720aa3', N'1', N'系统登录', N'1', N'2017-11-30 16:55:52.353', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'8cfd421c58b3451daa256433299de3a0', N'1', N'系统登录', N'0aa58273376a47978e6add548f29f2ca', N'2017-12-01 15:50:54.530', N'0:0:0:0:0:0:0:1', N'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E)', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'9128828eaa42484ca1504b0a50138d0f', N'1', N'系统登录', N'1', N'2017-12-01 11:08:51.366', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'9c2f644b1aa64b35b486c168ba3f3c11', N'1', N'系统登录', N'1', N'2017-12-01 09:09:15.533', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'e03351442cf745808f6be8efa6feb6fc', N'1', N'系统登录', N'1', N'2017-11-30 16:56:57.616', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'e49d9e17fd0a440c848240328e77aedd', N'1', N'系统登录', N'1', N'2017-11-30 16:59:40.030', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'eb311c6ddff241dc873bdf98d79e7669', N'1', N'系统登录', N'1', N'2017-11-30 17:24:18.296', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

INSERT INTO [dbo].[sys_log]  VALUES (N'f86d5609336846ad934f92b58024bdd5', N'1', N'系统登录', N'1', N'2017-12-02 09:11:19.983', N'0:0:0:0:0:0:0:1', N'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', N'/amrvm/a', N'GET', N'login=', N'')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_mdict]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_mdict]
GO

CREATE TABLE [dbo].[sys_mdict] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_ids] varchar(2000) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [sort] decimal(10) NOT NULL,
  [description] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_ids] varchar(2000) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [sort] decimal(10) NOT NULL,
  [href] varchar(2000) COLLATE Chinese_PRC_CI_AS NULL,
  [target] varchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [icon] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [is_show] char(1) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [permission] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Records of [sys_menu]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'0b2ebd4d639e4c2b83c2dd0764522f24', N'ba8092291b40482db8fe7fc006ea3d76', N'0,1,2,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', N'编辑', N'60', NULL, NULL, NULL, N'0', N'test:testData:edit', N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'0ca004d6b1bf4bcab9670a5060d82a55', N'79', N'0,1,2,79,3c92c17886944d0687e73e286cada573,', N'树结�?', N'90', N'/test/testTree', NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_menu]  VALUES (N'2', N'1', N'0,1,', N'管理后台根菜�?', N'10000', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-25 13:03:51.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_menu]  VALUES (N'24a4478af9b74e71963a5a18a29cdd24', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'集中器管�?', N'90', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:20:05.966', N'1', N'2017-12-01 13:20:05.966', N'', N'0')
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

INSERT INTO [dbo].[sys_menu]  VALUES (N'31', N'1', N'0,1,', N'内容管理', N'20000', NULL, NULL, NULL, N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-10-27 15:28:26.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'32', N'31', N'0,1,31,', N'栏目设置', N'300', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'33', N'32', N'0,1,31,32', N'栏目管理', N'30', N'/cms/category/', NULL, N'align-justify', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'34', N'33', N'0,1,31,32,33,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:category:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'35', N'33', N'0,1,31,32,33,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:category:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'36', N'32', N'0,1,31,32', N'站点设置', N'40', N'/cms/site/', NULL, N'certificate', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'37', N'36', N'0,1,31,32,36,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:site:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'38', N'36', N'0,1,31,32,36,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:site:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'39', N'32', N'0,1,31,32', N'切换站点', N'50', N'/cms/site/select', NULL, N'retweet', N'1', N'cms:site:select', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'3c92c17886944d0687e73e286cada573', N'79', N'0,1,2,79,', N'生成示例', N'20', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'4', N'3', N'0,1,2,3,', N'菜单管理', N'10', N'/sys/menu/', NULL, N'list-alt', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'40', N'31', N'0,1,31,', N'内容管理', N'100', NULL, NULL, NULL, N'1', N'cms:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'41', N'40', N'0,1,31,40,', N'内容发布', N'30', N'/cms/', NULL, N'briefcase', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'42', N'41', N'0,1,31,40,41,', N'文章模型', N'40', N'/cms/article/', NULL, N'file', N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'43', N'42', N'0,1,31,40,41,42,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:article:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'44', N'42', N'0,1,31,40,41,42,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:article:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'45', N'42', N'0,1,31,40,41,42,', N'审核', N'50', NULL, NULL, NULL, N'0', N'cms:article:audit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'46', N'41', N'0,1,31,40,41,', N'链接模型', N'60', N'/cms/link/', NULL, N'random', N'0', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'4643591154b04e67863475d26fbee1df', N'd4b9ed224c0a4c1db8f6731646b8da00', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,', N'设备管理', N'30', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:16:22.330', N'1', N'2017-12-01 13:16:22.330', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'47', N'46', N'0,1,31,40,41,46,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:link:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'48', N'46', N'0,1,31,40,41,46,', N'修改', N'40', NULL, NULL, NULL, N'0', N'cms:link:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'4855cf3b25c244fb8500a380db189d97', N'b1f6d1b86ba24365bae7fd86c5082317', N'0,1,2,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', N'查看', N'30', NULL, NULL, NULL, N'0', N'test:testDataMain:list,test:testDataMain:from,test:testDataMain:edit,test:testDataMain:delete', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 17:00:02.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'49', N'46', N'0,1,31,40,41,46,', N'审核', N'50', NULL, NULL, NULL, N'0', N'cms:link:audit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'5', N'4', N'0,1,2,3,4,', N'查看', N'30', NULL, NULL, NULL, N'0', N'sys:menu:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'50', N'40', N'0,1,31,40,', N'评论管理', N'40', N'/cms/comment/?status=2', NULL, N'comment', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'51', N'50', N'0,1,31,40,50,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:comment:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'52', N'50', N'0,1,31,40,50,', N'审核', N'40', NULL, NULL, NULL, N'0', N'cms:comment:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'53', N'40', N'0,1,31,40,', N'公共留言', N'80', N'/cms/guestbook/?status=2', NULL, N'glass', N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'54', N'53', N'0,1,31,40,53,', N'查看', N'30', NULL, NULL, NULL, N'0', N'cms:guestbook:view', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'55', N'53', N'0,1,31,40,53,', N'审核', N'40', NULL, NULL, NULL, N'0', N'cms:guestbook:edit', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_menu]  VALUES (N'60', N'31', N'0,1,31,', N'统计分析', N'200', NULL, NULL, NULL, N'1', NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'61', N'60', N'0,1,31,60,', N'信息量统�?', N'30', N'/cms/stats/article', NULL, N'tasks', N'1', N'cms:stats:article', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_menu]  VALUES (N'82', N'79', N'0,1,2,79,80,', N'业务表配�?', N'20', N'/gen/genTable', NULL, NULL, N'1', N'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', N'1', N'2013-10-16 08:00:00.000', N'1', N'2013-10-16 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'83', N'79', N'0,1,79,80,', N'代码模板管理', N'90', N'/gen/genTemplate', NULL, NULL, N'1', N'gen:genTemplate:view,gen:genTemplate:edit', N'1', N'2013-10-16 08:00:00.000', N'1', N'2013-10-16 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'84', N'67', N'0,1,2,67,', N'连接池监�?', N'20', N'/../druid', NULL, NULL, N'1', NULL, N'1', N'2013-10-18 08:00:00.000', N'1', N'2013-10-18 08:00:00.000', NULL, N'0')
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

INSERT INTO [dbo].[sys_menu]  VALUES (N'b1f6d1b86ba24365bae7fd86c5082317', N'79', N'0,1,2,79,3c92c17886944d0687e73e286cada573,', N'主子�?', N'60', N'/test/testDataMain', NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'b7ba47f9d5584beb9840d291e9c78d4c', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'异常设备管理', N'150', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:20:37.423', N'1', N'2017-12-01 13:20:37.423', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'ba8092291b40482db8fe7fc006ea3d76', N'79', N'0,1,2,79,3c92c17886944d0687e73e286cada573,', N'单表', N'30', N'/test/testData', NULL, NULL, N'1', NULL, N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'c2e4d9082a0b4386884a0b203afe2c5c', N'0ca004d6b1bf4bcab9670a5060d82a55', N'0,1,2,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', N'查看', N'30', NULL, NULL, NULL, N'0', N'test:testTree:from,test:testTree:list', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 17:17:52.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'd15ec45a4c5449c3bbd7a61d5f9dd1d2', N'b1f6d1b86ba24365bae7fd86c5082317', N'0,1,2,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', N'编辑', N'60', NULL, NULL, NULL, N'0', N'test:testDataMain:edit', N'1', N'2013-08-12 13:10:05.000', N'1', N'2013-08-12 13:10:05.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'd1f17c8ba6c74038aa9f11700a514057', N'4643591154b04e67863475d26fbee1df', N'0,1,d4b9ed224c0a4c1db8f6731646b8da00,4643591154b04e67863475d26fbee1df,', N'采集器管�?', N'60', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 13:19:44.500', N'1', N'2017-12-01 13:19:44.500', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'd4b9ed224c0a4c1db8f6731646b8da00', N'1', N'0,1,', N'设备管理', N'30000', N'', N'', N'', N'1', N'', N'1', N'2017-12-01 10:59:28.696', N'1', N'2017-12-01 10:59:28.696', N'', N'0')
GO

INSERT INTO [dbo].[sys_menu]  VALUES (N'df7ce823c5b24ff9bada43d992f373e2', N'ba8092291b40482db8fe7fc006ea3d76', N'0,1,2,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', N'查看', N'30', NULL, NULL, NULL, N'0', N'test:testData:list,test:testData:form,test:testData:edit,test:testData:delete', N'1', N'2013-08-12 13:10:05.000', N'1', N'2017-10-28 16:59:03.000', NULL, N'0')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_office]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_office]
GO

CREATE TABLE [dbo].[sys_office] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_ids] varchar(2000) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [sort] decimal(10) NOT NULL,
  [area_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [code] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [type] char(1) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [grade] char(1) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [address] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [zip_code] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [master] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [phone] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [fax] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [email] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [USEABLE] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [PRIMARY_PERSON] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [DEPUTY_PERSON] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Records of [sys_office]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'1', N'0', N'0,', N'山东省�?�公�?', N'10', N'2', N'100000', N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'10', N'7', N'0,1,7,', N'�?售部', N'30', N'3', N'200003', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'11', N'7', N'0,1,7,', N'工程�?', N'40', N'3', N'200004', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'12', N'7', N'0,1,7,', N'历城区分公司', N'0', N'4', N'201000', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'13', N'12', N'0,1,7,12,', N'公司领导', N'10', N'4', N'201001', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'14', N'12', N'0,1,7,12,', N'财务�?', N'20', N'4', N'201002', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'15', N'12', N'0,1,7,12,', N'市场�?', N'30', N'4', N'201003', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'16', N'12', N'0,1,7,12,', N'�?术部', N'40', N'4', N'201004', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'17', N'7', N'0,1,7,', N'历下区分公司', N'40', N'5', N'201010', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'18', N'17', N'0,1,7,17,', N'公司领导', N'10', N'5', N'201011', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'19', N'17', N'0,1,7,17,', N'综合�?', N'20', N'5', N'201012', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'2', N'1', N'0,1,', N'公司领导', N'10', N'2', N'100001', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'20', N'17', N'0,1,7,17,', N'市场�?', N'30', N'5', N'201013', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'21', N'17', N'0,1,7,17,', N'�?术部', N'40', N'5', N'201014', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'22', N'7', N'0,1,7,', N'高新区分公司', N'50', N'6', N'201010', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'23', N'22', N'0,1,7,22,', N'公司领导', N'10', N'6', N'201011', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'24', N'22', N'0,1,7,22,', N'综合�?', N'20', N'6', N'201012', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'25', N'22', N'0,1,7,22,', N'市场�?', N'30', N'6', N'201013', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'26', N'22', N'0,1,7,22,', N'�?术部', N'40', N'6', N'201014', N'2', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'3', N'1', N'0,1,', N'财务�?', N'20', N'2', N'100002', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 11:09:31.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'4', N'1', N'0,1,', N'�?售部', N'30', N'2', N'100003', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 11:08:30.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'5', N'1', N'0,1,', N'工程�?', N'40', N'2', N'100004', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 11:08:44.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'6', N'1', N'0,1,', N'研发�?', N'50', N'2', N'100005', N'2', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'7', N'1', N'0,1,', N'济南市分公司', N'20', N'3', N'200000', N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'8', N'7', N'0,1,7,', N'公司领导', N'10', N'3', N'200001', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_office]  VALUES (N'9', N'7', N'0,1,7,', N'综合�?', N'20', N'3', N'200002', N'2', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [office_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [enname] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [role_type] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [data_scope] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [is_sys] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [useable] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Records of [sys_role]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'084e586c6ad8478da6db0155809248b1', N'2', N'会计角色', N'cj', N'user', N'5', N'0', N'1', N'1', N'2017-10-18 15:39:38.000', N'1', N'2017-11-16 10:40:21.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'1', N'2', N'系统管理�?', N'admin', N'assignment', N'1', N'1', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-23 11:44:04.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'2', N'2', N'经理', N'jl', N'assignment', N'2', N'1', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-23 11:45:09.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'3', N'1', N'本公司管理员', N'a', N'assignment', N'3', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'4', N'1', N'部门管理�?', N'b', N'assignment', N'4', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'4c125b95bcac49478be0f9d52185e7c4', N'2', N'业务�?', N'ywy', N'user', N'8', N'0', N'1', N'1', N'2017-10-18 15:38:23.000', N'1', N'2017-11-23 09:11:17.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'5', N'1', N'本部门管理员', N'c', N'assignment', N'5', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'6', N'2', N'普�?�用�?', N'pt', N'assignment', N'8', N'1', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-14 13:42:05.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'7', N'7', N'济南市管理员', N'e', N'assignment', N'9', NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_role]  VALUES (N'ff4d8daf37404a72a688a72ebf7b43dd', N'2', N'操作�?', N'czy', N'user', N'8', N'0', N'1', N'1', N'2017-10-18 15:39:05.000', N'1', N'2017-11-23 11:44:33.000', NULL, N'0')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu]
GO

CREATE TABLE [dbo].[sys_role_menu] (
  [role_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [menu_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL
)
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
-- Table structure for sys_role_office
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_office]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_office]
GO

CREATE TABLE [dbo].[sys_role_office] (
  [role_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [office_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL
)
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
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [company_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [office_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [login_name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [password] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [no] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [email] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [phone] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [mobile] varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [user_type] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [photo] varchar(1000) COLLATE Chinese_PRC_CI_AS NULL,
  [login_ip] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [login_date] datetime NULL,
  [login_flag] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Records of [sys_user]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'0aa58273376a47978e6add548f29f2ca', N'1', N'5', N'caozuoyuan', N'cff79affd3428a483704882dacdbcab6b97b4434b9cfd4f1170ae124', N'00004', N'操作�?', NULL, NULL, NULL, N'3', NULL, N'0:0:0:0:0:0:0:1', N'2017-12-01 15:51:34.766', N'1', N'1', N'2017-11-13 11:34:47.000', N'1', N'2017-11-14 11:04:57.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'1', N'1', N'2', N'thinkgem', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0001', N'系统管理�?', N'thinkgem@163.com', N'8675', N'8675', N'1', N'', N'0:0:0:0:0:0:0:1', N'2017-12-03 19:30:06.750', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-12-02 10:05:53.600', N'�?高管理员', N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'10', N'7', N'11', N'jn_jsb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0010', N'济南�?术部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'11', N'12', N'13', N'lc_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0011', N'济南历城领导', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'12', N'12', N'18', N'lx_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0012', N'济南历下领导', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'13', N'22', N'23', N'gx_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0013', N'济南高新领导', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'2', N'1', N'2', N'sd_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0002', N'管理�?', NULL, NULL, NULL, NULL, NULL, N'0:0:0:0:0:0:0:1', N'2017-10-30 18:01:39.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'3', N'1', N'3', N'jingli', N'e77042f69aac3bfc2a2606209283ca2785cb808cdc35789bbf794202', N'0003', N'经理', NULL, NULL, NULL, N'2', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-24 15:07:56.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-17 09:55:14.000', NULL, N'0')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'4', N'1', N'4', N'xiaoshoujingli', N'7935f3dd780e98875d2cce060994513199e784c423a8486b2cb01826', N'0004', N'�?售经�?', NULL, NULL, NULL, N'2', NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:40:17.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'5', N'1', N'5', N'caozuoyuanjingli', N'9ca540b52738ba909c16e82d13c7027f1fb062c6fb8f586d1f6cc0e5', N'0005', N'操作员经�?', NULL, NULL, NULL, N'2', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-16 20:44:24.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2017-11-15 21:41:30.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'6', N'1', N'6', N'sd_yfb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0006', N'研发�?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'7', N'7', N'8', N'jn_admin', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0007', N'济南领导', NULL, NULL, NULL, NULL, NULL, N'0:0:0:0:0:0:0:1', N'2017-11-14 11:19:49.000', N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'734d64bc07ae40e3ab23d79fbcbab27d', N'1', N'3', N'kuaiji', N'439a70565b6e57942d87736c101ee8b2d59d15969ece2fe2229c62fb', N'00003', N'会计', NULL, NULL, NULL, N'3', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-21 10:31:13.000', N'1', N'1', N'2017-11-13 11:34:07.000', N'1', N'2017-11-14 11:04:03.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'8', N'7', N'9', N'jn_zhb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0008', N'济南综合�?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'8a18d1e909894ac38aee74ab8e959731', N'1', N'4', N'yewuyuan', N'92494836ea06660c401197ba4c8f5209e092bafc6ece3815fb2c1dda', N'00002', N'业务�?', NULL, NULL, NULL, N'3', NULL, N'0:0:0:0:0:0:0:1', N'2017-11-24 16:15:36.000', N'1', N'1', N'2017-11-13 11:33:36.000', N'1', N'2017-11-14 11:03:39.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'9', N'7', N'10', N'jn_scb', N'02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', N'0009', N'济南市场�?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'1', N'2013-05-27 08:00:00.000', N'1', N'2013-05-27 08:00:00.000', NULL, N'1')
GO

INSERT INTO [dbo].[sys_user]  VALUES (N'b3b68e02299944c89eb9657b30ff7bdb', N'1', N'2', N'ceshi', N'8f10946f809ae19ae28b8fadf9ee3e4ff8571d4399bdaeb96023c197', N'0001', N'娴嬭�?', N'ceshi@ceshi.com', N'18888888888', N'18888888888', N'3', N'/amrvm/userfiles/1/images/photo/2017/11/timg.jpg', NULL, NULL, N'1', N'1', N'2017-11-30 18:07:24.826', N'1', N'2017-11-30 18:07:24.826', N'ceshi', N'1')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [role_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL
)
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


-- ----------------------------
-- Table structure for test_data
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_data]') AND type IN ('U'))
	DROP TABLE [dbo].[test_data]
GO

CREATE TABLE [dbo].[test_data] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [office_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [area_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [sex] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [in_date] smalldatetime NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_data_child]') AND type IN ('U'))
	DROP TABLE [dbo].[test_data_child]
GO

CREATE TABLE [dbo].[test_data_child] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [test_data_main_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_data_main]') AND type IN ('U'))
	DROP TABLE [dbo].[test_data_main]
GO

CREATE TABLE [dbo].[test_data_main] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [office_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [area_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [sex] char(1) COLLATE Chinese_PRC_CI_AS NULL,
  [in_date] smalldatetime NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_tree]') AND type IN ('U'))
	DROP TABLE [dbo].[test_tree]
GO

CREATE TABLE [dbo].[test_tree] (
  [id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [parent_ids] varchar(2000) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [sort] decimal(10) NOT NULL,
  [create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [create_date] datetime NOT NULL,
  [update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [update_date] datetime NOT NULL,
  [remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [del_flag] char(1) COLLATE Chinese_PRC_CI_AS DEFAULT ('0') NOT NULL
)
GO


-- ----------------------------
-- View structure for v_watermeter
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter]
GO

CREATE VIEW [dbo].[v_watermeter] AS SELECT
/*猪场名称*/
	DBO.CHINA_STR ( t.[小区] ) AS farm_name,
/*集中器名�?*/
	t.[小区] AS concentrator_name,
/*集中器编�?*/
	t.[集中器ID] AS concentrator_num,
/*猪舍名称*/
	t.[楼栋名称] AS house_name,
/*水表位置*/
	t.[热户姓名] AS room_name,
/*水表用�??*/
CASE
	CHARINDEX( '水帘', t.[热户姓名] ) 
	WHEN 0 THEN
	DBO.CHINA_STR ( t.[楼栋名称] ) ELSE '水帘' 
	END AS watermeter_type,
/*水表编号*/
	RIGHT(t.[通断控制器ID],8) AS watermeter_num,
/*水表状�??*/
	t.[地址] AS watermeter_status,
/*安装日期*/
	t.[备注] AS installed_time 
FROM
	[基础信息] AS t
GO


-- ----------------------------
-- View structure for v_watermeter_all_flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_all_flow]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_all_flow]
GO

CREATE VIEW [dbo].[v_watermeter_all_flow] AS SELECT DISTINCT
/*猪场名称*/
	w.farm_name,
/*集中器名�?*/
	w.concentrator_name,
/*集中器编�?*/
	w.concentrator_num,
/*猪舍名称*/
	w.house_name,
/*水表位置*/
	w.room_name,
/*水表用�??*/
	w.watermeter_type,
/*水表编号*/
	w.watermeter_num,
/*水表状�??*/
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
	/*因为有的周会跨两个月份，�?以这部分数据可能会重复，此问题�?�过连接条件已解决，数据量少，待进一步验�?*/ /*WHERE
	wdf.watermeter_num = '24400028' 
	AND wdf.collect_cd = '2017-11-24' 
ORDER BY
	w.watermeter_num ASC,
	wdf.collect_cd DESC,
	wwf.collect_cw DESC*/
GO


-- ----------------------------
-- View structure for v_watermeter_all_flow_v2
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_all_flow_v2]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_all_flow_v2]
GO

CREATE VIEW [dbo].[v_watermeter_all_flow_v2] AS WITH day_flow AS (
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
/*集中器名�?*/
	w.concentrator_name,
/*集中器编�?*/
	w.concentrator_num,
/*猪舍名称*/
	w.house_name,
/*水表位置*/
	w.room_name,
/*水表用�??*/
	w.watermeter_type,
/*水表编号*/
	w.watermeter_num,
/*水表状�??*/
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
	AND wdf.collect_year = wyf.collect_cy /*因为有的周会跨两个月份，�?以这部分数据可能会重复，此问题�?�过连接条件已解决，数据量少，待进一步验�?*/
/*WHERE
	wdf.watermeter_num = '24400028' 
	AND wdf.collect_cd = '2017-11-24' 
ORDER BY
	w.watermeter_num ASC,
	wdf.collect_cd DESC,
	wwf.collect_cw DESC*/
GO


-- ----------------------------
-- View structure for v_watermeter_collect
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_collect]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_collect]
GO

CREATE VIEW [dbo].[v_watermeter_collect] AS SELECT
/*水表编号*/
	�?温度.[通断控制器ID] AS watermeter_num,
/*采集时间*/
	[日期时间] AS collect_time,
/*累计流量*/
	�?温度.[室温2] AS total_flow
FROM
	[�?温度]
GO


-- ----------------------------
-- View structure for v_watermeter_day
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_day]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_day]
GO

CREATE VIEW [dbo].[v_watermeter_day] AS SELECT
/*水表编号*/
	�?温度.[通断控制器ID] AS watermeter_num,
/*采集日期*/
	CONVERT ( CHAR ( 10 ), [日期时间], 120 ) AS collect_date,
/*累计流量*/
	MAX (�?温度.[室温2] ) AS total_flow 
FROM
	[�?温度] 
GROUP BY
	�?温度.[通断控制器ID],
	CONVERT (
	CHAR ( 10 ),
	[日期时间],
	120)
GO


-- ----------------------------
-- View structure for v_watermeter_day_flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_day_flow]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_day_flow]
GO

CREATE VIEW [dbo].[v_watermeter_day_flow] AS SELECT
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
GO


-- ----------------------------
-- View structure for v_watermeter_month
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_month]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_month]
GO

CREATE VIEW [dbo].[v_watermeter_month] AS SELECT
/*水表编号*/
	�?温度.[通断控制器ID] AS watermeter_num,
/*采集月份*/
	CONVERT ( VARCHAR ( 7 ), [日期时间], 120 ) AS collect_month,
/*�?小采集日�?*/
	MIN(CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
/*累计流量*/
	MAX (�?温度.[室温2] ) AS total_flow 
FROM
	[�?温度] 
GROUP BY
	�?温度.[通断控制器ID],
	CONVERT (
	VARCHAR ( 7 ),
	[日期时间],
	120 
	)
GO


-- ----------------------------
-- View structure for v_watermeter_month_flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_month_flow]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_month_flow]
GO

CREATE VIEW [dbo].[v_watermeter_month_flow] AS SELECT
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
GO


-- ----------------------------
-- View structure for v_watermeter_quarter
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_quarter]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_quarter]
GO

CREATE VIEW [dbo].[v_watermeter_quarter] AS SELECT
/*水表编号*/
	�?温度.[通断控制器ID] AS watermeter_num,
/*采集季度*/
	DATENAME( quarter, [日期时间] ) AS collect_quarter,
/*�?小采集日�?*/
	MIN (
	CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
/*累计流量*/
	MAX (�?温度.[室温2] ) AS total_flow 
FROM
	[�?温度] 
GROUP BY
	�?温度.[通断控制器ID],
	DATENAME(
	quarter,
	[日期时间] 
	)
GO


-- ----------------------------
-- View structure for v_watermeter_quarter_flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_quarter_flow]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_quarter_flow]
GO

CREATE VIEW [dbo].[v_watermeter_quarter_flow] AS SELECT
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
GO


-- ----------------------------
-- View structure for v_watermeter_week
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_week]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_week]
GO

CREATE VIEW [dbo].[v_watermeter_week] AS SELECT
/*水表编号*/
	�?温度.[通断控制器ID] AS watermeter_num,
/*采集月份*/
	DATENAME( week, [日期时间] ) AS collect_week,
/*�?小采集日�?*/
	MIN (
	CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
/*累计流量*/
	MAX (�?温度.[室温2] ) AS total_flow 
FROM
	[�?温度] 
GROUP BY
	�?温度.[通断控制器ID],
	DATENAME(
	week,
	[日期时间])
GO


-- ----------------------------
-- View structure for v_watermeter_week_flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_week_flow]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_week_flow]
GO

CREATE VIEW [dbo].[v_watermeter_week_flow] AS SELECT
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
GO


-- ----------------------------
-- View structure for v_watermeter_year
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_year]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_year]
GO

CREATE VIEW [dbo].[v_watermeter_year] AS SELECT
/*水表编号*/
	�?温度.[通断控制器ID] AS watermeter_num,
/*采集月份*/
	CONVERT ( VARCHAR ( 4 ), [日期时间], 120 ) AS collect_year,
/*�?小采集日�?*/
	MIN(CONVERT ( CHAR ( 10 ), [日期时间], 120 )) AS collect_date,
/*累计流量*/
	MAX (�?温度.[室温2] ) AS total_flow 
FROM
	[�?温度] 
GROUP BY
	�?温度.[通断控制器ID],
CONVERT ( VARCHAR ( 4 ), [日期时间], 120 )
GO


-- ----------------------------
-- View structure for v_watermeter_year_flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[v_watermeter_year_flow]') AND type IN ('V'))
	DROP VIEW [dbo].[v_watermeter_year_flow]
GO

CREATE VIEW [dbo].[v_watermeter_year_flow] AS SELECT
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
GO


-- ----------------------------
-- View structure for VIEW_water_当日流量_唯一
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_当日流量_唯一]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_当日流量_唯一]
GO

CREATE VIEW [dbo].[VIEW_water_当日流量_唯一] AS SELECT TOP 100 PERCENT 水表ID, MIN(累计流量) AS 当日流量, 当前日期
FROM dbo.VIEW_water_当日数据
GROUP BY 水表ID, 当前日期
GO


-- ----------------------------
-- View structure for VIEW_water_当日数据
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_当日数据]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_当日数据]
GO

CREATE VIEW [dbo].[VIEW_water_当日数据] AS SELECT 通断控制器ID AS 水表ID, 室温2 AS 累计流量, CONVERT(DATETIME, 
      LTRIM(STR(DATEPART(yyyy, 日期时间))) + '-' + LTRIM(STR(DATEPART(mm, 
      日期时间))) + '-' + LTRIM(STR(DATEPART(dd, 日期时间))), 102) AS 当前日期, 
      CONVERT(char(7), 日期时间, 126) AS 当前�?
FROM dbo.�?温度
GO


-- ----------------------------
-- View structure for VIEW_water_日用�?
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_日用量]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_日用量]
GO

CREATE VIEW [dbo].[VIEW_water_日用量] AS SELECT dbo.[VIEW_water_当日流量_唯一].水表ID, 
      dbo.[VIEW_water_当日流量_唯一].当日流量, 
      dbo.[VIEW_water_当日流量_唯一].当前日期, 
      dbo.[VIEW_water_昨日流量_唯一].昨日流量, 
      dbo.[VIEW_water_昨日流量_唯一].昨日日期, 
      dbo.[VIEW_water_当日流量_唯一].当日流量 - dbo.[VIEW_water_昨日流量_唯一].昨日流量
       AS 日用�?, dbo.基础信息.集中器ID, dbo.基础信息.楼栋名称 AS 用户名称, 
      dbo.基础信息.门牌�? AS 用户�?, dbo.基础信息.热户姓名
FROM dbo.[VIEW_water_当日流量_唯一] INNER JOIN
      dbo.[VIEW_water_昨日流量_唯一] ON 
      dbo.[VIEW_water_当日流量_唯一].水表ID = dbo.[VIEW_water_昨日流量_唯一].水表ID AND
       dbo.[VIEW_water_当日流量_唯一].当前日期 = dbo.[VIEW_water_昨日流量_唯一].昨日日期
       INNER JOIN
      dbo.基础信息 ON 
      dbo.[VIEW_water_昨日流量_唯一].水表ID = RIGHT(dbo.基础信息.热量表ID, 8)
GO


-- ----------------------------
-- View structure for VIEW_water_月初流量_唯一
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_月初流量_唯一]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_月初流量_唯一]
GO

CREATE VIEW [dbo].[VIEW_water_月初流量_唯一] AS SELECT 水表ID, MIN(昨日流量) AS 月初流量, 当前�?
FROM dbo.[VIEW_water_昨日数据]
GROUP BY 水表ID, 当前�?
GO


-- ----------------------------
-- View structure for VIEW_water_月末流量_唯一
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_月末流量_唯一]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_月末流量_唯一]
GO

CREATE VIEW [dbo].[VIEW_water_月末流量_唯一] AS SELECT 水表ID, MAX(累计流量) AS 月末流量, 当前�?
FROM dbo.[VIEW_water_当日数据]
GROUP BY 水表ID, 当前�?
GO


-- ----------------------------
-- View structure for VIEW_water_月用�?
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_月用量]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_月用量]
GO

CREATE VIEW [dbo].[VIEW_water_月用量] AS SELECT dbo.[VIEW_water_月初流量_唯一].水表ID, 
      dbo.[VIEW_water_月初流量_唯一].当前�?, 
      dbo.[VIEW_water_月初流量_唯一].月初流量, 
      dbo.[VIEW_water_月末流量_唯一].月末流量, 
      dbo.[VIEW_water_月末流量_唯一].月末流量 - dbo.[VIEW_water_月初流量_唯一].月初流量
       AS 月用�?, dbo.基础信息.集中器ID, dbo.基础信息.楼栋名称 AS 用户名称, 
      dbo.基础信息.门牌�? AS 用户�?, dbo.基础信息.热户姓名
FROM dbo.[VIEW_water_月初流量_唯一] INNER JOIN
      dbo.[VIEW_water_月末流量_唯一] ON 
      dbo.[VIEW_water_月初流量_唯一].水表ID = dbo.[VIEW_water_月末流量_唯一].水表ID AND
       dbo.[VIEW_water_月初流量_唯一].当前�? = dbo.[VIEW_water_月末流量_唯一].当前�? INNER
       JOIN
      dbo.基础信息 ON 
      dbo.[VIEW_water_月末流量_唯一].水表ID = RIGHT(dbo.基础信息.热量表ID, 8)
GO


-- ----------------------------
-- View structure for VIEW_water_昨日流量_唯一
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_昨日流量_唯一]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_昨日流量_唯一]
GO

CREATE VIEW [dbo].[VIEW_water_昨日流量_唯一] AS SELECT TOP 100 PERCENT 水表ID, MIN(昨日流量) AS 昨日流量, 昨日日期
FROM dbo.VIEW_water_昨日数据
GROUP BY 水表ID, 昨日日期
GO


-- ----------------------------
-- View structure for VIEW_water_昨日数据
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_water_昨日数据]') AND type IN ('V'))
	DROP VIEW [dbo].[VIEW_water_昨日数据]
GO

CREATE VIEW [dbo].[VIEW_water_昨日数据] AS SELECT 通断控制器ID AS 水表ID, 室温2 AS 昨日流量, CONVERT(DATETIME, 
      LTRIM(STR(DATEPART(yyyy, DATEADD(day, 1, 日期时间)))) 
      + '-' + LTRIM(STR(DATEPART(mm, DATEADD(day, 1, 日期时间)))) 
      + '-' + LTRIM(STR(DATEPART(dd, DATEADD(day, 1, 日期时间)))), 102) AS 昨日日期, 
      CONVERT(char(7), CONVERT(DATETIME, LTRIM(STR(DATEPART(yyyy, DATEADD(day, 
      1, 日期时间)))) + '-' + LTRIM(STR(DATEPART(mm, DATEADD(day, 1, 日期时间)))) 
      + '-' + LTRIM(STR(DATEPART(dd, DATEADD(day, 1, 日期时间)))), 102), 126) 
      AS 当前�?
FROM dbo.�?温度
GO



-- ----------------------------
-- Procedure structure for dt_generateansiname
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_generateansiname]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_generateansiname]
GO

CREATE PROCEDURE [dbo].[dt_generateansiname](@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave
GO


-- ----------------------------
-- Procedure structure for dt_adduserobject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_adduserobject]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_adduserobject]
GO

CREATE PROCEDURE [dbo].[dt_adduserobject]
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity
GO


-- ----------------------------
-- Procedure structure for dt_setpropertybyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_setpropertybyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_setpropertybyid]
GO

CREATE PROCEDURE [dbo].[dt_setpropertybyid]
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end
GO


-- ----------------------------
-- Procedure structure for dt_getobjwithprop
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getobjwithprop]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getobjwithprop]
GO

CREATE PROCEDURE [dbo].[dt_getobjwithprop]
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property
GO


-- ----------------------------
-- Procedure structure for dt_setpropertybyid_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_setpropertybyid_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_setpropertybyid_u]
GO

CREATE PROCEDURE [dbo].[dt_setpropertybyid_u]
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end
GO


-- ----------------------------
-- Procedure structure for dt_getobjwithprop_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getobjwithprop_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getobjwithprop_u]
GO

CREATE PROCEDURE [dbo].[dt_getobjwithprop_u]
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid_u]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_u]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property
GO


-- ----------------------------
-- Procedure structure for dt_dropuserobjectbyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_dropuserobjectbyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_dropuserobjectbyid]
GO

CREATE PROCEDURE [dbo].[dt_dropuserobjectbyid]
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id
GO


-- ----------------------------
-- Procedure structure for dt_droppropertiesbyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_droppropertiesbyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_droppropertiesbyid]
GO

CREATE PROCEDURE [dbo].[dt_droppropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property
GO


-- ----------------------------
-- Procedure structure for dt_verstamp006
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_verstamp006]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_verstamp006]
GO

CREATE PROCEDURE [dbo].[dt_verstamp006]
as
	select 7000
GO


-- ----------------------------
-- Procedure structure for dt_verstamp007
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_verstamp007]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_verstamp007]
GO

CREATE PROCEDURE [dbo].[dt_verstamp007]
as
	select 7005
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid_vcs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid_vcs]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid_vcs]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_vcs]
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )
GO


-- ----------------------------
-- Procedure structure for dt_displayoaerror
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_displayoaerror]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_displayoaerror]
GO

CREATE PROCEDURE [dbo].[dt_displayoaerror]
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return
GO


-- ----------------------------
-- Procedure structure for dt_adduserobject_vcs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_adduserobject_vcs]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_adduserobject_vcs]
GO

CREATE PROCEDURE [dbo].[dt_adduserobject_vcs]
    @vchProperty varchar(64)

as

set nocount on

declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn
GO


-- ----------------------------
-- Procedure structure for dt_addtosourcecontrol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_addtosourcecontrol]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_addtosourcecontrol]
GO

CREATE PROCEDURE [dbo].[dt_addtosourcecontrol]
    @vchSourceSafeINI varchar(255) = '',
    @vchProjectName   varchar(255) ='',
    @vchComment       varchar(255) ='',
    @vchLoginName     varchar(255) ='',
    @vchPassword      varchar(255) =''

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId = 0

declare @iStreamObjectId int
select @iStreamObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

declare @vchDatabaseName varchar(255)
select @vchDatabaseName = db_name()

declare @iReturnValue int
select @iReturnValue = 0

declare @iPropertyObjectId int
declare @vchParentId varchar(255)

declare @iObjectCount int
select @iObjectCount = 0

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError


    /* Create Project in SS */
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'AddProjectToSourceSafe',
											NULL,
											@vchSourceSafeINI,
											@vchProjectName output,
											@@SERVERNAME,
											@vchDatabaseName,
											@vchLoginName,
											@vchPassword,
											@vchComment


    if @iReturn <> 0 GOTO E_OAError

    /* Set Database Properties */

    begin tran SetProperties

    /* add high level object */

    exec @iPropertyObjectId = dbo.dt_adduserobject_vcs 'VCSProjectID'

    select @vchParentId = CONVERT(varchar(255),@iPropertyObjectId)

    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProjectID', @vchParentId , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProject' , @vchProjectName , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSourceSafeINI' , @vchSourceSafeINI , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLServer', @@SERVERNAME, NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLDatabase', @vchDatabaseName, NULL

    if @@error <> 0 GOTO E_General_Error

    commit tran SetProperties
    
    select @iObjectCount = 0;

CleanUp:
    select @vchProjectName
    select @iObjectCount
    return

E_General_Error:
    /* this is an all or nothing.  No specific error messages */
    goto CleanUp

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_checkinobject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkinobject]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkinobject]
GO

CREATE PROCEDURE [dbo].[dt_checkinobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */


as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)

    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */

            begin tran compile_all

            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid

            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines

            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end

        if @iReturn <> 0 GOTO E_OAError

        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end

    end

CleanUp:
	return

E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp

E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_checkoutobject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkoutobject]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkoutobject]
GO

CREATE PROCEDURE [dbo].[dt_checkoutobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @vchTempText varchar(255)

	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag

        if @iReturn <> 0 GOTO E_OAError


        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #commenttext (id int identity, sourcecode varchar(255))


        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end

        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_isundersourcecontrol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_isundersourcecontrol]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_isundersourcecontrol]
GO

CREATE PROCEDURE [dbo].[dt_isundersourcecontrol]
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @iStreamObjectId int
	select @iStreamObjectId   = 0

	declare @vchTempText varchar(255)

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end

    if @iWhoToo = 1
    begin

        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #ObjectList (id int identity, vchObjectlist varchar(255))

        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end

        select vchObjectlist from #ObjectList order by id
    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_removefromsourcecontrol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_removefromsourcecontrol]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_removefromsourcecontrol]
GO

CREATE PROCEDURE [dbo].[dt_removefromsourcecontrol]

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0
GO


-- ----------------------------
-- Procedure structure for dt_validateloginparams
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_validateloginparams]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_validateloginparams]
GO

CREATE PROCEDURE [dbo].[dt_validateloginparams]
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError

    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_vcsenabled
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_vcsenabled]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_vcsenabled]
GO

CREATE PROCEDURE [dbo].[dt_vcsenabled]

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */
GO


-- ----------------------------
-- Procedure structure for dt_whocheckedout
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_whocheckedout]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_whocheckedout]
GO

CREATE PROCEDURE [dbo].[dt_whocheckedout]
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword

        if @iReturn <> 0 GOTO E_OAError

        select @vchReturnValue

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid_vcs_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid_vcs_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid_vcs_u]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_vcs_u]
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output
GO


-- ----------------------------
-- Procedure structure for dt_displayoaerror_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_displayoaerror_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_displayoaerror_u]
GO

CREATE PROCEDURE [dbo].[dt_displayoaerror_u]
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult
GO


-- ----------------------------
-- Procedure structure for dt_addtosourcecontrol_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_addtosourcecontrol_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_addtosourcecontrol_u]
GO

CREATE PROCEDURE [dbo].[dt_addtosourcecontrol_u]
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''

as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword
GO


-- ----------------------------
-- Procedure structure for dt_checkinobject_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkinobject_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkinobject_u]
GO

CREATE PROCEDURE [dbo].[dt_checkinobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */

as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3
GO


-- ----------------------------
-- Procedure structure for dt_checkoutobject_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkoutobject_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkoutobject_u]
GO

CREATE PROCEDURE [dbo].[dt_checkoutobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag
GO


-- ----------------------------
-- Procedure structure for dt_isundersourcecontrol_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_isundersourcecontrol_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_isundersourcecontrol_u]
GO

CREATE PROCEDURE [dbo].[dt_isundersourcecontrol_u]
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo
GO


-- ----------------------------
-- Procedure structure for dt_validateloginparams_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_validateloginparams_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_validateloginparams_u]
GO

CREATE PROCEDURE [dbo].[dt_validateloginparams_u]
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as

	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword
GO


-- ----------------------------
-- Procedure structure for dt_whocheckedout_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_whocheckedout_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_whocheckedout_u]
GO

CREATE PROCEDURE [dbo].[dt_whocheckedout_u]
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)

as

	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword
GO

