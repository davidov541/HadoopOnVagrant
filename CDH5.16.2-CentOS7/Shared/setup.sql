CREATE ROLE scm LOGIN PASSWORD 'scm';
CREATE DATABASE scm OWNER scm ENCODING 'UTF8';

CREATE ROLE amon LOGIN PASSWORD 'amon_password';
CREATE DATABASE amon OWNER amon ENCODING 'UTF8';

CREATE ROLE rmon LOGIN PASSWORD 'rmon_password';
CREATE DATABASE rmon OWNER rmon ENCODING 'UTF8';

CREATE ROLE hive LOGIN PASSWORD 'hive_password';
CREATE DATABASE metastore OWNER hive ENCODING 'UTF8';

CREATE ROLE sentry LOGIN PASSWORD 'sentry_password';
CREATE DATABASE sentry OWNER sentry ENCODING 'UTF8';

CREATE ROLE nav LOGIN PASSWORD 'nav_password';
CREATE DATABASE nav OWNER nav ENCODING 'UTF8';

CREATE ROLE navms LOGIN PASSWORD 'navms_password';
CREATE DATABASE navms OWNER navms ENCODING 'UTF8';

ALTER DATABASE Metastore SET standard_conforming_strings = off;

create database hue with lc_collate='en_US.UTF-8';
create user hue with password 'hue_password';
grant all privileges on database hue to hue;

CREATE ROLE oozie LOGIN ENCRYPTED PASSWORD 'oozie';
CREATE DATABASE "oozie" WITH OWNER = oozie;

CREATE ROLE sqoop LOGIN ENCRYPTED PASSWORD 'sqoop' NOSUPERUSER INHERIT CREATEDB NOCREATEROLE;
CREATE DATABASE "sqoop" WITH OWNER = sqoop ENCODING = 'UTF8' TABLESPACE = pg_default LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' CONNECTION LIMIT = -1;
