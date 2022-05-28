create database liquibase;
create user liquibase identified by 'welcome';
grant all privileges on liquibase.* to liquibase;
grant SYSTEM_VARIABLES_ADMIN on *.* to liquibase;

create database trucking;
create user trucking identified by 'welcome';
grant all privileges on trucking.* to trucking;
grant SYSTEM_VARIABLES_ADMIN on *.* to trucking;

grant all privileges on trucking.* to liquibase;
grant all privileges on liquibase.* to trucking;

