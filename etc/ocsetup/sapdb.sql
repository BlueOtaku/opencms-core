CREATE TABLE CMS_SYSTEMPROPERTIES
(SYSTEMPROPERTY_ID INT not null,
 SYSTEMPROPERTY_NAME VARCHAR(40) not null,
 SYSTEMPROPERTY_VALUE LONG BYTE,
 PRIMARY KEY (SYSTEMPROPERTY_ID),
 UNIQUE (SYSTEMPROPERTY_NAME));

CREATE TABLE CMS_USERS
(USER_ID INT not null,
 USER_NAME VARCHAR(64) not null,
 USER_PASSWORD VARCHAR(32) not null,
 USER_RECOVERY_PASSWORD VARCHAR(32) not null,
 USER_DESCRIPTION VARCHAR(255) not null,
 USER_FIRSTNAME VARCHAR(50) not null,
 USER_LASTNAME VARCHAR(50) not null,
 USER_EMAIL VARCHAR(100) not null,
 USER_LASTLOGIN DATE not null,
 USER_LASTUSED DATE not null,
 USER_FLAGS INT not null,
 USER_INFO LONG BYTE,
 USER_DEFAULT_GROUP_ID INT not null,
 USER_ADDRESS VARCHAR(100) not null,
 USER_SECTION VARCHAR(50) not null,
 USER_TYPE INT not null,
 primary key(USER_ID),
 unique(USER_NAME));

CREATE TABLE CMS_PROJECTS
(PROJECT_ID INT not null,
 USER_ID INT not null,
 GROUP_ID INT not null,
 MANAGERGROUP_ID INT not null,
 TASK_ID INT not null,
 PROJECT_NAME VARCHAR(64) not null,
 PROJECT_DESCRIPTION VARCHAR(255) not null,
 PROJECT_FLAGS INT not null,
 PROJECT_CREATEDATE date not null,
 PROJECT_TYPE INT not null,
 primary key (PROJECT_ID),
 unique(PROJECT_NAME,PROJECT_CREATEDATE));

CREATE TABLE CMS_BACKUP_PROJECTS
(VERSION_ID INT not null,
 PROJECT_ID INT not null,
 PROJECT_NAME VARCHAR(64) not null,
 PROJECT_PUBLISHDATE date,
 PROJECT_PUBLISHED_BY INT not null,
 PROJECT_PUBLISHED_BY_NAME VARCHAR(167),
 USER_ID INT not null,
 USER_NAME VARCHAR(167),
 GROUP_ID INT not null,
 GROUP_NAME VARCHAR(64),
 MANAGERGROUP_ID INT not null,
 MANAGERGROUP_NAME VARCHAR(64),
 PROJECT_DESCRIPTION VARCHAR(255) not null,
 PROJECT_CREATEDATE date not null,
 PROJECT_TYPE INT not null,
 TASK_ID INT not null,
 primary key (VERSION_ID));

CREATE TABLE CMS_PROJECTRESOURCES
(PROJECT_ID INT NOT NULL,
RESOURCE_NAME VARCHAR(248) NOT NULL,
PRIMARY KEY (PROJECT_ID, RESOURCE_NAME));

CREATE TABLE CMS_BACKUP_PROJECTRESOURCES
(VERSION_ID INT NOT NULL,
 PROJECT_ID INT NOT NULL,
 RESOURCE_NAME VARCHAR(248) NOT NULL,
 PRIMARY KEY (VERSION_ID, PROJECT_ID, RESOURCE_NAME));

CREATE TABLE CMS_PROPERTYDEF
(PROPERTYDEF_ID INT not null,
 PROPERTYDEF_NAME VARCHAR(64) not null,
 RESOURCE_TYPE INT not null,
 primary key(PROPERTYDEF_ID),
 unique(PROPERTYDEF_NAME, RESOURCE_TYPE));

CREATE TABLE CMS_ONLINE_PROPERTYDEF
(PROPERTYDEF_ID INT not null,
 PROPERTYDEF_NAME VARCHAR(64) not null,
 RESOURCE_TYPE INT not null,
 primary key(PROPERTYDEF_ID),
 unique(PROPERTYDEF_NAME, RESOURCE_TYPE));

CREATE TABLE CMS_BACKUP_PROPERTYDEF
(PROPERTYDEF_ID INT not null,
 PROPERTYDEF_NAME VARCHAR(64) not null,
 RESOURCE_TYPE INT not null,
 primary key(PROPERTYDEF_ID),
 unique(PROPERTYDEF_NAME, RESOURCE_TYPE));

