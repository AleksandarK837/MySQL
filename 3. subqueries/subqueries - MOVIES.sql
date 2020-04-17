-- 1.Напишете заявка, която извежда имената на актрисите, които са също и
-- продуценти с нетна стойност по-голяма от 10 милиона
select name
from moviestar
where name in (select name from movieexex
               where networth > 10000) and gender = 'F';

-- 2.Напишете заявка, която извежда имената на тези актьори (мъже и жени), които
-- не са продуценти. От Упражнение 2, да се решат с подзаявки
select name
from moviestar
where name not in (select name from movieexec);

-- 3.Напишете заявка, която извежда имената на всички филми с дължина по-голяма
-- от дължината на филма ‘Gone With the Wind’ 
select title
from movie
where length > (select length from movie 
                where title='Gone With the Wind');

-- 4.Напишете заявка, която извежда имената на продуцентите и имената на
-- продукциите за които стойността им е по-голяма от продукциите на продуценти ‘Merv Griffin’ 
select title, name
from movieexec, movie
where networth > (select networth from movieexec
                  where name = 'Merv Griffin' and cert in (select producerc from movie))
				  and cert = producerc;

-- 5.Напишете заявка, която извежда името на филмите с най-голяма дължина по студио. 
select studioname, title, length
from movie m
where length >= all (select length 
		     from movie
		     where studioname=m.studioname)
             
             
             