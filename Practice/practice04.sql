/*
문제1.
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.(56건)
*/
 select count(salary)
 from employees
 where salary < (select avg(salary)
				 from employees)
 ;
 
 /*
 문제2. 
평균월급 이상, 최대월급 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차순으로 정렬하여 출력하세요  (51건)
*/
select  employee_id,
		first_name,
        salary
from employees
,
 
 