CREATE TABLE CMS_PROPERTIES
(PROPERTY_ID INT not null,
 PROPERTYDEF_ID INT not null,
 RESOURCE_ID INT not null,
 PROPERTY_VALUE VARCHAR(255) not null,
 primary key(PROPERTY_ID),
 unique(PROPERTYDEF_ID,
 RESOURCE_ID));

CREATE TABLE CMS_ONLINE_PROPERTIES
(PROPERTY_ID INT not null,
 PROPERTYDEF_ID INT not null,
 RESOURCE_ID INT not null,
 PROPERTY_VALUE VARCHAR(255) not null,
 primary key(PROPERTY_ID),
 unique(PROPERTYDEF_ID,
 RESOURCE_ID));

CREATE TABLE CMS_BACKUP_PROPERTIES
(PROPERTY_ID INT not null,
 PROPERTYDEF_ID INT not null,
 RESOURCE_ID INT not null,
 PROPERTY_VALUE VARCHAR(255) not null,
 VERSION_ID INT,
 primary key(PROPERTY_ID),
 unique(PROPERTYDEF_ID,
 RESOURCE_ID));

CREATE TABLE CMS_RESOURCES
(RESOURCE_ID INT not null,
 PARENT_ID INT not null,
 RESOURCE_NAME VARCHAR(248) not null,
 RESOURCE_TYPE INT not null,
 RESOURCE_FLAGS INT not null,
 USER_ID INT not null,
 GROUP_ID INT not null,
 PROJECT_ID INT not null,
 FILE_ID INT not null,
 ACCESS_FLAGS INT not null,
 STATE INT not null,
 LOCKED_BY INT not null,
 LAUNCHER_TYPE INT not null,
 LAUNCHER_CLASSNAME VARCHAR(255) not null,
 DATE_CREATED DATE not null,
 DATE_LASTMODIFIED DATE not null,
 RESOURCE_SIZE INT not null,
 RESOURCE_LASTMODIFIED_BY INT not null,
 primary key(RESOURCE_ID),
 unique(RESOURCE_NAME));

CREATE TABLE CMS_ONLINE_RESOURCES
(RESOURCE_ID INT not null,
 PARENT_ID INT not null,
 RESOURCE_NAME VARCHAR(248) not null,
 RESOURCE_TYPE INT not null,
 RESOURCE_FLAGS INT not null,
 USER_ID INT not null,
 GROUP_ID INT not null,
 PROJECT_ID INT not null,
 FILE_ID INT not null,
 ACCESS_FLAGS INT not null,
 STATE INT not null,
 LOCKED_BY INT not null,
 LAUNCHER_TYPE INT not null,
 LAUNCHER_CLASSNAME VARCHAR(255) not null,
 DATE_CREATED DATE not null,
 DATE_LASTMODIFIED DATE not null,
 RESOURCE_SIZE INT not null,
 RESOURCE_LASTMODIFIED_BY INT not null,
 primary key(RESOURCE_ID),
 unique(RESOURCE_NAME));

CREATE TABLE CMS_BACKUP_RESOURCES
(RESOURCE_ID INT not null,
 PARENT_ID INT not null,
 RESOURCE_NAME VARCHAR(248) not null,
 RESOURCE_TYPE INT not null,
 RESOURCE_FLAGS INT not null,
 USER_ID INT not null,
 USER_NAME VARCHAR(167),
 GROUP_ID INT not null,
 GROUP_NAME VARCHAR(64),
 PROJECT_ID INT not null,
 FILE_ID INT not null,
 ACCESS_FLAGS INT not null,
 STATE INT not null,
 LAUNCHER_TYPE INT not null,
 LAUNCHER_CLASSNAME VARCHAR(255) not null,
 DATE_CREATED DATE not null,
 DATE_LASTMODIFIED DATE not null,
 RESOURCE_SIZE INT not null,
 RESOURCE_LASTMODIFIED_BY INT not null,
 RESOURCE_LASTMODIFIED_BY_NAME VARCHAR(167),
 VERSION_ID INT not null,
 primary key(RESOURCE_ID),
 unique(VERSION_ID,RESOURCE_NAME));

CREATE TABLE CMS_FILES
(FILE_ID INT not null,
 FILE_CONTENT LONG BYTE not null,
 primary key (FILE_ID));

CREATE TABLE CMS_ONLINE_FILES
(FILE_ID INT not null,
 FILE_CONTENT LONG BYTE not null,
 primary key (FILE_ID));

CREATE TABLE CMS_BACKUP_FILES
(FILE_ID INT not null,
 FILE_CONTENT LONG BYTE not null,
 VERSION_ID INT,
 primary key (FILE_ID));

