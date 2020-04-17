-- 1.Да се напише заявка, която извежда имената и годините на всички филми, които са
-- по-дълги от 120 минути и са снимани преди 1990 г. Ако дължината на филма е
-- неизвестна (NULL), името и годината на този филм също да се изведат. 
select title, year
from movie
where year < 1990 and (length > 120 or length is null);

-- 2.Да се напише заявка, която извежда имената на най-младия актьор (мъж). 
select m.name, max(m.birthdate) as birthdateYear
from moviestar m
where m.gender = 'M';

-- 3.Да се напише заявка, която извежда имената и пола на всички актьори, чието име
-- започва с 'J' и са родени след 1948 година. Резултатът да бъде подреден по име в
-- намаляващ ред. 
select name, gender
from moviestar
where (name like 'J%') and year(birthdate) > 1948
order by name desc;

-- 4.Да се напише заявка, която извежда името на филма, годината и броят на актьорите
-- участвали в този филм, за тези филми с повече от 2-ма актьори. 
select movietitle, movieyear, count(starname) as cntStarname
from starsin  
group by movietitle, movieyear
having cntStarname > 2;


