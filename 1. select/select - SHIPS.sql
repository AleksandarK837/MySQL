-- 1. Напишете заявка, която извежда името на класа и страната за всички
-- класове с брой на оръдията по-малък от 10
select class, country 
from classes
where numguns < 10;

-- 2. Напишете заявка, която извежда имената на всички кораби, пуснати на
-- вода преди 1918. Задайте псевдоним на колоната shipName
select name as shipname 
from ships
where launched < 1918;