CREATE TABLE CMS_GROUPS
(GROUP_ID INT not null,
 PARENT_GROUP_ID INT not null,
 GROUP_NAME VARCHAR(64) not null,
 GROUP_DESCRIPTION VARCHAR(255) not null,
 GROUP_FLAGS INT not null,
 primary key(GROUP_ID),
 unique(GROUP_NAME));

CREATE TABLE CMS_SYSTEMID
(TABLE_KEY VARCHAR(255) not null,
 ID INT not null,
 primary key (TABLE_KEY));

CREATE TABLE CMS_EXPORT_LINKS           
(LINK_ID INT not null,
 LINK VARCHAR(255) not null,
 CREATEDATE DATE not null,
 PROCESSED INT,
 primary key (LINK_ID),
 unique (LINK));

CREATE TABLE CMS_EXPORT_DEPENDENCIES    
(LINK_ID INT not null,
 RESOURCENAME VARCHAR(255),
 unique(LINK_ID, RESOURCENAME));

CREATE TABLE CMS_LINKS
(PAGE_ID INT not null,
 LINK_DEST VARCHAR(255),
 unique(PAGE_ID, LINK_DEST));

CREATE TABLE CMS_ONLINE_LINKS
(PAGE_ID INT not null,
 LINK_DEST VARCHAR(255),
 unique(PAGE_ID, LINK_DEST));

CREATE TABLE CMS_GROUPUSERS
(GROUP_ID INT not null,
 USER_ID INT not null,
 GROUPUSER_FLAGS INT not null);

CREATE TABLE CMS_Task
(autofinish INT,
 endtime date,
 escalationtyperef INT,
 id INT NOT NULL,
 initiatoruserref INT,
 milestoneref INT,
 name varchar(254),
 originaluserref INT,
 agentuserref INT,
 parent INT,
 percentage varchar(50),
 permission varchar(50),
 priorityref INT DEFAULT '2',
 roleref INT,
 root INT,
 starttime date,
 state INT,
 tasktyperef INT,
 timeout date,
 wakeuptime date,
 htmllink varchar(254),
 estimatetime INT DEFAULT '86400',
 PRIMARY KEY (id));

CREATE TABLE CMS_TaskType
(autofinish INT,
 escalationtyperef INT,
 htmllink varchar(254),
 id INT NOT NULL,
 name varchar(50),
 permission varchar(50),
 priorityref INT,
 roleref INT,
 PRIMARY KEY (id));

CREATE TABLE CMS_TaskLog
(coment long,
 externalusername varchar(254),
 id INT NOT NULL,
 starttime date,
 taskref INT,
 userref INT,
 type INT DEFAULT '0',
 PRIMARY KEY (id));

CREATE TABLE CMS_TaskPar
(id INT NOT NULL,
 parname varchar(50),
 parvalue varchar(50),
 ref INT,
 PRIMARY KEY (id));

create table CMS_SESSIONS
(SESSION_ID varchar(255) not null,
SESSION_LASTUSED DATE not null,
SESSION_DATA LONG BYTE not null,
primary key(SESSION_ID));

