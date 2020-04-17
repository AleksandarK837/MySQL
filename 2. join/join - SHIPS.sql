-- 1.Напишете заявка, която извежда името на корабите по-тежки от 35000 
select s.name
from ships s, classes c
where s.class=c.class and c.displacement>35000;

-- 2.Напишете заявка, която извежда имената, водоизместимостта и броя оръжия на
-- всички кораби участвали в битката при ‘Guadalcanal’ 
select s.name, c.displacement, c.numguns
from ships s, classes c, outcomes o
where c.class = s.class and s.name = o.ship and o.battle = 'Guadalcanal';

-- 3.Напишете заявка, която извежда имената на тези държави, които имат кораби от
-- тип ‘bb’ и ‘bc’ едновременно
select c1.country
from classes c1, CLASSES c2
where c1.type = 'bb' and c2.type = 'bc' and c1.country = c2.country;

-- 4.Напишете заявка, която извежда имената на тези битки с три кораби на една и съща държава
select distinct o1.battle
from outcomes o1, outcomes o2, outcomes o3, 
     ships s1, ships s2, ships s3,
	 classes c1, classes c2, classes c3
where c1.class = s1.class and s1.name = o1.ship and
      c2.class = s2.class and s2.name = o2.ship and
	  c3.class = s3.class and s3.name = o3.ship and
	  c1.country = c2.country and c2.country = c3.country and
	  o1.battle=o2.battle and o1.battle=o3.battle and
	  s1.name<>s2.name and s1.name<>s3.name and s2.name<>s3.name;

-- 5. Напишете заявка, която извежда имената на тези кораби, които са били
-- повредени в една битка, но по късно са участвали в друга битка
select o1.ship
from outcomes o1, outcomes o2, battles b1, battles b2
where o1.ship = o2.ship and 
      o1.result = 'damaged' and
	  o1.battle = b1.name and o2.battle = b2.name and 
	  b1.date<b2.date;


