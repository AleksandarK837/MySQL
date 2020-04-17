-- 1.Напишете заявка, която извежда броя на класовете кораби
select count(class) from classes;

-- 2.Напишете заявка, която извежда средния брой на оръжия, според класа на кораба
select class, avg(numguns) as avgNumguns
from classes
order by class;

-- 3.Напишете заявка, която извежда средния брой на оръжия за всички кораби
select avg(cl.numguns) as avgNumguns
from classes cl join ships sh on cl.class = sh.class;

-- 4.Напишете заявка, която извежда за всеки клас първата и последната година, в
-- която кораб от съответния клас е пуснат на вода
select s.class, min(s.launched) as minYear, max(s.launched) as maxYear
from ships s
group by s.class;

-- 5.Напишете заявка, която извежда броя на корабите потънали в битка според класа
select s.class, count(o.ship) as CNT
from ships s join outcomes o on s.name = o.ship 
where o.result = 'sunk'
group by s.class;

-- 7.Напишете заявка, която извежда броя на корабите потънали в битка според
-- класа, за тези класове с повече от 2 кораба
select s.class, count(o.ship) as CNT
from ships s join outcomes o on s.name = o.ship 
where o.RESULT = 'sunk'
group by s.CLASS
having count(o.ship) > 2;

-- 8.Напишете заявка, която извежда средното тегло на корабите, за всяка страна. 
select avg(c.DISPLACEMENT) as avgKG, c.country
from classes c join ships s on c.CLASS = s.CLASS
group by c.COUNTRY;