create table CMS_MODULE_ONLINE_MASTER   
(MASTER_ID INT not null,
SUB_ID INT not null,
USER_ID INT not null,
GROUP_ID INT not null,
PROJECT_ID INT not null,
ACCESS_FLAGS INT not null,
STATE INT not null,
LOCKED_BY INT not null,
LASTMODIFIED_BY INT not null,
DATE_CREATED DATE not null,
DATE_LASTMODIFIED DATE not null,
PUBLICATION_DATE DATE,
PURGE_DATE DATE,
FLAGS INT,
FEED_ID INT,
FEED_REFERENCE INT,
FEED_FILENAME VARCHAR(255),
TITLE VARCHAR(255),
DATA_BIG_0 LONG VARCHAR,
DATA_BIG_1 LONG VARCHAR,
DATA_BIG_2 LONG VARCHAR,
DATA_BIG_3 LONG VARCHAR,
DATA_BIG_4 LONG VARCHAR,
DATA_BIG_5 LONG VARCHAR,
DATA_BIG_6 LONG VARCHAR,
DATA_BIG_7 LONG VARCHAR,
DATA_BIG_8 LONG VARCHAR,
DATA_BIG_9 LONG VARCHAR,
DATA_MEDIUM_0 LONG VARCHAR,
DATA_MEDIUM_1 LONG VARCHAR,
DATA_MEDIUM_2 LONG VARCHAR,
DATA_MEDIUM_3 LONG VARCHAR,
DATA_MEDIUM_4 LONG VARCHAR,
DATA_MEDIUM_5 LONG VARCHAR,
DATA_MEDIUM_6 LONG VARCHAR,
DATA_MEDIUM_7 LONG VARCHAR,
DATA_MEDIUM_8 LONG VARCHAR,
DATA_MEDIUM_9 LONG VARCHAR,
DATA_SMALL_0 LONG VARCHAR,
DATA_SMALL_1 LONG VARCHAR,
DATA_SMALL_2 LONG VARCHAR,
DATA_SMALL_3 LONG VARCHAR,
DATA_SMALL_4 LONG VARCHAR,
DATA_SMALL_5 LONG VARCHAR,
DATA_SMALL_6 LONG VARCHAR,
DATA_SMALL_7 LONG VARCHAR,
DATA_SMALL_8 LONG VARCHAR,
DATA_SMALL_9 LONG VARCHAR,
DATA_SMALL_10 LONG VARCHAR,
DATA_SMALL_11 LONG VARCHAR,
DATA_SMALL_12 LONG VARCHAR,
DATA_SMALL_13 LONG VARCHAR,
DATA_SMALL_14 LONG VARCHAR,
DATA_SMALL_15 LONG VARCHAR,
DATA_SMALL_16 LONG VARCHAR,
DATA_SMALL_17 LONG VARCHAR,
DATA_SMALL_18 LONG VARCHAR,
DATA_SMALL_19 LONG VARCHAR,
DATA_SMALL_20 LONG VARCHAR,
DATA_SMALL_21 LONG VARCHAR,
DATA_SMALL_22 LONG VARCHAR,
DATA_SMALL_23 LONG VARCHAR,
DATA_SMALL_24 LONG VARCHAR,
DATA_SMALL_25 LONG VARCHAR,
DATA_SMALL_26 LONG VARCHAR,
DATA_SMALL_27 LONG VARCHAR,
DATA_SMALL_28 LONG VARCHAR,
DATA_SMALL_29 LONG VARCHAR,
DATA_SMALL_30 LONG VARCHAR,
DATA_SMALL_31 LONG VARCHAR,
DATA_SMALL_32 LONG VARCHAR,
DATA_SMALL_33 LONG VARCHAR,
DATA_SMALL_34 LONG VARCHAR,
DATA_SMALL_35 LONG VARCHAR,
DATA_SMALL_36 LONG VARCHAR,
DATA_SMALL_37 LONG VARCHAR,
DATA_SMALL_38 LONG VARCHAR,
DATA_SMALL_39 LONG VARCHAR,
DATA_INT_0 INT,
DATA_INT_1 INT,
DATA_INT_2 INT,
DATA_INT_3 INT,
DATA_INT_4 INT,
DATA_INT_5 INT,
DATA_INT_6 INT,
DATA_INT_7 INT,
DATA_INT_8 INT,
DATA_INT_9 INT,
DATA_REFERENCE_0 INT,
DATA_REFERENCE_1 INT,
DATA_REFERENCE_2 INT,
DATA_REFERENCE_3 INT,
DATA_REFERENCE_4 INT,
DATA_REFERENCE_5 INT,
DATA_REFERENCE_6 INT,
DATA_REFERENCE_7 INT,
DATA_REFERENCE_8 INT,
DATA_REFERENCE_9 INT,
DATA_DATE_0 DATE,
DATA_DATE_1 DATE,
DATA_DATE_2 DATE,
DATA_DATE_3 DATE,
DATA_DATE_4 DATE,
primary key(MASTER_ID));

create table CMS_MODULE_ONLINE_CHANNEL_REL
(MASTER_ID INT not null,
CHANNEL_ID INT not null,
primary key(CHANNEL_ID, MASTER_ID));

create table CMS_MODULE_ONLINE_MEDIA    
(MEDIA_ID INT not null,
MASTER_ID INT not null,
MEDIA_POSITION INT not null,
MEDIA_WIDTH INT not null,
MEDIA_HEIGHT INT not null,
MEDIA_SIZE INT not null,
MEDIA_MIMETYPE VARCHAR(255),
MEDIA_TYPE INT not null,
MEDIA_TITLE VARCHAR(255),
MEDIA_NAME VARCHAR(255),
MEDIA_DESCRIPTION VARCHAR(500) not null,
MEDIA LONG BYTE not null,
primary key(MEDIA_ID));

