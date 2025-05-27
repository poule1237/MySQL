select first_name,
	   Upper(first_name),
       rpad(first_name,10,'*')
from employees;

/***************************************************************
*복수형 함수(그룹함수,집계함수)
***************************************************************/

-- 종류:갯수 합계 평균 최고값
-- avg

-- 사용가능(결과 1개-->표현가능)
select  avg(salary)
from employees;

-- 사용불가능(결과:107개와 1개를 같이 표현을 못함)
select  first_name,
		avg(salary)
from employees;

-- rmfnqgkatn > count()
-- 직원의 수를 구하시오
select count(*)				-- 전체갯수(row갯수)
from employees;

select count(commission_pct)		-- 커미션을 받은 직원의 수
from employees;

select count(manager_id)			-- 매니저(팀장)가 있는 직원의 수
from employees;

select count(*) , count(commission_pct) 
from employees;

-- 월급이 16000 초과 되는 직원의 수는?

select count(*) , count(salary)
from employees
where salary > 16000
;
select count(*)
from employees
where salary > 16000
;
select salary
from employees
where salary >16000
;

-- 그룹함수 - sum()
-- 입력된 데이터들의 합계 값을 구하는 함수

select  count(salary),
		sum(salary)
from employees;

-- 논리적으로 잘못된 합계
select  sum(employee_id),
		sum(first_name)
from employees;

-- 그룹함수 - avg()  : null포함 여부
-- 입력된 값들의 평균값을 구하는 함수
-- 주의: null 값이 있는 경우 빼고 계산함 – ifnull() 함수사용
-- 월급의 평균을 구하시오
select  avg(salary),				-- salary가 null이면 평균의 포함안됨
		avg(ifnull(salary,0))		-- salary가 null이면 0으로 평균에 포함됨
from employees;

-- 그룹함수--> max() , min()
-- 입력된 값들중 가장 큰값/작은값 을 구하는 함수
-- 여러건의 데이터를 순서대로 정렬 후 값을 구하기때문에 데이터가 많을 때는 느리다(주의해서 사용) 

select  max(salary),		-- 1개
		min(salary),		-- 1개
        sum(salary)			-- 1개
        -- first_name		-- 여러개
from employees;

-- 공부하는 시기에서 검증은 노가다 해라
select *
from employees
order by salary desc
;
-- group by 절
-- 부서별로 월급 합계를 구해라
-- 현재로는 where절을 이용해서 구한다 --> 한그룹씩만 가능
select sum(salary)
from employees
where department_id = 90
;
select sum(salary)
from employees
where department_id = 80
;

-- 한번에 그룹별로 합계를 구한다 
-- group by에 참여한 컬럼이나 그룹함수면 올수있다
select  department_id,
		count(*),
		sum(salary),
        avg(salary),
        max(salary),
        min(salary)
from employees
group by department_id
;

-- 부서별로 부서 번호와 , 인원수, 월급합계를 출력하세요

select  department_id,
		count(*),
        sum(salary)
from employees
group by department_id;

-- 부서별로 부서번호와 , 최고월급 ,최고월급을 받는 직원의 이름을 출력하세요
-- group by에 참여한 컬럼이나 그룹함수만 올수있다
select  department_id,
		first_name,
		max(salary),
        count(*)
from employees
group by department_id , first_name;

-- 그룹을 나누는 첫번째
select  department_id,
		job_id,
        max(salary),
        count(*)
from employees
group by department_id, job_id;

select  department_id,
		job_id,
        first_name,	-- 그룹에 참여하지 않은 컬럼명은 사용할수없다
        max(salary),
        count(*)
from employees
group by department_id, job_id;

-- -----------------------------------------------------
-- 월급(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수 , 월급합계를 출력하세요
-- 부서의 부서 번호화 인원수 월급합계를 출력하세요
-- having절 (그룹전용 where절) 이 조건이 복잡할때
select  department_id,
		count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and department_id >= 100
;
/*
select departments_id
from dual
where departments_id and
group by department_id
having
order by
;
*/
/***************************************
* if(조건문, 참일때, 거짓일때)
****************************************/
-- 모든 직원의 이름, 월급, 수당, 상태(state)을 출력하세요
-- 상태컬럼은 수당이 없으면(null이면) 0, 수당이 있으면(0.5) 1 을 state 컬럼에 표시하세요
select	first_name,
		salary,
        commission_pct,
        if(commission_pct is null, '사무직','영업사원') as 'if()',
        ifnull(commission_pct, '없음') as 'ifnull()'
from employees
;

-- 직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
-- 실제월급은 job_id 가 'AC_ACCOUNT' 면 월급+월급*0.1,
--                      'SA_REP' 월급+월급*0.2,
--                      'ST_CLERK' 면 월급+월급*0.3
--                      그외에는 월급으로              
-- 계산하세요

select 	job_id,
        salary,
       case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
			 when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
             else salary
        end as 실제월급
from employees
;

-- 직원의 이름, 부서아이디, 팀을 출력하세요
-- 팀은 코드로 결정하며 부서코드가
--    10~50 이면 'A-TEAM'
--    60~100이면 'B-TEAM'
--    110~150이면 'C-TEAM'
--    나머지는 '팀없음' 으로 
-- 출력하세요.
select	first_name,
		department_id,
        case  when department_id >=10 and department_id <=50 then 'A-TEAM'
			  when department_id >=60 and department_id <=100 then 'B-TEAM'
              when department_id >=110 and department_id <=150 then 'C-TEAM'
              else '팀없음'
        end Team
from employees
;









select * 
from employees;


