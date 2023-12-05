-- (quiz-booksr_deptemp-mysql.sql) 

-- department(deptno, deptname, floor)                    
-- employee(empno, empname, title, manager, salary, dno)

drop table if exists employee;
drop table if exists departments;
use weeks13;

CREATE TABLE departments (
     deptno              int          NOT NULL ,
     deptname          varchar(10) ,
     floor                 int ,
     PRIMARY KEY(deptno)
);

INSERT INTO departments VALUES(1, '영업', 8);
INSERT INTO departments VALUES(2, '기획', 10);
INSERT INTO departments VALUES(3, '개발', 9);
INSERT INTO departments VALUES(4, '총무', 7);

CREATE TABLE employee (
    empno	         int	              NOT NULL,
    empname     varchar(10)     UNIQUE,
    title	         varchar(10)     DEFAULT '사원',
    manager       int  ,
    salary            int	 ,
    dno              int	 ,
    PRIMARY KEY(empno),
    FOREIGN KEY(dno) REFERENCES departments(deptno)
);

INSERT INTO employee VALUES(2106, '김창섭','대리',1003, 2500000, 2);
INSERT INTO employee VALUES(3426, '박영권','과장',4377, 3000000, 1);
INSERT INTO employee VALUES(3011, '이수민','부장',4377, 4000000, 3);
INSERT INTO employee VALUES(1003, '조민희','과장',4377, 3000000, 2);
INSERT INTO employee VALUES(3427, '최종철','사원',3011, 1500000, 3);
INSERT INTO employee VALUES(1365, '김상원','사원',3426, 1500000, 1);
INSERT INTO employee(empno, empname, title, salary, dno) VALUES(4377, '이성래','이사', 5000000, 2);

select * from department;
select * from employee;

-- 20) 박영권과 같은 직급을 갖는 모든 사원들의 이름과 직급을 검색하라
SELECT	empname, title
FROM	employee
WHERE	title	= (SELECT	title
		   FROM 	employee
		   WHERE	empname = '박영권');

-- 21) 영업부나 개발부에 근무하는 사원들의 이름을 검색하라(IN 사용)
SELECT	empname
FROM	employee
WHERE	dno	IN	(SELECT	deptno
				 from	departments
                 WHERE	deptname IN ('영업','개발'));