create table CMS_MODULE_MASTER 
(MASTER_ID INT not null,
SUB_ID INT not null,
USER_ID INT not null,
GROUP_ID INT not null,
PROJECT_ID INT not null,
ACCESS_FLAGS INT not null,
STATE INT not null,
LOCKED_BY INT not null,
LASTMODIFIED_BY INT not null,
DATE_CREATED DATE not null,
DATE_LASTMODIFIED DATE not null,
PUBLICATION_DATE DATE,
PURGE_DATE DATE,
FLAGS INT,
FEED_ID INT,
FEED_REFERENCE INT,
FEED_FILENAME VARCHAR(255),
TITLE VARCHAR(255),
DATA_BIG_0 LONG VARCHAR,
DATA_BIG_1 LONG VARCHAR,
DATA_BIG_2 LONG VARCHAR,
DATA_BIG_3 LONG VARCHAR,
DATA_BIG_4 LONG VARCHAR,
DATA_BIG_5 LONG VARCHAR,
DATA_BIG_6 LONG VARCHAR,
DATA_BIG_7 LONG VARCHAR,
DATA_BIG_8 LONG VARCHAR,
DATA_BIG_9 LONG VARCHAR,
DATA_MEDIUM_0 LONG VARCHAR,
DATA_MEDIUM_1 LONG VARCHAR,
DATA_MEDIUM_2 LONG VARCHAR,
DATA_MEDIUM_3 LONG VARCHAR,
DATA_MEDIUM_4 LONG VARCHAR,
DATA_MEDIUM_5 LONG VARCHAR,
DATA_MEDIUM_6 LONG VARCHAR,
DATA_MEDIUM_7 LONG VARCHAR,
DATA_MEDIUM_8 LONG VARCHAR,
DATA_MEDIUM_9 LONG VARCHAR,
DATA_SMALL_0 LONG VARCHAR,
DATA_SMALL_1 LONG VARCHAR,
DATA_SMALL_2 LONG VARCHAR,
DATA_SMALL_3 LONG VARCHAR,
DATA_SMALL_4 LONG VARCHAR,
DATA_SMALL_5 LONG VARCHAR,
DATA_SMALL_6 LONG VARCHAR,
DATA_SMALL_7 LONG VARCHAR,
DATA_SMALL_8 LONG VARCHAR,
DATA_SMALL_9 LONG VARCHAR,
DATA_SMALL_10 LONG VARCHAR,
DATA_SMALL_11 LONG VARCHAR,
DATA_SMALL_12 LONG VARCHAR,
DATA_SMALL_13 LONG VARCHAR,
DATA_SMALL_14 LONG VARCHAR,
DATA_SMALL_15 LONG VARCHAR,
DATA_SMALL_16 LONG VARCHAR,
DATA_SMALL_17 LONG VARCHAR,
DATA_SMALL_18 LONG VARCHAR,
DATA_SMALL_19 LONG VARCHAR,
DATA_SMALL_20 LONG VARCHAR,
DATA_SMALL_21 LONG VARCHAR,
DATA_SMALL_22 LONG VARCHAR,
DATA_SMALL_23 LONG VARCHAR,
DATA_SMALL_24 LONG VARCHAR,
DATA_SMALL_25 LONG VARCHAR,
DATA_SMALL_26 LONG VARCHAR,
DATA_SMALL_27 LONG VARCHAR,
DATA_SMALL_28 LONG VARCHAR,
DATA_SMALL_29 LONG VARCHAR,
DATA_SMALL_30 LONG VARCHAR,
DATA_SMALL_31 LONG VARCHAR,
DATA_SMALL_32 LONG VARCHAR,
DATA_SMALL_33 LONG VARCHAR,
DATA_SMALL_34 LONG VARCHAR,
DATA_SMALL_35 LONG VARCHAR,
DATA_SMALL_36 LONG VARCHAR,
DATA_SMALL_37 LONG VARCHAR,
DATA_SMALL_38 LONG VARCHAR,
DATA_SMALL_39 LONG VARCHAR,
DATA_INT_0 INT,
DATA_INT_1 INT,
DATA_INT_2 INT,
DATA_INT_3 INT,
DATA_INT_4 INT,
DATA_INT_5 INT,
DATA_INT_6 INT,
DATA_INT_7 INT,
DATA_INT_8 INT,
DATA_INT_9 INT,
DATA_REFERENCE_0 INT,
DATA_REFERENCE_1 INT,
DATA_REFERENCE_2 INT,
DATA_REFERENCE_3 INT,
DATA_REFERENCE_4 INT,
DATA_REFERENCE_5 INT,
DATA_REFERENCE_6 INT,
DATA_REFERENCE_7 INT,
DATA_REFERENCE_8 INT,
DATA_REFERENCE_9 INT,
DATA_DATE_0 DATE,
DATA_DATE_1 DATE,
DATA_DATE_2 DATE,
DATA_DATE_3 DATE,
DATA_DATE_4 DATE,
primary key(MASTER_ID));

