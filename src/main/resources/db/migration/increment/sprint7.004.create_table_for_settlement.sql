-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.004.create_table_for_settlement:0001.create_table_route_charge
create table route_charge (
    route_id	        varchar(10)	not null comment '노선ID',
    driving_dtm	        datetime	comment '운행일시',
    driving_type	    varchar(2)	comment '운행타입',
    settlement_org_cd	varchar(3)	comment '정산조직코드',
    charge_type	        varchar(2)	comment '운임타입',
    vehicle_vendor_nm	varchar(20)	comment '간선사명',
    corperation_reg_no	varchar(13)	comment '사업자등록번호',
    charge	            bigint		comment '운임',
    confirmation_charge	bigint		comment '확정운임',
    vehicle_no	        varchar(12)	comment '차량번호',
    stopover_cost	    bigint		comment '경유지비용',
    stopover_yn	        varchar(1)	comment '경유지여부',
    lodge_cost	        bigint		comment '숙박비용',
    adjustment_ratio	smallint	comment '조정비율',
    total_charge	    bigint		comment '총운임',
    approval_status	    varchar(8)	comment '승인상태',
    approval_emp_no	    varchar(7)	comment '승인사원번호',
    approval_dtm	    datetime	comment '승인일시',
    reg_emp_no	        varchar(7)	comment '등록사원번호',
    reg_dtm	            datetime	comment '등록일시',
    mod_emp_no	        varchar(7)	comment '수정사원번호',
    mod_dtm	            datetime	comment '수정일시',
    constraint pk_route_charge primary key (route_id, driving_dtm)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '노선 운임';

-- liquibase formatted sql
-- changeset kunwoongkim:sprint7.004.create_table_for_settlement:0002.create_table_settlement
create table settlement (
    settlement_ym	        varchar(6)	not null comment '정산년월',
    org_cd	                varchar(3)	not null comment '조직코드',
    vehicle_vendor_nm	    varchar(20)	not null comment '간선사명',
    corperation_no      	varchar(13)	not null comment '사업자번호',
    settlement_status   	varchar(8)	comment '정산상태',
    scheduled_charge	    bigint		comment '정규편운임',
    non_scheduled_charge	bigint		comment '임시편운임',
    vat_amount	            bigint		comment '부가세금액',
    supply_price_amount	    bigint		comment '공급가금액',
    real_payment_cost	    bigint		comment '실지급비용',
    reg_emp_no          	varchar(7)	comment '등록사원번호',
    reg_dtm	                datetime	comment '등록일시',
    mod_emp_no	            varchar(7)	comment '수정사원번호',
    mod_dtm	                datetime	comment '수정일시',
    constraint pk_settlement primary key (settlement_ym, org_cd, vehicle_vendor_nm, corperation_no)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci comment '정산';

