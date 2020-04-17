-- 1.Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия. 
select distinct country 
from classes
where numguns >= all(select numguns from classes);

-- 2.Напишете заявка, която извежда класовете, за които поне един от корабите им е
-- потънал в битка. 
select distinct class 
from ships
where name in (select ship from outcomes where result = 'sunk');

-- 3.Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore). 
select distinct name 
from ships
where class in (select class from CLASSES
                where bore = 16);

-- 4.Напишете заявка, която извежда имената на битките, в които са участвали
-- кораби от клас ‘Kongo’. 
select battle 
from outcomes
where ship in (select name from ships
               where class = 'Kongo');

-- 5.Напишете заявка, която извежда иманата на корабите, чиито брой оръдия е най-голям 
-- в сравнение с корабите със същия калибър оръдия (bore). 
select c1. class, name
from classes c1, ships s
where numguns >= all (select numguns from classes where bore=c1.bore)
and s.class = c1.class
order by c1.class;

                 