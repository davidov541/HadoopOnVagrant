CREATE DATABASE ambari; 
CREATE USER ambari WITH PASSWORD 'ambaripw'; 
GRANT ALL PRIVILEGES ON DATABASE ambari TO ambari; 
\connect ambari; 
CREATE SCHEMA ambari AUTHORIZATION ambari; 
ALTER SCHEMA ambari OWNER TO ambari; 
ALTER ROLE ambari SET search_path TO 'ambari', 'public';

CREATE DATABASE hive; 
CREATE USER hive WITH PASSWORD 'hivepw'; 
GRANT ALL PRIVILEGES ON DATABASE hive TO hive; 
\connect hive; 
CREATE SCHEMA hive AUTHORIZATION hive; 
ALTER SCHEMA hive OWNER TO hive; 
ALTER ROLE hive SET search_path TO 'hive', 'public';

CREATE DATABASE oozie; 
CREATE USER oozie WITH PASSWORD 'ooziepw'; 
GRANT ALL PRIVILEGES ON DATABASE oozie TO oozie; 
\connect oozie; 
CREATE SCHEMA oozie AUTHORIZATION oozie; 
ALTER SCHEMA oozie OWNER TO oozie; 
ALTER ROLE oozie SET search_path TO 'oozie', 'public';