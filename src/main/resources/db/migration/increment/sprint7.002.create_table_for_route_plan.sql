-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.002.create_table_for_route_plan:0001.create_table_non_scheduled_dispatching
create table non_scheduled_dispatching (
    driving_id	            varchar(12)	    comment '운행ID',
    vehicle_vendor_nm	    varchar(20)	    comment '간선사명',
    vehicle_dispatching_status	varchar(8)	comment '배차상태',
    vehicle_dispatching_dtm	datetime		comment '배차일시',
    charger_nm	            varchar(30)	    comment '담당자명',
    vehicle_in_tm	        varchar(4)	    comment '입차시각',
    address	                varchar(200)	comment '주소',
    vehicle_no	            varchar(12)	    comment '차량번호',
    driver_contact_place	varchar(20)	    comment '기사연락처',
    reg_emp_no	            varchar(7)	    comment '등록사원번호',
    reg_dtm	                datetime		comment '등록일시',
    mod_emp_no	            varchar(7)	    comment '수정사원번호',
    mod_dtm	                datetime		comment '수정일시',
    constraint pk_non_scheduled_dispatching primary key (driving_id)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '임시 노선 배차';

-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.002.create_table_for_route_plan:0002.create_table_non_scheduled_route_plan
create table non_scheduled_route_plan (
    driving_id	        varchar(12)	not null comment '운행ID',
    route_id	        varchar(10)	not null comment '노선ID',
    route_naming	    varchar(13)	not null comment '편명',
    driving_dtm	        datetime	not null comment '운행일시',
    settlement_org_cd	varchar(3)	comment '정산조직코드',
    departure_tml_cd	varchar(3)	comment '출발터미널코드',
    departure_tml_nm	varchar(7)	comment '출발터미널명',
    departure_territory_cd	varchar(2)	comment '출발권역코드',
    arrival_tml_cd	    varchar(3)	comment '도착터미널코드',
    arrival_tml_nm	    varchar(7)	comment '도착터미널명',
    arrival_territory_cd	varchar(2)	comment '도착권역코드',
    distance	        int		    comment '거리',
    request_reason	    varchar(1000)	comment '요청사유',
    request_emp_no	    varchar(7)	comment '요청사원번호',
    request_dtm	        datetime	comment '요청일시',
    vehicle_model_cd	varchar(2)	comment '차종코드',
    vehicle_vendor_nm	varchar(20)	comment '간선사명',
    charge	            bigint		comment '운임',
    confirmation_charge	bigint		comment '확정운임',
    vehicle_in_request_tm	varchar(4)	comment '입차요청시각',
    approval_status	    varchar(8)	comment '승인상태',
    approval_dtm	    datetime	comment '승인일시',
    sales_office_burden_ratio	smallint	comment '영업소부담비율',
    reg_emp_no	        varchar(7)	comment '등록사원번호',
    reg_dtm         	datetime	comment '등록일시',
    mod_emp_no	        varchar(7)	comment '수정사원번호',
    mod_dtm	            datetime	comment '수정일시',
    constraint pk_non_scheduled_route_plan primary key (driving_id)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '임시 노선 계획';

-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.002.create_table_for_route_plan:0003.create_table_scheduled_route_plan
create table scheduled_route_plan (
    driving_id	        varchar(12)	not null comment '운행ID',
    route_id	        varchar(10)	not null comment '노선ID',
    route_naming	    varchar(13)	not null comment '편명',
    driving_dtm	        datetime	not null comment '운행일시',
    distance	        int		    comment '거리',
    charge	            bigint		comment '운임',
    confirmation_charge	bigint		comment '확정운임',
    settlement_org_cd	varchar(3)	comment '정산조직코드',
    vehicle_model_cd	varchar(2)	comment '차종코드',
    vehicle_vendor_nm	varchar(20)	comment '간선사명',
    vehicle_no	        varchar(12)	comment '차량번호',
    driver_contact_place	varchar(20)	comment '기사연락처',
    reg_emp_no	        varchar(7)	comment '등록사원번호',
    reg_dtm	            datetime	comment '등록일시',
    mod_emp_no	        varchar(7)	comment '수정사원번호',
    mod_dtm	            datetime	comment '수정일시',
    constraint pk_scheduled_route_plan primary key (driving_id)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '정규 노선 계획';

-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.002.create_table_for_route_plan:0004.create_table_scheduled_route
create table scheduled_route (
    route_id	        varchar(10)	    not null comment '노선ID',
    vehicle_model_cd	varchar(2)	    comment '차종코드',
    vehicle_no	        varchar(12)	    comment '차량번호',
    org_cd	            varchar(3)	    comment '조직코드',
    route_details	    varchar(100)    comment '노선상세',
    driving_start_dtm	datetime		comment '운행시작일시',
    driving_end_dtm	    datetime		comment '운행종료일시',
    reg_emp_no	        varchar(7)	    comment '등록사원번호',
    reg_dtm         	datetime		comment '등록일시',
    mod_emp_no	        varchar(7)	    comment '수정사원번호',
    mod_dtm	            datetime		comment '수정일시',
    constraint pk_scheduled_route primary key (route_id)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '정규 노선 계획';

-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.002.create_table_for_route_plan:0005.create_table_scheduled_route_details
create table scheduled_route_details (
    route_id	            varchar(10)	not null comment '노선ID',
    route_naming	        varchar(13)	not null comment '편명',
    departure_tml_cd	    varchar(3)	comment '출발터미널코드',
    departure_tml_nm	    varchar(7)	comment '출발터미널명',
    departure_territory_cd	varchar(2)	comment '출발권역코드',
    arrival_tml_cd	        varchar(3)	comment '도착터미널코드',
    arrival_tml_nm	        varchar(7)	comment '도착터미널명',
    arrival_territory_cd	varchar(2)	comment '도착권역코드',
    expectation_departure_tm	varchar(4)	comment '예상출발시각',
    expectation_arrival_tm	varchar(4)	comment '예상도착시각',
    constraint pk_scheduled_route_details primary key (route_id, route_naming)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '정규 노선 계획';