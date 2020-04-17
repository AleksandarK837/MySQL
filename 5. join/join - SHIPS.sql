-- 1.Напишете заявка, която извежда цялата налична информация за всеки кораб,
-- включително и данните за неговия клас. В резултата не трябва да се включват
-- тези класове, които нямат кораби. 
select s.*
from ships s 
right join classes c on s.class = c.class
where s.name is not null;

-- 2.Повторете горната заявка като този път включите в резултата и класовете, които
-- нямат кораби, но съществуват кораби със същото име като тяхното. 
select s.*
from ships s 
right join classes c on s.class = c.class
where s.name is not null or (s.name is null and c.class in (select name from ships));

-- 3.За всяка страна изведете имената на корабите, които никога не са участвали в битка. 
select c.country, s.name as shipName
from classes c 
join ships s on c.class = s.class
left join outcomes o on s.name = o.ship
where o.ship is null;

