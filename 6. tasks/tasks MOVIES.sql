-- 1.Напишете заявка, която извежда име на актьор, адрес на актьор и заглавие на филм, 
-- за тези филми създадени след 1990 г. и име на актьор започващо с ‘J’.
select m.name, m.address, s.movietitle, s.movieyear
from moviestar m join starsin s
on m.name = s.starname
where s.movieyear > 1990 and m.name like 'J%';

-- 2.Напишете заявка, която за всеки актьор извежда име на актьор и броя на филмите, в които актьора е участвал.
select distinct starname, count(starname) as CNT
from starsin 
group by starname;

-- 3.Напишете заявка, която извежда име на актьор и име на студио, 
-- за тези актьори участвали в най-малко филми на това студио.
select s.name, si.starname
from starsin si
join movie m on si.movietitle = m.title and si.movieyear = m.year
join studio s on m.studioname = s.name
group by s.name, si.starname
having count(*) <= all(select count(*)
                       from starsin si1
                       join movie m1 on si1.movietitle = m1.title and si1.movieyear = m1.year
                       join studio s1 on m1.studioname = s1.name
                       where s.name = s1.name
					   group by s1.name, si1.starname);
                       
-- 4.Напишете заявка, 
-- която извежда името на продуцента и името на филма продуциран от този продуцент, 
-- за този филм, в които са участвали най-много мъже.
select me.name, m.title
from movieexec me join movie m on me.cert = m.producerc
join starsin s on m.title = s.movietitle and m.year = s.movieyear
join moviestar mvs on mvs.name = s.starname where mvs.gender = 'M'
group by me.name, m.title
having count(*) >= all(select count(*)
                       from movieexec me1 join movie m1 on me1.cert = m1.producerc
					                      join starsin s1 on m1.title = s1.movietitle and m1.year = s1.movieyear
										  join moviestar mvs1 on mvs1.name = s1.starname where mvs1.gender = 'M'
					   group by me1.name, m1.title);         
 
 -- 5. Напишете заявка, която извежда името на този актьор, 
 -- който е участвал във филми продуцирани от продуцент с най-големи приходи от продукции (netwoth)
select t1.starname, t1.name as producer, t1.networth from
(select distinct s.starname, me.name, me.networth from movieexec me 
join movie m on me.cert = m.producerc
join starsin s on m.title = s.movietitle and m.YEAR = s.movieyear) t1
group by t1.starname, t1.name
having t1.networth >= all (select distinct me.networth 
                           from movieexec me 
                           join movie m on me.cert = m.producerc
                           join starsin s on m.title = s.movietitle and m.year = s.movieyear
                           group by s.starname, me.name);
 
-- 6.Напишете заявка, която да извежда за всяко студио името на студиото, 
-- заглавието и годината на филма, излязъл последно на екран за това студио.
select s.name, m.title, max(m.year)
from studio s join movie m on s.name = m.studioname
group by s.name;
 