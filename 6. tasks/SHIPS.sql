-- 1.Да се напише заявка, която извежда държавата и броят на потъналите кораби за
-- тази държава. Държави, които нямат кораби или имат кораб, но той не е участвал в
-- битка, също да бъдат изведени. 
select cl.country, count(o.result) as Sunk
from classes cl 
left join ships s on cl.class = s.class
left join outcomes o on o.ship = s.name
where o.result = 'sunk' or o.result is null
group by cl.country;

-- 2.Да се напише заявка, която извежда име и държава на всички кораби, които никога
-- не са потъвали в битка (може и да не са участвали). 
select s.name, c.country
from classes c
join ships s on c.class = s.class
left join outcomes o on s.name = o.SHIP
where (o.result = 'damaged' or o.result = 'ok') or o.result is null;

-- Вариант 2 на зад.2
select name, country
from ships
join classes on ships.class=classes.class
where name not in
 (select ship from outcomes where result='sunk');

-- 3.Да се напише заявка, която извежда имената на всички кораби без повторения,
-- които са участвали в поне една битка и чиито имена започват с буквите C или K. 
select distinct ship
from outcomes
where (ship like 'C%' or ship like 'K%');




