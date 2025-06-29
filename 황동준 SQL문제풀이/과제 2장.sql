-- 1. 영어영문학과(코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른순으로 표시하는
-- SQL 문장을 작성하시오,(단, 헤더는 '학번', '이름', '입학년도' 표시)
SELECT STUDENT_NO AS 학번, STUDENT_NAME AS 이름, ENTRANCE_DATE AS 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE ASC;

-- 2.
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

-- 3. 
SELECT PROFESSOR_NAME 교수이름, 2024 - (SUBSTR(PROFESSOR_SSN,1,2)+1900) AS 나이
FROM TB_PROFESSOR
ORDER BY 나이 ASC;

-- 4.
SELECT SUBSTR(PROFESSOR_NAME,2,2)
FROM TB_PROFESSOR;

-- 5. 어려움
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE,1,2) - SUBSTR(STUDENT_SSN,1,2) > 19;

--6.
SELECT TO_CHAR(TO_DATE('20/12/24'),'DAY') 
FROM DUAL;

-- 7.
SELECT TO_CHAR(TO_DATE('99/10/11'),'YY'),
TO_CHAR(TO_DATE('99/10/11'),'MM'),
TO_CHAR(TO_DATE('99/10/11'),'DD'),
TO_CHAR(TO_DATE('49/10/11'),'YY'),
TO_CHAR(TO_DATE('49/10/11'),'MM'),
TO_CHAR(TO_DATE('49/10/11'),'DD')
FROM DUAL;

SELECT TO_CHAR(TO_DATE('99/10/11'),'RR'),
TO_CHAR(TO_DATE('99/10/11'),'MM'),
TO_CHAR(TO_DATE('99/10/11'),'DD'),
TO_CHAR(TO_DATE('49/10/11'),'RR'),
TO_CHAR(TO_DATE('49/10/11'),'MM'),
TO_CHAR(TO_DATE('49/10/11'),'DD')
FROM DUAL;

-- 8.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO,1,1)!= 'A';

-- 9. 
SELECT ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10.
SELECT DEPARTMENT_NO AS 학과번호, COUNT(STUDENT_NO) AS "학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO ASC;

-- 11.
SELECT COUNT(STUDENT_NAME)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12.
SELECT EXTRACT(YEAR FROM TO_DATE(TERM_NO,'YYYYMM')), ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY EXTRACT(YEAR FROM TO_DATE(TERM_NO,'YYYYMM'));

-- 13.
SELECT DEPARTMENT_NO, COUNT(STUDENT_NO)
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO ASC;

-- 14.
SELECT STUDENT_NAME, COUNT(STUDENT_NAME)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(STUDENT_NAME) >= 2
ORDER BY STUDENT_NAME ASC;

-- 15. 어려움
SELECT SUBSTR(TERM_NO,1,4), SUBSTR(TERM_NO,5,2), ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY TERM_NO;