create table CMS_MODULE_CHANNEL_REL
(MASTER_ID INT not null,
CHANNEL_ID INT not null,
primary key(CHANNEL_ID, MASTER_ID));

create table CMS_MODULE_MEDIA
(MEDIA_ID INT not null,
MASTER_ID INT not null,
MEDIA_POSITION INT not null,
MEDIA_WIDTH INT not null,
MEDIA_HEIGHT INT not null,
MEDIA_SIZE INT not null,
MEDIA_MIMETYPE VARCHAR(255),
MEDIA_TYPE INT not null,
MEDIA_TITLE VARCHAR(255),
MEDIA_NAME VARCHAR(255),
MEDIA_DESCRIPTION VARCHAR(500) not null,
MEDIA LONG BYTE not null,
primary key(MEDIA_ID));

create table CMS_MODULE_BACKUP_MASTER
(MASTER_ID INT not null,
SUB_ID INT not null,
USER_ID INT not null,
GROUP_ID INT not null,
PROJECT_ID INT not null,
ACCESS_FLAGS INT not null,
STATE INT not null,
LOCKED_BY INT not null,
LASTMODIFIED_BY INT not null,
DATE_CREATED DATE not null,
DATE_LASTMODIFIED DATE not null,
PUBLICATION_DATE DATE,
PURGE_DATE DATE,
FLAGS INT,
FEED_ID INT,
FEED_REFERENCE INT,
FEED_FILENAME VARCHAR(255),
TITLE VARCHAR(255),
DATA_BIG_0 LONG VARCHAR,
DATA_BIG_1 LONG VARCHAR,
DATA_BIG_2 LONG VARCHAR,
DATA_BIG_3 LONG VARCHAR,
DATA_BIG_4 LONG VARCHAR,
DATA_BIG_5 LONG VARCHAR,
DATA_BIG_6 LONG VARCHAR,
DATA_BIG_7 LONG VARCHAR,
DATA_BIG_8 LONG VARCHAR,
DATA_BIG_9 LONG VARCHAR,
DATA_MEDIUM_0 LONG VARCHAR,
DATA_MEDIUM_1 LONG VARCHAR,
DATA_MEDIUM_2 LONG VARCHAR,
DATA_MEDIUM_3 LONG VARCHAR,
DATA_MEDIUM_4 LONG VARCHAR,
DATA_MEDIUM_5 LONG VARCHAR,
DATA_MEDIUM_6 LONG VARCHAR,
DATA_MEDIUM_7 LONG VARCHAR,
DATA_MEDIUM_8 LONG VARCHAR,
DATA_MEDIUM_9 LONG VARCHAR,
DATA_SMALL_0 LONG VARCHAR,
DATA_SMALL_1 LONG VARCHAR,
DATA_SMALL_2 LONG VARCHAR,
DATA_SMALL_3 LONG VARCHAR,
DATA_SMALL_4 LONG VARCHAR,
DATA_SMALL_5 LONG VARCHAR,
DATA_SMALL_6 LONG VARCHAR,
DATA_SMALL_7 LONG VARCHAR,
DATA_SMALL_8 LONG VARCHAR,
DATA_SMALL_9 LONG VARCHAR,
DATA_SMALL_10 LONG VARCHAR,
DATA_SMALL_11 LONG VARCHAR,
DATA_SMALL_12 LONG VARCHAR,
DATA_SMALL_13 LONG VARCHAR,
DATA_SMALL_14 LONG VARCHAR,
DATA_SMALL_15 LONG VARCHAR,
DATA_SMALL_16 LONG VARCHAR,
DATA_SMALL_17 LONG VARCHAR,
DATA_SMALL_18 LONG VARCHAR,
DATA_SMALL_19 LONG VARCHAR,
DATA_SMALL_20 LONG VARCHAR,
DATA_SMALL_21 LONG VARCHAR,
DATA_SMALL_22 LONG VARCHAR,
DATA_SMALL_23 LONG VARCHAR,
DATA_SMALL_24 LONG VARCHAR,
DATA_SMALL_25 LONG VARCHAR,
DATA_SMALL_26 LONG VARCHAR,
DATA_SMALL_27 LONG VARCHAR,
DATA_SMALL_28 LONG VARCHAR,
DATA_SMALL_29 LONG VARCHAR,
DATA_SMALL_30 LONG VARCHAR,
DATA_SMALL_31 LONG VARCHAR,
DATA_SMALL_32 LONG VARCHAR,
DATA_SMALL_33 LONG VARCHAR,
DATA_SMALL_34 LONG VARCHAR,
DATA_SMALL_35 LONG VARCHAR,
DATA_SMALL_36 LONG VARCHAR,
DATA_SMALL_37 LONG VARCHAR,
DATA_SMALL_38 LONG VARCHAR,
DATA_SMALL_39 LONG VARCHAR,
DATA_INT_0 INT,
DATA_INT_1 INT,
DATA_INT_2 INT,
DATA_INT_3 INT,
DATA_INT_4 INT,
DATA_INT_5 INT,
DATA_INT_6 INT,
DATA_INT_7 INT,
DATA_INT_8 INT,
DATA_INT_9 INT,
DATA_REFERENCE_0 INT,
DATA_REFERENCE_1 INT,
DATA_REFERENCE_2 INT,
DATA_REFERENCE_3 INT,
DATA_REFERENCE_4 INT,
DATA_REFERENCE_5 INT,
DATA_REFERENCE_6 INT,
DATA_REFERENCE_7 INT,
DATA_REFERENCE_8 INT,
DATA_REFERENCE_9 INT,
DATA_DATE_0 DATE,
DATA_DATE_1 DATE,
DATA_DATE_2 DATE,
DATA_DATE_3 DATE,
DATA_DATE_4 DATE,
VERSION_ID INT not null,
USER_NAME VARCHAR(167),
GROUP_NAME VARCHAR(64),
LASTMODIFIED_BY_NAME VARCHAR(167),
primary key(MASTER_ID, VERSION_ID));

