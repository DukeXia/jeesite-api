CREATE TABLE `c_feedback` (

`id` varchar(64) NOT NULL,

`content` varchar(500) NULL,

`user_id` varchar(64) NULL,

`email` varchar(500) NULL,

`name` varchar(255) NULL,

`phone` varchar(255) NULL,

`status` char(1) NULL,

`create_date` datetime NULL,

`update_by` varchar(64) NULL,

`update_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT 0,

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

COMMENT='����'
;



CREATE TABLE `c_article` (

`id` varchar(64) NOT NULL,

`type` char(1) NULL COMMENT '',

`title` varchar(255) NULL,

`image_url` varchar(500) NULL,

`content` varchar(5000) NULL,

`sub_title` varchar(255) NULL,

`create_by` varchar(64) NULL,

`create_date` datetime NULL,

`update_by` varchar(64) NULL,

`update_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT 0,

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='����'
;



CREATE TABLE `c_user` (

`id` varchar(64) NOT NULL COMMENT '�û�ID',

`user_type` char(1) DEFAULT NULL COMMENT '�û����� 0��ע���û�\r\n1���������û�',

`login_name` varchar(40) NULL DEFAULT NULL COMMENT '��¼��',

`password` varchar(50) NULL DEFAULT NULL COMMENT '����',

`device_type` char(1) NULL COMMENT '�豸���� 0:iPhone\r\n1:iPad\r\n2:android3:androidPad',

`device_id` varchar(40) NULL DEFAULT NULL COMMENT '�豸ID',

`open_id` varchar(64) NULL DEFAULT NULL COMMENT '������ID',

`real_name` varchar(50) NULL DEFAULT NULL COMMENT '��ʵ����',

`nick_name` varchar(50) DEFAULT NULL COMMENT '�ǳ�',

`image_url` varchar(255) NULL DEFAULT NULL COMMENT '�û�ͷ��',

`sex` char(1) NULL DEFAULT NULL COMMENT '�Ա� 0����\r\n1��Ů',

`phone` varchar(20) NULL DEFAULT NULL COMMENT '�ֻ�����',

`jf` int(10) NULL DEFAULT 0 COMMENT '����',

`status` char(1) NULL DEFAULT '0' COMMENT '0:����\r\n1:��ֹ',

`create_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT '0',

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

COMMENT='�û�'
;

CREATE TABLE `c_session` (

`id` varchar(64) NOT NULL,

`user_id` varchar(64) NULL,

`status` char(1) NULL,

`device_type` char(1) NULL,

`login_ip` varchar(255) NULL,

`login_date` datetime NULL,

`logout_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT 0,

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

COMMENT='�Ự'
;


CREATE TABLE `c_log` (

`id` varchar(64) NULL,

`title` varchar(255) NULL COMMENT '����',

`type` char(1) NULL COMMENT '����',

`user_token` varchar(64) NULL COMMENT '�û�token',

`remote_addr` varchar(255) NULL COMMENT 'IP��ַ',

`user_agent` varchar(255) NULL COMMENT '�û�����',

`request_uri` varchar(255) NULL COMMENT '����uri',

`method` varchar(5) NULL COMMENT '���󷽷�',

`params` text NULL COMMENT '�������',

`exception` text NULL COMMENT '�쳣��Ϣ',

`create_date` datetime NULL COMMENT '����ʱ��'

)

ENGINE=MyISAM

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;

-- ----------------------------
-- Table structure for c_telsms
-- ----------------------------
DROP TABLE IF EXISTS `c_telsms`;
CREATE TABLE `c_telsms` (
  `id` varchar(64) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `type` char(1) DEFAULT NULL COMMENT '0:ע��\r\n1:�һ�����',
  `code` varchar(10) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������֤��';

-- ----------------------------
-- Table structure for c_version
-- ----------------------------
DROP TABLE IF EXISTS `c_version`;
CREATE TABLE `c_version` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `type` char(1) DEFAULT NULL COMMENT '����',
  `system_type` char(1) DEFAULT NULL COMMENT 'ϵͳ���� 0 ��׿Pad 1 IOS ',
  `res_id` varchar(64) DEFAULT NULL COMMENT '�ļ�ID',
  `res_url` varchar(200) DEFAULT NULL COMMENT '��װ��url',
  `version_no` varchar(20) DEFAULT NULL COMMENT '�汾��',
  `content` varchar(500) DEFAULT NULL COMMENT '����',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�汾';

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `name` varchar(128) NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_sequence` VALUES ('default', '0', '1');

DROP FUNCTION IF EXISTS `currval`;

CREATE FUNCTION `currval`(seq_name VARCHAR(128))
 RETURNS int(11)
BEGIN  
  DECLARE value INTEGER;  
  SET value = 0;  
  SELECT current_value INTO value  
  FROM sys_sequence  
  WHERE name = seq_name;  
  RETURN value;  
END;

DROP FUNCTION IF EXISTS `nextval`;

CREATE FUNCTION `nextval`(seq_name VARCHAR(128))
 RETURNS int(11)
BEGIN  
   UPDATE sys_sequence  
   SET          current_value = current_value + increment  
   WHERE name = seq_name;  
   RETURN currval(seq_name);  
END;

DROP FUNCTION IF EXISTS `setval`;

CREATE FUNCTION `setval`(seq_name VARCHAR(128), value INTEGER)
 RETURNS int(11)
BEGIN  
   UPDATE sys_sequence  
   SET          current_value = value  
   WHERE name = seq_name;  
   RETURN currval(seq_name);  
END;


SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables*/

DROP TABLE IF EXISTS gen_scheme;
DROP TABLE IF EXISTS gen_table_column;
DROP TABLE IF EXISTS gen_table;
DROP TABLE IF EXISTS gen_template; 




/* Create Tables */

CREATE TABLE gen_scheme
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(200) COMMENT '����',
	category varchar(2000) COMMENT '����',
	package_name varchar(500) COMMENT '���ɰ�·��',
	module_name varchar(30) COMMENT '����ģ����',
	sub_module_name varchar(30) COMMENT '������ģ����',
	function_name varchar(500) COMMENT '���ɹ�����',
	function_name_simple varchar(100) COMMENT '���ɹ���������д��',
	function_author varchar(100) COMMENT '���ɹ�������',
	gen_table_id varchar(200) COMMENT '���ɱ���',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = '���ɷ���';


CREATE TABLE gen_table
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(200) COMMENT '����',
	comments varchar(500) COMMENT '����',
	class_name varchar(100) COMMENT 'ʵ��������',
	parent_table varchar(200) COMMENT '��������',
	parent_table_fk varchar(100) COMMENT '�����������',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ���';


CREATE TABLE gen_table_column
(
	id varchar(64) NOT NULL COMMENT '���',
	gen_table_id varchar(64) COMMENT '��������',
	name varchar(200) COMMENT '����',
	comments varchar(500) COMMENT '����',
	jdbc_type varchar(100) COMMENT '�е��������͵��ֽڳ���',
	java_type varchar(500) COMMENT 'JAVA����',
	java_field varchar(200) COMMENT 'JAVA�ֶ���',
	is_pk char(1) COMMENT '�Ƿ�����',
	is_null char(1) COMMENT '�Ƿ��Ϊ��',
	is_insert char(1) COMMENT '�Ƿ�Ϊ�����ֶ�',
	is_edit char(1) COMMENT '�Ƿ�༭�ֶ�',
	is_list char(1) COMMENT '�Ƿ��б��ֶ�',
	is_query char(1) COMMENT '�Ƿ��ѯ�ֶ�',
	query_type varchar(200) COMMENT '��ѯ��ʽ�����ڡ������ڡ����ڡ�С�ڡ���Χ����LIKE����LIKE������LIKE��',
	show_type varchar(200) COMMENT '�ֶ����ɷ������ı����ı��������򡢸�ѡ�򡢵�ѡ���ֵ�ѡ����Աѡ�񡢲���ѡ������ѡ��',
	dict_type varchar(200) COMMENT '�ֵ�����',
	settings varchar(2000) COMMENT '�������ã���չ�ֶ�JSON��',
	sort decimal COMMENT '��������',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ����ֶ�';


CREATE TABLE gen_template
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(200) COMMENT '����',
	category varchar(2000) COMMENT '����',
	file_path varchar(500) COMMENT '�����ļ�·��',
	file_name varchar(200) COMMENT '�����ļ���',
	content text COMMENT '����',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = '����ģ���';



/* Create Indexes */

CREATE INDEX gen_scheme_del_flag ON gen_scheme (del_flag ASC);
CREATE INDEX gen_table_name ON gen_table (name ASC);
CREATE INDEX gen_table_del_flag ON gen_table (del_flag ASC);
CREATE INDEX gen_table_column_table_id ON gen_table_column (gen_table_id ASC);
CREATE INDEX gen_table_column_name ON gen_table_column (name ASC);
CREATE INDEX gen_table_column_sort ON gen_table_column (sort ASC);
CREATE INDEX gen_table_column_del_flag ON gen_table_column (del_flag ASC);
CREATE INDEX gen_template_del_falg ON gen_template (del_flag ASC);


-- prompt Loading GEN_SCHEME...
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9c9de9db6da743bb899036c6546061ac', '����', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '��������', '����', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e6d905fd236b46d1af581dd32bdfb3b0', '���ӱ�', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '���ӱ�����', '���ӱ�', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35a13dc260284a728a270db3f382664b', '���ṹ', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '���ṹ����', '���ṹ', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 3 records loaded
-- prompt Loading GEN_TABLE...
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', 'ҵ�����ݱ�', 'TestData', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', 'ҵ�����ݱ�', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', 'ҵ�������ӱ�', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '���ṹ��', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 4 records loaded
-- prompt Loading GEN_TABLE_COLUMN...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '���', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '�����û�', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '��������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '��������', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '����', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '�Ա�', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '��������', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '��ע��Ϣ', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', 'ɾ����ǣ�0��������1��ɾ����', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '���', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '�����û�', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '��������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '��������', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '����', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '�Ա�', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '��������', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '��ע��Ϣ', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', 'ɾ����ǣ�0��������1��ɾ����', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '���', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', 'ҵ������', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '����', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '��ע��Ϣ', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', 'ɾ����ǣ�0��������1��ɾ����', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '���', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '�������', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '���и������', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '����', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '����', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '������', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '����ʱ��', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '��ע��Ϣ', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', 'ɾ����ǣ�0��������1��ɾ����', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 46 records loaded


SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_notify_record;
DROP TABLE IF EXISTS oa_notify;

/* Create Tables */
CREATE TABLE oa_notify
(
	id varchar(64) NOT NULL COMMENT '���',
	type char(1) COMMENT '����',
	title varchar(200) COMMENT '����',
	content varchar(2000) COMMENT '����',
	files varchar(2000) COMMENT '����',
	status char(1) COMMENT '״̬',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '֪ͨͨ��';

CREATE TABLE oa_notify_record
(
	id varchar(64) NOT NULL COMMENT '���',
	oa_notify_id varchar(64) COMMENT '֪ͨͨ��ID',
	user_id varchar(64) COMMENT '������',
	read_flag char(1) DEFAULT '0' COMMENT '�Ķ����',
	read_date date COMMENT '�Ķ�ʱ��',
	PRIMARY KEY (id)
) COMMENT = '֪ͨͨ�淢�ͼ�¼';

/* Create Indexes */
CREATE INDEX oa_notify_del_flag ON oa_notify (del_flag ASC);
CREATE INDEX oa_notify_record_notify_id ON oa_notify_record (oa_notify_id ASC);
CREATE INDEX oa_notify_record_user_id ON oa_notify_record (user_id ASC);
CREATE INDEX oa_notify_record_read_flag ON oa_notify_record (read_flag ASC);



SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sys_role_office;
DROP TABLE IF EXISTS sys_user_role;
DROP TABLE IF EXISTS sys_user;
DROP TABLE IF EXISTS sys_office;
DROP TABLE IF EXISTS sys_area;
DROP TABLE IF EXISTS sys_dict;
DROP TABLE IF EXISTS sys_log;
DROP TABLE IF EXISTS sys_mdict;
DROP TABLE IF EXISTS sys_role_menu;
DROP TABLE IF EXISTS sys_menu;
DROP TABLE IF EXISTS sys_role;




/* Create Tables */

CREATE TABLE sys_area
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	code varchar(100) COMMENT '�������',
	type char(1) COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�����';


CREATE TABLE sys_dict
(
	id varchar(64) NOT NULL COMMENT '���',
	value varchar(100) NOT NULL COMMENT '����ֵ',
	label varchar(100) NOT NULL COMMENT '��ǩ��',
	type varchar(100) NOT NULL COMMENT '����',
	description varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '��������',
	parent_id varchar(64) DEFAULT '0' COMMENT '�������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�ֵ��';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1', '0', '����', 'del_flag', 'ɾ�����', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10', 'yellow', '��ɫ', 'color', '��ɫֵ', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('105', '1', '����ͨ��\0\0\0\0', 'oa_notify_type', '֪ͨͨ������', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('106', '2', '����ͨ��\0\0\0\0', 'oa_notify_type', '֪ͨͨ������', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('107', '3', '�ͨ��\0\0\0\0', 'oa_notify_type', '֪ͨͨ������', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('108', '0', '�ݸ�', 'oa_notify_status', '֪ͨͨ��״̬', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('109', '1', '����', 'oa_notify_status', '֪ͨͨ��״̬', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('11', 'orange', '��ɫ', 'color', '��ɫֵ', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('110', '0', 'δ��', 'oa_notify_read', '֪ͨͨ��״̬', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('111', '1', '�Ѷ�', 'oa_notify_read', '֪ͨͨ��״̬', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('12', 'default', 'Ĭ������', 'theme', '���ⷽ��', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('13', 'cerulean', '��������', 'theme', '���ⷽ��', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('14', 'readable', '��ɫ����', 'theme', '���ⷽ��', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('15', 'united', '��ɫ����', 'theme', '���ⷽ��', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('16', 'flat', 'Flat����', 'theme', '���ⷽ��', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('17', '1', '����', 'sys_area_type', '��������', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('18', '2', 'ʡ�ݡ�ֱϽ��', 'sys_area_type', '��������', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('19', '3', '����', 'sys_area_type', '��������', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2', '1', 'ɾ��', 'del_flag', 'ɾ�����', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20', '4', '����', 'sys_area_type', '��������', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21', '1', '��˾', 'sys_office_type', '��������', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('22', '2', '����', 'sys_office_type', '��������', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('23', '3', 'С��', 'sys_office_type', '��������', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('24', '4', '����', 'sys_office_type', '��������', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('25', '1', '�ۺϲ�', 'sys_office_common', '���ͨ�ò���', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('26', '2', '������', 'sys_office_common', '���ͨ�ò���', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('27', '3', '������', 'sys_office_common', '���ͨ�ò���', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('28', '1', 'һ��', 'sys_office_grade', '�����ȼ�', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('29', '2', '����', 'sys_office_grade', '�����ȼ�', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('3', '1', '��ʾ', 'show_hide', '��ʾ/����', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30', '3', '����', 'sys_office_grade', '�����ȼ�', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('31', '4', '�ļ�', 'sys_office_grade', '�����ȼ�', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('32', '1', '��������', 'sys_data_scope', '���ݷ�Χ', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('33', '2', '���ڹ�˾����������', 'sys_data_scope', '���ݷ�Χ', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('34', '3', '���ڹ�˾����', 'sys_data_scope', '���ݷ�Χ', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('35', '4', '���ڲ��ż���������', 'sys_data_scope', '���ݷ�Χ', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('36', '5', '���ڲ�������', 'sys_data_scope', '���ݷ�Χ', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('37', '8', '����������', 'sys_data_scope', '���ݷ�Χ', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('38', '9', '����ϸ����', 'sys_data_scope', '���ݷ�Χ', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('39', '1', 'ϵͳ����', 'sys_user_type', '�û�����', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('4', '0', '����', 'show_hide', '��ʾ/����', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40', '2', '���ž���', 'sys_user_type', '�û�����', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41', '3', '��ͨ�û�', 'sys_user_type', '�û�����', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('5', '1', '��', 'yes_no', '��/��', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('6', '0', '��', 'yes_no', '��/��', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('67', '1', '������־', 'sys_log_type', '��־����', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('68', '2', '�쳣��־', 'sys_log_type', '��־����', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('7', 'red', '��ɫ', 'color', '��ɫֵ', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('8', 'green', '��ɫ', 'color', '��ɫֵ', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('9', 'blue', '��ɫ', 'color', '��ɫֵ', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('96', '1', '��', 'sex', '�Ա�', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('97', '2', 'Ů', 'sex', '�Ա�', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');


CREATE TABLE sys_log
(
	id varchar(64) NOT NULL COMMENT '���',
	type char(1) DEFAULT '1' COMMENT '��־����',
	title varchar(255) DEFAULT '' COMMENT '��־����',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	remote_addr varchar(255) COMMENT '����IP��ַ',
	user_agent varchar(255) COMMENT '�û�����',
	request_uri varchar(255) COMMENT '����URI',
	method varchar(5) COMMENT '������ʽ',
	params text COMMENT '�����ύ������',
	exception text COMMENT '�쳣��Ϣ',
	PRIMARY KEY (id)
) COMMENT = '��־��';


CREATE TABLE sys_mdict
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	description varchar(100) COMMENT '����',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�༶�ֵ��';


CREATE TABLE sys_menu
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	href varchar(2000) COMMENT '����',
	target varchar(20) COMMENT 'Ŀ��',
	icon varchar(100) COMMENT 'ͼ��',
	is_show char(1) NOT NULL COMMENT '�Ƿ��ڲ˵�����ʾ',
	permission varchar(200) COMMENT 'Ȩ�ޱ�ʶ',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�˵���';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '�༭', 60, '', '', '', '0', 'test:testData:edit', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '���ṹ', 90, '/test/testTree', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '���ܲ˵�', 0, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '�ֵ����', 60, '/sys/dict/', NULL, 'th-list', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '�鿴', 30, NULL, NULL, NULL, '0', 'sys:dict:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '�޸�', 40, NULL, NULL, NULL, '0', 'sys:dict:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '�����û�', 970, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '�������', 50, '/sys/area/', NULL, 'th', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '�鿴', 30, NULL, NULL, NULL, '0', 'sys:area:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '�޸�', 40, NULL, NULL, NULL, '0', 'sys:area:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '��������', 40, '/sys/office/', NULL, 'th-large', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '�鿴', 30, NULL, NULL, NULL, '0', 'sys:office:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '�޸�', 40, NULL, NULL, NULL, '0', 'sys:office:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', 'ϵͳ����', 900, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '�û�����', 30, '/sys/user/index', NULL, 'user', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '�鿴', 30, '', '', '', '0', 'sys:user:view', '1', '2013-5-27 08:00:00', '1', '2015-5-29 10:33:17', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '�޸�', 40, NULL, NULL, NULL, '0', 'sys:user:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('2652d8b8cf80447980e419b9f0d057a1', '1', '0,1,', '����˵�', 5030, '', '', '', '1', '', '1', '2016-7-20 11:34:42', '1', '2016-7-20 11:34:42', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '��������', 100, '', '', '', '1', '', '1', '2013-5-27 08:00:00', '1', '2015-5-28 13:14:44', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '������Ϣ', 30, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '������Ϣ', 30, '/sys/user/info', NULL, 'user', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', 'ϵͳ����', 980, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '�޸�����', 40, '/sys/user/modifyPwd', NULL, 'lock', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '����ʾ��', 120, '', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '�˵�����', 30, '/sys/menu/', NULL, 'list-alt', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '�鿴', 30, '', '', '', '0', 'test:testDataMain:view', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4eac1748666d4cd6b2e835a23149c57c', '98afebc8d89a4ebcb86702813db70143', '0,1,27,98afebc8d89a4ebcb86702813db70143,', 'ͨ�����', 50, '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2016-5-13 17:14:51', '1', '2016-5-13 17:14:51', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '�鿴', 30, NULL, NULL, NULL, '0', 'sys:menu:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '�ļ�����', 90, '/../static/ckfinder/ckfinder.html', NULL, 'folder-open', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '�鿴', 30, NULL, NULL, NULL, '0', 'cms:ckfinder:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '�ϴ�', 40, NULL, NULL, NULL, '0', 'cms:ckfinder:upload', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '�޸�', 50, NULL, NULL, NULL, '0', 'cms:ckfinder:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '�޸�', 40, NULL, NULL, NULL, '0', 'sys:menu:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '��־��ѯ', 985, NULL, NULL, NULL, '1', NULL, '1', '2013-6-3 08:00:00', '1', '2013-6-3 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '��־��ѯ', 30, '/sys/log', NULL, 'pencil', '1', 'sys:log:view', '1', '2013-6-3 08:00:00', '1', '2013-6-3 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '��ɫ����', 50, '/sys/role/', NULL, 'lock', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '�ļ�����', 90, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '��������', 5000, NULL, NULL, NULL, '1', NULL, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '�鿴', 30, NULL, NULL, NULL, '0', 'sys:role:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '��������', 50, NULL, NULL, NULL, '1', NULL, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '���ɷ�������', 30, '/gen/genScheme', NULL, NULL, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', 'ҵ�������', 20, '/gen/genTable', NULL, NULL, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '���ӳؼ���', 40, '/../druid', NULL, NULL, '1', NULL, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '��������', 80, '/../static/map/map-city.html', NULL, NULL, '1', NULL, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '�޸�', 40, NULL, NULL, NULL, '0', 'sys:role:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('98afebc8d89a4ebcb86702813db70143', '27', '0,1,27,', '֪ͨͨ��', 20, '', '', '', '1', '', '1', '2016-5-13 17:13:18', '1', '2016-5-13 17:13:18', '', '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '�༭', 60, '', '', '', '0', 'test:testTree:edit', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '���ӱ�', 60, '/test/testDataMain', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b2d622c3cbeb45ad80438cd34501593f', '2652d8b8cf80447980e419b9f0d057a1', '0,1,2652d8b8cf80447980e419b9f0d057a1,', '�û�����', 30, '/user/cUser/list', '', '', '1', 'user:cUser:view,user:cUser:edit', '1', '2016-7-20 11:37:09', '1', '2016-7-20 11:37:09', '', '1');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '����', 30, '/test/testData', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('bcaf28e42714410fb9c76b2725a0f57b', '2652d8b8cf80447980e419b9f0d057a1', '0,1,2652d8b8cf80447980e419b9f0d057a1,', '��������', 60, '', '', '', '1', '', '1', '2016-7-20 11:40:10', '1', '2016-7-20 11:40:10', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '�鿴', 30, '', '', '', '0', 'test:testTree:view', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c66ccee5d6c34daea011a7330a733a0b', '98afebc8d89a4ebcb86702813db70143', '0,1,27,98afebc8d89a4ebcb86702813db70143,', '�ҵ�ͨ��', 30, '/oa/oaNotify/self', '', '', '1', '', '1', '2016-5-13 17:14:10', '1', '2016-5-13 17:14:10', '', '0');
INSERT INTO `sys_menu` VALUES ('c6e1d0f17a46461e8fe819c7b5d4df91', 'bcaf28e42714410fb9c76b2725a0f57b', '0,1,2652d8b8cf80447980e419b9f0d057a1,bcaf28e42714410fb9c76b2725a0f57b,', '��������', 60, '/basis/aboutus/form', '', '', '1', 'basis:aboutus:edit', '1', '2016-7-20 11:41:24', '1', '2016-7-20 11:41:24', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '�༭', 60, '', '', '', '0', 'test:testDataMain:edit', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '�鿴', 30, '', '', '', '0', 'test:testData:view', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ea10007746e24ff891677ec8fd418fac', 'bcaf28e42714410fb9c76b2725a0f57b', '0,1,2652d8b8cf80447980e419b9f0d057a1,bcaf28e42714410fb9c76b2725a0f57b,', '�û�����', 30, '/user/cUser/list?userType=1', '', '', '1', 'user:cUser:view,user:cUser:edit', '1', '2016-7-20 11:40:37', '1', '2016-7-20 13:48:24', '', '0');
INSERT INTO `sys_menu` VALUES ('f6addfae30fb4995bf190ab08f18b720', 'bcaf28e42714410fb9c76b2725a0f57b', '0,1,2652d8b8cf80447980e419b9f0d057a1,bcaf28e42714410fb9c76b2725a0f57b,', '��Ȩ����', 90, '/basis/copyRight/form', '', '', '1', 'basis:copyright:edit', '1', '2016-7-20 11:42:25', '1', '2016-7-20 11:42:25', '', '0');

CREATE TABLE sys_office
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	area_id varchar(64) NOT NULL COMMENT '��������',
	code varchar(100) COMMENT '�������',
	type char(1) NOT NULL COMMENT '��������',
	grade char(1) NOT NULL COMMENT '�����ȼ�',
	address varchar(255) COMMENT '��ϵ��ַ',
	zip_code varchar(100) COMMENT '��������',
	master varchar(100) COMMENT '������',
	phone varchar(200) COMMENT '�绰',
	fax varchar(200) COMMENT '����',
	email varchar(200) COMMENT '����',
	USEABLE varchar(64) COMMENT '�Ƿ�����',
	PRIMARY_PERSON varchar(64) COMMENT '��������',
	DEPUTY_PERSON varchar(64) COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '������';


-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('4f15b69f97a64916ada77c8df53de233', '0', '0,', '�����������������Ƽ����޹�˾', '30', '100001', 'SZZL', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2016-05-16 17:35:00', '1', '2016-05-16 17:35:00', '', '0');
INSERT INTO `sys_office` VALUES ('54b6b3285a4a4c1c893c0f4f9afbb2a4', '4f15b69f97a64916ada77c8df53de233', '0,4f15b69f97a64916ada77c8df53de233,', '�ƶ���ҵ��', '30', '100001', 'YD', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2016-05-16 17:36:05', '1', '2016-05-16 17:36:05', '', '0');



CREATE TABLE sys_role
(
	id varchar(64) NOT NULL COMMENT '���',
	office_id varchar(64) COMMENT '��������',
	name varchar(100) NOT NULL COMMENT '��ɫ����',
	enname varchar(255) COMMENT 'Ӣ������',
	role_type varchar(255) COMMENT '��ɫ����',
	data_scope char(1) COMMENT '���ݷ�Χ',
	is_sys varchar(64) COMMENT '�Ƿ�ϵͳ����',
	useable varchar(64) COMMENT '�Ƿ����',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '��ɫ��';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('e729950f13684c12a07abe4f93a89ab2', '54b6b3285a4a4c1c893c0f4f9afbb2a4', 'ϵͳ����Ա', 'administrator', 'assignment', '8', '1', '1', '1', '2016-05-16 17:42:01', '1', '2016-05-16 17:42:44', '', '0');


CREATE TABLE sys_role_menu
(
	role_id varchar(64) NOT NULL COMMENT '��ɫ���',
	menu_id varchar(64) NOT NULL COMMENT '�˵����',
	PRIMARY KEY (role_id, menu_id)
) COMMENT = '��ɫ-�˵�';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '1');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '27');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '28');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '29');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '30');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '4eac1748666d4cd6b2e835a23149c57c');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '56');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '57');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '58');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '59');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '71');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '98afebc8d89a4ebcb86702813db70143');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', 'c66ccee5d6c34daea011a7330a733a0b');


CREATE TABLE sys_role_office
(
	role_id varchar(64) NOT NULL COMMENT '��ɫ���',
	office_id varchar(64) NOT NULL COMMENT '�������',
	PRIMARY KEY (role_id, office_id)
) COMMENT = '��ɫ-����';


CREATE TABLE sys_user
(
	id varchar(64) NOT NULL COMMENT '���',
	company_id varchar(64) NOT NULL COMMENT '������˾',
	office_id varchar(64) NOT NULL COMMENT '��������',
	login_name varchar(100) NOT NULL COMMENT '��¼��',
	password varchar(100) NOT NULL COMMENT '����',
	no varchar(100) COMMENT '����',
	name varchar(100) NOT NULL COMMENT '����',
	email varchar(200) COMMENT '����',
	phone varchar(200) COMMENT '�绰',
	mobile varchar(200) COMMENT '�ֻ�',
	user_type char(1) COMMENT '�û�����',
	photo varchar(1000) COMMENT '�û�ͷ��',
	login_ip varchar(100) COMMENT '����½IP',
	login_date datetime COMMENT '����½ʱ��',
	login_flag varchar(64) COMMENT '�Ƿ�ɵ�¼',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�û���';
-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', 'ϵͳ����Ա', '', '', '', '', '', '127.0.0.1', '2016-05-16 18:01:15', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');


CREATE TABLE sys_user_role
(
	user_id varchar(64) NOT NULL COMMENT '�û����',
	role_id varchar(64) NOT NULL COMMENT '��ɫ���',
	PRIMARY KEY (user_id, role_id)
) COMMENT = '�û�-��ɫ';



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



-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '100001', '0100001,', '������', '110000', '010', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:26:24', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('10', '1', '0,100001,1', 'ͨ����', '110112', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('100', '83', '0,100001,35,83', 'κ��', '130434', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1000', '999', '0,100001,929,999', '�³���', '330802', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('100001', '0', '0', '�й�', '1', null, '1', 'yyx', '2015-07-12 12:10:53', 'yyx', '2015-07-12 12:11:03', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1001', '999', '0,100001,929,999', '�齭��', '330803', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1002', '999', '0,100001,929,999', '��ɽ��', '330822', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1003', '999', '0,100001,929,999', '������', '330824', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1004', '999', '0,100001,929,999', '������', '330825', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1005', '999', '0,100001,929,999', '��ɽ��', '330881', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1006', '929', '0,100001,929', '��ɽ��', '330900', '0580', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1007', '1006', '0,100001,929,1006', '������', '330902', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1008', '1006', '0,100001,929,1006', '������', '330903', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1009', '1006', '0,100001,929,1006', '�ɽ��', '330921', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('101', '83', '0,100001,35,83', '������', '130435', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1010', '1006', '0,100001,929,1006', '������', '330922', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1011', '929', '0,100001,929', '̨����', '331000', '0576', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1012', '1011', '0,100001,929,1011', '������', '331002', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1013', '1011', '0,100001,929,1011', '������', '331003', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1014', '1011', '0,100001,929,1011', '·����', '331004', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1015', '1011', '0,100001,929,1011', '����', '331021', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1016', '1011', '0,100001,929,1011', '������', '331022', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1017', '1011', '0,100001,929,1011', '��̨��', '331023', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1018', '1011', '0,100001,929,1011', '�ɾ���', '331024', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1019', '1011', '0,100001,929,1011', '������', '331081', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('102', '83', '0,100001,35,83', '�䰲��', '130481', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1020', '1011', '0,100001,929,1011', '�ٺ���', '331082', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1021', '929', '0,100001,929', '��ˮ��', '331100', '0578', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1022', '1021', '0,100001,929,1021', '������', '331102', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1023', '1021', '0,100001,929,1021', '������', '331121', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1024', '1021', '0,100001,929,1021', '������', '331122', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1025', '1021', '0,100001,929,1021', '�����', '331123', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1026', '1021', '0,100001,929,1021', '������', '331124', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1027', '1021', '0,100001,929,1021', '�ƺ���', '331125', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1028', '1021', '0,100001,929,1021', '��Ԫ��', '331126', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1029', '1021', '0,100001,929,1021', '�������������', '331127', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('103', '35', '0,100001,35', '��̨��', '130500', '0319', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1030', '1021', '0,100001,929,1021', '��Ȫ��', '331181', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1031', '100001', '0,100001', '����ʡ', '340000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1032', '1031', '0,100001,1031', '�Ϸ���', '340100', '0551', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1033', '1032', '0,100001,1031,1032', '������', '340102', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1034', '1032', '0,100001,1031,1032', '®����', '340103', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1035', '1032', '0,100001,1031,1032', '��ɽ��', '340104', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1036', '1032', '0,100001,1031,1032', '������', '340111', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1037', '1032', '0,100001,1031,1032', '������', '340121', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1038', '1032', '0,100001,1031,1032', '�ʶ���', '340122', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1039', '1032', '0,100001,1031,1032', '������', '340123', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('104', '103', '0,100001,35,103', '�Ŷ���', '130502', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1040', '1032', '0,100001,1031,1032', '®����', '340124', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1041', '1032', '0,100001,1031,1032', '������', '340181', '0565', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1042', '1031', '0,100001,1031', '�ߺ���', '340200', '0553', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1043', '1042', '0,100001,1031,1042', '������', '340202', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1044', '1042', '0,100001,1031,1042', '߮����', '340203', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1045', '1042', '0,100001,1031,1042', '𯽭��', '340207', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1046', '1042', '0,100001,1031,1042', '��ɽ��', '340208', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1047', '1042', '0,100001,1031,1042', '�ߺ���', '340221', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1048', '1042', '0,100001,1031,1042', '������', '340222', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1049', '1042', '0,100001,1031,1042', '������', '340223', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('105', '103', '0,100001,35,103', '������', '130503', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1050', '1042', '0,100001,1031,1042', '��Ϊ��', '340225', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1051', '1031', '0,100001,1031', '������', '340300', '0552', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1052', '1051', '0,100001,1031,1051', '���Ӻ���', '340302', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1053', '1051', '0,100001,1031,1051', '��ɽ��', '340303', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1054', '1051', '0,100001,1031,1051', '�����', '340304', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1055', '1051', '0,100001,1031,1051', '������', '340311', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1056', '1051', '0,100001,1031,1051', '��Զ��', '340321', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1057', '1051', '0,100001,1031,1051', '�����', '340322', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1058', '1051', '0,100001,1031,1051', '������', '340323', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1059', '1031', '0,100001,1031', '������', '340400', '0554', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('106', '103', '0,100001,35,103', '��̨��', '130521', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1060', '1059', '0,100001,1031,1059', '��ͨ��', '340402', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1061', '1059', '0,100001,1031,1059', '�������', '340403', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1062', '1059', '0,100001,1031,1059', 'л�Ҽ���', '340404', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1063', '1059', '0,100001,1031,1059', '�˹�ɽ��', '340405', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1064', '1059', '0,100001,1031,1059', '�˼���', '340406', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1065', '1059', '0,100001,1031,1059', '��̨��', '340421', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1066', '1031', '0,100001,1031', '��ɽ��', '340500', '0555', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1067', '1066', '0,100001,1031,1066', '��ɽ��', '340503', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1068', '1066', '0,100001,1031,1066', '��ɽ��', '340504', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1069', '1066', '0,100001,1031,1066', '��Ϳ��', '340521', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('107', '103', '0,100001,35,103', '�ٳ���', '130522', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1070', '1066', '0,100001,1031,1066', '��ɽ��', '340522', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1071', '1066', '0,100001,1031,1066', '����', '340523', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1072', '1066', '0,100001,1031,1066', '������', '340596', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1073', '1031', '0,100001,1031', '������', '340600', '0561', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1074', '1073', '0,100001,1031,1073', '�ż���', '340602', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1075', '1073', '0,100001,1031,1073', '��ɽ��', '340603', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1076', '1073', '0,100001,1031,1073', '��ɽ��', '340604', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1077', '1073', '0,100001,1031,1073', '�Ϫ��', '340621', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1078', '1031', '0,100001,1031', 'ͭ����', '340700', '0562', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1079', '1078', '0,100001,1031,1078', 'ͭ��ɽ��', '340702', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('108', '103', '0,100001,35,103', '������', '130523', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1080', '1078', '0,100001,1031,1078', 'ʨ��ɽ��', '340703', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1081', '1078', '0,100001,1031,1078', '����', '340711', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1082', '1078', '0,100001,1031,1078', 'ͭ����', '340721', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1083', '1031', '0,100001,1031', '������', '340800', '0556', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1084', '1083', '0,100001,1031,1083', 'ӭ����', '340802', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1085', '1083', '0,100001,1031,1083', '�����', '340803', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1086', '1083', '0,100001,1031,1083', '������', '340811', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1087', '1083', '0,100001,1031,1083', '������', '340822', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1088', '1083', '0,100001,1031,1083', '������', '340823', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1089', '1083', '0,100001,1031,1083', 'Ǳɽ��', '340824', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('109', '103', '0,100001,35,103', '������', '130524', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1090', '1083', '0,100001,1031,1083', '̫����', '340825', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1091', '1083', '0,100001,1031,1083', '������', '340826', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1092', '1083', '0,100001,1031,1083', '������', '340827', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1093', '1083', '0,100001,1031,1083', '������', '340828', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1094', '1083', '0,100001,1031,1083', 'ͩ����', '340881', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1095', '1031', '0,100001,1031', '��ɽ��', '341000', '0559', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1096', '1095', '0,100001,1031,1095', '��Ϫ��', '341002', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1097', '1095', '0,100001,1031,1095', '��ɽ��', '341003', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1098', '1095', '0,100001,1031,1095', '������', '341004', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1099', '1095', '0,100001,1031,1095', '���', '341021', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('11', '1', '0,100001,1', '˳����', '110113', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('110', '103', '0,100001,35,103', '¡Ң��', '130525', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1100', '1095', '0,100001,1031,1095', '������', '341022', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1101', '1095', '0,100001,1031,1095', '����', '341023', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1102', '1095', '0,100001,1031,1095', '������', '341024', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1103', '1031', '0,100001,1031', '������', '341100', '0550', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1104', '1103', '0,100001,1031,1103', '������', '341102', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1105', '1103', '0,100001,1031,1103', '������', '341103', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1106', '1103', '0,100001,1031,1103', '������', '341122', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1107', '1103', '0,100001,1031,1103', 'ȫ����', '341124', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1108', '1103', '0,100001,1031,1103', '��Զ��', '341125', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1109', '1103', '0,100001,1031,1103', '������', '341126', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('111', '103', '0,100001,35,103', '����', '130526', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1110', '1103', '0,100001,1031,1103', '�쳤��', '341181', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1111', '1103', '0,100001,1031,1103', '������', '341182', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1112', '1031', '0,100001,1031', '������', '341200', '0558', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1113', '1112', '0,100001,1031,1112', '�����', '341202', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1114', '1112', '0,100001,1031,1112', '򣶫��', '341203', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1115', '1112', '0,100001,1031,1112', '�Ȫ��', '341204', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1116', '1112', '0,100001,1031,1112', '��Ȫ��', '341221', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1117', '1112', '0,100001,1031,1112', '̫����', '341222', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1118', '1112', '0,100001,1031,1112', '������', '341225', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1119', '1112', '0,100001,1031,1112', '�����', '341226', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('112', '103', '0,100001,35,103', '�Ϻ���', '130527', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1120', '1112', '0,100001,1031,1112', '������', '341282', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1121', '1031', '0,100001,1031', '������', '341300', '0557', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1122', '1121', '0,100001,1031,1121', '������', '341302', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1123', '1121', '0,100001,1031,1121', '�ɽ��', '341321', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1124', '1121', '0,100001,1031,1121', '����', '341322', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1125', '1121', '0,100001,1031,1121', '�����', '341323', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1126', '1121', '0,100001,1031,1121', '����', '341324', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1127', '1031', '0,100001,1031', '������', '341500', '0564', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1128', '1127', '0,100001,1031,1127', '����', '341502', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1129', '1127', '0,100001,1031,1127', 'ԣ����', '341503', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('113', '103', '0,100001,35,103', '������', '130528', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1130', '1127', '0,100001,1031,1127', '����', '341521', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1131', '1127', '0,100001,1031,1127', '������', '341522', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1132', '1127', '0,100001,1031,1127', '�����', '341523', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1133', '1127', '0,100001,1031,1127', '��կ��', '341524', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1134', '1127', '0,100001,1031,1127', '��ɽ��', '341525', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1135', '1031', '0,100001,1031', '������', '341600', '0558', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1136', '1135', '0,100001,1031,1135', '�۳���', '341602', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1137', '1135', '0,100001,1031,1135', '������', '341621', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1138', '1135', '0,100001,1031,1135', '�ɳ���', '341622', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1139', '1135', '0,100001,1031,1135', '������', '341623', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('114', '103', '0,100001,35,103', '��¹��', '130529', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1140', '1031', '0,100001,1031', '������', '341700', '0566', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1141', '1140', '0,100001,1031,1140', '�����', '341702', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1142', '1140', '0,100001,1031,1140', '������', '341721', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1143', '1140', '0,100001,1031,1140', 'ʯ̨��', '341722', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1144', '1140', '0,100001,1031,1140', '������', '341723', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1145', '1031', '0,100001,1031', '������', '341800', '0563', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1146', '1145', '0,100001,1031,1145', '������', '341802', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1147', '1145', '0,100001,1031,1145', '��Ϫ��', '341821', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1148', '1145', '0,100001,1031,1145', '�����', '341822', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1149', '1145', '0,100001,1031,1145', '����', '341823', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('115', '103', '0,100001,35,103', '�º���', '130530', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1150', '1145', '0,100001,1031,1145', '��Ϫ��', '341824', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1151', '1145', '0,100001,1031,1145', '캵���', '341825', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1152', '1145', '0,100001,1031,1145', '������', '341881', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1153', '100001', '0,100001', '����ʡ', '350000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1154', '1153', '0,100001,1153', '������', '350100', '0591', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1155', '1154', '0,100001,1153,1154', '��¥��', '350102', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1156', '1154', '0,100001,1153,1154', '̨����', '350103', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1157', '1154', '0,100001,1153,1154', '��ɽ��', '350104', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1158', '1154', '0,100001,1153,1154', '��β��', '350105', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1159', '1154', '0,100001,1153,1154', '������', '350111', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('116', '103', '0,100001,35,103', '������', '130531', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1160', '1154', '0,100001,1153,1154', '������', '350121', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1161', '1154', '0,100001,1153,1154', '������', '350122', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1162', '1154', '0,100001,1153,1154', '��Դ��', '350123', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1163', '1154', '0,100001,1153,1154', '������', '350124', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1164', '1154', '0,100001,1153,1154', '��̩��', '350125', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1165', '1154', '0,100001,1153,1154', 'ƽ̶��', '350128', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1166', '1154', '0,100001,1153,1154', '������', '350181', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1167', '1154', '0,100001,1153,1154', '������', '350182', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1168', '1153', '0,100001,1153', '������', '350200', '0592', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1169', '1168', '0,100001,1153,1168', '˼����', '350203', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('117', '103', '0,100001,35,103', 'ƽ����', '130532', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1170', '1168', '0,100001,1153,1168', '������', '350205', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1171', '1168', '0,100001,1153,1168', '������', '350206', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1172', '1168', '0,100001,1153,1168', '������', '350211', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1173', '1168', '0,100001,1153,1168', 'ͬ����', '350212', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1174', '1168', '0,100001,1153,1168', '�谲��', '350213', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1175', '1153', '0,100001,1153', '������', '350300', '0594', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1176', '1175', '0,100001,1153,1175', '������', '350302', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1177', '1175', '0,100001,1153,1175', '������', '350303', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1178', '1175', '0,100001,1153,1175', '�����', '350304', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1179', '1175', '0,100001,1153,1175', '������', '350305', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('118', '103', '0,100001,35,103', '����', '130533', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1180', '1175', '0,100001,1153,1175', '������', '350322', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1181', '1153', '0,100001,1153', '������', '350400', '0598', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1182', '1181', '0,100001,1153,1181', '÷����', '350402', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1183', '1181', '0,100001,1153,1181', '��Ԫ��', '350403', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1184', '1181', '0,100001,1153,1181', '��Ϫ��', '350421', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1185', '1181', '0,100001,1153,1181', '������', '350423', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1186', '1181', '0,100001,1153,1181', '������', '350424', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1187', '1181', '0,100001,1153,1181', '������', '350425', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1188', '1181', '0,100001,1153,1181', '��Ϫ��', '350426', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1189', '1181', '0,100001,1153,1181', 'ɳ��', '350427', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('119', '103', '0,100001,35,103', '�����', '130534', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1190', '1181', '0,100001,1153,1181', '������', '350428', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1191', '1181', '0,100001,1153,1181', '̩����', '350429', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1192', '1181', '0,100001,1153,1181', '������', '350430', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1193', '1181', '0,100001,1153,1181', '������', '350481', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1194', '1153', '0,100001,1153', 'Ȫ����', '350500', '0595', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1195', '1194', '0,100001,1153,1194', '�����', '350502', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1196', '1194', '0,100001,1153,1194', '������', '350503', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1197', '1194', '0,100001,1153,1194', '�彭��', '350504', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1198', '1194', '0,100001,1153,1194', 'Ȫ����', '350505', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1199', '1194', '0,100001,1153,1194', '�ݰ���', '350521', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('12', '1', '0,100001,1', '��ƽ��', '110114', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('120', '103', '0,100001,35,103', '������', '130535', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1200', '1194', '0,100001,1153,1194', '��Ϫ��', '350524', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1201', '1194', '0,100001,1153,1194', '������', '350525', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1202', '1194', '0,100001,1153,1194', '�»���', '350526', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1203', '1194', '0,100001,1153,1194', '������', '350527', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1204', '1194', '0,100001,1153,1194', 'ʯʨ��', '350581', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1205', '1194', '0,100001,1153,1194', '������', '350582', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1206', '1194', '0,100001,1153,1194', '�ϰ���', '350583', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1207', '1153', '0,100001,1153', '������', '350600', '0596', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1208', '1207', '0,100001,1153,1207', 'ܼ����', '350602', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1209', '1207', '0,100001,1153,1207', '������', '350603', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('121', '103', '0,100001,35,103', '�Ϲ���', '130581', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1210', '1207', '0,100001,1153,1207', '������', '350622', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1211', '1207', '0,100001,1153,1207', '������', '350623', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1212', '1207', '0,100001,1153,1207', 'گ����', '350624', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1213', '1207', '0,100001,1153,1207', '��̩��', '350625', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1214', '1207', '0,100001,1153,1207', '��ɽ��', '350626', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1215', '1207', '0,100001,1153,1207', '�Ͼ���', '350627', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1216', '1207', '0,100001,1153,1207', 'ƽ����', '350628', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1217', '1207', '0,100001,1153,1207', '������', '350629', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1218', '1207', '0,100001,1153,1207', '������', '350681', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1219', '1153', '0,100001,1153', '��ƽ��', '350700', '0599', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('122', '103', '0,100001,35,103', 'ɳ����', '130582', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1220', '1219', '0,100001,1153,1219', '��ƽ��', '350702', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1221', '1219', '0,100001,1153,1219', '˳����', '350721', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1222', '1219', '0,100001,1153,1219', '�ֳ���', '350722', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1223', '1219', '0,100001,1153,1219', '������', '350723', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1224', '1219', '0,100001,1153,1219', '��Ϫ��', '350724', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1225', '1219', '0,100001,1153,1219', '������', '350725', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1226', '1219', '0,100001,1153,1219', '������', '350781', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1227', '1219', '0,100001,1153,1219', '����ɽ��', '350782', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1228', '1219', '0,100001,1153,1219', '�����', '350783', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1229', '1219', '0,100001,1153,1219', '������', '350784', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('123', '35', '0,100001,35', '������', '130600', '0312', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1230', '1153', '0,100001,1153', '������', '350800', '0597', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1231', '1230', '0,100001,1153,1230', '������', '350802', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1232', '1230', '0,100001,1153,1230', '��͡��', '350821', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1233', '1230', '0,100001,1153,1230', '������', '350822', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1234', '1230', '0,100001,1153,1230', '�Ϻ���', '350823', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1235', '1230', '0,100001,1153,1230', '��ƽ��', '350824', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1236', '1230', '0,100001,1153,1230', '������', '350825', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1237', '1230', '0,100001,1153,1230', '��ƽ��', '350881', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1238', '1153', '0,100001,1153', '������', '350900', '0593', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1239', '1238', '0,100001,1153,1238', '������', '350902', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('124', '123', '0,100001,35,123', '������', '130602', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1240', '1238', '0,100001,1153,1238', 'ϼ����', '350921', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1241', '1238', '0,100001,1153,1238', '������', '350922', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1242', '1238', '0,100001,1153,1238', '������', '350923', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1243', '1238', '0,100001,1153,1238', '������', '350924', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1244', '1238', '0,100001,1153,1238', '������', '350925', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1245', '1238', '0,100001,1153,1238', '������', '350926', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1246', '1238', '0,100001,1153,1238', '������', '350981', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1247', '1238', '0,100001,1153,1238', '������', '350982', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1248', '100001', '0,100001', '����ʡ', '360000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1249', '1248', '0,100001,1248', '�ϲ���', '360100', '0791', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('125', '123', '0,100001,35,123', '������', '130603', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1250', '1249', '0,100001,1248,1249', '������', '360102', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1251', '1249', '0,100001,1248,1249', '������', '360103', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1252', '1249', '0,100001,1248,1249', '��������', '360104', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1253', '1249', '0,100001,1248,1249', '������', '360105', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1254', '1249', '0,100001,1248,1249', '��ɽ����', '360111', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1255', '1249', '0,100001,1248,1249', '�ϲ���', '360121', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1256', '1249', '0,100001,1248,1249', '�½���', '360122', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1257', '1249', '0,100001,1248,1249', '������', '360123', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1258', '1249', '0,100001,1248,1249', '������', '360124', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1259', '1248', '0,100001,1248', '��������', '360200', '0798', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('126', '123', '0,100001,35,123', '������', '130604', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1260', '1259', '0,100001,1248,1259', '������', '360202', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1261', '1259', '0,100001,1248,1259', '��ɽ��', '360203', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1262', '1259', '0,100001,1248,1259', '������', '360222', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1263', '1259', '0,100001,1248,1259', '��ƽ��', '360281', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1264', '1248', '0,100001,1248', 'Ƽ����', '360300', '0799', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1265', '1264', '0,100001,1248,1264', '��Դ��', '360302', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1266', '1264', '0,100001,1248,1264', '�涫��', '360313', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1267', '1264', '0,100001,1248,1264', '������', '360321', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1268', '1264', '0,100001,1248,1264', '������', '360322', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1269', '1264', '0,100001,1248,1264', '«Ϫ��', '360323', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('127', '123', '0,100001,35,123', '������', '130621', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1270', '1248', '0,100001,1248', '�Ž���', '360400', '0792', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1271', '1270', '0,100001,1248,1270', '®ɽ��', '360402', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1272', '1270', '0,100001,1248,1270', '�����', '360403', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1273', '1270', '0,100001,1248,1270', '�Ž���', '360421', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1274', '1270', '0,100001,1248,1270', '������', '360423', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1275', '1270', '0,100001,1248,1270', '��ˮ��', '360424', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1276', '1270', '0,100001,1248,1270', '������', '360425', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1277', '1270', '0,100001,1248,1270', '�°���', '360426', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1278', '1270', '0,100001,1248,1270', '������', '360427', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1279', '1270', '0,100001,1248,1270', '������', '360428', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('128', '123', '0,100001,35,123', '��Է��', '130622', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1280', '1270', '0,100001,1248,1270', '������', '360429', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1281', '1270', '0,100001,1248,1270', '������', '360430', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1282', '1270', '0,100001,1248,1270', '�����', '360481', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1283', '1270', '0,100001,1248,1270', '�������', '360482', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1284', '1248', '0,100001,1248', '������', '360500', '0790', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1285', '1284', '0,100001,1248,1284', '��ˮ��', '360502', '0790', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1286', '1284', '0,100001,1248,1284', '������', '360521', '0790', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1287', '1248', '0,100001,1248', 'ӥ̶��', '360600', '0701', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1288', '1287', '0,100001,1248,1287', '�º���', '360602', '0701', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1289', '1287', '0,100001,1248,1287', '�཭��', '360622', '0701', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('129', '123', '0,100001,35,123', '�ˮ��', '130623', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1290', '1287', '0,100001,1248,1287', '��Ϫ��', '360681', '0701', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1291', '1248', '0,100001,1248', '������', '360700', '0797', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1292', '1291', '0,100001,1248,1291', '�¹���', '360702', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1293', '1291', '0,100001,1248,1291', '����', '360721', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1294', '1291', '0,100001,1248,1291', '�ŷ���', '360722', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1295', '1291', '0,100001,1248,1291', '������', '360723', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1296', '1291', '0,100001,1248,1291', '������', '360724', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1297', '1291', '0,100001,1248,1291', '������', '360725', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1298', '1291', '0,100001,1248,1291', '��Զ��', '360726', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1299', '1291', '0,100001,1248,1291', '������', '360727', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('13', '1', '0,100001,1', '������', '110115', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('130', '123', '0,100001,35,123', '��ƽ��', '130624', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1300', '1291', '0,100001,1248,1291', '������', '360728', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1301', '1291', '0,100001,1248,1291', 'ȫ����', '360729', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1302', '1291', '0,100001,1248,1291', '������', '360730', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1303', '1291', '0,100001,1248,1291', '�ڶ���', '360731', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1304', '1291', '0,100001,1248,1291', '�˹���', '360732', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1305', '1291', '0,100001,1248,1291', '�����', '360733', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1306', '1291', '0,100001,1248,1291', 'Ѱ����', '360734', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1307', '1291', '0,100001,1248,1291', 'ʯ����', '360735', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1308', '1291', '0,100001,1248,1291', '�����', '360781', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1309', '1291', '0,100001,1248,1291', '�Ͽ���', '360782', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('131', '123', '0,100001,35,123', '��ˮ��', '130625', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1310', '1248', '0,100001,1248', '������', '360800', '0796', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1311', '1310', '0,100001,1248,1310', '������', '360802', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1312', '1310', '0,100001,1248,1310', '��ԭ��', '360803', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1313', '1310', '0,100001,1248,1310', '������', '360821', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1314', '1310', '0,100001,1248,1310', '��ˮ��', '360822', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1315', '1310', '0,100001,1248,1310', 'Ͽ����', '360823', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1316', '1310', '0,100001,1248,1310', '�¸���', '360824', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1317', '1310', '0,100001,1248,1310', '������', '360825', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1318', '1310', '0,100001,1248,1310', '̩����', '360826', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1319', '1310', '0,100001,1248,1310', '�촨��', '360827', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('132', '123', '0,100001,35,123', '������', '130626', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1320', '1310', '0,100001,1248,1310', '����', '360828', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1321', '1310', '0,100001,1248,1310', '������', '360829', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1322', '1310', '0,100001,1248,1310', '������', '360830', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1323', '1310', '0,100001,1248,1310', '����ɽ��', '360881', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1324', '1248', '0,100001,1248', '�˴���', '360900', '0795', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1325', '1324', '0,100001,1248,1324', 'Ԭ����', '360902', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1326', '1324', '0,100001,1248,1324', '������', '360921', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1327', '1324', '0,100001,1248,1324', '������', '360922', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1328', '1324', '0,100001,1248,1324', '�ϸ���', '360923', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1329', '1324', '0,100001,1248,1324', '�˷���', '360924', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('133', '123', '0,100001,35,123', '����', '130627', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1330', '1324', '0,100001,1248,1324', '������', '360925', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1331', '1324', '0,100001,1248,1324', 'ͭ����', '360926', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1332', '1324', '0,100001,1248,1324', '�����', '360981', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1333', '1324', '0,100001,1248,1324', '������', '360982', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1334', '1324', '0,100001,1248,1324', '�߰���', '360983', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1335', '1248', '0,100001,1248', '������', '361000', '0794', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1336', '1335', '0,100001,1248,1335', '�ٴ���', '361002', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1337', '1335', '0,100001,1248,1335', '�ϳ���', '361021', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1338', '1335', '0,100001,1248,1335', '�质��', '361022', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1339', '1335', '0,100001,1248,1335', '�Ϸ���', '361023', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('134', '123', '0,100001,35,123', '������', '130628', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1340', '1335', '0,100001,1248,1335', '������', '361024', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1341', '1335', '0,100001,1248,1335', '�ְ���', '361025', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1342', '1335', '0,100001,1248,1335', '�˻���', '361026', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1343', '1335', '0,100001,1248,1335', '��Ϫ��', '361027', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1344', '1335', '0,100001,1248,1335', '��Ϫ��', '361028', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1345', '1335', '0,100001,1248,1335', '������', '361029', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1346', '1335', '0,100001,1248,1335', '�����', '361030', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1347', '1248', '0,100001,1248', '������', '361100', '0793', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1348', '1347', '0,100001,1248,1347', '������', '361102', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1349', '1347', '0,100001,1248,1347', '������', '361121', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('135', '123', '0,100001,35,123', '�ݳ���', '130629', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1350', '1347', '0,100001,1248,1347', '�����', '361122', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1351', '1347', '0,100001,1248,1347', '��ɽ��', '361123', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1352', '1347', '0,100001,1248,1347', 'Ǧɽ��', '361124', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1353', '1347', '0,100001,1248,1347', '�����', '361125', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1354', '1347', '0,100001,1248,1347', '߮����', '361126', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1355', '1347', '0,100001,1248,1347', '�����', '361127', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1356', '1347', '0,100001,1248,1347', '۶����', '361128', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1357', '1347', '0,100001,1248,1347', '������', '361129', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1358', '1347', '0,100001,1248,1347', '��Դ��', '361130', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1359', '1347', '0,100001,1248,1347', '������', '361181', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('136', '123', '0,100001,35,123', '�Դ��', '130630', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1360', '100001', '0,100001', 'ɽ��ʡ', '370000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1361', '1360', '0,100001,1360', '������', '370100', '0531', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1362', '1361', '0,100001,1360,1361', '������', '370102', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1363', '1361', '0,100001,1360,1361', '������', '370103', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1364', '1361', '0,100001,1360,1361', '������', '370104', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1365', '1361', '0,100001,1360,1361', '������', '370105', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1366', '1361', '0,100001,1360,1361', '������', '370112', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1367', '1361', '0,100001,1360,1361', '������', '370113', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1368', '1361', '0,100001,1360,1361', 'ƽ����', '370124', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1369', '1361', '0,100001,1360,1361', '������', '370125', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('137', '123', '0,100001,35,123', '������', '130631', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1370', '1361', '0,100001,1360,1361', '�̺���', '370126', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1371', '1361', '0,100001,1360,1361', '������', '370181', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1372', '1360', '0,100001,1360', '�ൺ��', '370200', '0532', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1373', '1372', '0,100001,1360,1372', '������', '370202', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1374', '1372', '0,100001,1360,1372', '�б���', '370203', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1375', '1372', '0,100001,1360,1372', '�ķ���', '370205', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1376', '1372', '0,100001,1360,1372', '�Ƶ���', '370211', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1377', '1372', '0,100001,1360,1372', '��ɽ��', '370212', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1378', '1372', '0,100001,1360,1372', '�����', '370213', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1379', '1372', '0,100001,1360,1372', '������', '370214', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('138', '123', '0,100001,35,123', '������', '130632', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1380', '1372', '0,100001,1360,1372', '������', '370281', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1381', '1372', '0,100001,1360,1372', '��ī��', '370282', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1382', '1372', '0,100001,1360,1372', 'ƽ����', '370283', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1383', '1372', '0,100001,1360,1372', '������', '370284', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1384', '1372', '0,100001,1360,1372', '������', '370285', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1385', '1360', '0,100001,1360', '�Ͳ���', '370300', '0533', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1386', '1385', '0,100001,1360,1385', '�ʹ���', '370302', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1387', '1385', '0,100001,1360,1385', '�ŵ���', '370303', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1388', '1385', '0,100001,1360,1385', '��ɽ��', '370304', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1389', '1385', '0,100001,1360,1385', '������', '370305', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('139', '123', '0,100001,35,123', '����', '130633', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1390', '1385', '0,100001,1360,1385', '�ܴ���', '370306', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1391', '1385', '0,100001,1360,1385', '��̨��', '370321', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1392', '1385', '0,100001,1360,1385', '������', '370322', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1393', '1385', '0,100001,1360,1385', '��Դ��', '370323', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1394', '1360', '0,100001,1360', '��ׯ��', '370400', '0632', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1395', '1394', '0,100001,1360,1394', '������', '370402', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1396', '1394', '0,100001,1360,1394', 'Ѧ����', '370403', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1397', '1394', '0,100001,1360,1394', 'ỳ���', '370404', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1398', '1394', '0,100001,1360,1394', '̨��ׯ��', '370405', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1399', '1394', '0,100001,1360,1394', 'ɽͤ��', '370406', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('14', '1', '0,100001,1', '������', '110116', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('140', '123', '0,100001,35,123', '������', '130634', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1400', '1394', '0,100001,1360,1394', '������', '370481', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1401', '1360', '0,100001,1360', '��Ӫ��', '370500', '0546', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1402', '1401', '0,100001,1360,1401', '��Ӫ��', '370502', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1403', '1401', '0,100001,1360,1401', '�ӿ���', '370503', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1404', '1401', '0,100001,1360,1401', '������', '370521', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1405', '1401', '0,100001,1360,1401', '������', '370522', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1406', '1401', '0,100001,1360,1401', '������', '370523', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1407', '1360', '0,100001,1360', '��̨��', '370600', '0535', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1408', '1407', '0,100001,1360,1407', '֥���', '370602', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1409', '1407', '0,100001,1360,1407', '��ɽ��', '370611', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('141', '123', '0,100001,35,123', '���', '130635', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1410', '1407', '0,100001,1360,1407', 'Ĳƽ��', '370612', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1411', '1407', '0,100001,1360,1407', '��ɽ��', '370613', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1412', '1407', '0,100001,1360,1407', '������', '370634', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1413', '1407', '0,100001,1360,1407', '������', '370681', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1414', '1407', '0,100001,1360,1407', '������', '370682', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1415', '1407', '0,100001,1360,1407', '������', '370683', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1416', '1407', '0,100001,1360,1407', '������', '370684', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1417', '1407', '0,100001,1360,1407', '��Զ��', '370685', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1418', '1407', '0,100001,1360,1407', '��ϼ��', '370686', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1419', '1407', '0,100001,1360,1407', '������', '370687', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('142', '123', '0,100001,35,123', '˳ƽ��', '130636', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1420', '1360', '0,100001,1360', 'Ϋ����', '370700', '0536', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1421', '1420', '0,100001,1360,1420', 'Ϋ����', '370702', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1422', '1420', '0,100001,1360,1420', '��ͤ��', '370703', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1423', '1420', '0,100001,1360,1420', '������', '370704', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1424', '1420', '0,100001,1360,1420', '������', '370705', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1425', '1420', '0,100001,1360,1420', '������', '370724', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1426', '1420', '0,100001,1360,1420', '������', '370725', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1427', '1420', '0,100001,1360,1420', '������', '370781', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1428', '1420', '0,100001,1360,1420', '�����', '370782', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1429', '1420', '0,100001,1360,1420', '�ٹ���', '370783', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('143', '123', '0,100001,35,123', '��Ұ��', '130637', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1430', '1420', '0,100001,1360,1420', '������', '370784', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1431', '1420', '0,100001,1360,1420', '������', '370785', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1432', '1420', '0,100001,1360,1420', '������', '370786', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1433', '1360', '0,100001,1360', '������', '370800', '0537', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1434', '1433', '0,100001,1360,1433', '������', '370802', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1435', '1433', '0,100001,1360,1433', '�γ���', '370811', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1436', '1433', '0,100001,1360,1433', '΢ɽ��', '370826', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1437', '1433', '0,100001,1360,1433', '��̨��', '370827', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1438', '1433', '0,100001,1360,1433', '������', '370828', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1439', '1433', '0,100001,1360,1433', '������', '370829', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('144', '123', '0,100001,35,123', '����', '130638', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1440', '1433', '0,100001,1360,1433', '������', '370830', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1441', '1433', '0,100001,1360,1433', '��ˮ��', '370831', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1442', '1433', '0,100001,1360,1433', '��ɽ��', '370832', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1443', '1433', '0,100001,1360,1433', '������', '370881', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1444', '1433', '0,100001,1360,1433', '������', '370882', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1445', '1433', '0,100001,1360,1433', '�޳���', '370883', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1446', '1360', '0,100001,1360', '̩����', '370900', '0538', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1447', '1446', '0,100001,1360,1446', '̩ɽ��', '370902', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1448', '1446', '0,100001,1360,1446', '�����', '370911', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1449', '1446', '0,100001,1360,1446', '������', '370921', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('145', '123', '0,100001,35,123', '������', '130681', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1450', '1446', '0,100001,1360,1446', '��ƽ��', '370923', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1451', '1446', '0,100001,1360,1446', '��̩��', '370982', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1452', '1446', '0,100001,1360,1446', '�ʳ���', '370983', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1453', '1360', '0,100001,1360', '������', '371000', '0631', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1454', '1453', '0,100001,1360,1453', '������', '371002', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1455', '1453', '0,100001,1360,1453', '�ĵ���', '371081', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1456', '1453', '0,100001,1360,1453', '�ٳ���', '371082', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1457', '1453', '0,100001,1360,1453', '��ɽ��', '371083', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1458', '1360', '0,100001,1360', '������', '371100', '0633', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1459', '1458', '0,100001,1360,1458', '������', '371102', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('146', '123', '0,100001,35,123', '������', '130682', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1460', '1458', '0,100001,1360,1458', '�ɽ��', '371103', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1461', '1458', '0,100001,1360,1458', '������', '371121', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1462', '1458', '0,100001,1360,1458', '����', '371122', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1463', '1360', '0,100001,1360', '������', '371200', '0634', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1464', '1463', '0,100001,1360,1463', '������', '371202', '0634', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1465', '1463', '0,100001,1360,1463', '�ֳ���', '371203', '0634', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1466', '1360', '0,100001,1360', '������', '371300', '0539', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1467', '1466', '0,100001,1360,1466', '��ɽ��', '371302', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1468', '1466', '0,100001,1360,1466', '��ׯ��', '371311', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1469', '1466', '0,100001,1360,1466', '�Ӷ���', '371312', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('147', '123', '0,100001,35,123', '������', '130683', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1470', '1466', '0,100001,1360,1466', '������', '371321', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1471', '1466', '0,100001,1360,1466', '۰����', '371322', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1472', '1466', '0,100001,1360,1466', '��ˮ��', '371323', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1473', '1466', '0,100001,1360,1466', '��ɽ��', '371324', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1474', '1466', '0,100001,1360,1466', '����', '371325', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1475', '1466', '0,100001,1360,1466', 'ƽ����', '371326', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1476', '1466', '0,100001,1360,1466', '������', '371327', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1477', '1466', '0,100001,1360,1466', '������', '371328', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1478', '1466', '0,100001,1360,1466', '������', '371329', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1479', '1360', '0,100001,1360', '������', '371400', '0534', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('148', '123', '0,100001,35,123', '�߱�����', '130684', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1480', '1479', '0,100001,1360,1479', '�³���', '371402', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1481', '1479', '0,100001,1360,1479', '����', '371421', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1482', '1479', '0,100001,1360,1479', '������', '371422', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1483', '1479', '0,100001,1360,1479', '������', '371423', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1484', '1479', '0,100001,1360,1479', '������', '371424', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1485', '1479', '0,100001,1360,1479', '�����', '371425', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1486', '1479', '0,100001,1360,1479', 'ƽԭ��', '371426', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1487', '1479', '0,100001,1360,1479', '�Ľ���', '371427', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1488', '1479', '0,100001,1360,1479', '�����', '371428', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1489', '1479', '0,100001,1360,1479', '������', '371481', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('149', '35', '0,100001,35', '�żҿ���', '130700', '0313', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1490', '1479', '0,100001,1360,1479', '�����', '371482', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1491', '1360', '0,100001,1360', '�ĳ���', '371500', '0635', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1492', '1491', '0,100001,1360,1491', '��������', '371502', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1493', '1491', '0,100001,1360,1491', '������', '371521', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1494', '1491', '0,100001,1360,1491', 'ݷ��', '371522', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1495', '1491', '0,100001,1360,1491', '��ƽ��', '371523', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1496', '1491', '0,100001,1360,1491', '������', '371524', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1497', '1491', '0,100001,1360,1491', '����', '371525', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1498', '1491', '0,100001,1360,1491', '������', '371526', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1499', '1491', '0,100001,1360,1491', '������', '371581', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('15', '1', '0,100001,1', 'ƽ����', '110117', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('150', '149', '0,100001,35,149', '�Ŷ���', '130702', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1500', '1360', '0,100001,1360', '������', '371600', '0543', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1501', '1500', '0,100001,1360,1500', '������', '371602', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1502', '1500', '0,100001,1360,1500', '������', '371621', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1503', '1500', '0,100001,1360,1500', '������', '371622', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1504', '1500', '0,100001,1360,1500', '�����', '371623', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1505', '1500', '0,100001,1360,1500', 'մ����', '371624', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1506', '1500', '0,100001,1360,1500', '������', '371625', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1507', '1500', '0,100001,1360,1500', '��ƽ��', '371626', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1508', '1360', '0,100001,1360', '������', '371700', '0530', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1509', '1508', '0,100001,1360,1508', 'ĵ����', '371702', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('151', '149', '0,100001,35,149', '������', '130703', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1510', '1508', '0,100001,1360,1508', '����', '371721', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1511', '1508', '0,100001,1360,1508', '����', '371722', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1512', '1508', '0,100001,1360,1508', '������', '371723', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1513', '1508', '0,100001,1360,1508', '��Ұ��', '371724', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1514', '1508', '0,100001,1360,1508', '۩����', '371725', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1515', '1508', '0,100001,1360,1508', '۲����', '371726', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1516', '1508', '0,100001,1360,1508', '������', '371727', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1517', '1508', '0,100001,1360,1508', '������', '371728', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1518', '100001', '0,100001', '����ʡ', '410000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1519', '1518', '0,100001,1518', '֣����', '410100', '0371', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('152', '149', '0,100001,35,149', '������', '130705', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1520', '1519', '0,100001,1518,1519', '��ԭ��', '410102', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1521', '1519', '0,100001,1518,1519', '������', '410103', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1522', '1519', '0,100001,1518,1519', '�ܳǻ�����', '410104', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1523', '1519', '0,100001,1518,1519', '��ˮ��', '410105', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1524', '1519', '0,100001,1518,1519', '�Ͻ���', '410106', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1525', '1519', '0,100001,1518,1519', '�ݼ���', '410108', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1526', '1519', '0,100001,1518,1519', '��Ĳ��', '410122', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1527', '1519', '0,100001,1518,1519', '������', '410181', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1528', '1519', '0,100001,1518,1519', '������', '410182', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1529', '1519', '0,100001,1518,1519', '������', '410183', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('153', '149', '0,100001,35,149', '�»�԰��', '130706', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1530', '1519', '0,100001,1518,1519', '��֣��', '410184', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1531', '1519', '0,100001,1518,1519', '�Ƿ���', '410185', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1532', '1518', '0,100001,1518', '������', '410200', '0378', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1533', '1532', '0,100001,1518,1532', '��ͤ��', '410202', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1534', '1532', '0,100001,1518,1532', '˳�ӻ�����', '410203', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1535', '1532', '0,100001,1518,1532', '��¥��', '410204', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1536', '1532', '0,100001,1518,1532', '����̨��', '410205', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1537', '1532', '0,100001,1518,1532', '������', '410211', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1538', '1532', '0,100001,1518,1532', '���', '410221', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1539', '1532', '0,100001,1518,1532', 'ͨ����', '410222', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('154', '149', '0,100001,35,149', '������', '130721', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1540', '1532', '0,100001,1518,1532', 'ξ����', '410223', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1541', '1532', '0,100001,1518,1532', '������', '410224', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1542', '1532', '0,100001,1518,1532', '������', '410225', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1543', '1518', '0,100001,1518', '������', '410300', '0379', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1544', '1543', '0,100001,1518,1543', '�ϳ���', '410302', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1545', '1543', '0,100001,1518,1543', '������', '410303', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1546', '1543', '0,100001,1518,1543', '�e�ӻ�����', '410304', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1547', '1543', '0,100001,1518,1543', '������', '410305', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1548', '1543', '0,100001,1518,1543', '������', '410306', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1549', '1543', '0,100001,1518,1543', '������', '410311', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('155', '149', '0,100001,35,149', '�ű���', '130722', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1550', '1543', '0,100001,1518,1543', '�Ͻ���', '410322', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1551', '1543', '0,100001,1518,1543', '�°���', '410323', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1552', '1543', '0,100001,1518,1543', '�ﴨ��', '410324', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1553', '1543', '0,100001,1518,1543', '����', '410325', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1554', '1543', '0,100001,1518,1543', '������', '410326', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1555', '1543', '0,100001,1518,1543', '������', '410327', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1556', '1543', '0,100001,1518,1543', '������', '410328', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1557', '1543', '0,100001,1518,1543', '������', '410329', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1558', '1543', '0,100001,1518,1543', '��ʦ��', '410381', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1559', '1518', '0,100001,1518', 'ƽ��ɽ��', '410400', '0375', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('156', '149', '0,100001,35,149', '������', '130723', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1560', '1559', '0,100001,1518,1559', '�»���', '410402', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1561', '1559', '0,100001,1518,1559', '������', '410403', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1562', '1559', '0,100001,1518,1559', 'ʯ����', '410404', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1563', '1559', '0,100001,1518,1559', 'տ����', '410411', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1564', '1559', '0,100001,1518,1559', '������', '410421', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1565', '1559', '0,100001,1518,1559', 'Ҷ��', '410422', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1566', '1559', '0,100001,1518,1559', '³ɽ��', '410423', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1567', '1559', '0,100001,1518,1559', 'ۣ��', '410425', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1568', '1559', '0,100001,1518,1559', '�����', '410481', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1569', '1559', '0,100001,1518,1559', '������', '410482', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('157', '149', '0,100001,35,149', '��Դ��', '130724', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1570', '1518', '0,100001,1518', '������', '410500', '0372', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1571', '1570', '0,100001,1518,1570', '�ķ���', '410502', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1572', '1570', '0,100001,1518,1570', '������', '410503', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1573', '1570', '0,100001,1518,1570', '����', '410505', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1574', '1570', '0,100001,1518,1570', '������', '410506', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1575', '1570', '0,100001,1518,1570', '������', '410522', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1576', '1570', '0,100001,1518,1570', '������', '410523', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1577', '1570', '0,100001,1518,1570', '����', '410526', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1578', '1570', '0,100001,1518,1570', '�ڻ���', '410527', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1579', '1570', '0,100001,1518,1570', '������', '410581', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('158', '149', '0,100001,35,149', '������', '130725', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1580', '1518', '0,100001,1518', '�ױ���', '410600', '0392', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1581', '1580', '0,100001,1518,1580', '��ɽ��', '410602', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1582', '1580', '0,100001,1518,1580', 'ɽ����', '410603', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1583', '1580', '0,100001,1518,1580', '俱���', '410611', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1584', '1580', '0,100001,1518,1580', '����', '410621', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1585', '1580', '0,100001,1518,1580', '���', '410622', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1586', '1518', '0,100001,1518', '������', '410700', '0373', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1587', '1586', '0,100001,1518,1586', '������', '410702', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1588', '1586', '0,100001,1518,1586', '������', '410703', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1589', '1586', '0,100001,1518,1586', '��Ȫ��', '410704', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('159', '149', '0,100001,35,149', 'ε��', '130726', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1590', '1586', '0,100001,1518,1586', '��Ұ��', '410711', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1591', '1586', '0,100001,1518,1586', '������', '410721', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1592', '1586', '0,100001,1518,1586', '�����', '410724', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1593', '1586', '0,100001,1518,1586', 'ԭ����', '410725', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1594', '1586', '0,100001,1518,1586', '�ӽ���', '410726', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1595', '1586', '0,100001,1518,1586', '������', '410727', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1596', '1586', '0,100001,1518,1586', '��ԫ��', '410728', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1597', '1586', '0,100001,1518,1586', '������', '410781', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1598', '1586', '0,100001,1518,1586', '������', '410782', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1599', '1518', '0,100001,1518', '������', '410800', '0391', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('16', '1', '0,100001,1', '������', '110228', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('160', '149', '0,100001,35,149', '��ԭ��', '130727', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1600', '1599', '0,100001,1518,1599', '�����', '410802', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1601', '1599', '0,100001,1518,1599', '��վ��', '410803', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1602', '1599', '0,100001,1518,1599', '�����', '410804', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1603', '1599', '0,100001,1518,1599', 'ɽ����', '410811', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1604', '1599', '0,100001,1518,1599', '������', '410821', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1605', '1599', '0,100001,1518,1599', '������', '410822', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1606', '1599', '0,100001,1518,1599', '������', '410823', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1607', '1599', '0,100001,1518,1599', '����', '410825', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1608', '1599', '0,100001,1518,1599', '������', '410882', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1609', '1599', '0,100001,1518,1599', '������', '410883', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('161', '149', '0,100001,35,149', '������', '130728', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1610', '1518', '0,100001,1518', '�����', '410900', '0393', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1611', '1610', '0,100001,1518,1610', '������', '410902', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1612', '1610', '0,100001,1518,1610', '�����', '410922', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1613', '1610', '0,100001,1518,1610', '������', '410923', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1614', '1610', '0,100001,1518,1610', '����', '410926', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1615', '1610', '0,100001,1518,1610', '̨ǰ��', '410927', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1616', '1610', '0,100001,1518,1610', '�����', '410928', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1617', '1518', '0,100001,1518', '�����', '411000', '0374', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1618', '1617', '0,100001,1518,1617', 'κ����', '411002', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1619', '1617', '0,100001,1518,1617', '�����', '411023', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('162', '149', '0,100001,35,149', '��ȫ��', '130729', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1620', '1617', '0,100001,1518,1617', '۳����', '411024', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1621', '1617', '0,100001,1518,1617', '�����', '411025', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1622', '1617', '0,100001,1518,1617', '������', '411081', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1623', '1617', '0,100001,1518,1617', '������', '411082', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1624', '1518', '0,100001,1518', '�����', '411100', '0395', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1625', '1624', '0,100001,1518,1624', 'Դ����', '411102', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1626', '1624', '0,100001,1518,1624', '۱����', '411103', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1627', '1624', '0,100001,1518,1624', '������', '411104', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1628', '1624', '0,100001,1518,1624', '������', '411121', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1629', '1624', '0,100001,1518,1624', '�����', '411122', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('163', '149', '0,100001,35,149', '������', '130730', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1630', '1518', '0,100001,1518', '����Ͽ��', '411200', '0398', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1631', '1630', '0,100001,1518,1630', '������', '411202', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1632', '1630', '0,100001,1518,1630', '�ų���', '411221', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1633', '1630', '0,100001,1518,1630', '����', '411222', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1634', '1630', '0,100001,1518,1630', '¬����', '411224', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1635', '1630', '0,100001,1518,1630', '������', '411281', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1636', '1630', '0,100001,1518,1630', '�鱦��', '411282', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1637', '1518', '0,100001,1518', '������', '411300', '0377', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1638', '1637', '0,100001,1518,1637', '�����', '411302', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1639', '1637', '0,100001,1518,1637', '������', '411303', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('164', '149', '0,100001,35,149', '��¹��', '130731', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1640', '1637', '0,100001,1518,1637', '������', '411321', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1641', '1637', '0,100001,1518,1637', '������', '411322', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1642', '1637', '0,100001,1518,1637', '��Ͽ��', '411323', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1643', '1637', '0,100001,1518,1637', '��ƽ��', '411324', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1644', '1637', '0,100001,1518,1637', '������', '411325', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1645', '1637', '0,100001,1518,1637', '������', '411326', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1646', '1637', '0,100001,1518,1637', '������', '411327', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1647', '1637', '0,100001,1518,1637', '�ƺ���', '411328', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1648', '1637', '0,100001,1518,1637', '��Ұ��', '411329', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1649', '1637', '0,100001,1518,1637', 'ͩ����', '411330', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('165', '149', '0,100001,35,149', '�����', '130732', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1650', '1637', '0,100001,1518,1637', '������', '411381', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1651', '1518', '0,100001,1518', '������', '411400', '0370', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1652', '1651', '0,100001,1518,1651', '��԰��', '411402', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1653', '1651', '0,100001,1518,1651', '�����', '411403', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1654', '1651', '0,100001,1518,1651', '��Ȩ��', '411421', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1655', '1651', '0,100001,1518,1651', '���', '411422', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1656', '1651', '0,100001,1518,1651', '������', '411423', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1657', '1651', '0,100001,1518,1651', '�ϳ���', '411424', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1658', '1651', '0,100001,1518,1651', '�ݳ���', '411425', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1659', '1651', '0,100001,1518,1651', '������', '411426', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('166', '149', '0,100001,35,149', '������', '130733', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1660', '1651', '0,100001,1518,1651', '������', '411481', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1661', '1518', '0,100001,1518', '������', '411500', '0376', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1662', '1661', '0,100001,1518,1661', '������', '411502', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1663', '1661', '0,100001,1518,1661', 'ƽ����', '411503', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1664', '1661', '0,100001,1518,1661', '��ɽ��', '411521', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1665', '1661', '0,100001,1518,1661', '��ɽ��', '411522', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1666', '1661', '0,100001,1518,1661', '����', '411523', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1667', '1661', '0,100001,1518,1661', '�̳���', '411524', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1668', '1661', '0,100001,1518,1661', '��ʼ��', '411525', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1669', '1661', '0,100001,1518,1661', '�괨��', '411526', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('167', '35', '0,100001,35', '�е���', '130800', '0314', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1670', '1661', '0,100001,1518,1661', '������', '411527', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1671', '1661', '0,100001,1518,1661', 'Ϣ��', '411528', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1672', '1518', '0,100001,1518', '�ܿ���', '411600', '0394', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1673', '1672', '0,100001,1518,1672', '������', '411602', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1674', '1672', '0,100001,1518,1672', '������', '411621', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1675', '1672', '0,100001,1518,1672', '������', '411622', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1676', '1672', '0,100001,1518,1672', '��ˮ��', '411623', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1677', '1672', '0,100001,1518,1672', '������', '411624', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1678', '1672', '0,100001,1518,1672', '������', '411625', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1679', '1672', '0,100001,1518,1672', '������', '411626', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('168', '167', '0,100001,35,167', '˫����', '130802', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1680', '1672', '0,100001,1518,1672', '̫����', '411627', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1681', '1672', '0,100001,1518,1672', '¹����', '411628', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1682', '1672', '0,100001,1518,1672', '�����', '411681', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1683', '1518', '0,100001,1518', 'פ�����', '411700', '0396', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1684', '1683', '0,100001,1518,1683', '�����', '411702', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1685', '1683', '0,100001,1518,1683', '��ƽ��', '411721', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1686', '1683', '0,100001,1518,1683', '�ϲ���', '411722', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1687', '1683', '0,100001,1518,1683', 'ƽ����', '411723', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1688', '1683', '0,100001,1518,1683', '������', '411724', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1689', '1683', '0,100001,1518,1683', 'ȷɽ��', '411725', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('169', '167', '0,100001,35,167', '˫����', '130803', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1690', '1683', '0,100001,1518,1683', '������', '411726', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1691', '1683', '0,100001,1518,1683', '������', '411727', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1692', '1683', '0,100001,1518,1683', '��ƽ��', '411728', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1693', '1683', '0,100001,1518,1683', '�²���', '411729', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1694', '1518', '0,100001,1518', 'ʡֱϽ', '419000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1695', '1694', '0,100001,1518,1694', '��Դ��', '419001', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1696', '100001', '0,100001', '����ʡ', '420000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1697', '1696', '0,100001,1696', '�人��', '420100', '027', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1698', '1697', '0,100001,1696,1697', '������', '420102', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1699', '1697', '0,100001,1696,1697', '������', '420103', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('17', '1', '0,100001,1', '������', '110229', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('170', '167', '0,100001,35,167', 'ӥ��Ӫ�ӿ���', '130804', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1700', '1697', '0,100001,1696,1697', '�~����', '420104', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1701', '1697', '0,100001,1696,1697', '������', '420105', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1702', '1697', '0,100001,1696,1697', '�����', '420106', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1703', '1697', '0,100001,1696,1697', '��ɽ��', '420107', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1704', '1697', '0,100001,1696,1697', '��ɽ��', '420111', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1705', '1697', '0,100001,1696,1697', '��������', '420112', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1706', '1697', '0,100001,1696,1697', '������', '420113', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1707', '1697', '0,100001,1696,1697', '�̵���', '420114', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1708', '1697', '0,100001,1696,1697', '������', '420115', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1709', '1697', '0,100001,1696,1697', '������', '420116', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('171', '167', '0,100001,35,167', '�е���', '130821', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1710', '1697', '0,100001,1696,1697', '������', '420117', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1711', '1696', '0,100001,1696', '��ʯ��', '420200', '0714', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1712', '1711', '0,100001,1696,1711', '��ʯ����', '420202', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1713', '1711', '0,100001,1696,1711', '����ɽ��', '420203', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1714', '1711', '0,100001,1696,1711', '��½��', '420204', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1715', '1711', '0,100001,1696,1711', '��ɽ��', '420205', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1716', '1711', '0,100001,1696,1711', '������', '420222', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1717', '1711', '0,100001,1696,1711', '��ұ��', '420281', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1718', '1696', '0,100001,1696', 'ʮ����', '420300', '0719', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1719', '1718', '0,100001,1696,1718', 'é����', '420302', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('172', '167', '0,100001,35,167', '��¡��', '130822', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1720', '1718', '0,100001,1696,1718', '������', '420303', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1721', '1718', '0,100001,1696,1718', '����', '420321', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1722', '1718', '0,100001,1696,1718', '������', '420322', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1723', '1718', '0,100001,1696,1718', '��ɽ��', '420323', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1724', '1718', '0,100001,1696,1718', '��Ϫ��', '420324', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1725', '1718', '0,100001,1696,1718', '����', '420325', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1726', '1718', '0,100001,1696,1718', '��������', '420381', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1727', '1696', '0,100001,1696', '�˲���', '420500', '0717', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1728', '1727', '0,100001,1696,1727', '������', '420502', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1729', '1727', '0,100001,1696,1727', '��Ҹ���', '420503', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('173', '167', '0,100001,35,167', 'ƽȪ��', '130823', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1730', '1727', '0,100001,1696,1727', '�����', '420504', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1731', '1727', '0,100001,1696,1727', '�Vͤ��', '420505', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1732', '1727', '0,100001,1696,1727', '������', '420506', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1733', '1727', '0,100001,1696,1727', 'Զ����', '420525', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1734', '1727', '0,100001,1696,1727', '��ɽ��', '420526', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1735', '1727', '0,100001,1696,1727', '������', '420527', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1736', '1727', '0,100001,1696,1727', '����������������', '420528', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1737', '1727', '0,100001,1696,1727', '���������������', '420529', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1738', '1727', '0,100001,1696,1727', '�˶���', '420581', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1739', '1727', '0,100001,1696,1727', '������', '420582', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('174', '167', '0,100001,35,167', '��ƽ��', '130824', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1740', '1727', '0,100001,1696,1727', '֦����', '420583', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1741', '1696', '0,100001,1696', '������', '420600', '0710', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1742', '1741', '0,100001,1696,1741', '�����', '420602', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1743', '1741', '0,100001,1696,1741', '������', '420606', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1744', '1741', '0,100001,1696,1741', '������', '420607', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1745', '1741', '0,100001,1696,1741', '������', '420624', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1746', '1741', '0,100001,1696,1741', '�ȳ���', '420625', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1747', '1741', '0,100001,1696,1741', '������', '420626', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1748', '1741', '0,100001,1696,1741', '�Ϻӿ���', '420682', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1749', '1741', '0,100001,1696,1741', '������', '420683', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('175', '167', '0,100001,35,167', '¡����', '130825', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1750', '1741', '0,100001,1696,1741', '�˳���', '420684', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1751', '1696', '0,100001,1696', '������', '420700', '0711', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1752', '1751', '0,100001,1696,1751', '���Ӻ���', '420702', '0711', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1753', '1751', '0,100001,1696,1751', '������', '420703', '0711', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1754', '1751', '0,100001,1696,1751', '������', '420704', '0711', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1755', '1696', '0,100001,1696', '������', '420800', '0724', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1756', '1755', '0,100001,1696,1755', '������', '420802', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1757', '1755', '0,100001,1696,1755', '�޵���', '420804', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1758', '1755', '0,100001,1696,1755', '��ɽ��', '420821', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1759', '1755', '0,100001,1696,1755', 'ɳ����', '420822', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('176', '167', '0,100001,35,167', '��������������', '130826', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1760', '1755', '0,100001,1696,1755', '������', '420881', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1761', '1696', '0,100001,1696', 'Т����', '420900', '0712', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1762', '1761', '0,100001,1696,1761', 'Т����', '420902', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1763', '1761', '0,100001,1696,1761', 'Т����', '420921', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1764', '1761', '0,100001,1696,1761', '������', '420922', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1765', '1761', '0,100001,1696,1761', '������', '420923', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1766', '1761', '0,100001,1696,1761', 'Ӧ����', '420981', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1767', '1761', '0,100001,1696,1761', '��½��', '420982', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1768', '1761', '0,100001,1696,1761', '������', '420984', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1769', '1696', '0,100001,1696', '������', '421000', '0716', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('177', '167', '0,100001,35,167', '�������������', '130827', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1770', '1769', '0,100001,1696,1769', 'ɳ����', '421002', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1771', '1769', '0,100001,1696,1769', '������', '421003', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1772', '1769', '0,100001,1696,1769', '������', '421022', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1773', '1769', '0,100001,1696,1769', '������', '421023', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1774', '1769', '0,100001,1696,1769', '������', '421024', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1775', '1769', '0,100001,1696,1769', 'ʯ����', '421081', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1776', '1769', '0,100001,1696,1769', '�����', '421083', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1777', '1769', '0,100001,1696,1769', '������', '421087', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1778', '1696', '0,100001,1696', '�Ƹ���', '421100', '0713', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1779', '1778', '0,100001,1696,1778', '������', '421102', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('178', '167', '0,100001,35,167', 'Χ�������ɹ���������', '130828', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1780', '1778', '0,100001,1696,1778', '�ŷ���', '421121', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1781', '1778', '0,100001,1696,1778', '�찲��', '421122', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1782', '1778', '0,100001,1696,1778', '������', '421123', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1783', '1778', '0,100001,1696,1778', 'Ӣɽ��', '421124', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1784', '1778', '0,100001,1696,1778', '�ˮ��', '421125', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1785', '1778', '0,100001,1696,1778', 'ޭ����', '421126', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1786', '1778', '0,100001,1696,1778', '��÷��', '421127', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1787', '1778', '0,100001,1696,1778', '�����', '421181', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1788', '1778', '0,100001,1696,1778', '��Ѩ��', '421182', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1789', '1696', '0,100001,1696', '������', '421200', '0715', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('179', '35', '0,100001,35', '������', '130900', '0317', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1790', '1789', '0,100001,1696,1789', '�̰���', '421202', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1791', '1789', '0,100001,1696,1789', '������', '421221', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1792', '1789', '0,100001,1696,1789', 'ͨ����', '421222', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1793', '1789', '0,100001,1696,1789', '������', '421223', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1794', '1789', '0,100001,1696,1789', 'ͨɽ��', '421224', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1795', '1789', '0,100001,1696,1789', '�����', '421281', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1796', '1696', '0,100001,1696', '������', '421300', '0722', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1797', '1796', '0,100001,1696,1796', '������', '421303', '0722', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1798', '1796', '0,100001,1696,1796', '����', '421321', '0722', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1799', '1796', '0,100001,1696,1796', '��ˮ��', '421381', '0722', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('18', '100001', '0100001,', '�����', '120000', '022', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:26:45', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('180', '179', '0,100001,35,179', '�»���', '130902', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1800', '1696', '0,100001,1696', '��ʩ����������������', '422800', '0718', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1801', '1800', '0,100001,1696,1800', '��ʩ��', '422801', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1802', '1800', '0,100001,1696,1800', '������', '422802', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1803', '1800', '0,100001,1696,1800', '��ʼ��', '422822', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1804', '1800', '0,100001,1696,1800', '�Ͷ���', '422823', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1805', '1800', '0,100001,1696,1800', '������', '422825', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1806', '1800', '0,100001,1696,1800', '�̷���', '422826', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1807', '1800', '0,100001,1696,1800', '������', '422827', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1808', '1800', '0,100001,1696,1800', '�׷���', '422828', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1809', '1696', '0,100001,1696', 'ʡֱϽ', '429000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('181', '179', '0,100001,35,179', '�˺���', '130903', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1810', '1809', '0,100001,1696,1809', '������', '429004', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1811', '1809', '0,100001,1696,1809', 'Ǳ����', '429005', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1812', '1809', '0,100001,1696,1809', '������', '429006', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1813', '1809', '0,100001,1696,1809', '��ũ������', '429021', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1814', '100001', '0,100001', '����ʡ', '430000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1815', '1814', '0,100001,1814', '��ɳ��', '430100', '0731', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1816', '1815', '0,100001,1814,1815', 'ܽ����', '430102', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1817', '1815', '0,100001,1814,1815', '������', '430103', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1818', '1815', '0,100001,1814,1815', '��´��', '430104', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1819', '1815', '0,100001,1814,1815', '������', '430105', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('182', '179', '0,100001,35,179', '����', '130921', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1820', '1815', '0,100001,1814,1815', '�껨��', '430111', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1821', '1815', '0,100001,1814,1815', '������', '430112', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1822', '1815', '0,100001,1814,1815', '��ɳ��', '430121', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1823', '1815', '0,100001,1814,1815', '������', '430124', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1824', '1815', '0,100001,1814,1815', '�����', '430181', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1825', '1814', '0,100001,1814', '������', '430200', '0733', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1826', '1825', '0,100001,1814,1825', '������', '430202', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1827', '1825', '0,100001,1814,1825', '«����', '430203', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1828', '1825', '0,100001,1814,1825', 'ʯ����', '430204', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1829', '1825', '0,100001,1814,1825', '��Ԫ��', '430211', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('183', '179', '0,100001,35,179', '����', '130922', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1830', '1825', '0,100001,1814,1825', '������', '430221', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1831', '1825', '0,100001,1814,1825', '����', '430223', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1832', '1825', '0,100001,1814,1825', '������', '430224', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1833', '1825', '0,100001,1814,1825', '������', '430225', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1834', '1825', '0,100001,1814,1825', '������', '430281', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1835', '1814', '0,100001,1814', '��̶��', '430300', '0732', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1836', '1835', '0,100001,1814,1835', '�����', '430302', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1837', '1835', '0,100001,1814,1835', '������', '430304', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1838', '1835', '0,100001,1814,1835', '��̶��', '430321', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1839', '1835', '0,100001,1814,1835', '������', '430381', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('184', '179', '0,100001,35,179', '������', '130923', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1840', '1835', '0,100001,1814,1835', '��ɽ��', '430382', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1841', '1814', '0,100001,1814', '������', '430400', '0734', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1842', '1841', '0,100001,1814,1841', '������', '430405', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1843', '1841', '0,100001,1814,1841', '�����', '430406', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1844', '1841', '0,100001,1814,1841', 'ʯ����', '430407', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1845', '1841', '0,100001,1814,1841', '������', '430408', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1846', '1841', '0,100001,1814,1841', '������', '430412', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1847', '1841', '0,100001,1814,1841', '������', '430421', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1848', '1841', '0,100001,1814,1841', '������', '430422', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1849', '1841', '0,100001,1814,1841', '��ɽ��', '430423', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('185', '179', '0,100001,35,179', '������', '130924', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1850', '1841', '0,100001,1814,1841', '�ⶫ��', '430424', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1851', '1841', '0,100001,1814,1841', '���', '430426', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1852', '1841', '0,100001,1814,1841', '������', '430481', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1853', '1841', '0,100001,1814,1841', '������', '430482', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1854', '1814', '0,100001,1814', '������', '430500', '0739', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1855', '1854', '0,100001,1814,1854', '˫����', '430502', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1856', '1854', '0,100001,1814,1854', '������', '430503', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1857', '1854', '0,100001,1814,1854', '������', '430511', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1858', '1854', '0,100001,1814,1854', '�۶���', '430521', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1859', '1854', '0,100001,1814,1854', '������', '430522', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('186', '179', '0,100001,35,179', '��ɽ��', '130925', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1860', '1854', '0,100001,1814,1854', '������', '430523', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1861', '1854', '0,100001,1814,1854', '¡����', '430524', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1862', '1854', '0,100001,1814,1854', '������', '430525', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1863', '1854', '0,100001,1814,1854', '������', '430527', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1864', '1854', '0,100001,1814,1854', '������', '430528', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1865', '1854', '0,100001,1814,1854', '�ǲ�����������', '430529', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1866', '1854', '0,100001,1814,1854', '�����', '430581', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1867', '1814', '0,100001,1814', '������', '430600', '0730', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1868', '1867', '0,100001,1814,1867', '����¥��', '430602', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1869', '1867', '0,100001,1814,1867', '��Ϫ��', '430603', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('187', '179', '0,100001,35,179', '������', '130926', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1870', '1867', '0,100001,1814,1867', '��ɽ��', '430611', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1871', '1867', '0,100001,1814,1867', '������', '430621', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1872', '1867', '0,100001,1814,1867', '������', '430623', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1873', '1867', '0,100001,1814,1867', '������', '430624', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1874', '1867', '0,100001,1814,1867', 'ƽ����', '430626', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1875', '1867', '0,100001,1814,1867', '������', '430681', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1876', '1867', '0,100001,1814,1867', '������', '430682', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1877', '1814', '0,100001,1814', '������', '430700', '0736', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1878', '1877', '0,100001,1814,1877', '������', '430702', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1879', '1877', '0,100001,1814,1877', '������', '430703', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('188', '179', '0,100001,35,179', '��Ƥ��', '130927', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1880', '1877', '0,100001,1814,1877', '������', '430721', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1881', '1877', '0,100001,1814,1877', '������', '430722', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1882', '1877', '0,100001,1814,1877', '���', '430723', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1883', '1877', '0,100001,1814,1877', '�����', '430724', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1884', '1877', '0,100001,1814,1877', '��Դ��', '430725', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1885', '1877', '0,100001,1814,1877', 'ʯ����', '430726', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1886', '1877', '0,100001,1814,1877', '������', '430781', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1887', '1814', '0,100001,1814', '�żҽ���', '430800', '0744', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1888', '1887', '0,100001,1814,1887', '������', '430802', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1889', '1887', '0,100001,1814,1887', '����Դ��', '430811', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('189', '179', '0,100001,35,179', '������', '130928', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1890', '1887', '0,100001,1814,1887', '������', '430821', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1891', '1887', '0,100001,1814,1887', 'ɣֲ��', '430822', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1892', '1814', '0,100001,1814', '������', '430900', '0737', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1893', '1892', '0,100001,1814,1892', '������', '430902', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1894', '1892', '0,100001,1814,1892', '��ɽ��', '430903', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1895', '1892', '0,100001,1814,1892', '����', '430921', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1896', '1892', '0,100001,1814,1892', '�ҽ���', '430922', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1897', '1892', '0,100001,1814,1892', '������', '430923', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1898', '1892', '0,100001,1814,1892', '�佭��', '430981', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1899', '1814', '0,100001,1814', '������', '431000', '0735', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('19', '18', '0,100001,18', '��ƽ��', '120101', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('190', '179', '0,100001,35,179', '����', '130929', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1900', '1899', '0,100001,1814,1899', '������', '431002', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1901', '1899', '0,100001,1814,1899', '������', '431003', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1902', '1899', '0,100001,1814,1899', '������', '431021', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1903', '1899', '0,100001,1814,1899', '������', '431022', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1904', '1899', '0,100001,1814,1899', '������', '431023', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1905', '1899', '0,100001,1814,1899', '�κ���', '431024', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1906', '1899', '0,100001,1814,1899', '������', '431025', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1907', '1899', '0,100001,1814,1899', '�����', '431026', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1908', '1899', '0,100001,1814,1899', '����', '431027', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1909', '1899', '0,100001,1814,1899', '������', '431028', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('191', '179', '0,100001,35,179', '�ϴ����������', '130930', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1910', '1899', '0,100001,1814,1899', '������', '431081', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1911', '1814', '0,100001,1814', '������', '431100', '0746', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1912', '1911', '0,100001,1814,1911', '������', '431102', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1913', '1911', '0,100001,1814,1911', '��ˮ̲��', '431103', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1914', '1911', '0,100001,1814,1911', '������', '431121', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1915', '1911', '0,100001,1814,1911', '������', '431122', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1916', '1911', '0,100001,1814,1911', '˫����', '431123', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1917', '1911', '0,100001,1814,1911', '����', '431124', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1918', '1911', '0,100001,1814,1911', '������', '431125', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1919', '1911', '0,100001,1814,1911', '��Զ��', '431126', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('192', '179', '0,100001,35,179', '��ͷ��', '130981', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1920', '1911', '0,100001,1814,1911', '��ɽ��', '431127', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1921', '1911', '0,100001,1814,1911', '������', '431128', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1922', '1911', '0,100001,1814,1911', '��������������', '431129', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1923', '1814', '0,100001,1814', '������', '431200', '0745', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1924', '1923', '0,100001,1814,1923', '�׳���', '431202', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1925', '1923', '0,100001,1814,1923', '�з���', '431221', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1926', '1923', '0,100001,1814,1923', '������', '431222', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1927', '1923', '0,100001,1814,1923', '��Ϫ��', '431223', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1928', '1923', '0,100001,1814,1923', '������', '431224', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1929', '1923', '0,100001,1814,1923', '��ͬ��', '431225', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('193', '179', '0,100001,35,179', '������', '130982', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1930', '1923', '0,100001,1814,1923', '��������������', '431226', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1931', '1923', '0,100001,1814,1923', '�»ζ���������', '431227', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1932', '1923', '0,100001,1814,1923', '�ƽ�����������', '431228', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1933', '1923', '0,100001,1814,1923', '�������嶱��������', '431229', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1934', '1923', '0,100001,1814,1923', 'ͨ������������', '431230', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1935', '1923', '0,100001,1814,1923', '�齭��', '431281', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1936', '1814', '0,100001,1814', '¦����', '431300', '0738', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1937', '1936', '0,100001,1814,1936', '¦����', '431302', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1938', '1936', '0,100001,1814,1936', '˫����', '431321', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1939', '1936', '0,100001,1814,1936', '�»���', '431322', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('194', '179', '0,100001,35,179', '������', '130983', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1940', '1936', '0,100001,1814,1936', '��ˮ����', '431381', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1941', '1936', '0,100001,1814,1936', '��Դ��', '431382', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1942', '1814', '0,100001,1814', '��������������������', '433100', '0743', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1943', '1942', '0,100001,1814,1942', '������', '433101', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1944', '1942', '0,100001,1814,1942', '��Ϫ��', '433122', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1945', '1942', '0,100001,1814,1942', '�����', '433123', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1946', '1942', '0,100001,1814,1942', '��ԫ��', '433124', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1947', '1942', '0,100001,1814,1942', '������', '433125', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1948', '1942', '0,100001,1814,1942', '������', '433126', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1949', '1942', '0,100001,1814,1942', '��˳��', '433127', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('195', '179', '0,100001,35,179', '�Ӽ���', '130984', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1950', '1942', '0,100001,1814,1942', '��ɽ��', '433130', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1951', '100001', '0,100001', '�㶫ʡ', '440000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1952', '1951', '0,100001,1951', '������', '440100', '020', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1953', '1952', '0,100001,1951,1952', '������', '440103', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1954', '1952', '0,100001,1951,1952', 'Խ����', '440104', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1955', '1952', '0,100001,1951,1952', '������', '440105', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1956', '1952', '0,100001,1951,1952', '�����', '440106', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1957', '1952', '0,100001,1951,1952', '������', '440111', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1958', '1952', '0,100001,1951,1952', '������', '440112', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1959', '1952', '0,100001,1951,1952', '��خ��', '440113', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('196', '35', '0,100001,35', '�ȷ���', '131000', '0316', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1960', '1952', '0,100001,1951,1952', '������', '440114', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1961', '1952', '0,100001,1951,1952', '��ɳ��', '440115', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1962', '1952', '0,100001,1951,1952', '�ܸ���', '440116', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1963', '1952', '0,100001,1951,1952', '������', '440183', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1964', '1952', '0,100001,1951,1952', '�ӻ���', '440184', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1965', '1951', '0,100001,1951', '�ع���', '440200', '0751', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1966', '1965', '0,100001,1951,1965', '�佭��', '440203', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1967', '1965', '0,100001,1951,1965', '䥽���', '440204', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1968', '1965', '0,100001,1951,1965', '������', '440205', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1969', '1965', '0,100001,1951,1965', 'ʼ����', '440222', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('197', '196', '0,100001,35,196', '������', '131002', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1970', '1965', '0,100001,1951,1965', '�ʻ���', '440224', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1971', '1965', '0,100001,1951,1965', '��Դ��', '440229', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1972', '1965', '0,100001,1951,1965', '��Դ����������', '440232', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1973', '1965', '0,100001,1951,1965', '�·���', '440233', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1974', '1965', '0,100001,1951,1965', '�ֲ���', '440281', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1975', '1965', '0,100001,1951,1965', '������', '440282', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1976', '1951', '0,100001,1951', '������', '440300', '0755', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1977', '1976', '0,100001,1951,1976', '�޺���', '440303', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1978', '1976', '0,100001,1951,1976', '������', '440304', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1979', '1976', '0,100001,1951,1976', '��ɽ��', '440305', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('198', '196', '0,100001,35,196', '������', '131003', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1980', '1976', '0,100001,1951,1976', '������', '440306', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1981', '1976', '0,100001,1951,1976', '������', '440307', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1982', '1976', '0,100001,1951,1976', '������', '440308', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1983', '1951', '0,100001,1951', '�麣��', '440400', '0756', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1984', '1983', '0,100001,1951,1983', '������', '440402', '0756', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1985', '1983', '0,100001,1951,1983', '������', '440403', '0756', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1986', '1983', '0,100001,1951,1983', '������', '440404', '0756', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1987', '1951', '0,100001,1951', '��ͷ��', '440500', '0754', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1988', '1987', '0,100001,1951,1987', '������', '440507', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1989', '1987', '0,100001,1951,1987', '��ƽ��', '440511', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('199', '196', '0,100001,35,196', '�̰���', '131022', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1990', '1987', '0,100001,1951,1987', '婽���', '440512', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1991', '1987', '0,100001,1951,1987', '������', '440513', '0661', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1992', '1987', '0,100001,1951,1987', '������', '440514', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1993', '1987', '0,100001,1951,1987', '�κ���', '440515', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1994', '1987', '0,100001,1951,1987', '�ϰ���', '440523', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1995', '1951', '0,100001,1951', '��ɽ��', '440600', '0757', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1996', '1995', '0,100001,1951,1995', '������', '440604', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1997', '1995', '0,100001,1951,1995', '�Ϻ���', '440605', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1998', '1995', '0,100001,1951,1995', '˳����', '440606', '0765', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1999', '1995', '0,100001,1951,1995', '��ˮ��', '440607', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,100001,1', '������', '110101', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('20', '18', '0,100001,18', '�Ӷ���', '120102', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('200', '196', '0,100001,35,196', '������', '131023', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2000', '1995', '0,100001,1951,1995', '������', '440608', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2001', '1951', '0,100001,1951', '������', '440700', '0750', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2002', '2001', '0,100001,1951,2001', '���', '440703', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2003', '2001', '0,100001,1951,2001', '������', '440704', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2004', '2001', '0,100001,1951,2001', '�»���', '440705', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2005', '2001', '0,100001,1951,2001', '̨ɽ��', '440781', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2006', '2001', '0,100001,1951,2001', '��ƽ��', '440783', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2007', '2001', '0,100001,1951,2001', '��ɽ��', '440784', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2008', '2001', '0,100001,1951,2001', '��ƽ��', '440785', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2009', '1951', '0,100001,1951', 'տ����', '440800', '0759', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('201', '196', '0,100001,35,196', '�����', '131024', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2010', '2009', '0,100001,1951,2009', '�࿲��', '440802', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2011', '2009', '0,100001,1951,2009', 'ϼɽ��', '440803', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2012', '2009', '0,100001,1951,2009', '��ͷ��', '440804', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2013', '2009', '0,100001,1951,2009', '������', '440811', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2014', '2009', '0,100001,1951,2009', '��Ϫ��', '440823', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2015', '2009', '0,100001,1951,2009', '������', '440825', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2016', '2009', '0,100001,1951,2009', '������', '440881', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2017', '2009', '0,100001,1951,2009', '������', '440882', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2018', '2009', '0,100001,1951,2009', '�⴨��', '440883', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2019', '1951', '0,100001,1951', 'ï����', '440900', '0668', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('202', '196', '0,100001,35,196', '�����', '131025', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2020', '2019', '0,100001,1951,2019', 'ï����', '440902', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2021', '2019', '0,100001,1951,2019', 'ï����', '440903', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2022', '2019', '0,100001,1951,2019', '�����', '440923', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2023', '2019', '0,100001,1951,2019', '������', '440981', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2024', '2019', '0,100001,1951,2019', '������', '440982', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2025', '2019', '0,100001,1951,2019', '������', '440983', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2026', '1951', '0,100001,1951', '������', '441200', '0758', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2027', '2026', '0,100001,1951,2026', '������', '441202', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2028', '2026', '0,100001,1951,2026', '������', '441203', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2029', '2026', '0,100001,1951,2026', '������', '441223', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('203', '196', '0,100001,35,196', '�İ���', '131026', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2030', '2026', '0,100001,1951,2026', '������', '441224', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2031', '2026', '0,100001,1951,2026', '�⿪��', '441225', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2032', '2026', '0,100001,1951,2026', '������', '441226', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2033', '2026', '0,100001,1951,2026', '��Ҫ��', '441283', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2034', '2026', '0,100001,1951,2026', '�Ļ���', '441284', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2035', '1951', '0,100001,1951', '������', '441300', '0752', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2036', '2035', '0,100001,1951,2035', '�ݳ���', '441302', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2037', '2035', '0,100001,1951,2035', '������', '441303', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2038', '2035', '0,100001,1951,2035', '������', '441322', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2039', '2035', '0,100001,1951,2035', '�ݶ���', '441323', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('204', '196', '0,100001,35,196', '�󳧻���������', '131028', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2040', '2035', '0,100001,1951,2035', '������', '441324', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2041', '1951', '0,100001,1951', '÷����', '441400', '0753', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2042', '2041', '0,100001,1951,2041', '÷����', '441402', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2043', '2041', '0,100001,1951,2041', '÷��', '441421', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2044', '2041', '0,100001,1951,2041', '������', '441422', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2045', '2041', '0,100001,1951,2041', '��˳��', '441423', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2046', '2041', '0,100001,1951,2041', '�廪��', '441424', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2047', '2041', '0,100001,1951,2041', 'ƽԶ��', '441426', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2048', '2041', '0,100001,1951,2041', '������', '441427', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2049', '2041', '0,100001,1951,2041', '������', '441481', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('205', '196', '0,100001,35,196', '������', '131081', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2050', '1951', '0,100001,1951', '��β��', '441500', '0660', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2051', '2050', '0,100001,1951,2050', '����', '441502', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2052', '2050', '0,100001,1951,2050', '������', '441521', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2053', '2050', '0,100001,1951,2050', '½����', '441523', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2054', '2050', '0,100001,1951,2050', '½����', '441581', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2055', '1951', '0,100001,1951', '��Դ��', '441600', '0762', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2056', '2055', '0,100001,1951,2055', 'Դ����', '441602', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2057', '2055', '0,100001,1951,2055', '�Ͻ���', '441621', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2058', '2055', '0,100001,1951,2055', '������', '441622', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2059', '2055', '0,100001,1951,2055', '��ƽ��', '441623', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('206', '196', '0,100001,35,196', '������', '131082', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2060', '2055', '0,100001,1951,2055', '��ƽ��', '441624', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2061', '2055', '0,100001,1951,2055', '��Դ��', '441625', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2062', '1951', '0,100001,1951', '������', '441700', '0662', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2063', '2062', '0,100001,1951,2062', '������', '441702', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2064', '2062', '0,100001,1951,2062', '������', '441721', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2065', '2062', '0,100001,1951,2062', '������', '441723', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2066', '2062', '0,100001,1951,2062', '������', '441781', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2067', '1951', '0,100001,1951', '��Զ��', '441800', '0763', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2068', '2067', '0,100001,1951,2067', '�����', '441802', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2069', '2067', '0,100001,1951,2067', '�����', '441821', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('207', '35', '0,100001,35', '��ˮ��', '131100', '0318', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2070', '2067', '0,100001,1951,2067', '��ɽ��', '441823', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2071', '2067', '0,100001,1951,2067', '��ɽ׳������������', '441825', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2072', '2067', '0,100001,1951,2067', '��������������', '441826', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2073', '2067', '0,100001,1951,2067', '������', '441827', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2074', '2067', '0,100001,1951,2067', 'Ӣ����', '441881', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2075', '2067', '0,100001,1951,2067', '������', '441882', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2076', '1951', '0,100001,1951', '��ݸ��', '441900', '0769', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2077', '2076', '0,100001,1951,2076', '��ݸ��', '441901', '0769', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2078', '1951', '0,100001,1951', '��ɽ��', '442000', '0760', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2079', '2078', '0,100001,1951,2078', '��ɽ��', '442001', '0760', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('208', '207', '0,100001,35,207', '�ҳ���', '131102', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2080', '1951', '0,100001,1951', '������', '445100', '0768', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2081', '2080', '0,100001,1951,2080', '������', '445102', '0768', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2082', '2080', '0,100001,1951,2080', '������', '445121', '0768', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2083', '2080', '0,100001,1951,2080', '��ƽ��', '445122', '0768', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2084', '1951', '0,100001,1951', '������', '445200', '0663', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2085', '2084', '0,100001,1951,2084', '�ų���', '445202', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2086', '2084', '0,100001,1951,2084', '�Ҷ���', '445221', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2087', '2084', '0,100001,1951,2084', '������', '445222', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2088', '2084', '0,100001,1951,2084', '������', '445224', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2089', '2084', '0,100001,1951,2084', '������', '445281', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('209', '207', '0,100001,35,207', '��ǿ��', '131121', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2090', '1951', '0,100001,1951', '�Ƹ���', '445300', '0766', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2091', '2090', '0,100001,1951,2090', '�Ƴ���', '445302', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2092', '2090', '0,100001,1951,2090', '������', '445321', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2093', '2090', '0,100001,1951,2090', '������', '445322', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2094', '2090', '0,100001,1951,2090', '�ư���', '445323', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2095', '2090', '0,100001,1951,2090', '�޶���', '445381', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2096', '100001', '0,100001', '����׳��������', '450000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2097', '2096', '0,100001,2096', '������', '450100', '0771', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2098', '2097', '0,100001,2096,2097', '������', '450102', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2099', '2097', '0,100001,2096,2097', '������', '450103', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('21', '18', '0,100001,18', '������', '120103', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('210', '207', '0,100001,35,207', '������', '131122', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2100', '2097', '0,100001,2096,2097', '������', '450105', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2101', '2097', '0,100001,2096,2097', '��������', '450107', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2102', '2097', '0,100001,2096,2097', '������', '450108', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2103', '2097', '0,100001,2096,2097', '������', '450109', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2104', '2097', '0,100001,2096,2097', '������', '450122', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2105', '2097', '0,100001,2096,2097', '¡����', '450123', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2106', '2097', '0,100001,2096,2097', '��ɽ��', '450124', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2107', '2097', '0,100001,2096,2097', '������', '450125', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2108', '2097', '0,100001,2096,2097', '������', '450126', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2109', '2097', '0,100001,2096,2097', '����', '450127', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('211', '207', '0,100001,35,207', '��ǿ��', '131123', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2110', '2096', '0,100001,2096', '������', '450200', '0772', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2111', '2110', '0,100001,2096,2110', '������', '450202', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2112', '2110', '0,100001,2096,2110', '�����', '450203', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2113', '2110', '0,100001,2096,2110', '������', '450204', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2114', '2110', '0,100001,2096,2110', '������', '450205', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2115', '2110', '0,100001,2096,2110', '������', '450221', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2116', '2110', '0,100001,2096,2110', '������', '450222', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2117', '2110', '0,100001,2096,2110', '¹կ��', '450223', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2118', '2110', '0,100001,2096,2110', '�ڰ���', '450224', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2119', '2110', '0,100001,2096,2110', '��ˮ����������', '450225', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('212', '207', '0,100001,35,207', '������', '131124', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2120', '2110', '0,100001,2096,2110', '��������������', '450226', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2121', '2096', '0,100001,2096', '������', '450300', '0773', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2122', '2121', '0,100001,2096,2121', '�����', '450302', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2123', '2121', '0,100001,2096,2121', '������', '450303', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2124', '2121', '0,100001,2096,2121', '��ɽ��', '450304', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2125', '2121', '0,100001,2096,2121', '������', '450305', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2126', '2121', '0,100001,2096,2121', '��ɽ��', '450311', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2127', '2121', '0,100001,2096,2121', '��˷��', '450321', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2128', '2121', '0,100001,2096,2121', '�ٹ���', '450322', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2129', '2121', '0,100001,2096,2121', '�鴨��', '450323', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('213', '207', '0,100001,35,207', '��ƽ��', '131125', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2130', '2121', '0,100001,2096,2121', 'ȫ����', '450324', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2131', '2121', '0,100001,2096,2121', '�˰���', '450325', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2132', '2121', '0,100001,2096,2121', '������', '450326', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2133', '2121', '0,100001,2096,2121', '������', '450327', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2134', '2121', '0,100001,2096,2121', '��ʤ����������', '450328', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2135', '2121', '0,100001,2096,2121', '��Դ��', '450329', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2136', '2121', '0,100001,2096,2121', 'ƽ����', '450330', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2137', '2121', '0,100001,2096,2121', '������', '450331', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2138', '2121', '0,100001,2096,2121', '��������������', '450332', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2139', '2096', '0,100001,2096', '������', '450400', '0774', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('214', '207', '0,100001,35,207', '�ʳ���', '131126', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2140', '2139', '0,100001,2096,2139', '������', '450403', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2141', '2139', '0,100001,2096,2139', '��ɽ��', '450404', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2142', '2139', '0,100001,2096,2139', '������', '450405', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2143', '2139', '0,100001,2096,2139', '������', '450421', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2144', '2139', '0,100001,2096,2139', '����', '450422', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2145', '2139', '0,100001,2096,2139', '��ɽ��', '450423', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2146', '2139', '0,100001,2096,2139', '�Ϫ��', '450481', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2147', '2096', '0,100001,2096', '������', '450500', '0779', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2148', '2147', '0,100001,2096,2147', '������', '450502', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2149', '2147', '0,100001,2096,2147', '������', '450503', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('215', '207', '0,100001,35,207', '����', '131127', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2150', '2147', '0,100001,2096,2147', '��ɽ����', '450512', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2151', '2147', '0,100001,2096,2147', '������', '450521', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2152', '2096', '0,100001,2096', '���Ǹ���', '450600', '0770', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2153', '2152', '0,100001,2096,2152', '�ۿ���', '450602', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2154', '2152', '0,100001,2096,2152', '������', '450603', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2155', '2152', '0,100001,2096,2152', '��˼��', '450621', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2156', '2152', '0,100001,2096,2152', '������', '450681', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2157', '2096', '0,100001,2096', '������', '450700', '0777', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2158', '2157', '0,100001,2096,2157', '������', '450702', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2159', '2157', '0,100001,2096,2157', '�ձ���', '450703', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('216', '207', '0,100001,35,207', '������', '131128', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2160', '2157', '0,100001,2096,2157', '��ɽ��', '450721', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2161', '2157', '0,100001,2096,2157', '�ֱ���', '450722', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2162', '2096', '0,100001,2096', '�����', '450800', '0775', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2163', '2162', '0,100001,2096,2162', '�۱���', '450802', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2164', '2162', '0,100001,2096,2162', '������', '450803', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2165', '2162', '0,100001,2096,2162', '������', '450804', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2166', '2162', '0,100001,2096,2162', 'ƽ����', '450821', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2167', '2162', '0,100001,2096,2162', '��ƽ��', '450881', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2168', '2096', '0,100001,2096', '������', '450900', '0775', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2169', '2168', '0,100001,2096,2168', '������', '450902', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('217', '207', '0,100001,35,207', '������', '131181', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2170', '2168', '0,100001,2096,2168', '����', '450921', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2171', '2168', '0,100001,2096,2168', '½����', '450922', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2172', '2168', '0,100001,2096,2168', '������', '450923', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2173', '2168', '0,100001,2096,2168', '��ҵ��', '450924', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2174', '2168', '0,100001,2096,2168', '������', '450981', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2175', '2096', '0,100001,2096', '��ɫ��', '451000', '0776', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2176', '2175', '0,100001,2096,2175', '�ҽ���', '451002', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2177', '2175', '0,100001,2096,2175', '������', '451021', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2178', '2175', '0,100001,2096,2175', '�ﶫ��', '451022', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2179', '2175', '0,100001,2096,2175', 'ƽ����', '451023', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('218', '207', '0,100001,35,207', '������', '131182', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2180', '2175', '0,100001,2096,2175', '�±���', '451024', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2181', '2175', '0,100001,2096,2175', '������', '451025', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2182', '2175', '0,100001,2096,2175', '������', '451026', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2183', '2175', '0,100001,2096,2175', '������', '451027', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2184', '2175', '0,100001,2096,2175', '��ҵ��', '451028', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2185', '2175', '0,100001,2096,2175', '������', '451029', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2186', '2175', '0,100001,2096,2175', '������', '451030', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2187', '2175', '0,100001,2096,2175', '¡�ָ���������', '451031', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2188', '2096', '0,100001,2096', '������', '451100', '0774', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2189', '2188', '0,100001,2096,2188', '�˲���', '451102', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('219', '100001', '0,100001', 'ɽ��ʡ', '140000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2190', '2188', '0,100001,2096,2188', 'ƽ�������', '451119', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2191', '2188', '0,100001,2096,2188', '��ƽ��', '451121', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2192', '2188', '0,100001,2096,2188', '��ɽ��', '451122', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2193', '2188', '0,100001,2096,2188', '��������������', '451123', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2194', '2096', '0,100001,2096', '�ӳ���', '451200', '0778', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2195', '2194', '0,100001,2096,2194', '��ǽ���', '451202', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2196', '2194', '0,100001,2096,2194', '�ϵ���', '451221', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2197', '2194', '0,100001,2096,2194', '�����', '451222', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2198', '2194', '0,100001,2096,2194', '��ɽ��', '451223', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2199', '2194', '0,100001,2096,2194', '������', '451224', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('22', '18', '0,100001,18', '�Ͽ���', '120104', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('220', '219', '0,100001,219', '̫ԭ��', '140100', '0351', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2200', '2194', '0,100001,2096,2194', '�޳�������������', '451225', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2201', '2194', '0,100001,2096,2194', '����ë����������', '451226', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2202', '2194', '0,100001,2096,2194', '��������������', '451227', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2203', '2194', '0,100001,2096,2194', '��������������', '451228', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2204', '2194', '0,100001,2096,2194', '������������', '451229', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2205', '2194', '0,100001,2096,2194', '������', '451281', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2206', '2096', '0,100001,2096', '������', '451300', '0772', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2207', '2206', '0,100001,2096,2206', '�˱���', '451302', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2208', '2206', '0,100001,2096,2206', '�ó���', '451321', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2209', '2206', '0,100001,2096,2206', '������', '451322', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('221', '220', '0,100001,219,220', 'С����', '140105', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2210', '2206', '0,100001,2096,2206', '������', '451323', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2211', '2206', '0,100001,2096,2206', '��������������', '451324', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2212', '2206', '0,100001,2096,2206', '��ɽ��', '451381', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2213', '2096', '0,100001,2096', '������', '451400', '0771', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2214', '2213', '0,100001,2096,2213', '������', '451402', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2215', '2213', '0,100001,2096,2213', '������', '451421', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2216', '2213', '0,100001,2096,2213', '������', '451422', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2217', '2213', '0,100001,2096,2213', '������', '451423', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2218', '2213', '0,100001,2096,2213', '������', '451424', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2219', '2213', '0,100001,2096,2213', '�����', '451425', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('222', '220', '0,100001,219,220', 'ӭ����', '140106', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2220', '2213', '0,100001,2096,2213', 'ƾ����', '451481', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2221', '100001', '0,100001', '����ʡ', '460000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2222', '2221', '0,100001,2221', '������', '460100', '0898', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2223', '2222', '0,100001,2221,2222', '��Ӣ��', '460105', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2224', '2222', '0,100001,2221,2222', '������', '460106', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2225', '2222', '0,100001,2221,2222', '��ɽ��', '460107', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2226', '2222', '0,100001,2221,2222', '������', '460108', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2227', '2221', '0,100001,2221', '������', '460200', '0899', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2228', '2227', '0,100001,2221,2227', '������', '460201', '0899', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2229', '2221', '0,100001,2221', '��ɳ��', '460300', '0898', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('223', '220', '0,100001,219,220', '�ӻ�����', '140107', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2230', '2229', '0,100001,2221,2229', '��ɳȺ��', '460321', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2231', '2229', '0,100001,2221,2229', '��ɳȺ��', '460322', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2232', '2229', '0,100001,2221,2229', '��ɳȺ��', '460323', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2233', '2221', '0,100001,2221', 'ʡֱϽ', '469000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2234', '2233', '0,100001,2221,2233', '��ָɽ��', '469001', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2235', '2233', '0,100001,2221,2233', '����', '469002', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2236', '2233', '0,100001,2221,2233', '������', '469003', '0890', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2237', '2233', '0,100001,2221,2233', '�Ĳ���', '469005', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2238', '2233', '0,100001,2221,2233', '������', '469006', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2239', '2233', '0,100001,2221,2233', '������', '469007', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('224', '220', '0,100001,219,220', '���ƺ��', '140108', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2240', '2233', '0,100001,2221,2233', '������', '469021', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2241', '2233', '0,100001,2221,2233', '�Ͳ���', '469022', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2242', '2233', '0,100001,2221,2233', '������', '469023', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2243', '2233', '0,100001,2221,2233', '�ٸ���', '469024', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2244', '2233', '0,100001,2221,2233', '��ɳ����������', '469025', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2245', '2233', '0,100001,2221,2233', '��������������', '469026', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2246', '2233', '0,100001,2221,2233', '�ֶ�����������', '469027', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2247', '2233', '0,100001,2221,2233', '��ˮ����������', '469028', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2248', '2233', '0,100001,2221,2233', '��ͤ��������������', '469029', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2249', '2233', '0,100001,2221,2233', '������������������', '469030', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('225', '220', '0,100001,219,220', '�������', '140109', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2250', '100001', '0100001,', '������', '500000', '0811', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:27:48', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2251', '2250', '0,100001,2250', '������', '500101', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2252', '2250', '0,100001,2250', '������', '500102', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2253', '2250', '0,100001,2250', '������', '500103', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2254', '2250', '0,100001,2250', '��ɿ���', '500104', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2255', '2250', '0,100001,2250', '������', '500105', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2256', '2250', '0,100001,2250', 'ɳƺ����', '500106', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2257', '2250', '0,100001,2250', '��������', '500107', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2258', '2250', '0,100001,2250', '�ϰ���', '500108', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2259', '2250', '0,100001,2250', '������', '500109', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('226', '220', '0,100001,219,220', '��Դ��', '140110', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2260', '2250', '0,100001,2250', '�뽭��', '500110', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2261', '2250', '0,100001,2250', '������', '500111', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2262', '2250', '0,100001,2250', '�山��', '500112', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2263', '2250', '0,100001,2250', '������', '500113', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2264', '2250', '0,100001,2250', 'ǭ����', '500114', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2265', '2250', '0,100001,2250', '������', '500115', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2266', '2250', '0,100001,2250', '������', '500116', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2267', '2250', '0,100001,2250', '�ϴ���', '500117', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2268', '2250', '0,100001,2250', '������', '500118', '0814', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2269', '2250', '0,100001,2250', '�ϴ���', '500119', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('227', '220', '0,100001,219,220', '������', '140121', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2270', '2250', '0,100001,2250', '������', '500223', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2271', '2250', '0,100001,2250', 'ͭ����', '500224', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2272', '2250', '0,100001,2250', '�ٲ���', '500226', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2273', '2250', '0,100001,2250', '�ɽ��', '500227', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2274', '2250', '0,100001,2250', '��ƽ��', '500228', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2275', '2250', '0,100001,2250', '�ǿ���', '500229', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2276', '2250', '0,100001,2250', '�ᶼ��', '500230', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2277', '2250', '0,100001,2250', '�潭��', '500231', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2278', '2250', '0,100001,2250', '��¡��', '500232', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2279', '2250', '0,100001,2250', '����', '500233', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('228', '220', '0,100001,219,220', '������', '140122', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2280', '2250', '0,100001,2250', '����', '500234', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2281', '2250', '0,100001,2250', '������', '500235', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2282', '2250', '0,100001,2250', '�����', '500236', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2283', '2250', '0,100001,2250', '��ɽ��', '500237', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2284', '2250', '0,100001,2250', '��Ϫ��', '500238', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2285', '2250', '0,100001,2250', 'ʯ��������������', '500240', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2286', '2250', '0,100001,2250', '��ɽ����������������', '500241', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2287', '2250', '0,100001,2250', '��������������������', '500242', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2288', '2250', '0,100001,2250', '��ˮ����������������', '500243', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2289', '100001', '0,100001', '�Ĵ�ʡ', '510000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('229', '220', '0,100001,219,220', '¦����', '140123', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2290', '2289', '0,100001,2289', '�ɶ���', '510100', '028', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2291', '2290', '0,100001,2289,2290', '������', '510104', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2292', '2290', '0,100001,2289,2290', '������', '510105', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2293', '2290', '0,100001,2289,2290', '��ţ��', '510106', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2294', '2290', '0,100001,2289,2290', '�����', '510107', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2295', '2290', '0,100001,2289,2290', '�ɻ���', '510108', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2296', '2290', '0,100001,2289,2290', '��Ȫ����', '510112', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2297', '2290', '0,100001,2289,2290', '��׽���', '510113', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2298', '2290', '0,100001,2289,2290', '�¶���', '510114', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2299', '2290', '0,100001,2289,2290', '�½���', '510115', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('23', '18', '0,100001,18', '�ӱ���', '120105', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('230', '220', '0,100001,219,220', '�Ž���', '140181', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2300', '2290', '0,100001,2289,2290', '������', '510121', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2301', '2290', '0,100001,2289,2290', '˫����', '510122', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2302', '2290', '0,100001,2289,2290', 'ۯ��', '510124', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2303', '2290', '0,100001,2289,2290', '������', '510129', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2304', '2290', '0,100001,2289,2290', '�ѽ���', '510131', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2305', '2290', '0,100001,2289,2290', '�½���', '510132', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2306', '2290', '0,100001,2289,2290', '��������', '510181', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2307', '2290', '0,100001,2289,2290', '������', '510182', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2308', '2290', '0,100001,2289,2290', '������', '510183', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2309', '2290', '0,100001,2289,2290', '������', '510184', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('231', '219', '0,100001,219', '��ͬ��', '140200', '0352', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2310', '2289', '0,100001,2289', '�Թ���', '510300', '0813', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2311', '2310', '0,100001,2289,2310', '��������', '510302', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2312', '2310', '0,100001,2289,2310', '������', '510303', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2313', '2310', '0,100001,2289,2310', '����', '510304', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2314', '2310', '0,100001,2289,2310', '��̲��', '510311', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2315', '2310', '0,100001,2289,2310', '����', '510321', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2316', '2310', '0,100001,2289,2310', '��˳��', '510322', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2317', '2289', '0,100001,2289', '��֦����', '510400', '0812', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2318', '2317', '0,100001,2289,2317', '����', '510402', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2319', '2317', '0,100001,2289,2317', '����', '510403', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('232', '231', '0,100001,219,231', '����', '140202', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2320', '2317', '0,100001,2289,2317', '�ʺ���', '510411', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2321', '2317', '0,100001,2289,2317', '������', '510421', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2322', '2317', '0,100001,2289,2317', '�α���', '510422', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2323', '2289', '0,100001,2289', '������', '510500', '0840', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2324', '2323', '0,100001,2289,2323', '������', '510502', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2325', '2323', '0,100001,2289,2323', '��Ϫ��', '510503', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2326', '2323', '0,100001,2289,2323', '����̶��', '510504', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2327', '2323', '0,100001,2289,2323', '����', '510521', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2328', '2323', '0,100001,2289,2323', '�Ͻ���', '510522', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2329', '2323', '0,100001,2289,2323', '������', '510524', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('233', '231', '0,100001,219,231', '����', '140203', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2330', '2323', '0,100001,2289,2323', '������', '510525', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2331', '2289', '0,100001,2289', '������', '510600', '0838', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2332', '2331', '0,100001,2289,2331', '�����', '510603', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2333', '2331', '0,100001,2289,2331', '�н���', '510623', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2334', '2331', '0,100001,2289,2331', '�޽���', '510626', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2335', '2331', '0,100001,2289,2331', '�㺺��', '510681', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2336', '2331', '0,100001,2289,2331', 'ʲ����', '510682', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2337', '2331', '0,100001,2289,2331', '������', '510683', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2338', '2289', '0,100001,2289', '������', '510700', '0816', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2339', '2338', '0,100001,2289,2338', '������', '510703', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('234', '231', '0,100001,219,231', '�Ͻ���', '140211', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2340', '2338', '0,100001,2289,2338', '������', '510704', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2341', '2338', '0,100001,2289,2338', '��̨��', '510722', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2342', '2338', '0,100001,2289,2338', '��ͤ��', '510723', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2343', '2338', '0,100001,2289,2338', '����', '510724', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2344', '2338', '0,100001,2289,2338', '������', '510725', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2345', '2338', '0,100001,2289,2338', '����Ǽ��������', '510726', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2346', '2338', '0,100001,2289,2338', 'ƽ����', '510727', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2347', '2338', '0,100001,2289,2338', '������', '510781', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2348', '2289', '0,100001,2289', '��Ԫ��', '510800', '0839', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2349', '2348', '0,100001,2289,2348', '������', '510802', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('235', '231', '0,100001,219,231', '������', '140212', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2350', '2348', '0,100001,2289,2348', 'Ԫ����', '510811', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2351', '2348', '0,100001,2289,2348', '������', '510812', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2352', '2348', '0,100001,2289,2348', '������', '510821', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2353', '2348', '0,100001,2289,2348', '�ന��', '510822', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2354', '2348', '0,100001,2289,2348', '������', '510823', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2355', '2348', '0,100001,2289,2348', '��Ϫ��', '510824', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2356', '2289', '0,100001,2289', '������', '510900', '0825', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2357', '2356', '0,100001,2289,2356', '��ɽ��', '510903', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2358', '2356', '0,100001,2289,2356', '������', '510904', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2359', '2356', '0,100001,2289,2356', '��Ϫ��', '510921', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('236', '231', '0,100001,219,231', '������', '140221', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2360', '2356', '0,100001,2289,2356', '�����', '510922', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2361', '2356', '0,100001,2289,2356', '��Ӣ��', '510923', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2362', '2289', '0,100001,2289', '�ڽ���', '511000', '0832', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2363', '2362', '0,100001,2289,2362', '������', '511002', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2364', '2362', '0,100001,2289,2362', '������', '511011', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2365', '2362', '0,100001,2289,2362', '��Զ��', '511024', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2366', '2362', '0,100001,2289,2362', '������', '511025', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2367', '2362', '0,100001,2289,2362', '¡����', '511028', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2368', '2289', '0,100001,2289', '��ɽ��', '511100', '0833', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2369', '2368', '0,100001,2289,2368', '������', '511102', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('237', '231', '0,100001,219,231', '������', '140222', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2370', '2368', '0,100001,2289,2368', 'ɳ����', '511111', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2371', '2368', '0,100001,2289,2368', '��ͨ����', '511112', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2372', '2368', '0,100001,2289,2368', '��ں���', '511113', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2373', '2368', '0,100001,2289,2368', '��Ϊ��', '511123', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2374', '2368', '0,100001,2289,2368', '������', '511124', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2375', '2368', '0,100001,2289,2368', '�н���', '511126', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2376', '2368', '0,100001,2289,2368', '�崨��', '511129', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2377', '2368', '0,100001,2289,2368', '�������������', '511132', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2378', '2368', '0,100001,2289,2368', '�������������', '511133', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2379', '2368', '0,100001,2289,2368', '��üɽ��', '511181', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('238', '231', '0,100001,219,231', '������', '140223', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2380', '2289', '0,100001,2289', '�ϳ���', '511300', '0817', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2381', '2380', '0,100001,2289,2380', '˳����', '511302', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2382', '2380', '0,100001,2289,2380', '��ƺ��', '511303', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2383', '2380', '0,100001,2289,2380', '������', '511304', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2384', '2380', '0,100001,2289,2380', '�ϲ���', '511321', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2385', '2380', '0,100001,2289,2380', 'Ӫɽ��', '511322', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2386', '2380', '0,100001,2289,2380', '���', '511323', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2387', '2380', '0,100001,2289,2380', '��¤��', '511324', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2388', '2380', '0,100001,2289,2380', '������', '511325', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2389', '2380', '0,100001,2289,2380', '������', '511381', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('239', '231', '0,100001,219,231', '������', '140224', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2390', '2289', '0,100001,2289', 'üɽ��', '511400', '028', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2391', '2390', '0,100001,2289,2390', '������', '511402', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2392', '2390', '0,100001,2289,2390', '������', '511421', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2393', '2390', '0,100001,2289,2390', '��ɽ��', '511422', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2394', '2390', '0,100001,2289,2390', '������', '511423', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2395', '2390', '0,100001,2289,2390', '������', '511424', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2396', '2390', '0,100001,2289,2390', '������', '511425', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2397', '2289', '0,100001,2289', '�˱���', '511500', '0831', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2398', '2397', '0,100001,2289,2397', '������', '511502', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2399', '2397', '0,100001,2289,2397', '�˱���', '511521', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('24', '18', '0,100001,18', '������', '120106', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('240', '231', '0,100001,219,231', '��Դ��', '140225', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2400', '2397', '0,100001,2289,2397', '��Ϫ��', '511522', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2401', '2397', '0,100001,2289,2397', '������', '511523', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2402', '2397', '0,100001,2289,2397', '������', '511524', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2403', '2397', '0,100001,2289,2397', '����', '511525', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2404', '2397', '0,100001,2289,2397', '����', '511526', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2405', '2397', '0,100001,2289,2397', '������', '511527', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2406', '2397', '0,100001,2289,2397', '������', '511528', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2407', '2397', '0,100001,2289,2397', '��ɽ��', '511529', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2408', '2289', '0,100001,2289', '�㰲��', '511600', '0826', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2409', '2408', '0,100001,2289,2408', '�㰲��', '511602', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('241', '231', '0,100001,219,231', '������', '140226', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2410', '2408', '0,100001,2289,2408', '������', '511621', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2411', '2408', '0,100001,2289,2408', '��ʤ��', '511622', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2412', '2408', '0,100001,2289,2408', '��ˮ��', '511623', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2413', '2408', '0,100001,2289,2408', '������', '511681', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2414', '2289', '0,100001,2289', '������', '511700', '0818', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2415', '2414', '0,100001,2289,2414', 'ͨ����', '511702', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2416', '2414', '0,100001,2289,2414', '����', '511721', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2417', '2414', '0,100001,2289,2414', '������', '511722', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2418', '2414', '0,100001,2289,2414', '������', '511723', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2419', '2414', '0,100001,2289,2414', '������', '511724', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('242', '231', '0,100001,219,231', '��ͬ��', '140227', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2420', '2414', '0,100001,2289,2414', '����', '511725', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2421', '2414', '0,100001,2289,2414', '��Դ��', '511781', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2422', '2289', '0,100001,2289', '�Ű���', '511800', '0835', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2423', '2422', '0,100001,2289,2422', '�����', '511802', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2424', '2422', '0,100001,2289,2422', '��ɽ��', '511821', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2425', '2422', '0,100001,2289,2422', '������', '511822', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2426', '2422', '0,100001,2289,2422', '��Դ��', '511823', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2427', '2422', '0,100001,2289,2422', 'ʯ����', '511824', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2428', '2422', '0,100001,2289,2422', '��ȫ��', '511825', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2429', '2422', '0,100001,2289,2422', '«ɽ��', '511826', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('243', '219', '0,100001,219', '��Ȫ��', '140300', '0353', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2430', '2422', '0,100001,2289,2422', '������', '511827', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2431', '2289', '0,100001,2289', '������', '511900', '0827', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2432', '2431', '0,100001,2289,2431', '������', '511902', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2433', '2431', '0,100001,2289,2431', 'ͨ����', '511921', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2434', '2431', '0,100001,2289,2431', '�Ͻ���', '511922', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2435', '2431', '0,100001,2289,2431', 'ƽ����', '511923', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2436', '2289', '0,100001,2289', '������', '512000', '028', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2437', '2436', '0,100001,2289,2436', '�㽭��', '512002', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2438', '2436', '0,100001,2289,2436', '������', '512021', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2439', '2436', '0,100001,2289,2436', '������', '512022', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('244', '243', '0,100001,219,243', '����', '140302', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2440', '2436', '0,100001,2289,2436', '������', '512081', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2441', '2289', '0,100001,2289', '���Ӳ���Ǽ��������', '513200', '0837', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2442', '2441', '0,100001,2289,2441', '�봨��', '513221', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2443', '2441', '0,100001,2289,2441', '����', '513222', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2444', '2441', '0,100001,2289,2441', 'ï��', '513223', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2445', '2441', '0,100001,2289,2441', '������', '513224', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2446', '2441', '0,100001,2289,2441', '��կ����', '513225', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2447', '2441', '0,100001,2289,2441', '����', '513226', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2448', '2441', '0,100001,2289,2441', 'С����', '513227', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2449', '2441', '0,100001,2289,2441', '��ˮ��', '513228', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('245', '243', '0,100001,219,243', '����', '140303', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2450', '2441', '0,100001,2289,2441', '�������', '513229', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2451', '2441', '0,100001,2289,2441', '������', '513230', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2452', '2441', '0,100001,2289,2441', '������', '513231', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2453', '2441', '0,100001,2289,2441', '��������', '513232', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2454', '2441', '0,100001,2289,2441', '��ԭ��', '513233', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2455', '2289', '0,100001,2289', '���β���������', '513300', '0836', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2456', '2455', '0,100001,2289,2455', '������', '513321', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2457', '2455', '0,100001,2289,2455', '����', '513322', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2458', '2455', '0,100001,2289,2455', '������', '513323', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2459', '2455', '0,100001,2289,2455', '������', '513324', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('246', '243', '0,100001,219,243', '����', '140311', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2460', '2455', '0,100001,2289,2455', '�Ž���', '513325', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2461', '2455', '0,100001,2289,2455', '������', '513326', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2462', '2455', '0,100001,2289,2455', '¯����', '513327', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2463', '2455', '0,100001,2289,2455', '������', '513328', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2464', '2455', '0,100001,2289,2455', '������', '513329', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2465', '2455', '0,100001,2289,2455', '�¸���', '513330', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2466', '2455', '0,100001,2289,2455', '������', '513331', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2467', '2455', '0,100001,2289,2455', 'ʯ����', '513332', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2468', '2455', '0,100001,2289,2455', 'ɫ����', '513333', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2469', '2455', '0,100001,2289,2455', '������', '513334', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('247', '243', '0,100001,219,243', 'ƽ����', '140321', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2470', '2455', '0,100001,2289,2455', '������', '513335', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2471', '2455', '0,100001,2289,2455', '�����', '513336', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2472', '2455', '0,100001,2289,2455', '������', '513337', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2473', '2455', '0,100001,2289,2455', '������', '513338', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2474', '2289', '0,100001,2289', '��ɽ����������', '513400', '0834', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2475', '2474', '0,100001,2289,2474', '������', '513401', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2476', '2474', '0,100001,2289,2474', 'ľ�����������', '513422', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2477', '2474', '0,100001,2289,2474', '��Դ��', '513423', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2478', '2474', '0,100001,2289,2474', '�²���', '513424', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2479', '2474', '0,100001,2289,2474', '������', '513425', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('248', '243', '0,100001,219,243', '����', '140322', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2480', '2474', '0,100001,2289,2474', '�ᶫ��', '513426', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2481', '2474', '0,100001,2289,2474', '������', '513427', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2482', '2474', '0,100001,2289,2474', '�ո���', '513428', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2483', '2474', '0,100001,2289,2474', '������', '513429', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2484', '2474', '0,100001,2289,2474', '������', '513430', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2485', '2474', '0,100001,2289,2474', '�Ѿ���', '513431', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2486', '2474', '0,100001,2289,2474', 'ϲ����', '513432', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2487', '2474', '0,100001,2289,2474', '������', '513433', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2488', '2474', '0,100001,2289,2474', 'Խ����', '513434', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2489', '2474', '0,100001,2289,2474', '������', '513435', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('249', '219', '0,100001,219', '������', '140400', '0355', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2490', '2474', '0,100001,2289,2474', '������', '513436', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2491', '2474', '0,100001,2289,2474', '�ײ���', '513437', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2492', '100001', '0,100001', '����ʡ', '520000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2493', '2492', '0,100001,2492', '������', '520100', '0851', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2494', '2493', '0,100001,2492,2493', '������', '520102', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2495', '2493', '0,100001,2492,2493', '������', '520103', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2496', '2493', '0,100001,2492,2493', '��Ϫ��', '520111', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2497', '2493', '0,100001,2492,2493', '�ڵ���', '520112', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2498', '2493', '0,100001,2492,2493', '������', '520113', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2499', '2493', '0,100001,2492,2493', 'С����', '520114', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('25', '18', '0,100001,18', '������', '120110', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('250', '249', '0,100001,219,249', '����', '140402', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2500', '2493', '0,100001,2492,2493', '������', '520121', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2501', '2493', '0,100001,2492,2493', 'Ϣ����', '520122', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2502', '2493', '0,100001,2492,2493', '������', '520123', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2503', '2493', '0,100001,2492,2493', '������', '520181', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2504', '2492', '0,100001,2492', '����ˮ��', '520200', '0858', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2505', '2504', '0,100001,2492,2504', '��ɽ��', '520201', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2506', '2504', '0,100001,2492,2504', '��֦����', '520203', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2507', '2504', '0,100001,2492,2504', 'ˮ����', '520221', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2508', '2504', '0,100001,2492,2504', '����', '520222', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2509', '2492', '0,100001,2492', '������', '520300', '0852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('251', '249', '0,100001,219,249', '����', '140411', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2510', '2509', '0,100001,2492,2509', '�컨����', '520302', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2511', '2509', '0,100001,2492,2509', '�㴨��', '520303', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2512', '2509', '0,100001,2492,2509', '������', '520321', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2513', '2509', '0,100001,2492,2509', 'ͩ����', '520322', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2514', '2509', '0,100001,2492,2509', '������', '520323', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2515', '2509', '0,100001,2492,2509', '������', '520324', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2516', '2509', '0,100001,2492,2509', '��������������������', '520325', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2517', '2509', '0,100001,2492,2509', '������������������', '520326', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2518', '2509', '0,100001,2492,2509', '�����', '520327', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2519', '2509', '0,100001,2492,2509', '��̶��', '520328', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('252', '249', '0,100001,219,249', '������', '140421', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2520', '2509', '0,100001,2492,2509', '������', '520329', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2521', '2509', '0,100001,2492,2509', 'ϰˮ��', '520330', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2522', '2509', '0,100001,2492,2509', '��ˮ��', '520381', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2523', '2509', '0,100001,2492,2509', '�ʻ���', '520382', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2524', '2492', '0,100001,2492', '��˳��', '520400', '0853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2525', '2524', '0,100001,2492,2524', '������', '520402', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2526', '2524', '0,100001,2492,2524', 'ƽ����', '520421', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2527', '2524', '0,100001,2492,2524', '�ն���', '520422', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2528', '2524', '0,100001,2492,2524', '��������������������', '520423', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2529', '2524', '0,100001,2492,2524', '���벼��������������', '520424', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('253', '249', '0,100001,219,249', '��ԫ��', '140423', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2530', '2524', '0,100001,2492,2524', '�������岼����������', '520425', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2531', '2492', '0,100001,2492', '�Ͻ���', '520500', '0857', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2532', '2531', '0,100001,2492,2531', '���ǹ���', '520501', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2533', '2531', '0,100001,2492,2531', '����', '520522', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2534', '2531', '0,100001,2492,2531', 'ǭ����', '520523', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2535', '2531', '0,100001,2492,2531', '��ɳ��', '520524', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2536', '2531', '0,100001,2492,2531', '֯����', '520525', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2537', '2531', '0,100001,2492,2531', '��Ӻ��', '520526', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2538', '2531', '0,100001,2492,2531', '���������������������', '520527', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2539', '2531', '0,100001,2492,2531', '������', '520528', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('254', '249', '0,100001,219,249', '������', '140424', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2540', '2492', '0,100001,2492', 'ͭ����', '520600', '0856', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2541', '2540', '0,100001,2492,2540', '�̽���', '520601', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2542', '2540', '0,100001,2492,2540', '��ɽ��', '520602', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2543', '2540', '0,100001,2492,2540', '������', '520622', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2544', '2540', '0,100001,2492,2540', '��������������', '520623', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2545', '2540', '0,100001,2492,2540', 'ʯ����', '520624', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2546', '2540', '0,100001,2492,2540', '˼����', '520625', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2547', '2540', '0,100001,2492,2540', 'ӡ������������������', '520626', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2548', '2540', '0,100001,2492,2540', '�½���', '520627', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2549', '2540', '0,100001,2492,2540', '�غ�������������', '520628', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('255', '249', '0,100001,219,249', 'ƽ˳��', '140425', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2550', '2540', '0,100001,2492,2540', '��������������', '520629', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2551', '2492', '0,100001,2492', 'ǭ���ϲ���������������', '522300', '0859', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2552', '2551', '0,100001,2492,2551', '������', '522301', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2553', '2551', '0,100001,2492,2551', '������', '522322', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2554', '2551', '0,100001,2492,2551', '�հ���', '522323', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2555', '2551', '0,100001,2492,2551', '��¡��', '522324', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2556', '2551', '0,100001,2492,2551', '�����', '522325', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2557', '2551', '0,100001,2492,2551', '������', '522326', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2558', '2551', '0,100001,2492,2551', '�����', '522327', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2559', '2551', '0,100001,2492,2551', '������', '522328', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('256', '249', '0,100001,219,249', '�����', '140426', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2560', '2492', '0,100001,2492', 'ǭ�������嶱��������', '522600', '0855', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2561', '2560', '0,100001,2492,2560', '������', '522601', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2562', '2560', '0,100001,2492,2560', '��ƽ��', '522622', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2563', '2560', '0,100001,2492,2560', 'ʩ����', '522623', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2564', '2560', '0,100001,2492,2560', '������', '522624', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2565', '2560', '0,100001,2492,2560', '��Զ��', '522625', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2566', '2560', '0,100001,2492,2560', '᯹���', '522626', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2567', '2560', '0,100001,2492,2560', '������', '522627', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2568', '2560', '0,100001,2492,2560', '������', '522628', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2569', '2560', '0,100001,2492,2560', '������', '522629', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('257', '249', '0,100001,219,249', '������', '140427', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2570', '2560', '0,100001,2492,2560', '̨����', '522630', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2571', '2560', '0,100001,2492,2560', '��ƽ��', '522631', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2572', '2560', '0,100001,2492,2560', '�Ž���', '522632', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2573', '2560', '0,100001,2492,2560', '�ӽ���', '522633', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2574', '2560', '0,100001,2492,2560', '��ɽ��', '522634', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2575', '2560', '0,100001,2492,2560', '�齭��', '522635', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2576', '2560', '0,100001,2492,2560', '��կ��', '522636', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2577', '2492', '0,100001,2492', 'ǭ�ϲ���������������', '522700', '0854', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2578', '2577', '0,100001,2492,2577', '������', '522701', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2579', '2577', '0,100001,2492,2577', '��Ȫ��', '522702', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('258', '249', '0,100001,219,249', '������', '140428', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2580', '2577', '0,100001,2492,2577', '����', '522722', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2581', '2577', '0,100001,2492,2577', '����', '522723', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2582', '2577', '0,100001,2492,2577', '�Ͱ���', '522725', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2583', '2577', '0,100001,2492,2577', '��ɽ��', '522726', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2584', '2577', '0,100001,2492,2577', 'ƽ����', '522727', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2585', '2577', '0,100001,2492,2577', '�޵���', '522728', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2586', '2577', '0,100001,2492,2577', '��˳��', '522729', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2587', '2577', '0,100001,2492,2577', '������', '522730', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2588', '2577', '0,100001,2492,2577', '��ˮ��', '522731', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2589', '2577', '0,100001,2492,2577', '����ˮ��������', '522732', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('259', '249', '0,100001,219,249', '������', '140429', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2590', '100001', '0,100001', '����ʡ', '530000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2591', '2590', '0,100001,2590', '������', '530100', '0871', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2592', '2591', '0,100001,2590,2591', '�廪��', '530102', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2593', '2591', '0,100001,2590,2591', '������', '530103', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2594', '2591', '0,100001,2590,2591', '�ٶ���', '530111', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2595', '2591', '0,100001,2590,2591', '��ɽ��', '530112', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2596', '2591', '0,100001,2590,2591', '������', '530113', '0881', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2597', '2591', '0,100001,2590,2591', '�ʹ���', '530121', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2598', '2591', '0,100001,2590,2591', '������', '530122', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2599', '2591', '0,100001,2590,2591', '������', '530124', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('26', '18', '0,100001,18', '������', '120111', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('260', '249', '0,100001,219,249', '����', '140430', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2600', '2591', '0,100001,2590,2591', '������', '530125', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2601', '2591', '0,100001,2590,2591', 'ʯ������������', '530126', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2602', '2591', '0,100001,2590,2591', '������', '530127', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2603', '2591', '0,100001,2590,2591', '»Ȱ��������������', '530128', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2604', '2591', '0,100001,2590,2591', 'Ѱ���������������', '530129', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2605', '2591', '0,100001,2590,2591', '������', '530181', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2606', '2590', '0,100001,2590', '������', '530300', '0874', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2607', '2606', '0,100001,2590,2606', '������', '530302', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2608', '2606', '0,100001,2590,2606', '������', '530321', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2609', '2606', '0,100001,2590,2606', '½����', '530322', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('261', '249', '0,100001,219,249', '��Դ��', '140431', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2610', '2606', '0,100001,2590,2606', 'ʦ����', '530323', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2611', '2606', '0,100001,2590,2606', '��ƽ��', '530324', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2612', '2606', '0,100001,2590,2606', '��Դ��', '530325', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2613', '2606', '0,100001,2590,2606', '������', '530326', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2614', '2606', '0,100001,2590,2606', 'մ����', '530328', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2615', '2606', '0,100001,2590,2606', '������', '530381', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2616', '2590', '0,100001,2590', '��Ϫ��', '530400', '0877', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2617', '2616', '0,100001,2590,2616', '������', '530402', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2618', '2616', '0,100001,2590,2616', '������', '530421', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2619', '2616', '0,100001,2590,2616', '�ν���', '530422', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('262', '249', '0,100001,219,249', 'º����', '140481', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2620', '2616', '0,100001,2590,2616', 'ͨ����', '530423', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2621', '2616', '0,100001,2590,2616', '������', '530424', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2622', '2616', '0,100001,2590,2616', '������', '530425', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2623', '2616', '0,100001,2590,2616', '��ɽ����������', '530426', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2624', '2616', '0,100001,2590,2616', '��ƽ�������������', '530427', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2625', '2616', '0,100001,2590,2616', 'Ԫ���������������������', '530428', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2626', '2590', '0,100001,2590', '��ɽ��', '530500', '0875', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2627', '2626', '0,100001,2590,2626', '¡����', '530502', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2628', '2626', '0,100001,2590,2626', 'ʩ����', '530521', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2629', '2626', '0,100001,2590,2626', '�ڳ���', '530522', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('263', '219', '0,100001,219', '������', '140500', '0356', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2630', '2626', '0,100001,2590,2626', '������', '530523', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2631', '2626', '0,100001,2590,2626', '������', '530524', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2632', '2590', '0,100001,2590', '��ͨ��', '530600', '0870', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2633', '2632', '0,100001,2590,2632', '������', '530602', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2634', '2632', '0,100001,2590,2632', '³����', '530621', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2635', '2632', '0,100001,2590,2632', '�ɼ���', '530622', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2636', '2632', '0,100001,2590,2632', '�ν���', '530623', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2637', '2632', '0,100001,2590,2632', '�����', '530624', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2638', '2632', '0,100001,2590,2632', '������', '530625', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2639', '2632', '0,100001,2590,2632', '�罭��', '530626', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('264', '263', '0,100001,219,263', '����', '140502', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2640', '2632', '0,100001,2590,2632', '������', '530627', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2641', '2632', '0,100001,2590,2632', '������', '530628', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2642', '2632', '0,100001,2590,2632', '������', '530629', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2643', '2632', '0,100001,2590,2632', 'ˮ����', '530630', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2644', '2590', '0,100001,2590', '������', '530700', '0888', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2645', '2644', '0,100001,2590,2644', '�ų���', '530702', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2646', '2644', '0,100001,2590,2644', '����������������', '530721', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2647', '2644', '0,100001,2590,2644', '��ʤ��', '530722', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2648', '2644', '0,100001,2590,2644', '��ƺ��', '530723', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2649', '2644', '0,100001,2590,2644', '��������������', '530724', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('265', '263', '0,100001,219,263', '��ˮ��', '140521', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2650', '2590', '0,100001,2590', '�ն���', '530800', '0879', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2651', '2650', '0,100001,2590,2650', '˼é��', '530802', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2652', '2650', '0,100001,2590,2650', '��������������������', '530821', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2653', '2650', '0,100001,2590,2650', 'ī��������������', '530822', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2654', '2650', '0,100001,2590,2650', '��������������', '530823', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2655', '2650', '0,100001,2590,2650', '���ȴ�������������', '530824', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2656', '2650', '0,100001,2590,2650', '�������������������������', '530825', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2657', '2650', '0,100001,2590,2650', '���ǹ���������������', '530826', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2658', '2650', '0,100001,2590,2650', '������������������������', '530827', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2659', '2650', '0,100001,2590,2650', '����������������', '530828', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('266', '263', '0,100001,219,263', '������', '140522', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2660', '2650', '0,100001,2590,2650', '��������������', '530829', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2661', '2590', '0,100001,2590', '�ٲ���', '530900', '0883', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2662', '2661', '0,100001,2590,2661', '������', '530902', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2663', '2661', '0,100001,2590,2661', '������', '530921', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2664', '2661', '0,100001,2590,2661', '����', '530922', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2665', '2661', '0,100001,2590,2661', '������', '530923', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2666', '2661', '0,100001,2590,2661', '����', '530924', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2667', '2661', '0,100001,2590,2661', '˫�����������岼�������������', '530925', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2668', '2661', '0,100001,2590,2661', '�����������������', '530926', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2669', '2661', '0,100001,2590,2661', '��Դ����������', '530927', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('267', '263', '0,100001,219,263', '�괨��', '140524', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2670', '2590', '0,100001,2590', '��������������', '532300', '0878', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2671', '2670', '0,100001,2590,2670', '������', '532301', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2672', '2670', '0,100001,2590,2670', '˫����', '532322', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2673', '2670', '0,100001,2590,2670', 'Ĳ����', '532323', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2674', '2670', '0,100001,2590,2670', '�ϻ���', '532324', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2675', '2670', '0,100001,2590,2670', 'Ҧ����', '532325', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2676', '2670', '0,100001,2590,2670', '��Ҧ��', '532326', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2677', '2670', '0,100001,2590,2670', '������', '532327', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2678', '2670', '0,100001,2590,2670', 'Ԫı��', '532328', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2679', '2670', '0,100001,2590,2670', '�䶨��', '532329', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('268', '263', '0,100001,219,263', '������', '140525', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2680', '2670', '0,100001,2590,2670', '»����', '532331', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2681', '2590', '0,100001,2590', '��ӹ���������������', '532500', '0873', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2682', '2681', '0,100001,2590,2681', '������', '532501', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2683', '2681', '0,100001,2590,2681', '��Զ��', '532502', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2684', '2681', '0,100001,2590,2681', '������', '532503', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2685', '2681', '0,100001,2590,2681', '��������������', '532523', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2686', '2681', '0,100001,2590,2681', '��ˮ��', '532524', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2687', '2681', '0,100001,2590,2681', 'ʯ����', '532525', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2688', '2681', '0,100001,2590,2681', '������', '532526', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2689', '2681', '0,100001,2590,2681', '������', '532527', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('269', '263', '0,100001,219,263', '��ƽ��', '140581', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2690', '2681', '0,100001,2590,2681', 'Ԫ����', '532528', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2691', '2681', '0,100001,2590,2681', '�����', '532529', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2692', '2681', '0,100001,2590,2681', '��ƽ�����������������', '532530', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2693', '2681', '0,100001,2590,2681', '�̴���', '532531', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2694', '2681', '0,100001,2590,2681', '�ӿ�����������', '532532', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2695', '2590', '0,100001,2590', '��ɽ׳������������', '532600', '0876', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2696', '2695', '0,100001,2590,2695', '��ɽ��', '532621', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2697', '2695', '0,100001,2590,2695', '��ɽ��', '532622', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2698', '2695', '0,100001,2590,2695', '������', '532623', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2699', '2695', '0,100001,2590,2695', '��������', '532624', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('27', '18', '0,100001,18', '������', '120112', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('270', '219', '0,100001,219', '˷����', '140600', '0349', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2700', '2695', '0,100001,2590,2695', '�����', '532625', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2701', '2695', '0,100001,2590,2695', '����', '532626', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2702', '2695', '0,100001,2590,2695', '������', '532627', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2703', '2695', '0,100001,2590,2695', '������', '532628', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2704', '2590', '0,100001,2590', '��˫���ɴ���������', '532800', '0691', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2705', '2704', '0,100001,2590,2704', '������', '532801', '0691', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2706', '2704', '0,100001,2590,2704', '�º���', '532822', '0691', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2707', '2704', '0,100001,2590,2704', '������', '532823', '0691', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2708', '2590', '0,100001,2590', '�������������', '532900', '0872', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2709', '2708', '0,100001,2590,2708', '������', '532901', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('271', '270', '0,100001,219,270', '˷����', '140602', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2710', '2708', '0,100001,2590,2708', '�������������', '532922', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2711', '2708', '0,100001,2590,2708', '������', '532923', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2712', '2708', '0,100001,2590,2708', '������', '532924', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2713', '2708', '0,100001,2590,2708', '�ֶ���', '532925', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2714', '2708', '0,100001,2590,2708', '�Ͻ�����������', '532926', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2715', '2708', '0,100001,2590,2708', 'Ρɽ�������������', '532927', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2716', '2708', '0,100001,2590,2708', '��ƽ��', '532928', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2717', '2708', '0,100001,2590,2708', '������', '532929', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2718', '2708', '0,100001,2590,2708', '��Դ��', '532930', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2719', '2708', '0,100001,2590,2708', '������', '532931', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('272', '270', '0,100001,219,270', 'ƽ³��', '140603', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2720', '2708', '0,100001,2590,2708', '������', '532932', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2721', '2590', '0,100001,2590', '�º���徰����������', '533100', '0692', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2722', '2721', '0,100001,2590,2721', '������', '533102', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2723', '2721', '0,100001,2590,2721', 'â��', '533103', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2724', '2721', '0,100001,2590,2721', '������', '533122', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2725', '2721', '0,100001,2590,2721', 'ӯ����', '533123', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2726', '2721', '0,100001,2590,2721', '¤����', '533124', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2727', '2590', '0,100001,2590', 'ŭ��������������', '533300', '0886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2728', '2727', '0,100001,2590,2727', '��ˮ��', '533321', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2729', '2727', '0,100001,2590,2727', '������', '533323', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('273', '270', '0,100001,219,270', 'ɽ����', '140621', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2730', '2727', '0,100001,2590,2727', '��ɽ������ŭ��������', '533324', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2731', '2727', '0,100001,2590,2727', '��ƺ����������������', '533325', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2732', '2590', '0,100001,2590', '�������������', '533400', '0887', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2733', '2732', '0,100001,2590,2732', '���������', '533421', '0887', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2734', '2732', '0,100001,2590,2732', '������', '533422', '0887', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2735', '2732', '0,100001,2590,2732', 'ά��������������', '533423', '0887', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2736', '100001', '0,100001', '����������', '540000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2737', '2736', '0,100001,2736', '������', '540100', '0891', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2738', '2737', '0,100001,2736,2737', '�ǹ���', '540102', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2739', '2737', '0,100001,2736,2737', '������', '540121', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('274', '270', '0,100001,219,270', 'Ӧ��', '140622', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2740', '2737', '0,100001,2736,2737', '������', '540122', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2741', '2737', '0,100001,2736,2737', '��ľ��', '540123', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2742', '2737', '0,100001,2736,2737', '��ˮ��', '540124', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2743', '2737', '0,100001,2736,2737', '����������', '540125', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2744', '2737', '0,100001,2736,2737', '������', '540126', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2745', '2737', '0,100001,2736,2737', 'ī�񹤿���', '540127', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2746', '2736', '0,100001,2736', '��������', '542100', '0895', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2747', '2746', '0,100001,2736,2746', '������', '542121', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2748', '2746', '0,100001,2736,2746', '������', '542122', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2749', '2746', '0,100001,2736,2746', '������', '542123', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('275', '270', '0,100001,219,270', '������', '140623', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2750', '2746', '0,100001,2736,2746', '��������', '542124', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2751', '2746', '0,100001,2736,2746', '������', '542125', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2752', '2746', '0,100001,2736,2746', '������', '542126', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2753', '2746', '0,100001,2736,2746', '������', '542127', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2754', '2746', '0,100001,2736,2746', '����', '542128', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2755', '2746', '0,100001,2736,2746', 'â����', '542129', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2756', '2746', '0,100001,2736,2746', '��¡��', '542132', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2757', '2746', '0,100001,2736,2746', '�߰���', '542133', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2758', '2736', '0,100001,2736', 'ɽ�ϵ���', '542200', '0893', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2759', '2758', '0,100001,2736,2758', '�˶���', '542221', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('276', '270', '0,100001,219,270', '������', '140624', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2760', '2758', '0,100001,2736,2758', '������', '542222', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2761', '2758', '0,100001,2736,2758', '������', '542223', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2762', '2758', '0,100001,2736,2758', 'ɣ����', '542224', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2763', '2758', '0,100001,2736,2758', '�����', '542225', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2764', '2758', '0,100001,2736,2758', '������', '542226', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2765', '2758', '0,100001,2736,2758', '������', '542227', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2766', '2758', '0,100001,2736,2758', '������', '542228', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2767', '2758', '0,100001,2736,2758', '�Ӳ���', '542229', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2768', '2758', '0,100001,2736,2758', '¡����', '542231', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2769', '2758', '0,100001,2736,2758', '������', '542232', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('277', '219', '0,100001,219', '������', '140700', '0354', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2770', '2758', '0,100001,2736,2758', '�˿�����', '542233', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2771', '2736', '0,100001,2736', '�տ������', '542300', '0892', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2772', '2771', '0,100001,2736,2771', '�տ�����', '542301', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2773', '2771', '0,100001,2736,2771', '��ľ����', '542322', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2774', '2771', '0,100001,2736,2771', '������', '542323', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2775', '2771', '0,100001,2736,2771', '������', '542324', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2776', '2771', '0,100001,2736,2771', '������', '542325', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2777', '2771', '0,100001,2736,2771', '������', '542326', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2778', '2771', '0,100001,2736,2771', '������', '542327', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2779', '2771', '0,100001,2736,2771', 'лͨ����', '542328', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('278', '277', '0,100001,219,277', '�ܴ���', '140702', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2780', '2771', '0,100001,2736,2771', '������', '542329', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2781', '2771', '0,100001,2736,2771', '�ʲ���', '542330', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2782', '2771', '0,100001,2736,2771', '������', '542331', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2783', '2771', '0,100001,2736,2771', '������', '542332', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2784', '2771', '0,100001,2736,2771', '�ٰ���', '542333', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2785', '2771', '0,100001,2736,2771', '�Ƕ���', '542334', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2786', '2771', '0,100001,2736,2771', '��¡��', '542335', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2787', '2771', '0,100001,2736,2771', '����ľ��', '542336', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2788', '2771', '0,100001,2736,2771', '������', '542337', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2789', '2771', '0,100001,2736,2771', '�ڰ���', '542338', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('279', '277', '0,100001,219,277', '������', '140721', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2790', '2736', '0,100001,2736', '��������', '542400', '0896', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2791', '2790', '0,100001,2736,2790', '������', '542421', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2792', '2790', '0,100001,2736,2790', '������', '542422', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2793', '2790', '0,100001,2736,2790', '������', '542423', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2794', '2790', '0,100001,2736,2790', '������', '542424', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2795', '2790', '0,100001,2736,2790', '������', '542425', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2796', '2790', '0,100001,2736,2790', '������', '542426', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2797', '2790', '0,100001,2736,2790', '����', '542427', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2798', '2790', '0,100001,2736,2790', '�����', '542428', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2799', '2790', '0,100001,2736,2790', '������', '542429', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('28', '18', '0,100001,18', '������', '120113', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('280', '277', '0,100001,219,277', '��Ȩ��', '140722', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2800', '2790', '0,100001,2736,2790', '������', '542430', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2801', '2736', '0,100001,2736', '�������', '542500', '0897', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2802', '2801', '0,100001,2736,2801', '������', '542521', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2803', '2801', '0,100001,2736,2801', '������', '542522', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2804', '2801', '0,100001,2736,2801', '������', '542523', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2805', '2801', '0,100001,2736,2801', '������', '542524', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2806', '2801', '0,100001,2736,2801', '�Ｊ��', '542525', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2807', '2801', '0,100001,2736,2801', '������', '542526', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2808', '2801', '0,100001,2736,2801', '������', '542527', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2809', '2736', '0,100001,2736', '��֥����', '542600', '0894', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('281', '277', '0,100001,219,277', '��˳��', '140723', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2810', '2809', '0,100001,2736,2809', '��֥��', '542621', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2811', '2809', '0,100001,2736,2809', '����������', '542622', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2812', '2809', '0,100001,2736,2809', '������', '542623', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2813', '2809', '0,100001,2736,2809', 'ī����', '542624', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2814', '2809', '0,100001,2736,2809', '������', '542625', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2815', '2809', '0,100001,2736,2809', '������', '542626', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2816', '2809', '0,100001,2736,2809', '����', '542627', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2817', '100001', '0,100001', '����ʡ', '610000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2818', '2817', '0,100001,2817', '������', '610100', '029', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2819', '2818', '0,100001,2817,2818', '�³���', '610102', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('282', '277', '0,100001,219,277', '������', '140724', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2820', '2818', '0,100001,2817,2818', '������', '610103', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2821', '2818', '0,100001,2817,2818', '������', '610104', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2822', '2818', '0,100001,2817,2818', '�����', '610111', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2823', '2818', '0,100001,2817,2818', 'δ����', '610112', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2824', '2818', '0,100001,2817,2818', '������', '610113', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2825', '2818', '0,100001,2817,2818', '������', '610114', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2826', '2818', '0,100001,2817,2818', '������', '610115', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2827', '2818', '0,100001,2817,2818', '������', '610116', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2828', '2818', '0,100001,2817,2818', '������', '610122', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2829', '2818', '0,100001,2817,2818', '������', '610124', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('283', '277', '0,100001,219,277', '������', '140725', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2830', '2818', '0,100001,2817,2818', '����', '610125', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2831', '2818', '0,100001,2817,2818', '������', '610126', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2832', '2817', '0,100001,2817', 'ͭ����', '610200', '0919', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2833', '2832', '0,100001,2817,2832', '������', '610202', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2834', '2832', '0,100001,2817,2832', 'ӡ̨��', '610203', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2835', '2832', '0,100001,2817,2832', 'ҫ����', '610204', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2836', '2832', '0,100001,2817,2832', '�˾���', '610222', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2837', '2817', '0,100001,2817', '������', '610300', '0917', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2838', '2837', '0,100001,2817,2837', 'μ����', '610302', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2839', '2837', '0,100001,2817,2837', '��̨��', '610303', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('284', '277', '0,100001,219,277', '̫����', '140726', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2840', '2837', '0,100001,2817,2837', '�²���', '610304', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2841', '2837', '0,100001,2817,2837', '������', '610322', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2842', '2837', '0,100001,2817,2837', '�ɽ��', '610323', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2843', '2837', '0,100001,2817,2837', '������', '610324', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2844', '2837', '0,100001,2817,2837', 'ü��', '610326', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2845', '2837', '0,100001,2817,2837', '¤��', '610327', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2846', '2837', '0,100001,2817,2837', 'ǧ����', '610328', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2847', '2837', '0,100001,2817,2837', '������', '610329', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2848', '2837', '0,100001,2817,2837', '����', '610330', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2849', '2837', '0,100001,2817,2837', '̫����', '610331', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('285', '277', '0,100001,219,277', '����', '140727', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2850', '2817', '0,100001,2817', '������', '610400', '0910', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2851', '2850', '0,100001,2817,2850', '�ض���', '610402', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2852', '2850', '0,100001,2817,2850', '������', '610403', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2853', '2850', '0,100001,2817,2850', 'μ����', '610404', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2854', '2850', '0,100001,2817,2850', '��ԭ��', '610422', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2855', '2850', '0,100001,2817,2850', '������', '610423', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2856', '2850', '0,100001,2817,2850', 'Ǭ��', '610424', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2857', '2850', '0,100001,2817,2850', '��Ȫ��', '610425', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2858', '2850', '0,100001,2817,2850', '������', '610426', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2859', '2850', '0,100001,2817,2850', '����', '610427', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('286', '277', '0,100001,219,277', 'ƽң��', '140728', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2860', '2850', '0,100001,2817,2850', '������', '610428', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2861', '2850', '0,100001,2817,2850', 'Ѯ����', '610429', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2862', '2850', '0,100001,2817,2850', '������', '610430', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2863', '2850', '0,100001,2817,2850', '�书��', '610431', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2864', '2850', '0,100001,2817,2850', '��ƽ��', '610481', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2865', '2817', '0,100001,2817', 'μ����', '610500', '0913', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2866', '2865', '0,100001,2817,2865', '��μ��', '610502', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2867', '2865', '0,100001,2817,2865', '����', '610521', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2868', '2865', '0,100001,2817,2865', '������', '610522', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2869', '2865', '0,100001,2817,2865', '������', '610523', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('287', '277', '0,100001,219,277', '��ʯ��', '140729', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2870', '2865', '0,100001,2817,2865', '������', '610524', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2871', '2865', '0,100001,2817,2865', '�γ���', '610525', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2872', '2865', '0,100001,2817,2865', '�ѳ���', '610526', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2873', '2865', '0,100001,2817,2865', '��ˮ��', '610527', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2874', '2865', '0,100001,2817,2865', '��ƽ��', '610528', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2875', '2865', '0,100001,2817,2865', '������', '610581', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2876', '2865', '0,100001,2817,2865', '������', '610582', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2877', '2817', '0,100001,2817', '�Ӱ���', '610600', '0911', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2878', '2877', '0,100001,2817,2877', '������', '610602', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2879', '2877', '0,100001,2817,2877', '�ӳ���', '610621', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('288', '277', '0,100001,219,277', '������', '140781', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2880', '2877', '0,100001,2817,2877', '�Ӵ���', '610622', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2881', '2877', '0,100001,2817,2877', '�ӳ���', '610623', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2882', '2877', '0,100001,2817,2877', '������', '610624', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2883', '2877', '0,100001,2817,2877', '־����', '610625', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2884', '2877', '0,100001,2817,2877', '������', '610626', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2885', '2877', '0,100001,2817,2877', '��Ȫ��', '610627', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2886', '2877', '0,100001,2817,2877', '����', '610628', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2887', '2877', '0,100001,2817,2877', '�崨��', '610629', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2888', '2877', '0,100001,2817,2877', '�˴���', '610630', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2889', '2877', '0,100001,2817,2877', '������', '610631', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('289', '219', '0,100001,219', '�˳���', '140800', '0359', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2890', '2877', '0,100001,2817,2877', '������', '610632', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2891', '2817', '0,100001,2817', '������', '610700', '0916', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2892', '2891', '0,100001,2817,2891', '��̨��', '610702', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2893', '2891', '0,100001,2817,2891', '��֣��', '610721', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2894', '2891', '0,100001,2817,2891', '�ǹ���', '610722', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2895', '2891', '0,100001,2817,2891', '����', '610723', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2896', '2891', '0,100001,2817,2891', '������', '610724', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2897', '2891', '0,100001,2817,2891', '����', '610725', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2898', '2891', '0,100001,2817,2891', '��ǿ��', '610726', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2899', '2891', '0,100001,2817,2891', '������', '610727', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('29', '18', '0,100001,18', '������', '120114', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('290', '289', '0,100001,219,289', '�κ���', '140802', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2900', '2891', '0,100001,2817,2891', '�����', '610728', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2901', '2891', '0,100001,2817,2891', '������', '610729', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2902', '2891', '0,100001,2817,2891', '��ƺ��', '610730', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2903', '2817', '0,100001,2817', '������', '610800', '0912', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2904', '2903', '0,100001,2817,2903', '������', '610802', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2905', '2903', '0,100001,2817,2903', '��ľ��', '610821', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2906', '2903', '0,100001,2817,2903', '������', '610822', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2907', '2903', '0,100001,2817,2903', '��ɽ��', '610823', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2908', '2903', '0,100001,2817,2903', '������', '610824', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2909', '2903', '0,100001,2817,2903', '������', '610825', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('291', '289', '0,100001,219,289', '�����', '140821', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2910', '2903', '0,100001,2817,2903', '�����', '610826', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2911', '2903', '0,100001,2817,2903', '��֬��', '610827', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2912', '2903', '0,100001,2817,2903', '����', '610828', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2913', '2903', '0,100001,2817,2903', '�Ɽ��', '610829', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2914', '2903', '0,100001,2817,2903', '�彧��', '610830', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2915', '2903', '0,100001,2817,2903', '������', '610831', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2916', '2817', '0,100001,2817', '������', '610900', '0915', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2917', '2916', '0,100001,2817,2916', '������', '610902', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2918', '2916', '0,100001,2817,2916', '������', '610921', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2919', '2916', '0,100001,2817,2916', 'ʯȪ��', '610922', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('292', '289', '0,100001,219,289', '������', '140822', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2920', '2916', '0,100001,2817,2916', '������', '610923', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2921', '2916', '0,100001,2817,2916', '������', '610924', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2922', '2916', '0,100001,2817,2916', '᰸���', '610925', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2923', '2916', '0,100001,2817,2916', 'ƽ����', '610926', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2924', '2916', '0,100001,2817,2916', '��ƺ��', '610927', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2925', '2916', '0,100001,2817,2916', 'Ѯ����', '610928', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2926', '2916', '0,100001,2817,2916', '�׺���', '610929', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2927', '2817', '0,100001,2817', '������', '611000', '0914', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2928', '2927', '0,100001,2817,2927', '������', '611002', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2929', '2927', '0,100001,2817,2927', '������', '611021', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('293', '289', '0,100001,219,289', '��ϲ��', '140823', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2930', '2927', '0,100001,2817,2927', '������', '611022', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2931', '2927', '0,100001,2817,2927', '������', '611023', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2932', '2927', '0,100001,2817,2927', 'ɽ����', '611024', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2933', '2927', '0,100001,2817,2927', '����', '611025', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2934', '2927', '0,100001,2817,2927', '��ˮ��', '611026', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2935', '100001', '0,100001', '����ʡ', '620000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2936', '2935', '0,100001,2935', '������', '620100', '0931', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2937', '2936', '0,100001,2935,2936', '�ǹ���', '620102', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2938', '2936', '0,100001,2935,2936', '�������', '620103', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2939', '2936', '0,100001,2935,2936', '������', '620104', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('294', '289', '0,100001,219,289', '�ɽ��', '140824', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2940', '2936', '0,100001,2935,2936', '������', '620105', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2941', '2936', '0,100001,2935,2936', '�����', '620111', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2942', '2936', '0,100001,2935,2936', '������', '620121', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2943', '2936', '0,100001,2935,2936', '������', '620122', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2944', '2936', '0,100001,2935,2936', '������', '620123', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2945', '2935', '0,100001,2935', '��������', '620200', '0937', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2946', '2945', '0,100001,2935,2945', '��������', '620201', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2947', '2935', '0,100001,2935', '�����', '620300', '0935', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2948', '2947', '0,100001,2935,2947', '����', '620302', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2949', '2947', '0,100001,2935,2947', '������', '620321', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('295', '289', '0,100001,219,289', '�����', '140825', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2950', '2935', '0,100001,2935', '������', '620400', '0943', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2951', '2950', '0,100001,2935,2950', '������', '620402', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2952', '2950', '0,100001,2935,2950', 'ƽ����', '620403', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2953', '2950', '0,100001,2935,2950', '��Զ��', '620421', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2954', '2950', '0,100001,2935,2950', '������', '620422', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2955', '2950', '0,100001,2935,2950', '��̩��', '620423', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2956', '2935', '0,100001,2935', '��ˮ��', '620500', '0938', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2957', '2956', '0,100001,2935,2956', '������', '620502', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2958', '2956', '0,100001,2935,2956', '�����', '620503', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2959', '2956', '0,100001,2935,2956', '��ˮ��', '620521', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('296', '289', '0,100001,219,289', '���', '140826', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2960', '2956', '0,100001,2935,2956', '�ذ���', '620522', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2961', '2956', '0,100001,2935,2956', '�ʹ���', '620523', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2962', '2956', '0,100001,2935,2956', '��ɽ��', '620524', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2963', '2956', '0,100001,2935,2956', '�żҴ�����������', '620525', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2964', '2935', '0,100001,2935', '������', '620600', '0935', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2965', '2964', '0,100001,2935,2964', '������', '620602', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2966', '2964', '0,100001,2935,2964', '������', '620621', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2967', '2964', '0,100001,2935,2964', '������', '620622', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2968', '2964', '0,100001,2935,2964', '��ף����������', '620623', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2969', '2935', '0,100001,2935', '��Ҵ��', '620700', '0936', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('297', '289', '0,100001,219,289', 'ԫ����', '140827', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2970', '2969', '0,100001,2935,2969', '������', '620702', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2971', '2969', '0,100001,2935,2969', '����ԣ����������', '620721', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2972', '2969', '0,100001,2935,2969', '������', '620722', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2973', '2969', '0,100001,2935,2969', '������', '620723', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2974', '2969', '0,100001,2935,2969', '��̨��', '620724', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2975', '2969', '0,100001,2935,2969', 'ɽ����', '620725', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2976', '2935', '0,100001,2935', 'ƽ����', '620800', '0933', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2977', '2976', '0,100001,2935,2976', '�����', '620802', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2978', '2976', '0,100001,2935,2976', '������', '620821', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2979', '2976', '0,100001,2935,2976', '��̨��', '620822', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('298', '289', '0,100001,219,289', '����', '140828', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2980', '2976', '0,100001,2935,2976', '������', '620823', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2981', '2976', '0,100001,2935,2976', '��ͤ��', '620824', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2982', '2976', '0,100001,2935,2976', 'ׯ����', '620825', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2983', '2976', '0,100001,2935,2976', '������', '620826', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2984', '2935', '0,100001,2935', '��Ȫ��', '620900', '0937', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2985', '2984', '0,100001,2935,2984', '������', '620902', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2986', '2984', '0,100001,2935,2984', '������', '620921', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2987', '2984', '0,100001,2935,2984', '������', '620922', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2988', '2984', '0,100001,2935,2984', '�౱�ɹ���������', '620923', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2989', '2984', '0,100001,2935,2984', '��������������������', '620924', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('299', '289', '0,100001,219,289', 'ƽ½��', '140829', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2990', '2984', '0,100001,2935,2984', '������', '620981', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2991', '2984', '0,100001,2935,2984', '�ػ���', '620982', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2992', '2935', '0,100001,2935', '������', '621000', '0934', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2993', '2992', '0,100001,2935,2992', '������', '621002', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2994', '2992', '0,100001,2935,2992', '�����', '621021', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2995', '2992', '0,100001,2935,2992', '����', '621022', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2996', '2992', '0,100001,2935,2992', '������', '621023', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2997', '2992', '0,100001,2935,2992', '��ˮ��', '621024', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2998', '2992', '0,100001,2935,2992', '������', '621025', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2999', '2992', '0,100001,2935,2992', '����', '621026', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3', '1', '0,100001,1', '������', '110102', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('30', '18', '0,100001,18', '������', '120115', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('300', '289', '0,100001,219,289', '�ǳ���', '140830', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3000', '2992', '0,100001,2935,2992', '��ԭ��', '621027', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3001', '2935', '0,100001,2935', '������', '621100', '0932', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3002', '3001', '0,100001,2935,3001', '������', '621102', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3003', '3001', '0,100001,2935,3001', 'ͨμ��', '621121', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3004', '3001', '0,100001,2935,3001', '¤����', '621122', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3005', '3001', '0,100001,2935,3001', 'μԴ��', '621123', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3006', '3001', '0,100001,2935,3001', '�����', '621124', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3007', '3001', '0,100001,2935,3001', '����', '621125', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3008', '3001', '0,100001,2935,3001', '���', '621126', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3009', '2935', '0,100001,2935', '¤����', '621200', '0939', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('301', '289', '0,100001,219,289', '������', '140881', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3010', '3009', '0,100001,2935,3009', '�䶼��', '621202', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3011', '3009', '0,100001,2935,3009', '����', '621221', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3012', '3009', '0,100001,2935,3009', '����', '621222', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3013', '3009', '0,100001,2935,3009', '崲���', '621223', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3014', '3009', '0,100001,2935,3009', '����', '621224', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3015', '3009', '0,100001,2935,3009', '������', '621225', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3016', '3009', '0,100001,2935,3009', '����', '621226', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3017', '3009', '0,100001,2935,3009', '����', '621227', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3018', '3009', '0,100001,2935,3009', '������', '621228', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3019', '2935', '0,100001,2935', '���Ļ���������', '622900', '0930', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('302', '289', '0,100001,219,289', '�ӽ���', '140882', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3020', '3019', '0,100001,2935,3019', '������', '622901', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3021', '3019', '0,100001,2935,3019', '������', '622921', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3022', '3019', '0,100001,2935,3019', '������', '622922', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3023', '3019', '0,100001,2935,3019', '������', '622923', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3024', '3019', '0,100001,2935,3019', '�����', '622924', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3025', '3019', '0,100001,2935,3019', '������', '622925', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3026', '3019', '0,100001,2935,3019', '������������', '622926', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3027', '3019', '0,100001,2935,3019', '��ʯɽ�����嶫����������������', '622927', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3028', '2935', '0,100001,2935', '���ϲ���������', '623000', '0941', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3029', '3028', '0,100001,2935,3028', '������', '623001', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('303', '219', '0,100001,219', '������', '140900', '0350', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3030', '3028', '0,100001,2935,3028', '��̶��', '623021', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3031', '3028', '0,100001,2935,3028', '׿����', '623022', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3032', '3028', '0,100001,2935,3028', '������', '623023', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3033', '3028', '0,100001,2935,3028', '������', '623024', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3034', '3028', '0,100001,2935,3028', '������', '623025', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3035', '3028', '0,100001,2935,3028', 'µ����', '623026', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3036', '3028', '0,100001,2935,3028', '�ĺ���', '623027', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3037', '100001', '0,100001', '�ຣʡ', '630000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3038', '3037', '0,100001,3037', '������', '630100', '0971', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3039', '3038', '0,100001,3037,3038', '�Ƕ���', '630102', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('304', '303', '0,100001,219,303', '�ø���', '140902', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3040', '3038', '0,100001,3037,3038', '������', '630103', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3041', '3038', '0,100001,3037,3038', '������', '630104', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3042', '3038', '0,100001,3037,3038', '�Ǳ���', '630105', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3043', '3038', '0,100001,3037,3038', '��ͨ��������������', '630121', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3044', '3038', '0,100001,3037,3038', '������', '630122', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3045', '3038', '0,100001,3037,3038', '��Դ��', '630123', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3046', '3037', '0,100001,3037', '��������', '632100', '0972', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3047', '3046', '0,100001,3037,3046', 'ƽ����', '632121', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3048', '3046', '0,100001,3037,3046', '��ͻ�������������', '632122', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3049', '3046', '0,100001,3037,3046', '�ֶ���', '632123', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('305', '303', '0,100001,219,303', '������', '140921', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3050', '3046', '0,100001,3037,3046', '��������������', '632126', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3051', '3046', '0,100001,3037,3046', '��¡����������', '632127', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3052', '3046', '0,100001,3037,3046', 'ѭ��������������', '632128', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3053', '3037', '0,100001,3037', '��������������', '632200', '0970', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3054', '3053', '0,100001,3037,3053', '��Դ����������', '632221', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3055', '3053', '0,100001,3037,3053', '������', '632222', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3056', '3053', '0,100001,3037,3053', '������', '632223', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3057', '3053', '0,100001,3037,3053', '�ղ���', '632224', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3058', '3037', '0,100001,3037', '���ϲ���������', '632300', '0973', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3059', '3058', '0,100001,3037,3058', 'ͬ����', '632321', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('306', '303', '0,100001,219,303', '��̨��', '140922', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3060', '3058', '0,100001,3037,3058', '������', '632322', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3061', '3058', '0,100001,3037,3058', '�����', '632323', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3062', '3058', '0,100001,3037,3058', '�����ɹ���������', '632324', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3063', '3037', '0,100001,3037', '���ϲ���������', '632500', '0974', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3064', '3063', '0,100001,3037,3063', '������', '632521', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3065', '3063', '0,100001,3037,3063', 'ͬ����', '632522', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3066', '3063', '0,100001,3037,3063', '�����', '632523', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3067', '3063', '0,100001,3037,3063', '�˺���', '632524', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3068', '3063', '0,100001,3037,3063', '������', '632525', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3069', '3037', '0,100001,3037', '�������������', '632600', '0975', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('307', '303', '0,100001,219,303', '����', '140923', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3070', '3069', '0,100001,3037,3069', '������', '632621', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3071', '3069', '0,100001,3037,3069', '������', '632622', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3072', '3069', '0,100001,3037,3069', '�ʵ���', '632623', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3073', '3069', '0,100001,3037,3069', '������', '632624', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3074', '3069', '0,100001,3037,3069', '������', '632625', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3075', '3069', '0,100001,3037,3069', '�����', '632626', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3076', '3037', '0,100001,3037', '��������������', '632700', '0976', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3077', '3076', '0,100001,3037,3076', '������', '632721', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3078', '3076', '0,100001,3037,3076', '�Ӷ���', '632722', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3079', '3076', '0,100001,3037,3076', '�ƶ���', '632723', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('308', '303', '0,100001,219,303', '������', '140924', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3080', '3076', '0,100001,3037,3076', '�ζ���', '632724', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3081', '3076', '0,100001,3037,3076', '��ǫ��', '632725', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3082', '3076', '0,100001,3037,3076', '��������', '632726', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3083', '3037', '0,100001,3037', '�����ɹ������������', '632800', '0977', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3084', '3083', '0,100001,3037,3083', '���ľ��', '632801', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3085', '3083', '0,100001,3037,3083', '�������', '632802', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3086', '3083', '0,100001,3037,3083', '������', '632821', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3087', '3083', '0,100001,3037,3083', '������', '632822', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3088', '3083', '0,100001,3037,3083', '�����', '632823', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3089', '100001', '0,100001', '���Ļ���������', '640000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('309', '303', '0,100001,219,303', '������', '140925', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3090', '3089', '0,100001,3089', '������', '640100', '0951', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3091', '3090', '0,100001,3089,3090', '������', '640104', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3092', '3090', '0,100001,3089,3090', '������', '640105', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3093', '3090', '0,100001,3089,3090', '�����', '640106', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3094', '3090', '0,100001,3089,3090', '������', '640121', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3095', '3090', '0,100001,3089,3090', '������', '640122', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3096', '3090', '0,100001,3089,3090', '������', '640181', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3097', '3089', '0,100001,3089', 'ʯ��ɽ��', '640200', '0952', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3098', '3097', '0,100001,3089,3097', '�������', '640202', '0952', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3099', '3097', '0,100001,3089,3097', '��ũ��', '640205', '0952', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('31', '18', '0,100001,18', '��������', '120116', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('310', '303', '0,100001,219,303', '������', '140926', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3100', '3097', '0,100001,3089,3097', 'ƽ����', '640221', '0952', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3101', '3089', '0,100001,3089', '������', '640300', '0953', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3102', '3101', '0,100001,3089,3101', '��ͨ��', '640302', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3103', '3101', '0,100001,3089,3101', '���±���', '640303', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3104', '3101', '0,100001,3089,3101', '�γ���', '640323', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3105', '3101', '0,100001,3089,3101', 'ͬ����', '640324', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3106', '3101', '0,100001,3089,3101', '��ͭϿ��', '640381', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3107', '3089', '0,100001,3089', '��ԭ��', '640400', '0954', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3108', '3107', '0,100001,3089,3107', 'ԭ����', '640402', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3109', '3107', '0,100001,3089,3107', '������', '640422', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('311', '303', '0,100001,219,303', '�����', '140927', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3110', '3107', '0,100001,3089,3107', '¡����', '640423', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3111', '3107', '0,100001,3089,3107', '��Դ��', '640424', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3112', '3107', '0,100001,3089,3107', '������', '640425', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3113', '3089', '0,100001,3089', '������', '640500', '0977', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3114', '3113', '0,100001,3089,3113', 'ɳ��ͷ��', '640502', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3115', '3113', '0,100001,3089,3113', '������', '640521', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3116', '3113', '0,100001,3089,3113', '��ԭ��', '640522', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3117', '100001', '0,100001', '�½�ά���������', '650000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3118', '3117', '0,100001,3117', '��³ľ����', '650100', '0991', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3119', '3118', '0,100001,3117,3118', '��ɽ��', '650102', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('312', '303', '0,100001,219,303', '��կ��', '140928', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3120', '3118', '0,100001,3117,3118', 'ɳ���Ϳ���', '650103', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3121', '3118', '0,100001,3117,3118', '������', '650104', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3122', '3118', '0,100001,3117,3118', 'ˮĥ����', '650105', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3123', '3118', '0,100001,3117,3118', 'ͷ�ͺ���', '650106', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3124', '3118', '0,100001,3117,3118', '�������', '650107', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3125', '3118', '0,100001,3117,3118', '�׶���', '650109', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3126', '3118', '0,100001,3117,3118', '��³ľ����', '650121', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3127', '3117', '0,100001,3117', '����������', '650200', '0990', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3128', '3127', '0,100001,3117,3127', '��ɽ����', '650202', '0992', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3129', '3127', '0,100001,3117,3127', '����������', '650203', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('313', '303', '0,100001,219,303', '����', '140929', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3130', '3127', '0,100001,3117,3127', '�׼�̲��', '650204', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3131', '3127', '0,100001,3117,3127', '�ڶ�����', '650205', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3132', '3117', '0,100001,3117', '��³������', '652100', '0995', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3133', '3132', '0,100001,3117,3132', '��³����', '652101', '0995', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3134', '3132', '0,100001,3117,3132', '۷����', '652122', '0995', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3135', '3132', '0,100001,3117,3132', '�п�ѷ��', '652123', '0995', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3136', '3117', '0,100001,3117', '���ܵ���', '652200', '0902', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3137', '3136', '0,100001,3117,3136', '������', '652201', '0902', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3138', '3136', '0,100001,3117,3136', '������������������', '652222', '0902', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3139', '3136', '0,100001,3117,3136', '������', '652223', '0902', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('314', '303', '0,100001,219,303', '������', '140930', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3140', '3117', '0,100001,3117', '��������������', '652300', '0994', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3141', '3140', '0,100001,3117,3140', '������', '652301', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3142', '3140', '0,100001,3117,3140', '������', '652302', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3143', '3140', '0,100001,3117,3140', '��ͼ����', '652323', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3144', '3140', '0,100001,3117,3140', '����˹��', '652324', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3145', '3140', '0,100001,3117,3140', '��̨��', '652325', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3146', '3140', '0,100001,3117,3140', '��ľ������', '652327', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3147', '3140', '0,100001,3117,3140', 'ľ�ݹ�����������', '652328', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3148', '3117', '0,100001,3117', '���������ɹ�������', '652700', '0909', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3149', '3148', '0,100001,3117,3148', '������', '652701', '0909', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('315', '303', '0,100001,219,303', '������', '140931', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3150', '3148', '0,100001,3117,3148', '������', '652722', '0909', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3151', '3148', '0,100001,3117,3148', '��Ȫ��', '652723', '0909', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3152', '3117', '0,100001,3117', '���������ɹ�������', '652800', '0996', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3153', '3152', '0,100001,3117,3152', '�������', '652801', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3154', '3152', '0,100001,3117,3152', '��̨��', '652822', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3155', '3152', '0,100001,3117,3152', 'ξ����', '652823', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3156', '3152', '0,100001,3117,3152', '��Ǽ��', '652824', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3157', '3152', '0,100001,3117,3152', '��ĩ��', '652825', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3158', '3152', '0,100001,3117,3152', '���Ȼ���������', '652826', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3159', '3152', '0,100001,3117,3152', '�;���', '652827', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('316', '303', '0,100001,219,303', 'ƫ����', '140932', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3160', '3152', '0,100001,3117,3152', '��˶��', '652828', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3161', '3152', '0,100001,3117,3152', '������', '652829', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3162', '3117', '0,100001,3117', '�����յ���', '652900', '0997', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3163', '3162', '0,100001,3117,3162', '��������', '652901', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3164', '3162', '0,100001,3117,3162', '������', '652922', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3165', '3162', '0,100001,3117,3162', '�⳵��', '652923', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3166', '3162', '0,100001,3117,3162', 'ɳ����', '652924', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3167', '3162', '0,100001,3117,3162', '�º���', '652925', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3168', '3162', '0,100001,3117,3162', '�ݳ���', '652926', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3169', '3162', '0,100001,3117,3162', '��ʲ��', '652927', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('317', '303', '0,100001,219,303', 'ԭƽ��', '140981', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3170', '3162', '0,100001,3117,3162', '��������', '652928', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3171', '3162', '0,100001,3117,3162', '��ƺ��', '652929', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3172', '3117', '0,100001,3117', '�������տ¶�����������', '653000', '0908', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3173', '3172', '0,100001,3117,3172', '��ͼʲ��', '653001', '0908', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3174', '3172', '0,100001,3117,3172', '��������', '653022', '0908', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3175', '3172', '0,100001,3117,3172', '��������', '653023', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3176', '3172', '0,100001,3117,3172', '��ǡ��', '653024', '0908', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3177', '3117', '0,100001,3117', '��ʲ����', '653100', '0998', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3178', '3177', '0,100001,3117,3177', '��ʲ��', '653101', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3179', '3177', '0,100001,3117,3177', '�踽��', '653121', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('318', '219', '0,100001,219', '�ٷ���', '141000', '0357', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3180', '3177', '0,100001,3117,3177', '������', '653122', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3181', '3177', '0,100001,3117,3177', 'Ӣ��ɳ��', '653123', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3182', '3177', '0,100001,3117,3177', '������', '653124', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3183', '3177', '0,100001,3117,3177', 'ɯ����', '653125', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3184', '3177', '0,100001,3117,3177', 'Ҷ����', '653126', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3185', '3177', '0,100001,3117,3177', '�������', '653127', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3186', '3177', '0,100001,3117,3177', '���պ���', '653128', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3187', '3177', '0,100001,3117,3177', '٤ʦ��', '653129', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3188', '3177', '0,100001,3117,3177', '�ͳ���', '653130', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3189', '3177', '0,100001,3117,3177', '��ʲ�����������������', '653131', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('319', '318', '0,100001,219,318', 'Ң����', '141002', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3190', '3117', '0,100001,3117', '�������', '653200', '0903', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3191', '3190', '0,100001,3117,3190', '������', '653201', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3192', '3190', '0,100001,3117,3190', '������', '653221', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3193', '3190', '0,100001,3117,3190', 'ī����', '653222', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3194', '3190', '0,100001,3117,3190', 'Ƥɽ��', '653223', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3195', '3190', '0,100001,3117,3190', '������', '653224', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3196', '3190', '0,100001,3117,3190', '������', '653225', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3197', '3190', '0,100001,3117,3190', '������', '653226', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3198', '3190', '0,100001,3117,3190', '�����', '653227', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3199', '3117', '0,100001,3117', '���������������', '654000', '0999', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('32', '18', '0,100001,18', '������', '120221', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('320', '318', '0,100001,219,318', '������', '141021', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3200', '3199', '0,100001,3117,3199', '������', '654002', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3201', '3199', '0,100001,3117,3199', '������', '654003', '0992', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3202', '3199', '0,100001,3117,3199', '������', '654021', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3203', '3199', '0,100001,3117,3199', '�첼�������������', '654022', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3204', '3199', '0,100001,3117,3199', '������', '654023', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3205', '3199', '0,100001,3117,3199', '������', '654024', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3206', '3199', '0,100001,3117,3199', '��Դ��', '654025', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3207', '3199', '0,100001,3117,3199', '������', '654026', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3208', '3199', '0,100001,3117,3199', '�ؿ�˹��', '654027', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3209', '3199', '0,100001,3117,3199', '���տ���', '654028', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('321', '318', '0,100001,219,318', '�����', '141022', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3210', '3117', '0,100001,3117', '���ǵ���', '654200', '0901', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3211', '3210', '0,100001,3117,3210', '������', '654201', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3212', '3210', '0,100001,3117,3210', '������', '654202', '0992', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3213', '3210', '0,100001,3117,3210', '������', '654221', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3214', '3210', '0,100001,3117,3210', 'ɳ����', '654223', '0993', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3215', '3210', '0,100001,3117,3210', '������', '654224', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3216', '3210', '0,100001,3117,3210', 'ԣ����', '654225', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3217', '3210', '0,100001,3117,3210', '�Ͳ��������ɹ�������', '654226', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3218', '3117', '0,100001,3117', '����̩����', '654300', '0906', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3219', '3218', '0,100001,3117,3218', '����̩��', '654301', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('322', '318', '0,100001,219,318', '�����', '141023', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3220', '3218', '0,100001,3117,3218', '��������', '654321', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3221', '3218', '0,100001,3117,3218', '������', '654322', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3222', '3218', '0,100001,3117,3218', '������', '654323', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3223', '3218', '0,100001,3117,3218', '���ͺ���', '654324', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3224', '3218', '0,100001,3117,3218', '�����', '654325', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3225', '3218', '0,100001,3117,3218', '��ľ����', '654326', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3226', '3117', '0,100001,3117', '������ֱϽ', '659000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3227', '3226', '0,100001,3117,3226', 'ʯ������', '659001', '0993', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3228', '3226', '0,100001,3117,3226', '��������', '659002', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3229', '3226', '0,100001,3117,3226', 'ͼľ�����', '659003', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('323', '318', '0,100001,219,318', '�鶴��', '141024', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3230', '3226', '0,100001,3117,3226', '�������', '659004', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3231', '100001', '0,100001', '̨��ʡ', '710000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3232', '3231', '0,100001,3231', '̨����', '710100', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3233', '3232', '0,100001,3231,3232', '������', '710101', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3234', '3232', '0,100001,3231,3232', '��ͬ��', '710102', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3235', '3232', '0,100001,3231,3232', '��ɽ��', '710103', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3236', '3232', '0,100001,3231,3232', '��ɽ��', '710104', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3237', '3232', '0,100001,3231,3232', '����', '710105', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3238', '3232', '0,100001,3231,3232', '����', '710106', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3239', '3232', '0,100001,3231,3232', '������', '710107', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('324', '318', '0,100001,219,318', '����', '141025', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3240', '3232', '0,100001,3231,3232', 'ʿ����', '710108', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3241', '3232', '0,100001,3231,3232', '��Ͷ��', '710109', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3242', '3232', '0,100001,3231,3232', '�ں���', '710110', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3243', '3232', '0,100001,3231,3232', '�ϸ���', '710111', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3244', '3232', '0,100001,3231,3232', '��ɽ��', '710112', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3245', '3231', '0,100001,3231', '������', '710200', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3246', '3245', '0,100001,3231,3245', '������', '710201', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3247', '3245', '0,100001,3231,3245', 'ǰ����', '710202', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3248', '3245', '0,100001,3231,3245', '������', '710203', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3249', '3245', '0,100001,3231,3245', '������', '710204', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('325', '318', '0,100001,219,318', '������', '141026', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3250', '3245', '0,100001,3231,3245', '��ɽ��', '710205', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3251', '3245', '0,100001,3231,3245', '�����', '710206', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3252', '3245', '0,100001,3231,3245', 'ǰ����', '710207', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3253', '3245', '0,100001,3231,3245', '������', '710208', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3254', '3245', '0,100001,3231,3245', '��Ӫ��', '710209', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3255', '3245', '0,100001,3231,3245', '�����', '710210', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3256', '3245', '0,100001,3231,3245', 'С����', '710211', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3257', '3231', '0,100001,3231', '��¡��', '710300', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3258', '3257', '0,100001,3231,3257', '�ʰ���', '710301', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3259', '3257', '0,100001,3231,3257', '������', '710302', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('326', '318', '0,100001,219,318', '��ɽ��', '141027', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3260', '3257', '0,100001,3231,3257', '������', '710303', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3261', '3257', '0,100001,3231,3257', '��ɽ��', '710304', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3262', '3257', '0,100001,3231,3257', '������', '710305', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3263', '3257', '0,100001,3231,3257', 'ůů��', '710306', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3264', '3257', '0,100001,3231,3257', '�߶���', '710307', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3265', '3231', '0,100001,3231', '̨����', '710400', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3266', '3265', '0,100001,3231,3265', '����', '710401', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3267', '3265', '0,100001,3231,3265', '����', '710402', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3268', '3265', '0,100001,3231,3265', '����', '710403', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3269', '3265', '0,100001,3231,3265', '����', '710404', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('327', '318', '0,100001,219,318', '����', '141028', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3270', '3265', '0,100001,3231,3265', '����', '710405', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3271', '3265', '0,100001,3231,3265', '������', '710406', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3272', '3265', '0,100001,3231,3265', '������', '710407', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3273', '3265', '0,100001,3231,3265', '������', '710408', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3274', '3231', '0,100001,3231', '̨����', '710500', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3275', '3274', '0,100001,3231,3274', '������', '710501', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3276', '3274', '0,100001,3231,3274', '����', '710502', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3277', '3274', '0,100001,3231,3274', '����', '710503', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3278', '3274', '0,100001,3231,3274', '����', '710504', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3279', '3274', '0,100001,3231,3274', '��ƽ��', '710505', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('328', '318', '0,100001,219,318', '������', '141029', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3280', '3274', '0,100001,3231,3274', '������', '710506', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3281', '3231', '0,100001,3231', '������', '710600', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3282', '3281', '0,100001,3231,3281', '����', '710601', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3283', '3281', '0,100001,3231,3281', '����', '710602', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3284', '3281', '0,100001,3231,3281', '��ɽ��', '710603', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3285', '3231', '0,100001,3231', '������', '710700', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3286', '3285', '0,100001,3231,3285', '����', '710701', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3287', '3285', '0,100001,3231,3285', '����', '710702', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3288', '3231', '0,100001,3231', 'ʡֱϽ', '719000', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3289', '3288', '0,100001,3231,3288', '̨����', '719001', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('329', '318', '0,100001,219,318', '������', '141030', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3290', '3288', '0,100001,3231,3288', '������', '719002', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3291', '3288', '0,100001,3231,3288', '������', '719003', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3292', '3288', '0,100001,3231,3288', '��԰��', '719004', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3293', '3288', '0,100001,3231,3288', '������', '719005', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3294', '3288', '0,100001,3231,3288', '̨����', '719006', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3295', '3288', '0,100001,3231,3288', '�û���', '719007', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3296', '3288', '0,100001,3231,3288', '��Ͷ��', '719008', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3297', '3288', '0,100001,3231,3288', '������', '719009', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3298', '3288', '0,100001,3231,3288', '������', '719010', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3299', '3288', '0,100001,3231,3288', '̨����', '719011', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('33', '18', '0,100001,18', '������', '120223', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('330', '318', '0,100001,219,318', '����', '141031', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3300', '3288', '0,100001,3231,3288', '������', '719012', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3301', '3288', '0,100001,3231,3288', '������', '719013', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3302', '3288', '0,100001,3231,3288', '̨����', '719014', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3303', '3288', '0,100001,3231,3288', '������', '719015', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3304', '3288', '0,100001,3231,3288', '�����', '719016', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3305', '100001', '0,100001', '����ر�������', '810000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3306', '3305', '0,100001,3305', '��۵�', '810100', '00852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3307', '3306', '0,100001,3305,3306', '������', '810101', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3308', '3306', '0,100001,3305,3306', '������', '810102', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3309', '3306', '0,100001,3305,3306', '����', '810103', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('331', '318', '0,100001,219,318', '������', '141032', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3310', '3306', '0,100001,3305,3306', '����', '810104', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3311', '3305', '0,100001,3305', '����', '810200', '00852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3312', '3311', '0,100001,3305,3311', '�ͼ�����', '810201', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3313', '3311', '0,100001,3305,3311', '��ˮ����', '810202', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3314', '3311', '0,100001,3305,3311', '��������', '810203', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3315', '3311', '0,100001,3305,3311', '�ƴ�����', '810204', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3316', '3311', '0,100001,3305,3311', '������', '810205', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3317', '3305', '0,100001,3305', '�½�', '810300', '00852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3318', '3317', '0,100001,3305,3317', '����', '810301', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3319', '3317', '0,100001,3305,3317', '������', '810302', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('332', '318', '0,100001,219,318', '����', '141033', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3320', '3317', '0,100001,3305,3317', 'ɳ����', '810303', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3321', '3317', '0,100001,3305,3317', '������', '810304', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3322', '3317', '0,100001,3305,3317', '������', '810305', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3323', '3317', '0,100001,3305,3317', '������', '810306', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3324', '3317', '0,100001,3305,3317', 'Ԫ����', '810307', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3325', '3317', '0,100001,3305,3317', '������', '810308', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3326', '3317', '0,100001,3305,3317', '�뵺��', '810309', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3327', '100001', '0,100001', '�����ر�������', '820000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3328', '3327', '0,100001,3327', '���Ű뵺', '820100', '00853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3329', '3328', '0,100001,3327,3328', '����������', '820101', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('333', '318', '0,100001,219,318', '������', '141034', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3330', '3328', '0,100001,3327,3328', 'ʥ����������', '820102', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3331', '3328', '0,100001,3327,3328', '������', '820103', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3332', '3328', '0,100001,3327,3328', '��������', '820104', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3333', '3328', '0,100001,3327,3328', '��˳����', '820105', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3334', '3327', '0,100001,3327', '�����뵺', '820200', '00853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3335', '3334', '0,100001,3327,3334', '��ģ����', '820201', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3336', '3334', '0,100001,3327,3334', 'ʥ���ø�����', '820202', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3337', '3327', '0,100001,3327', '��������������', '820300', '00853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3338', '3337', '0,100001,3327,3337', '·���', '820301', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('334', '318', '0,100001,219,318', '������', '141081', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('335', '318', '0,100001,219,318', '������', '141082', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('336', '219', '0,100001,219', '������', '141100', '0358', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('337', '336', '0,100001,219,336', '��ʯ��', '141102', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('338', '336', '0,100001,219,336', '��ˮ��', '141121', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('339', '336', '0,100001,219,336', '������', '141122', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('34', '18', '0,100001,18', '����', '120225', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('340', '336', '0,100001,219,336', '����', '141123', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('341', '336', '0,100001,219,336', '����', '141124', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('342', '336', '0,100001,219,336', '������', '141125', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('343', '336', '0,100001,219,336', 'ʯ¥��', '141126', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('344', '336', '0,100001,219,336', '���', '141127', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('345', '336', '0,100001,219,336', '��ɽ��', '141128', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('346', '336', '0,100001,219,336', '������', '141129', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('347', '336', '0,100001,219,336', '������', '141130', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('348', '336', '0,100001,219,336', 'Т����', '141181', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('349', '336', '0,100001,219,336', '������', '141182', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('35', '100001', '0,100001', '�ӱ�ʡ', '130000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('350', '100001', '0,100001', '���ɹ�������', '150000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('351', '350', '0,100001,350', '���ͺ�����', '150100', '0471', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('352', '351', '0,100001,350,351', '�³���', '150102', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('353', '351', '0,100001,350,351', '������', '150103', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('354', '351', '0,100001,350,351', '��Ȫ��', '150104', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('355', '351', '0,100001,350,351', '������', '150105', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('356', '351', '0,100001,350,351', '��Ĭ������', '150121', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('357', '351', '0,100001,350,351', '�п�����', '150122', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('358', '351', '0,100001,350,351', '���ָ����', '150123', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('359', '351', '0,100001,350,351', '��ˮ����', '150124', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('36', '35', '0,100001,35', 'ʯ��ׯ��', '130100', '0311', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('360', '351', '0,100001,350,351', '�䴨��', '150125', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('361', '350', '0,100001,350', '��ͷ��', '150200', '0472', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('362', '361', '0,100001,350,361', '������', '150202', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('363', '361', '0,100001,350,361', '��������', '150203', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('364', '361', '0,100001,350,361', '��ɽ��', '150204', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('365', '361', '0,100001,350,361', 'ʯ����', '150205', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('366', '361', '0,100001,350,361', '���ƶ�������', '150206', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('367', '361', '0,100001,350,361', '��ԭ��', '150207', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('368', '361', '0,100001,350,361', '��Ĭ������', '150221', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('369', '361', '0,100001,350,361', '������', '150222', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('37', '36', '0,100001,35,36', '������', '130102', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('370', '361', '0,100001,350,361', '�����ï����������', '150223', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('371', '350', '0,100001,350', '�ں���', '150300', '0473', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('372', '371', '0,100001,350,371', '��������', '150302', '0473', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('373', '371', '0,100001,350,371', '������', '150303', '0473', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('374', '371', '0,100001,350,371', '�ڴ���', '150304', '0473', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('375', '350', '0,100001,350', '�����', '150400', '0476', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('376', '375', '0,100001,350,375', '��ɽ��', '150402', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('377', '375', '0,100001,350,375', 'Ԫ��ɽ��', '150403', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('378', '375', '0,100001,350,375', '��ɽ��', '150404', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('379', '375', '0,100001,350,375', '��³�ƶ�����', '150421', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('38', '36', '0,100001,35,36', '�Ŷ���', '130103', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('380', '375', '0,100001,350,375', '��������', '150422', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('381', '375', '0,100001,350,375', '��������', '150423', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('382', '375', '0,100001,350,375', '������', '150424', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('383', '375', '0,100001,350,375', '��ʲ������', '150425', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('384', '375', '0,100001,350,375', '��ţ����', '150426', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('385', '375', '0,100001,350,375', '��������', '150428', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('386', '375', '0,100001,350,375', '������', '150429', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('387', '375', '0,100001,350,375', '������', '150430', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('388', '350', '0,100001,350', 'ͨ����', '150500', '0475', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('389', '388', '0,100001,350,388', '�ƶ�����', '150502', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('39', '36', '0,100001,35,36', '������', '130104', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('390', '388', '0,100001,350,388', '�ƶ�����������', '150521', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('391', '388', '0,100001,350,388', '�ƶ����������', '150522', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('392', '388', '0,100001,350,388', '��³��', '150523', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('393', '388', '0,100001,350,388', '������', '150524', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('394', '388', '0,100001,350,388', '������', '150525', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('395', '388', '0,100001,350,388', '��³����', '150526', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('396', '388', '0,100001,350,388', '���ֹ�����', '150581', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('397', '350', '0,100001,350', '������˹��', '150600', '0477', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('398', '397', '0,100001,350,397', '��ʤ��', '150602', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('399', '397', '0,100001,350,397', '��������', '150621', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('4', '1', '0,100001,1', '������', '110105', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('40', '36', '0,100001,35,36', '�»���', '130105', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('400', '397', '0,100001,350,397', '׼�����', '150622', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('401', '397', '0,100001,350,397', '���п�ǰ��', '150623', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('402', '397', '0,100001,350,397', '���п���', '150624', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('403', '397', '0,100001,350,397', '������', '150625', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('404', '397', '0,100001,350,397', '������', '150626', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('405', '397', '0,100001,350,397', '���������', '150627', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('406', '350', '0,100001,350', '���ױ�����', '150700', '0470', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('407', '406', '0,100001,350,406', '��������', '150702', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('408', '406', '0,100001,350,406', '������', '150721', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('409', '406', '0,100001,350,406', 'Ī�����ߴ��Ӷ���������', '150722', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('41', '36', '0,100001,35,36', '�������', '130107', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('410', '406', '0,100001,350,406', '���״�������', '150723', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('411', '406', '0,100001,350,406', '���¿���������', '150724', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('412', '406', '0,100001,350,406', '�°Ͷ�����', '150725', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('413', '406', '0,100001,350,406', '�°Ͷ�������', '150726', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('414', '406', '0,100001,350,406', '�°Ͷ�������', '150727', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('415', '406', '0,100001,350,406', '��������', '150781', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('416', '406', '0,100001,350,406', '����ʯ��', '150782', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('417', '406', '0,100001,350,406', '��������', '150783', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('418', '406', '0,100001,350,406', '���������', '150784', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('419', '406', '0,100001,350,406', '������', '150785', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('42', '36', '0,100001,35,36', 'ԣ����', '130108', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('420', '350', '0,100001,350', '�����׶���', '150800', '0478', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('421', '420', '0,100001,350,420', '�ٺ���', '150802', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('422', '420', '0,100001,350,420', '��ԭ��', '150821', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('423', '420', '0,100001,350,420', '�����', '150822', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('424', '420', '0,100001,350,420', '������ǰ��', '150823', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('425', '420', '0,100001,350,420', '����������', '150824', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('426', '420', '0,100001,350,420', '�����غ���', '150825', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('427', '420', '0,100001,350,420', '��������', '150826', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('428', '350', '0,100001,350', '�����첼��', '150900', '0474', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('429', '428', '0,100001,350,428', '������', '150902', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('43', '36', '0,100001,35,36', '������', '130121', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('430', '428', '0,100001,350,428', '׿����', '150921', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('431', '428', '0,100001,350,428', '������', '150922', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('432', '428', '0,100001,350,428', '�̶���', '150923', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('433', '428', '0,100001,350,428', '�˺���', '150924', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('434', '428', '0,100001,350,428', '������', '150925', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('435', '428', '0,100001,350,428', '���������ǰ��', '150926', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('436', '428', '0,100001,350,428', '�������������', '150927', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('437', '428', '0,100001,350,428', '������������', '150928', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('438', '428', '0,100001,350,428', '��������', '150929', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('439', '428', '0,100001,350,428', '������', '150981', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('44', '36', '0,100001,35,36', '������', '130123', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('440', '350', '0,100001,350', '�˰���', '152200', '0482', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('441', '440', '0,100001,350,440', '����������', '152201', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('442', '440', '0,100001,350,440', '����ɽ��', '152202', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('443', '440', '0,100001,350,440', '�ƶ�������ǰ��', '152221', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('444', '440', '0,100001,350,440', '�ƶ�����������', '152222', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('445', '440', '0,100001,350,440', '��������', '152223', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('446', '440', '0,100001,350,440', 'ͻȪ��', '152224', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('447', '350', '0,100001,350', '���ֹ�����', '152500', '0479', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('448', '447', '0,100001,350,447', '����������', '152501', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('449', '447', '0,100001,350,447', '���ֺ�����', '152502', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('45', '36', '0,100001,35,36', '�����', '130124', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('450', '447', '0,100001,350,447', '���͸���', '152522', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('451', '447', '0,100001,350,447', '����������', '152523', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('452', '447', '0,100001,350,447', '����������', '152524', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('453', '447', '0,100001,350,447', '������������', '152525', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('454', '447', '0,100001,350,447', '������������', '152526', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('455', '447', '0,100001,350,447', '̫������', '152527', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('456', '447', '0,100001,350,447', '�����', '152528', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('457', '447', '0,100001,350,447', '�������', '152529', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('458', '447', '0,100001,350,447', '������', '152530', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('459', '447', '0,100001,350,447', '������', '152531', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('46', '36', '0,100001,35,36', '������', '130125', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('460', '350', '0,100001,350', '��������', '152900', '0483', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('461', '460', '0,100001,350,460', '����������', '152921', '0483', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('462', '460', '0,100001,350,460', '����������', '152922', '0483', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('463', '460', '0,100001,350,460', '�������', '152923', '0483', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('464', '100001', '0,100001', '����ʡ', '210000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('465', '464', '0,100001,464', '������', '210100', '024', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('466', '465', '0,100001,464,465', '��ƽ��', '210102', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('467', '465', '0,100001,464,465', '�����', '210103', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('468', '465', '0,100001,464,465', '����', '210104', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('469', '465', '0,100001,464,465', '�ʹ���', '210105', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('47', '36', '0,100001,35,36', '������', '130126', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('470', '465', '0,100001,464,465', '������', '210106', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('471', '465', '0,100001,464,465', '�ռ�����', '210111', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('472', '465', '0,100001,464,465', '������', '210112', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('473', '465', '0,100001,464,465', '������', '210113', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('474', '465', '0,100001,464,465', '�ں���', '210114', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('475', '465', '0,100001,464,465', '������', '210122', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('476', '465', '0,100001,464,465', '��ƽ��', '210123', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('477', '465', '0,100001,464,465', '������', '210124', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('478', '465', '0,100001,464,465', '������', '210181', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('479', '464', '0,100001,464', '������', '210200', '0411', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('48', '36', '0,100001,35,36', '������', '130127', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('480', '479', '0,100001,464,479', '��ɽ��', '210202', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('481', '479', '0,100001,464,479', '������', '210203', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('482', '479', '0,100001,464,479', 'ɳ�ӿ���', '210204', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('483', '479', '0,100001,464,479', '�ʾ�����', '210211', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('484', '479', '0,100001,464,479', '��˳����', '210212', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('485', '479', '0,100001,464,479', '������', '210213', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('486', '479', '0,100001,464,479', '������', '210224', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('487', '479', '0,100001,464,479', '�߷�����', '210281', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('488', '479', '0,100001,464,479', '��������', '210282', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('489', '479', '0,100001,464,479', 'ׯ����', '210283', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('49', '36', '0,100001,35,36', '������', '130128', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('490', '464', '0,100001,464', '��ɽ��', '210300', '0412', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('491', '490', '0,100001,464,490', '������', '210302', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('492', '490', '0,100001,464,490', '������', '210303', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('493', '490', '0,100001,464,490', '��ɽ��', '210304', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('494', '490', '0,100001,464,490', 'ǧɽ��', '210311', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('495', '490', '0,100001,464,490', '̨����', '210321', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('496', '490', '0,100001,464,490', '�������������', '210323', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('497', '490', '0,100001,464,490', '������', '210381', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('498', '464', '0,100001,464', '��˳��', '210400', '0413', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('499', '498', '0,100001,464,498', '�¸���', '210402', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('5', '1', '0,100001,1', '��̨��', '110106', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('50', '36', '0,100001,35,36', '�޻���', '130129', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('500', '498', '0,100001,464,498', '������', '210403', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('501', '498', '0,100001,464,498', '������', '210404', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('502', '498', '0,100001,464,498', '˳����', '210411', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('503', '498', '0,100001,464,498', '��˳��', '210421', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('504', '498', '0,100001,464,498', '�±�����������', '210422', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('505', '498', '0,100001,464,498', '��ԭ����������', '210423', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('506', '464', '0,100001,464', '��Ϫ��', '210500', '0414', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('507', '506', '0,100001,464,506', 'ƽɽ��', '210502', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('508', '506', '0,100001,464,506', 'Ϫ����', '210503', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('509', '506', '0,100001,464,506', '��ɽ��', '210504', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('51', '36', '0,100001,35,36', '�޼���', '130130', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('510', '506', '0,100001,464,506', '�Ϸ���', '210505', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('511', '506', '0,100001,464,506', '��Ϫ����������', '210521', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('512', '506', '0,100001,464,506', '��������������', '210522', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('513', '464', '0,100001,464', '������', '210600', '0415', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('514', '513', '0,100001,464,513', 'Ԫ����', '210602', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('515', '513', '0,100001,464,513', '������', '210603', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('516', '513', '0,100001,464,513', '����', '210604', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('517', '513', '0,100001,464,513', '�������������', '210624', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('518', '513', '0,100001,464,513', '������', '210681', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('519', '513', '0,100001,464,513', '�����', '210682', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('52', '36', '0,100001,35,36', 'ƽɽ��', '130131', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('520', '464', '0,100001,464', '������', '210700', '0416', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('521', '520', '0,100001,464,520', '������', '210702', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('522', '520', '0,100001,464,520', '�����', '210703', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('523', '520', '0,100001,464,520', '̫����', '210711', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('524', '520', '0,100001,464,520', '��ɽ��', '210726', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('525', '520', '0,100001,464,520', '����', '210727', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('526', '520', '0,100001,464,520', '�躣��', '210781', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('527', '520', '0,100001,464,520', '������', '210782', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('528', '464', '0,100001,464', 'Ӫ����', '210800', '0417', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('529', '528', '0,100001,464,528', 'վǰ��', '210802', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('53', '36', '0,100001,35,36', 'Ԫ����', '130132', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('530', '528', '0,100001,464,528', '������', '210803', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('531', '528', '0,100001,464,528', '����Ȧ��', '210804', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('532', '528', '0,100001,464,528', '�ϱ���', '210811', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('533', '528', '0,100001,464,528', '������', '210881', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('534', '528', '0,100001,464,528', '��ʯ����', '210882', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('535', '464', '0,100001,464', '������', '210900', '0418', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('536', '535', '0,100001,464,535', '������', '210902', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('537', '535', '0,100001,464,535', '������', '210903', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('538', '535', '0,100001,464,535', '̫ƽ��', '210904', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('539', '535', '0,100001,464,535', '�������', '210905', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('54', '36', '0,100001,35,36', '����', '130133', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('540', '535', '0,100001,464,535', 'ϸ����', '210911', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('541', '535', '0,100001,464,535', '�����ɹ���������', '210921', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('542', '535', '0,100001,464,535', '������', '210922', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('543', '464', '0,100001,464', '������', '211000', '0419', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('544', '543', '0,100001,464,543', '������', '211002', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('545', '543', '0,100001,464,543', '��ʥ��', '211003', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('546', '543', '0,100001,464,543', '��ΰ��', '211004', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('547', '543', '0,100001,464,543', '��������', '211005', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('548', '543', '0,100001,464,543', '̫�Ӻ���', '211011', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('549', '543', '0,100001,464,543', '������', '211021', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('55', '36', '0,100001,35,36', '������', '130181', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('550', '543', '0,100001,464,543', '������', '211081', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('551', '464', '0,100001,464', '�̽���', '211100', '0427', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('552', '551', '0,100001,464,551', '˫̨����', '211102', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('553', '551', '0,100001,464,551', '��¡̨��', '211103', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('554', '551', '0,100001,464,551', '������', '211121', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('555', '551', '0,100001,464,551', '��ɽ��', '211122', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('556', '464', '0,100001,464', '������', '211200', '0410', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('557', '556', '0,100001,464,556', '������', '211202', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('558', '556', '0,100001,464,556', '�����', '211204', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('559', '556', '0,100001,464,556', '������', '211221', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('56', '36', '0,100001,35,36', '޻����', '130182', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('560', '556', '0,100001,464,556', '������', '211223', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('561', '556', '0,100001,464,556', '��ͼ��', '211224', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('562', '556', '0,100001,464,556', '����ɽ��', '211281', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('563', '556', '0,100001,464,556', '��ԭ��', '211282', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('564', '464', '0,100001,464', '������', '211300', '0421', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('565', '564', '0,100001,464,564', '˫����', '211302', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('566', '564', '0,100001,464,564', '������', '211303', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('567', '564', '0,100001,464,564', '������', '211321', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('568', '564', '0,100001,464,564', '��ƽ��', '211322', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('569', '564', '0,100001,464,564', '�����������ɹ���������', '211324', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('57', '36', '0,100001,35,36', '������', '130183', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('570', '564', '0,100001,464,564', '��Ʊ��', '211381', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('571', '564', '0,100001,464,564', '��Դ��', '211382', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('572', '464', '0,100001,464', '��«����', '211400', '0429', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('573', '572', '0,100001,464,572', '��ɽ��', '211402', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('574', '572', '0,100001,464,572', '������', '211403', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('575', '572', '0,100001,464,572', '��Ʊ��', '211404', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('576', '572', '0,100001,464,572', '������', '211421', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('577', '572', '0,100001,464,572', '������', '211422', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('578', '572', '0,100001,464,572', '�˳���', '211481', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('579', '100001', '0,100001', '����ʡ', '220000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('58', '36', '0,100001,35,36', '������', '130184', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('580', '579', '0,100001,579', '������', '220100', '0431', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('581', '580', '0,100001,579,580', '�Ϲ���', '220102', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('582', '580', '0,100001,579,580', '�����', '220103', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('583', '580', '0,100001,579,580', '������', '220104', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('584', '580', '0,100001,579,580', '������', '220105', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('585', '580', '0,100001,579,580', '��԰��', '220106', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('586', '580', '0,100001,579,580', '˫����', '220112', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('587', '580', '0,100001,579,580', 'ũ����', '220122', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('588', '580', '0,100001,579,580', '��̨��', '220181', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('589', '580', '0,100001,579,580', '������', '220182', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('59', '36', '0,100001,35,36', '¹Ȫ��', '130185', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('590', '580', '0,100001,579,580', '�»���', '220183', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('591', '579', '0,100001,579', '������', '220200', '0432', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('592', '591', '0,100001,579,591', '������', '220202', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('593', '591', '0,100001,579,591', '��̶��', '220203', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('594', '591', '0,100001,579,591', '��Ӫ��', '220204', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('595', '591', '0,100001,579,591', '������', '220211', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('596', '591', '0,100001,579,591', '������', '220221', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('597', '591', '0,100001,579,591', '�Ժ���', '220281', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('598', '591', '0,100001,579,591', '�����', '220282', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('599', '591', '0,100001,579,591', '������', '220283', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('6', '1', '0,100001,1', 'ʯ��ɽ��', '110107', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('60', '35', '0,100001,35', '��ɽ��', '130200', '0315', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('600', '591', '0,100001,579,591', '��ʯ��', '220284', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('601', '579', '0,100001,579', '��ƽ��', '220300', '0434', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('602', '601', '0,100001,579,601', '������', '220302', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('603', '601', '0,100001,579,601', '������', '220303', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('604', '601', '0,100001,579,601', '������', '220322', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('605', '601', '0,100001,579,601', '��ͨ����������', '220323', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('606', '601', '0,100001,579,601', '��������', '220381', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('607', '601', '0,100001,579,601', '˫����', '220382', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('608', '579', '0,100001,579', '��Դ��', '220400', '0437', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('609', '608', '0,100001,579,608', '��ɽ��', '220402', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('61', '60', '0,100001,35,60', '·����', '130202', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('610', '608', '0,100001,579,608', '������', '220403', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('611', '608', '0,100001,579,608', '������', '220421', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('612', '608', '0,100001,579,608', '������', '220422', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('613', '579', '0,100001,579', 'ͨ����', '220500', '0435', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('614', '613', '0,100001,579,613', '������', '220502', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('615', '613', '0,100001,579,613', '��������', '220503', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('616', '613', '0,100001,579,613', 'ͨ����', '220521', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('617', '613', '0,100001,579,613', '������', '220523', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('618', '613', '0,100001,579,613', '������', '220524', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('619', '613', '0,100001,579,613', '÷�ӿ���', '220581', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('62', '60', '0,100001,35,60', '·����', '130203', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('620', '613', '0,100001,579,613', '������', '220582', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('621', '579', '0,100001,579', '��ɽ��', '220600', '0439', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('622', '621', '0,100001,579,621', '�뽭��', '220602', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('623', '621', '0,100001,579,621', '��Դ��', '220605', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('624', '621', '0,100001,579,621', '������', '220621', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('625', '621', '0,100001,579,621', '������', '220622', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('626', '621', '0,100001,579,621', '���׳�����������', '220623', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('627', '621', '0,100001,579,621', '�ٽ���', '220681', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('628', '579', '0,100001,579', '��ԭ��', '220700', '0438', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('629', '628', '0,100001,579,628', '������', '220702', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('63', '60', '0,100001,35,60', '��ұ��', '130204', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('630', '628', '0,100001,579,628', 'ǰ������˹�ɹ���������', '220721', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('631', '628', '0,100001,579,628', '������', '220722', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('632', '628', '0,100001,579,628', 'Ǭ����', '220723', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('633', '628', '0,100001,579,628', '������', '220724', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('634', '579', '0,100001,579', '�׳���', '220800', '0436', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('635', '634', '0,100001,579,634', '䬱���', '220802', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('636', '634', '0,100001,579,634', '������', '220821', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('637', '634', '0,100001,579,634', 'ͨ����', '220822', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('638', '634', '0,100001,579,634', '�����', '220881', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('639', '634', '0,100001,579,634', '����', '220882', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('64', '60', '0,100001,35,60', '��ƽ��', '130205', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('640', '579', '0,100001,579', '�ӱ߳�����������', '222400', '0433', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('641', '640', '0,100001,579,640', '�Ӽ���', '222401', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('642', '640', '0,100001,579,640', 'ͼ����', '222402', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('643', '640', '0,100001,579,640', '�ػ���', '222403', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('644', '640', '0,100001,579,640', '������', '222404', '0440', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('645', '640', '0,100001,579,640', '������', '222405', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('646', '640', '0,100001,579,640', '������', '222406', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('647', '640', '0,100001,579,640', '������', '222424', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('648', '640', '0,100001,579,640', '��ͼ��', '222426', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('649', '100001', '0,100001', '������ʡ', '230000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('65', '60', '0,100001,35,60', '������', '130207', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('650', '649', '0,100001,649', '��������', '230100', '0451', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('651', '650', '0,100001,649,650', '������', '230102', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('652', '650', '0,100001,649,650', '�ϸ���', '230103', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('653', '650', '0,100001,649,650', '������', '230104', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('654', '650', '0,100001,649,650', 'ƽ����', '230108', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('655', '650', '0,100001,649,650', '�ɱ���', '230109', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('656', '650', '0,100001,649,650', '�㷻��', '230110', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('657', '650', '0,100001,649,650', '������', '230111', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('658', '650', '0,100001,649,650', '������', '230112', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('659', '650', '0,100001,649,650', '������', '230123', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('66', '60', '0,100001,35,60', '������', '130208', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('660', '650', '0,100001,649,650', '������', '230124', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('661', '650', '0,100001,649,650', '����', '230125', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('662', '650', '0,100001,649,650', '������', '230126', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('663', '650', '0,100001,649,650', 'ľ����', '230127', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('664', '650', '0,100001,649,650', 'ͨ����', '230128', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('665', '650', '0,100001,649,650', '������', '230129', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('666', '650', '0,100001,649,650', '˫����', '230182', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('667', '650', '0,100001,649,650', '��־��', '230183', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('668', '650', '0,100001,649,650', '�峣��', '230184', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('669', '649', '0,100001,649', '���������', '230200', '0452', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('67', '60', '0,100001,35,60', '����', '130223', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('670', '669', '0,100001,649,669', '��ɳ��', '230202', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('671', '669', '0,100001,649,669', '������', '230203', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('672', '669', '0,100001,649,669', '������', '230204', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('673', '669', '0,100001,649,669', '����Ϫ��', '230205', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('674', '669', '0,100001,649,669', '����������', '230206', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('675', '669', '0,100001,649,669', '����ɽ��', '230207', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('676', '669', '0,100001,649,669', '÷��˹���Ӷ�����', '230208', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('677', '669', '0,100001,649,669', '������', '230221', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('678', '669', '0,100001,649,669', '������', '230223', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('679', '669', '0,100001,649,669', '̩����', '230224', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('68', '60', '0,100001,35,60', '������', '130224', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('680', '669', '0,100001,649,669', '������', '230225', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('681', '669', '0,100001,649,669', '��ԣ��', '230227', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('682', '669', '0,100001,649,669', '��ɽ��', '230229', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('683', '669', '0,100001,649,669', '�˶���', '230230', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('684', '669', '0,100001,649,669', '��Ȫ��', '230231', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('685', '669', '0,100001,649,669', 'ګ����', '230281', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('686', '649', '0,100001,649', '������', '230300', '0467', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('687', '686', '0,100001,649,686', '������', '230302', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('688', '686', '0,100001,649,686', '��ɽ��', '230303', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('689', '686', '0,100001,649,686', '�ε���', '230304', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('69', '60', '0,100001,35,60', '��ͤ��', '130225', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('690', '686', '0,100001,649,686', '������', '230305', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('691', '686', '0,100001,649,686', '���Ӻ���', '230306', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('692', '686', '0,100001,649,686', '��ɽ��', '230307', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('693', '686', '0,100001,649,686', '������', '230321', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('694', '686', '0,100001,649,686', '������', '230381', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('695', '686', '0,100001,649,686', '��ɽ��', '230382', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('696', '649', '0,100001,649', '�׸���', '230400', '0468', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('697', '696', '0,100001,649,696', '������', '230402', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('698', '696', '0,100001,649,696', '��ũ��', '230403', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('699', '696', '0,100001,649,696', '��ɽ��', '230404', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('7', '1', '0,100001,1', '������', '110108', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('70', '60', '0,100001,35,60', 'Ǩ����', '130227', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('700', '696', '0,100001,649,696', '�˰���', '230405', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('701', '696', '0,100001,649,696', '��ɽ��', '230406', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('702', '696', '0,100001,649,696', '��ɽ��', '230407', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('703', '696', '0,100001,649,696', '�ܱ���', '230421', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('704', '696', '0,100001,649,696', '�����', '230422', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('705', '649', '0,100001,649', '˫Ѽɽ��', '230500', '0469', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('706', '705', '0,100001,649,705', '��ɽ��', '230502', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('707', '705', '0,100001,649,705', '�붫��', '230503', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('708', '705', '0,100001,649,705', '�ķ�̨��', '230505', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('709', '705', '0,100001,649,705', '��ɽ��', '230506', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('71', '60', '0,100001,35,60', '������', '130229', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('710', '705', '0,100001,649,705', '������', '230521', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('711', '705', '0,100001,649,705', '������', '230522', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('712', '705', '0,100001,649,705', '������', '230523', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('713', '705', '0,100001,649,705', '�ĺ���', '230524', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('714', '649', '0,100001,649', '������', '230600', '0459', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('715', '714', '0,100001,649,714', '����ͼ��', '230602', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('716', '714', '0,100001,649,714', '������', '230603', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('717', '714', '0,100001,649,714', '�ú�·��', '230604', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('718', '714', '0,100001,649,714', '�����', '230605', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('719', '714', '0,100001,649,714', '��ͬ��', '230606', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('72', '60', '0,100001,35,60', '��������', '130230', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('720', '714', '0,100001,649,714', '������', '230621', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('721', '714', '0,100001,649,714', '��Դ��', '230622', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('722', '714', '0,100001,649,714', '�ֵ���', '230623', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('723', '714', '0,100001,649,714', '�Ŷ������ɹ���������', '230624', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('724', '649', '0,100001,649', '������', '230700', '0458', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('725', '724', '0,100001,649,724', '������', '230702', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('726', '724', '0,100001,649,724', '�ϲ���', '230703', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('727', '724', '0,100001,649,724', '�Ѻ���', '230704', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('728', '724', '0,100001,649,724', '������', '230705', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('729', '724', '0,100001,649,724', '������', '230706', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('73', '60', '0,100001,35,60', '����', '130281', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('730', '724', '0,100001,649,724', '������', '230707', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('731', '724', '0,100001,649,724', '��Ϫ��', '230708', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('732', '724', '0,100001,649,724', '��ɽ����', '230709', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('733', '724', '0,100001,649,724', '��Ӫ��', '230710', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('734', '724', '0,100001,649,724', '�������', '230711', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('735', '724', '0,100001,649,724', '��������', '230712', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('736', '724', '0,100001,649,724', '������', '230713', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('737', '724', '0,100001,649,724', '��������', '230714', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('738', '724', '0,100001,649,724', '������', '230715', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('739', '724', '0,100001,649,724', '�ϸ�����', '230716', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('74', '60', '0,100001,35,60', 'Ǩ����', '130283', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('740', '724', '0,100001,649,724', '������', '230722', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('741', '724', '0,100001,649,724', '������', '230781', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('742', '649', '0,100001,649', '��ľ˹��', '230800', '0454', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('743', '742', '0,100001,649,742', '������', '230803', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('744', '742', '0,100001,649,742', 'ǰ����', '230804', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('745', '742', '0,100001,649,742', '������', '230805', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('746', '742', '0,100001,649,742', '����', '230811', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('747', '742', '0,100001,649,742', '������', '230822', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('748', '742', '0,100001,649,742', '�봨��', '230826', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('749', '742', '0,100001,649,742', '��ԭ��', '230828', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('75', '35', '0,100001,35', '�ػʵ���', '130300', '0335', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('750', '742', '0,100001,649,742', '��Զ��', '230833', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('751', '742', '0,100001,649,742', 'ͬ����', '230881', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('752', '742', '0,100001,649,742', '������', '230882', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('753', '649', '0,100001,649', '��̨����', '230900', '0464', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('754', '753', '0,100001,649,753', '������', '230902', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('755', '753', '0,100001,649,753', '��ɽ��', '230903', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('756', '753', '0,100001,649,753', '���Ӻ���', '230904', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('757', '753', '0,100001,649,753', '������', '230921', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('758', '649', '0,100001,649', 'ĵ������', '231000', '0453', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('759', '758', '0,100001,649,758', '������', '231002', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('76', '75', '0,100001,35,75', '������', '130302', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('760', '758', '0,100001,649,758', '������', '231003', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('761', '758', '0,100001,649,758', '������', '231004', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('762', '758', '0,100001,649,758', '������', '231005', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('763', '758', '0,100001,649,758', '������', '231024', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('764', '758', '0,100001,649,758', '�ֿ���', '231025', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('765', '758', '0,100001,649,758', '��Һ���', '231081', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('766', '758', '0,100001,649,758', '������', '231083', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('767', '758', '0,100001,649,758', '������', '231084', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('768', '758', '0,100001,649,758', '������', '231085', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('769', '649', '0,100001,649', '�ں���', '231100', '0456', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('77', '75', '0,100001,35,75', 'ɽ������', '130303', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('770', '769', '0,100001,649,769', '������', '231102', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('771', '769', '0,100001,649,769', '�۽���', '231121', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('772', '769', '0,100001,649,769', 'ѷ����', '231123', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('773', '769', '0,100001,649,769', '������', '231124', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('774', '769', '0,100001,649,769', '������', '231181', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('775', '769', '0,100001,649,769', '���������', '231182', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('776', '649', '0,100001,649', '�绯��', '231200', '0455', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('777', '776', '0,100001,649,776', '������', '231202', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('778', '776', '0,100001,649,776', '������', '231221', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('779', '776', '0,100001,649,776', '������', '231222', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('78', '75', '0,100001,35,75', '��������', '130304', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('780', '776', '0,100001,649,776', '�����', '231223', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('781', '776', '0,100001,649,776', '�찲��', '231224', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('782', '776', '0,100001,649,776', '��ˮ��', '231225', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('783', '776', '0,100001,649,776', '������', '231226', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('784', '776', '0,100001,649,776', '������', '231281', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('785', '776', '0,100001,649,776', '�ض���', '231282', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('786', '776', '0,100001,649,776', '������', '231283', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('787', '649', '0,100001,649', '���˰������', '232700', '0457', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('788', '787', '0,100001,649,787', '�Ӹ������', '232701', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('789', '787', '0,100001,649,787', '������', '232702', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('79', '75', '0,100001,35,75', '��������������', '130321', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('790', '787', '0,100001,649,787', '������', '232703', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('791', '787', '0,100001,649,787', '������', '232704', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('792', '787', '0,100001,649,787', '������', '232721', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('793', '787', '0,100001,649,787', '������', '232722', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('794', '787', '0,100001,649,787', 'Į����', '232723', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('795', '100001', '0100001,', '�Ϻ���', '310000', '021', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:27:35', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('796', '795', '0,100001,795', '������', '310101', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('797', '795', '0,100001,795', '�����', '310104', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('798', '795', '0,100001,795', '������', '310105', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('799', '795', '0,100001,795', '������', '310106', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('8', '1', '0,100001,1', '��ͷ����', '110109', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('80', '75', '0,100001,35,75', '������', '130322', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('800', '795', '0,100001,795', '������', '310107', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('801', '795', '0,100001,795', 'բ����', '310108', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('802', '795', '0,100001,795', '�����', '310109', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('803', '795', '0,100001,795', '������', '310110', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('804', '795', '0,100001,795', '������', '310112', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('805', '795', '0,100001,795', '��ɽ��', '310113', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('806', '795', '0,100001,795', '�ζ���', '310114', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('807', '795', '0,100001,795', '�ֶ�����', '310115', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('808', '795', '0,100001,795', '��ɽ��', '310116', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('809', '795', '0,100001,795', '�ɽ���', '310117', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('81', '75', '0,100001,35,75', '������', '130323', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('810', '795', '0,100001,795', '������', '310118', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('811', '795', '0,100001,795', '������', '310120', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('812', '795', '0,100001,795', '������', '310230', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('813', '100001', '0,100001', '����ʡ', '320000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('814', '813', '0,100001,813', '�Ͼ���', '320100', '025', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('815', '814', '0,100001,813,814', '������', '320102', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('816', '814', '0,100001,813,814', '������', '320103', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('817', '814', '0,100001,813,814', '�ػ���', '320104', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('818', '814', '0,100001,813,814', '������', '320105', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('819', '814', '0,100001,813,814', '��¥��', '320106', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('82', '75', '0,100001,35,75', '¬����', '130324', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('820', '814', '0,100001,813,814', '�¹���', '320107', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('821', '814', '0,100001,813,814', '�ֿ���', '320111', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('822', '814', '0,100001,813,814', '��ϼ��', '320113', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('823', '814', '0,100001,813,814', '�껨̨��', '320114', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('824', '814', '0,100001,813,814', '������', '320115', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('825', '814', '0,100001,813,814', '������', '320116', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('826', '814', '0,100001,813,814', '��ˮ��', '320124', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('827', '814', '0,100001,813,814', '�ߴ���', '320125', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('828', '813', '0,100001,813', '������', '320200', '0510', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('829', '828', '0,100001,813,828', '�簲��', '320202', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('83', '35', '0,100001,35', '������', '130400', '0310', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('830', '828', '0,100001,813,828', '�ϳ���', '320203', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('831', '828', '0,100001,813,828', '������', '320204', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('832', '828', '0,100001,813,828', '��ɽ��', '320205', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('833', '828', '0,100001,813,828', '��ɽ��', '320206', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('834', '828', '0,100001,813,828', '������', '320211', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('835', '828', '0,100001,813,828', '������', '320281', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('836', '828', '0,100001,813,828', '������', '320282', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('837', '813', '0,100001,813', '������', '320300', '0516', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('838', '837', '0,100001,813,837', '��¥��', '320302', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('839', '837', '0,100001,813,837', '������', '320303', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('84', '83', '0,100001,35,83', '��ɽ��', '130402', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('840', '837', '0,100001,813,837', '������', '320305', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('841', '837', '0,100001,813,837', 'Ȫɽ��', '320311', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('842', '837', '0,100001,813,837', 'ͭɽ��', '320312', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('843', '837', '0,100001,813,837', '����', '320321', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('844', '837', '0,100001,813,837', '����', '320322', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('845', '837', '0,100001,813,837', '�����', '320324', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('846', '837', '0,100001,813,837', '������', '320381', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('847', '837', '0,100001,813,837', '������', '320382', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('848', '813', '0,100001,813', '������', '320400', '0519', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('849', '848', '0,100001,813,848', '������', '320402', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('85', '83', '0,100001,35,83', '��̨��', '130403', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('850', '848', '0,100001,813,848', '��¥��', '320404', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('851', '848', '0,100001,813,848', '��������', '320405', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('852', '848', '0,100001,813,848', '�±���', '320411', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('853', '848', '0,100001,813,848', '�����', '320412', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('854', '848', '0,100001,813,848', '������', '320481', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('855', '848', '0,100001,813,848', '��̳��', '320482', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('856', '813', '0,100001,813', '������', '320500', '0512', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('857', '856', '0,100001,813,856', '������', '320503', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('858', '856', '0,100001,813,856', '������', '320505', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('859', '856', '0,100001,813,856', '������', '320506', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('86', '83', '0,100001,35,83', '������', '130404', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('860', '856', '0,100001,813,856', '�����', '320507', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('861', '856', '0,100001,813,856', '������', '320581', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('862', '856', '0,100001,813,856', '�żҸ���', '320582', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('863', '856', '0,100001,813,856', '��ɽ��', '320583', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('864', '856', '0,100001,813,856', '�⽭��', '320584', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('865', '856', '0,100001,813,856', '̫����', '320585', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('866', '813', '0,100001,813', '��ͨ��', '320600', '0513', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('867', '866', '0,100001,813,866', '�紨��', '320602', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('868', '866', '0,100001,813,866', '��բ��', '320611', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('869', '866', '0,100001,813,866', 'ͨ����', '320612', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('87', '83', '0,100001,35,83', '������', '130406', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('870', '866', '0,100001,813,866', '������', '320621', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('871', '866', '0,100001,813,866', '�綫��', '320623', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('872', '866', '0,100001,813,866', '������', '320681', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('873', '866', '0,100001,813,866', '�����', '320682', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('874', '866', '0,100001,813,866', '������', '320684', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('875', '813', '0,100001,813', '���Ƹ���', '320700', '0518', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('876', '875', '0,100001,813,875', '������', '320703', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('877', '875', '0,100001,813,875', '������', '320705', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('878', '875', '0,100001,813,875', '������', '320706', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('879', '875', '0,100001,813,875', '������', '320721', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('88', '83', '0,100001,35,83', '������', '130421', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('880', '875', '0,100001,813,875', '������', '320722', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('881', '875', '0,100001,813,875', '������', '320723', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('882', '875', '0,100001,813,875', '������', '320724', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('883', '813', '0,100001,813', '������', '320800', '0517', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('884', '883', '0,100001,813,883', '�����', '320802', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('885', '883', '0,100001,813,883', '������', '320803', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('886', '883', '0,100001,813,883', '������', '320804', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('887', '883', '0,100001,813,883', '������', '320811', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('888', '883', '0,100001,813,883', '��ˮ��', '320826', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('889', '883', '0,100001,813,883', '������', '320829', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('89', '83', '0,100001,35,83', '������', '130423', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('890', '883', '0,100001,813,883', '������', '320830', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('891', '883', '0,100001,813,883', '�����', '320831', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('892', '813', '0,100001,813', '�γ���', '320900', '0515', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('893', '892', '0,100001,813,892', 'ͤ����', '320902', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('894', '892', '0,100001,813,892', '�ζ���', '320903', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('895', '892', '0,100001,813,892', '��ˮ��', '320921', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('896', '892', '0,100001,813,892', '������', '320922', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('897', '892', '0,100001,813,892', '������', '320923', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('898', '892', '0,100001,813,892', '������', '320924', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('899', '892', '0,100001,813,892', '������', '320925', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('9', '1', '0,100001,1', '��ɽ��', '110111', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('90', '83', '0,100001,35,83', '�ɰ���', '130424', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('900', '892', '0,100001,813,892', '��̨��', '320981', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('901', '892', '0,100001,813,892', '�����', '320982', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('902', '813', '0,100001,813', '������', '321000', '0514', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('903', '902', '0,100001,813,902', '������', '321002', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('904', '902', '0,100001,813,902', '������', '321003', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('905', '902', '0,100001,813,902', '��Ӧ��', '321023', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('906', '902', '0,100001,813,902', '������', '321081', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('907', '902', '0,100001,813,902', '������', '321084', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('908', '902', '0,100001,813,902', '������', '321088', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('909', '813', '0,100001,813', '����', '321100', '0511', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('91', '83', '0,100001,35,83', '������', '130425', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('910', '909', '0,100001,813,909', '������', '321102', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('911', '909', '0,100001,813,909', '������', '321111', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('912', '909', '0,100001,813,909', '��ͽ��', '321112', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('913', '909', '0,100001,813,909', '������', '321181', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('914', '909', '0,100001,813,909', '������', '321182', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('915', '909', '0,100001,813,909', '������', '321183', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('916', '813', '0,100001,813', '̩����', '321200', '0523', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('917', '916', '0,100001,813,916', '������', '321202', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('918', '916', '0,100001,813,916', '�߸���', '321203', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('919', '916', '0,100001,813,916', '�˻���', '321281', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('92', '83', '0,100001,35,83', '����', '130426', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('920', '916', '0,100001,813,916', '������', '321282', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('921', '916', '0,100001,813,916', '̩����', '321283', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('922', '916', '0,100001,813,916', '������', '321284', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('923', '813', '0,100001,813', '��Ǩ��', '321300', '0527', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('924', '923', '0,100001,813,923', '�޳���', '321302', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('925', '923', '0,100001,813,923', '��ԥ��', '321311', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('926', '923', '0,100001,813,923', '������', '321322', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('927', '923', '0,100001,813,923', '������', '321323', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('928', '923', '0,100001,813,923', '������', '321324', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('929', '100001', '0,100001', '�㽭ʡ', '330000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('93', '83', '0,100001,35,83', '����', '130427', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('930', '929', '0,100001,929', '������', '330100', '0571', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('931', '930', '0,100001,929,930', '�ϳ���', '330102', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('932', '930', '0,100001,929,930', '�³���', '330103', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('933', '930', '0,100001,929,930', '������', '330104', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('934', '930', '0,100001,929,930', '������', '330105', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('935', '930', '0,100001,929,930', '������', '330106', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('936', '930', '0,100001,929,930', '������', '330108', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('937', '930', '0,100001,929,930', '��ɽ��', '330109', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('938', '930', '0,100001,929,930', '�ຼ��', '330110', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('939', '930', '0,100001,929,930', 'ͩ®��', '330122', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('94', '83', '0,100001,35,83', '������', '130428', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('940', '930', '0,100001,929,930', '������', '330127', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('941', '930', '0,100001,929,930', '������', '330182', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('942', '930', '0,100001,929,930', '������', '330183', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('943', '930', '0,100001,929,930', '�ٰ���', '330185', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('944', '929', '0,100001,929', '������', '330200', '0574', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('945', '944', '0,100001,929,944', '������', '330203', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('946', '944', '0,100001,929,944', '������', '330204', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('947', '944', '0,100001,929,944', '������', '330205', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('948', '944', '0,100001,929,944', '������', '330206', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('949', '944', '0,100001,929,944', '����', '330211', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('95', '83', '0,100001,35,83', '������', '130429', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('950', '944', '0,100001,929,944', '۴����', '330212', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('951', '944', '0,100001,929,944', '��ɽ��', '330225', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('952', '944', '0,100001,929,944', '������', '330226', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('953', '944', '0,100001,929,944', '��Ҧ��', '330281', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('954', '944', '0,100001,929,944', '��Ϫ��', '330282', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('955', '944', '0,100001,929,944', '���', '330283', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('956', '929', '0,100001,929', '������', '330300', '0577', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('957', '956', '0,100001,929,956', '¹����', '330302', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('958', '956', '0,100001,929,956', '������', '330303', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('959', '956', '0,100001,929,956', '걺���', '330304', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('96', '83', '0,100001,35,83', '����', '130430', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('960', '956', '0,100001,929,956', '��ͷ��', '330322', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('961', '956', '0,100001,929,956', '������', '330324', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('962', '956', '0,100001,929,956', 'ƽ����', '330326', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('963', '956', '0,100001,929,956', '������', '330327', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('964', '956', '0,100001,929,956', '�ĳ���', '330328', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('965', '956', '0,100001,929,956', '̩˳��', '330329', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('966', '956', '0,100001,929,956', '����', '330381', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('967', '956', '0,100001,929,956', '������', '330382', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('968', '929', '0,100001,929', '������', '330400', '0573', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('969', '968', '0,100001,929,968', '�Ϻ���', '330402', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('97', '83', '0,100001,35,83', '������', '130431', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('970', '968', '0,100001,929,968', '������', '330411', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('971', '968', '0,100001,929,968', '������', '330421', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('972', '968', '0,100001,929,968', '������', '330424', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('973', '968', '0,100001,929,968', '������', '330481', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('974', '968', '0,100001,929,968', 'ƽ����', '330482', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('975', '968', '0,100001,929,968', 'ͩ����', '330483', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('976', '929', '0,100001,929', '������', '330500', '0572', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('977', '976', '0,100001,929,976', '������', '330502', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('978', '976', '0,100001,929,976', '�����', '330503', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('979', '976', '0,100001,929,976', '������', '330521', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('98', '83', '0,100001,35,83', '��ƽ��', '130432', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('980', '976', '0,100001,929,976', '������', '330522', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('981', '976', '0,100001,929,976', '������', '330523', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('982', '929', '0,100001,929', '������', '330600', '0575', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('983', '982', '0,100001,929,982', 'Խ����', '330602', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('984', '982', '0,100001,929,982', '������', '330621', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('985', '982', '0,100001,929,982', '�²���', '330624', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('986', '982', '0,100001,929,982', '������', '330681', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('987', '982', '0,100001,929,982', '������', '330682', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('988', '982', '0,100001,929,982', '������', '330683', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('989', '929', '0,100001,929', '����', '330700', '0579', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('99', '83', '0,100001,35,83', '������', '130433', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('990', '989', '0,100001,929,989', '�ĳ���', '330702', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('991', '989', '0,100001,929,989', '����', '330703', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('992', '989', '0,100001,929,989', '������', '330723', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('993', '989', '0,100001,929,989', '�ֽ���', '330726', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('994', '989', '0,100001,929,989', '�Ͱ���', '330727', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('995', '989', '0,100001,929,989', '��Ϫ��', '330781', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('996', '989', '0,100001,929,989', '������', '330782', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('997', '989', '0,100001,929,989', '������', '330783', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('998', '989', '0,100001,929,989', '������', '330784', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('999', '929', '0,100001,929', '������', '330800', '0570', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');


SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS test_data;
DROP TABLE IF EXISTS test_data_child;
DROP TABLE IF EXISTS test_data_main;
DROP TABLE IF EXISTS test_tree;




/* Create Tables */

CREATE TABLE test_data
(
	id varchar(64) NOT NULL COMMENT '���',
	user_id varchar(64) COMMENT '�����û�',
	office_id varchar(64) COMMENT '��������',
	area_id varchar(64) COMMENT '��������',
	name varchar(100) COMMENT '����',
	sex char(1) COMMENT '�Ա�',
	in_date date COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ�����ݱ�';


CREATE TABLE test_data_child
(
	id varchar(64) NOT NULL COMMENT '���',
	test_data_main_id varchar(64) COMMENT 'ҵ������ID',
	name varchar(100) COMMENT '����',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ�������ӱ�';


CREATE TABLE test_data_main
(
	id varchar(64) NOT NULL COMMENT '���',
	user_id varchar(64) COMMENT '�����û�',
	office_id varchar(64) COMMENT '��������',
	area_id varchar(64) COMMENT '��������',
	name varchar(100) COMMENT '����',
	sex char(1) COMMENT '�Ա�',
	in_date date COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ�����ݱ�';


CREATE TABLE test_tree
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '���ṹ��';



/* Create Indexes */

CREATE INDEX test_data_del_flag ON test_data (del_flag ASC);
CREATE INDEX test_data_child_del_flag ON test_data_child (del_flag ASC);
CREATE INDEX test_data_main_del_flag ON test_data_main (del_flag ASC);
CREATE INDEX test_tree_del_flag ON test_tree (del_flag ASC);
CREATE INDEX test_data_parent_id ON test_tree (parent_id ASC);
/*CREATE INDEX test_data_parent_ids ON test_tree (parent_ids ASC);*/







