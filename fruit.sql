use weeks13;

drop table if exists fruit;

create table fruit (
    과일번호     int      NOT NULL AUTO_INCREMENT  ,
    과일이름     varchar(30) ,
    가격           int,
    색상           varchar(20) ,
    원산지        varchar(30) , 
    PRIMARY KEY(과일번호)
);

insert into fruit(과일이름,가격,색상,원산지) values('사과',2000,'빨간색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('배',5000,'노란색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('바나나',1500,'노란색','인도네시아');
insert into fruit(과일이름,가격,색상,원산지) values('키위',4000,'초록색','호주');
insert into fruit(과일이름,가격,색상,원산지) values('수박',8000,'초록색','한국');

insert into fruit(과일이름,가격,색상,원산지) values('오렌지',1000,'주황색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('망고',5000,'노란색','페루');
insert into fruit(과일이름,가격,색상,원산지) values('체리',4800,'빨간색','중국');
insert into fruit(과일이름,가격,색상,원산지) values('포도',2500,'보라색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('아보카도',2000,'초록색','남아프리카');
insert into fruit(과일이름,가격,색상,원산지) values('레몬',6000,'노란색','미국');
insert into fruit(과일이름,가격,색상,원산지) values('모과',5000,'노란색', NULL);

select * from fruit;

-- 1-1) 노란색 과일의 이름, 색상을 검색하라.
SELECT 과일이름, 색상
FROM	fruit
WHERE	색상 = '노란색';

-- 1-2) 과일이름을 오름차순으로 정렬하여 모든 필드를 검색하라
SELECT	*
FROM	fruit
ORDER BY 과일이름 ASC;

-- 1-3) 가격이 5000 이하인 빨간색 과일의 이름을 검색하라
SELECT	과일이름
FROM	fruit
WHERE	가격 <= 5000 AND	색상 = '빨간색';
-- 1-4) 가격이 2000 ~ 5000 사이의 과일이름과 가격, 원산지를 검색하라(BETWEEN AND)
SELECT	과일이름, 가격, 원산지
FROM 	fruit
WHERE	가격 BETWEEN 2000 AND 5000;
-- 1-5) 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(IN 사용)
SELECT	과일이름, 색상
FROM	fruit
WHERE	색상 IN ('노란색', '초록색');
-- 1-6) 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(논리연산자 OR 사용)
SELECT	과일이름, 색상
FROM	fruit
WHERE	색상 = '노란색' OR 색상 = '초록색';
-- 1-7) 원산지가 한국이 아닌 과일이름, 원산지를 검색하라
SELECT	과일이름, 원산지
FROM	fruit
WHERE	NOT 원산지 = '한국';

-- 4-1) 원산지를 알 수 없는 과일의 과일이름, 원산지를 검색하라
SELECT	과일이름, 원산지
FROM	fruit
WHERE	원산지 IS NULL;
-- 4-2) 과일 가격의 내림차순으로 정렬하는데,
-- 가격이 같은 경우, 원산지의 오름차순 정렬로 검색하라
SELECT	가격, 원산지
FROM	fruit
ORDER BY	가격 ASC, 원산지 DESC;
-- 4-3) 원산지가 국으로 끝나는 과일이름, 원산지를 검색하라
SELECT	과일이름, 원산지
FROM	fruit
WHERE	원산지 LIKE  '%국';
-- 4-4) 원산지가 인으로 시작하는 과일이름, 원산지를 출력하라
SELECT	과일이름, 원산지
FROM	fruit
WHERE	원산지 LIKE  '인%';
-- 4-5) 원산지별로 원산지와 개수를 검색하라
SELECT	원산지, COUNT(원산지)
FROM	fruit
group by	원산지;

-- 4-6) 색상별로 색상이 3개 이상인 과일만 색상, 과일개수를 검색하라
-- 단, 과일개수가 많은 것부터 나타나도록 검색하라
SELECT	색상, COUNT(*)
FROM	fruit
GROUP BY 색상S
HAVING COUNT(*)
ORDER BY COUNT(*) DESC;