create table CMS_MODULE_BACKUP_MEDIA    
(MEDIA_ID INT not null,
MASTER_ID INT not null,
MEDIA_POSITION INT not null,
MEDIA_WIDTH INT not null,
MEDIA_HEIGHT INT not null,
MEDIA_SIZE INT not null,
MEDIA_MIMETYPE VARCHAR(255),
MEDIA_TYPE INT not null,
MEDIA_TITLE VARCHAR(255),
MEDIA_NAME VARCHAR(255),
MEDIA_DESCRIPTION VARCHAR(500) not null,
MEDIA LONG BYTE not null,
VERSION_ID INT not null,
primary key(MEDIA_ID, VERSION_ID));

create table CMS_WEBUSERS
(USER_ID INT not null,
USER_MEMBER_ID VARCHAR(255),
USER_SALUTATION VARCHAR(255),
USER_TITLE VARCHAR(255),
USER_PWD VARCHAR(255),   
USER_PWD_QUESTION VARCHAR(255),   
USER_PWD_ANSWER VARCHAR(255),        
USER_CITY VARCHAR(255),
USER_POSTCODE VARCHAR(255),
USER_STATE VARCHAR(255),
USER_COUNTRY VARCHAR(255),
USER_ADDRESS_TYPE INT,
USER_BIRTHDAY DATE,
USER_PHONE VARCHAR(255),
USER_FAX VARCHAR(255),
USER_MOBILE VARCHAR(255),
USER_ACCEPT INT,   
USER_RECOMMENDED_BY VARCHAR(255), 
USER_PROFESSION VARCHAR(255),
USER_COMPANY VARCHAR(255),
USER_DEPARTMENT VARCHAR(255),
USER_POSITION VARCHAR(255),         
USER_ACCOUNT_NUMBER VARCHAR(255),
USER_BANK_NUMBER VARCHAR(255),
USER_BANK VARCHAR(255),
USER_NEWSLETTER VARCHAR(255),   
USER_EXTRAINFO_1 VARCHAR(255),
USER_EXTRAINFO_2 VARCHAR(255),
USER_EXTRAINFO_3 VARCHAR(255),
USER_EXTRAINFO_4 VARCHAR(255),
USER_EXTRAINFO_5 VARCHAR(255),
USER_EXTRAINFO_6 VARCHAR(255),
USER_EXTRAINFO_7 VARCHAR(255),
USER_EXTRAINFO_8 VARCHAR(255),
USER_EXTRAINFO_9 VARCHAR(255),
USER_EXTRAINFO_10 VARCHAR(255),
USER_EXTRAINFO_11 VARCHAR(255),
USER_EXTRAINFO_12 VARCHAR(255),
USER_EXTRAINFO_13 VARCHAR(255),
USER_EXTRAINFO_14 VARCHAR(255),
USER_EXTRAINFO_15 VARCHAR(255),
USER_EXTRAINFO_16 VARCHAR(255),
USER_EXTRAINFO_17 VARCHAR(255),
USER_EXTRAINFO_18 VARCHAR(255),
USER_EXTRAINFO_19 LONG VARCHAR,
USER_EXTRAINFO_20 LONG VARCHAR,
USER_PICTURE LONG BYTE,
USER_PICTURE_NAME VARCHAR(255),         
USER_CREATE_DATE DATE,
USER_LASTCHANGE_BY VARCHAR(255),
USER_LASTCHANGE_DATE DATE,
LOCKSTATE INT,
primary key (USER_ID)
);

