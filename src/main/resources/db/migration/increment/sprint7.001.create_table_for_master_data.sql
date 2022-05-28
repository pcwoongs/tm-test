-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0001.create_table_vehicle
create table vehicle (
    vehicle_no	        varchar(12) not null comment '차량번호',
    settlement_org_nm	varchar(7) comment '정산조직명',
    vehicle_type_cd	varchar(2) comment '차량타입코드',
    manufacturing_co_cd	varchar(2) comment '제조사코드',
    vehicle_model_cd	varchar(2) comment '차종코드',
    vehicle_model_year	varchar(6) comment '차량연식',
    hired_vehicle_type	varchar(2) comment '용차타입',
    hired_vehicle_vendor_cd	varchar(7) comment '용차업체코드',
    scrapping_dtm	datetime comment '폐차일시',
    comment	        varchar(30) comment '코멘트',
    vechicle_owner_cd	varchar(1) comment '차량소유자코드',
    painting_yn	    varchar(1) comment '도색여부',
    driver_id	    bigint comment '기사ID',
    reg_emp_no	    varchar(7) comment '등록사원번호',
    reg_dtm	        datetime comment '등록일시',
    mod_emp_no	    varchar(7) comment '수정사원번호',
    mod_dtm	        datetime comment '수정일시',
    constraint pk_vehicle primary key (vehicle_no)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '차량정보';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0002.create_table_driver
create table driver (
    driver_id	    bigint	        comment '기사ID',
    driver_nm	    varchar	(40)    comment '기사명',
    contact_place	varchar(11)     comment	'연락처',
    reg_emp_no	    varchar(7)	    comment '등록사원번호',
    reg_dtm	        datetime		comment '등록일시',
    mod_emp_no	    varchar(7)	    comment '수정사원번호',
    mod_dtm	        datetime		comment '수정일시',
    constraint pk_driver primary key (driver_id)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '기사정보';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0003.create_table_line_distance
create table line_distance (
    departure_tml_nm	varchar(7)	comment '출발터미널명',
    arrival_tml_nm	    varchar(7)	comment '도착터미널명',
    distance	        int		    comment '거리',
    reg_emp_no	        varchar(7)	comment '등록사원번호',
    reg_dtm	            datetime	comment '등록일시',
    mod_emp_no	        varchar(7)	comment '수정사원번호',
    mod_dtm	            datetime	comment '수정일시',
    constraint pk_line_distance primary key (departure_tml_nm, arrival_tml_nm)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '간선구간별 거리';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0004.create_table_tariff
create table tariff (
    vehicle_model_cd	varchar(2)	comment '차종코드',
    distance	        int		    comment '거리',
    apply_start_dtm	    datetime	comment '적용시작일시',
    apply_end_dtm	    datetime	comment '적용종료일시',
    unit_price	        bigint		comment '단가',
    reg_emp_no	        varchar(7)	comment '등록사원번호',
    reg_dtm	            datetime	comment '등록일시',
    mod_emp_no	        varchar(7)	comment '수정사원번호',
    mod_dtm	            datetime	comment '수정일시',
    constraint pk_tariff primary key (vehicle_model_cd, distance, apply_start_dtm, apply_end_dtm)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '기본 Tariff';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0005.create_table_terminal
create table terminal (
    tml_cd	        varchar(3)	comment '터미널코드',
    tml_nm	        varchar(7)	comment '터미널명',
    upper_org_cd	varchar(3)	comment '상위조직코드',
    interface_yn	varchar(1)	comment '인터페이스여부',
    tml_type	    varchar(2)	comment '터미널타입',
    territory_cd	varchar(2)	comment '권역코드',
    reg_emp_no	    varchar(7)	comment '등록사원번호',
    reg_dtm	        datetime	comment '등록일시',
    mod_emp_no	    varchar(7)	comment '수정사원번호',
    mod_dtm	        datetime	comment '수정일시',
    constraint pk_terminal primary key (tml_cd)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '터미널 정보';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0006.create_table_terminal_territory
create table terminal_territory (
    tml_cd	        varchar(3)	comment '터미널코드',
    tml_nm	        varchar(7)	comment '터미널명',
    trucking_territory_cd	varchar(4)	comment '간선권역코드',
    reg_emp_no	    varchar(7)	comment '등록사원번호',
    reg_dtm	        datetime	comment '등록일시',
    mod_emp_no	    varchar(7)	comment '수정사원번호',
    mod_dtm	        datetime	comment '수정일시',
    constraint pk_terminal_territory primary key (tml_cd)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '터미널별 권역';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0007.create_table_vehicle_vendor_territory
create table vehicle_vendor_territory (
    vehicle_vendor_territory_id	bigint		auto_increment  comment '간선사권역ID',
    corperation_reg_no	        varchar(20)	comment '사업자등록번호',
    trucking_territory_cd	    varchar(4)	comment '간선권역코드',
    vehicle_vendor_territory_nm	varchar(30)	comment '간선사권역명',
    reg_emp_no	    varchar(7)	comment '등록사원번호',
    reg_dtm	        datetime	comment '등록일시',
    mod_emp_no	    varchar(7)	comment '수정사원번호',
    mod_dtm	        datetime	comment '수정일시',
    constraint pk_vehicle_vendor_territory primary key (vehicle_vendor_territory_id)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '간선사별 권역';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0008.create_table_etc_terminal
create table etc_terminal (
    etc_tml_cd	    varchar(3)	comment '기타터미널코드',
    branch_office_cd	varchar(3)	comment '지점코드',
    etc_tml	        varchar(5)	comment '기타터미널명칭',
    address	        varchar(200)    comment	'주소',
    contact_place	varchar(20)	comment '연락처',
    latitude	    varchar(14)	comment '위도',
    longitude	    varchar(14)	comment '경도',
    reg_emp_no	    varchar(7)	comment '등록사원번호',
    reg_dtm	        datetime	comment '등록일시',
    mod_emp_no	    varchar(7)	comment '수정사원번호',
    mod_dtm	        datetime	comment '수정일시',
    constraint pk_etc_terminal primary key (etc_tml_cd)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '기타 터미널';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0009.create_table_vehicle_vendor_charger
create table vehicle_vendor_charger (
    vehicle_vendor_territory_id	bigint		comment '간선사권역ID',
    charger_emp_no	varchar(7)	comment '담당자사원번호',
    charger_nm	varchar(30)	    comment '담당자명',
    reg_emp_no	    varchar(7)	comment '등록사원번호',
    reg_dtm	        datetime	comment '등록일시',
    mod_emp_no	    varchar(7)	comment '수정사원번호',
    mod_dtm	        datetime	comment '수정일시',
    constraint pk_vehicle_vendor_charger primary key (vehicle_vendor_territory_id, charger_emp_no)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '간선사별 담당자';


-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.001.create_table_for_master_data:0010.create_table_cost_rate
create table cost_rate (
    departure_territory_cd	varchar(2)	comment '출발권역코드',
    arrival_territory_cd	varchar(2)	comment '도착권역코드',
    vehicle_vendor_nm	varchar(20)	comment '간선사명',
    rate	            int		comment '요율',
    reg_emp_no	    varchar(7)	comment '등록사원번호',
    reg_dtm	        datetime	comment '등록일시',
    mod_emp_no	    varchar(7)	comment '수정사원번호',
    mod_dtm	        datetime	comment '수정일시',
    constraint pk_vehicle primary key (departure_territory_cd, arrival_territory_cd)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '요율';

