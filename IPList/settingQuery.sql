CREATE TABLE assets (
    asset_code VARCHAR(20) PRIMARY KEY,
    asset_type VARCHAR(30),
    asset_grade VARCHAR(10),
    pur_date DATE,
    exp_date DATE,
    rep_date DATE,
    cost int,
    emp_name varchar(22),
	emp_num varchar(8),
    affi VARCHAR(30),
    dept VARCHAR(30),
    loc VARCHAR(30),
    usage_type VARCHAR(30),
    usage_status VARCHAR(30),
    model_name VARCHAR(50),
    serial_num VARCHAR(50),
    ip_address VARCHAR(45),
    remarks varchar(1000)
);

drop table assets;
drop table employee;

create table employee (
emp_num varchar(8),
emp_name varchar(22),
position varchar(10),
affi varchar(30),
dept varchar(30),
loc varchar(30),
hire_date date,
term_date date
);

INSERT INTO assets (
    asset_code, asset_type, asset_grade, pur_date, exp_date, rep_date, cost, emp_name,
    emp_num, affi, dept, loc, usage_type, usage_status, model_name,
    serial_num, ip_address, remarks
) VALUES
('74092876', 'workstation', 'h', '2019-01-02', '2022-01-01', '2020-10-08', 101000, '김유진', '22514854', 'Ansan', 'Marketing', 'Seoul', 'asset', '개인', 'Galaxy Book', 'SN-870158', '192.168.4.164', '이관 예정'),
('DS2F1ZGN', 'monitor', 'n', '2019-07-23', '2022-07-22', '2020-04-11', 2000, '윤유진', '22393483', 'Jecheon', 'Planning', 'Warehouse', 'lotte', '공용', 'ThinkPad T14', 'SN-401880', '192.168.242.20', '수리 이력 있음'),
('DSLCA9ZK', 'desktop', 'n', '2021-09-08', '2024-09-07', '2022-05-10', 28900, '정수민', '21647160', 'Changwon', 'Marketing', 'Lab', 'aj', '공용', 'Dell XPS', 'SN-568615', '192.168.209.59', '임시 사용'),
('DS3TTASJ', 'monitor', 'n', '2019-07-21', '2022-07-20', '2020-08-14', 49000, '윤서연', '21890275', 'Ansan', 'Retail', 'Busan', 'lotte', '개인', 'MacBook Pro', 'SN-216062', '192.168.38.4', '폐기 예정'),
('12849866', 'notebook', 'h', '2019-10-13', '2022-10-12', '2020-07-14', 6100, '장민재', '22685225', 'Jecheon', 'IT', 'Warehouse', 'asset', '공용', 'ThinkPad T14', 'SN-985485', '192.168.144.78', '폐기 예정'),
('12849862', 'notebook', 'l', '2022-04-08', '2025-04-07', '2023-03-05', 273000, '최지우', '21573053', 'Ansan', 'Outsourcing', 'Warehouse', 'asset', '공용', 'ThinkPad T14', 'SN-394940', '192.168.246.171', '정기 점검 대상'),
('12833382', 'pda', 'h', '2019-06-08', '2022-06-07', '2021-12-28', 240000, '정서연', '21888790', 'Jecheon', 'Marketing', 'Busan', 'aj', '공용', 'LG Gram', 'SN-737590', '192.168.213.211', '사용자 요청 교체'),
('12847712', 'notebook', 'l', '2023-02-01', '2026-01-31', '2025-10-14', 40000, '김성문', '22217373', 'Seoul', 'Marketing', 'Seoul', 'lotte', '공용', 'LG Gram', 'SN-531759', '192.168.72.58', '긴급 대여'),
('12841982', 'notebook', 'n', '2020-09-08', '2023-09-07', '2022-07-24', 294000, '정하늘', '22420508', 'Ansan', 'Marketing', 'Seoul', 'asset', '공용', 'ThinkPad T14', 'SN-982733', '192.168.41.91', '신규 구매'),
('1H6UEA2B', 'monitor', 'n', '2020-06-28', '2023-06-27', '2022-05-22', 4000, '윤지훈', '21769438', 'Seoul', 'Retail', 'Seoul', 'aj', '개인', 'Dell XPS', 'SN-838794', '192.168.210.234', '정기 점검 대상'),
('DS3N9GCF', 'workstation', 'h', '2022-11-11', '2025-11-10', '2024-01-04', 99000, '윤지훈', '22837630', 'Ansan', 'Retail', 'Busan', 'lotte', '공용', 'MacBook Pro', 'SN-503658', '192.168.64.10', '프로젝트용'),
('DSCD5D1N', 'desktop', 'h', '2024-05-11', '2027-05-10', '2025-12-14', 254000, '박서연', '21894888', 'Seoul', 'Overseas', 'Warehouse', 'asset', '개인', 'ThinkPad T14', 'SN-245365', '192.168.183.60', '긴급 대여'),
('DSA0U1E0', 'desktop', 'n', '2023-12-26', '2026-12-25', '2025-07-26', 90000, '최하늘', '21740289', 'Changwon', 'Retail', 'Warehouse', 'lotte', '개인', 'ThinkPad T14', 'SN-122495', '192.168.226.19', '신규 구매'),
('74092833', 'monitor', 'n', '2021-06-25', '2024-06-24', '2022-12-27', 2500, '한지우', '22681361', 'Changwon', 'Overseas', 'Lab', 'aj', '개인', 'LG Gram', 'SN-897537', '192.168.12.137', '정기 점검 대상'),
('12367772', 'notebook', 'h', '2021-11-26', '2024-11-25', '2023-08-22', 21400, '박지훈', '22670361', 'Changwon', 'Retail', 'Seoul', 'asset', '개인', 'ThinkPad T14', 'SN-301930', '192.168.8.193', '임시 사용'),
('74092871', 'desktop', 'h', '2023-07-21', '2026-07-20', '2024-04-06', 27900, '윤지훈', '21600495', 'Ansan', 'Planning', 'Seoul', 'lotte', '공용', 'LG Gram', 'SN-238217', '192.168.225.34', '수리 이력 있음'),
('DSNOG87W', 'notebook', 'l', '2024-07-07', '2027-07-06', '2025-07-02', 27600, '박지성', '22215058', 'Seoul', 'Retail', 'Warehouse', 'aj', '공용', 'ThinkPad T14', 'SN-994842', '192.168.100.163', '사용자 요청 교체'),
('1P7SS5J5', 'workstation', 'h', '2019-12-19', '2022-12-18', '2021-09-14', 98000, '정성문', '22649244', 'Jecheon', 'Planning', 'Warehouse', 'asset', '공용', 'Galaxy Book', 'SN-922569', '192.168.189.234', '임시 사용'),
('74092872', 'desktop', 'n', '2023-01-20', '2026-01-19', '2024-03-14', 2000, '최민재', '21952465', 'Jecheon', 'CS', 'Seoul', 'lotte', '개인', 'ThinkPad T14', 'SN-146096', '192.168.8.4', '프로젝트용'),
('1YOBDKMC', 'pda', 'h', '2018-05-28', '2021-05-27', '2020-06-10', 71000, '한성문', '21556093', 'Changwon', 'Marketing', 'Busan', 'aj', '개인', 'ThinkPad T14', 'SN-603288', '192.168.61.61', '폐기 예정');