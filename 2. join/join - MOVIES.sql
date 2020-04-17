-- 1.Напишете заявка, която извежда имената на актьорите мъже участвали в ‘Terms of Endearment’ 
select starname 
from starsin, moviestar
where movietitle like 'Terms of Endearment' and starname = name and gender like 'M';

-- 2.Напишете заявка, която извежда имената на актьорите участвали във филми
-- продуцирани от ‘MGM’през 1995 г.
select starname 
from starsin, movie
where movietitle = title and studioname like 'MGM' and year = 1995 and year = movieyear;

-- 3.Напишете заявка, която извежда името на президента на ‘MGM’ 
select distinct name
from movie, movieexec
where producerc=cert and studioname='MGM';

-- 4.Напишете заявка, която извежда имената на всички филми с дължина по-голяма
-- от дължината на филма ‘Gone With the Wind’ 
select m1.title 
from movie m1, movie m2 
where m2.title='Gone With the Wind' and m1.length > m2.length;

-- 5. Напишете заявка, която извежда имената на тези продукции на стойност поголяма от продукциите на продуценти ‘Merv Griffin’ 
select * from movieexec m1, movieexec m2
where m2.name = 'Merv Griffin' and m1.cert<>m2.cert and m1.networth > m2.networth;