CREATE INDEX SESSIONS_LASTUSED ON
    CMS_SESSIONS(SESSION_LASTUSED);

CREATE INDEX GROUP_PARENTID ON
  CMS_GROUPS(PARENT_GROUP_ID);

CREATE INDEX GROUPUSER_GROUPID ON
  CMS_GROUPUSERS(GROUP_ID);

CREATE INDEX GROUPUSER_USERID ON
  CMS_GROUPUSERS(USER_ID);

CREATE INDEX PROJECTS_GROUPID ON
  CMS_PROJECTS(GROUP_ID);

CREATE INDEX PROJECTS_MANAGERID ON
  CMS_PROJECTS(MANAGERGROUP_ID);

CREATE INDEX PROJECTS_USERID ON
  CMS_PROJECTS(USER_ID);

CREATE INDEX PROJECT_NAME ON
  CMS_PROJECTS(PROJECT_NAME);

CREATE INDEX PROJECT_TASKID ON
  CMS_PROJECTS(TASK_ID);

CREATE INDEX PROJECTS_FLAGS ON
CMS_PROJECTS (PROJECT_FLAGS);

CREATE INDEX RESOURCES_TYPE ON
CMS_RESOURCES (RESOURCE_TYPE);

CREATE INDEX RESOURCES_STATE ON
CMS_RESOURCES (STATE);

CREATE INDEX RESOURCES_PROJECT_TYPE ON
CMS_RESOURCES (PROJECT_ID, RESOURCE_TYPE);

CREATE INDEX RESOURCES_RESOURCEID_PROJECT ON
CMS_RESOURCES (RESOURCE_ID, PROJECT_ID);

CREATE INDEX RESOURCE_FILEID ON
  CMS_RESOURCES(FILE_ID);

CREATE INDEX RESOURCE_GROUP ON
  CMS_RESOURCES(GROUP_ID);

CREATE INDEX RESOURCE_LOCKED_BY ON
  CMS_RESOURCES(LOCKED_BY);

CREATE INDEX RESOURCE_PARENTID ON
  CMS_RESOURCES(PARENT_ID);

CREATE INDEX RESOURCE_PROJECTID ON
  CMS_RESOURCES(PROJECT_ID);

CREATE INDEX RESOURCE_USERID ON
  CMS_RESOURCES(USER_ID);

CREATE INDEX PARENT_RESOURCE_TYPE ON
  CMS_RESOURCES(PARENT_ID, RESOURCE_TYPE);

CREATE INDEX SYSTEMID ON
  CMS_SYSTEMID(TABLE_KEY, ID);

CREATE INDEX PAGE_ID ON
CMS_LINKS (PAGE_ID);

CREATE INDEX TASK_PARENT ON
  CMS_TASK(PARENT);

CREATE INDEX TASK_TYPETASKREF ON
  CMS_TASK(TASKTYPEREF);

CREATE INDEX TASKLOG_REF ON
  CMS_TASKLOG(TASKREF);

CREATE INDEX TASKLOG_USERREF ON
  CMS_TASKLOG(USERREF);

CREATE INDEX TASKPAR_REF ON
  CMS_TASKPAR(REF);

CREATE INDEX PROJECTRESOURCE_RESOURCE_NAME ON
  CMS_PROJECTRESOURCES(RESOURCE_NAME);

CREATE INDEX MASTER_SUBID ON
  CMS_MODULE_MASTER(SUB_ID);
  
CREATE INDEX ONLINEMASTER_SUBID ON
  CMS_MODULE_ONLINE_MASTER(SUB_ID);
  
CREATE INDEX ONLINEMEDIA_MASTERID ON 
  CMS_MODULE_ONLINE_MEDIA(MASTER_ID);
  
CREATE INDEX MEDIA_MASTERID ON 
  CMS_MODULE_MEDIA(MASTER_ID);