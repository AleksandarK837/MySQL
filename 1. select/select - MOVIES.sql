-- 1.Напишете заявка, която извежда адресът на студио ‘MGM’
select address 
from studio
where name = 'MGM';

-- 2.Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock
select birthdate 
from moviestar
where name = 'Sandra Bullock';

-- 3.Напишете заявка, която извежда имената на всички актьори, които са
-- участвали във филм през 1980 в заглавието на които има думата ‘Love’
select starname 
from starsin
where movieyear=1980 and movietitle like '%Love%';

-- 4.Напишете заявка, която извежда имената на всички продуценти на
-- филми на стойност над 10 000 000 долара
select name 
from movieexec
where networth > 10000;

-- 5. Напишете заявка, която извежда имената на всички актьори, които са
-- мъже или живеят в Malibu
select name 
from moviestar
where address like '%Malibu%' or gender like 'M';




