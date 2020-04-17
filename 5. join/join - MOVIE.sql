-- 1.Напишете заявка, която извежда името на продуцента и имената на филмите,
-- продуцирани от продуцента на ‘Star Wars’ 
select me.name, m.title
from movieexec me 
join movie m on me.cert = m.producerc
where me.name in (select name from movieexec 
                  where cert in (select producerc from movie
								 where title = 'Star Wars'));

-- 2.Напишете заявка, която извежда имената на продуцентите на филмите на ‘Harrison Ford’ 
select me.name, m.title, s.starname
from starsin s 
join movie m on s.movietitle = m.title and s.movieyear = m.year
join movieexec me on me.cert = m.producerc
where s.starname = 'Harrison Ford';

-- 3.Напишете заявка, която извежда името на студиото и имената на актьорите
-- участвали във филми произведени от това студио, подредени по име на студио. 
select distinct st.name as studioName, s.starname
from studio st 
join movie m on st.name = m.studioname
join starsin s on m.title = s.movietitle and m.year = s.movieyear
order by st.name;

-- 4.Напишете заявка, която извежда имената на актьора (актьорите) участвали във
-- филми на най-голяма стойност
select s.starname, m.title, me.networth as maxNetworth
from starsin s 
join movie m on s.movietitle = m.title and s.movieyear = m.year
join movieexec me on me.cert = m.producerc
where me.networth >= all (select networth from movieexec);

-- 5.Напишете заявка, която извежда имената на актьорите не участвали в нито един филм.
select me.name, si.movietitle
from movieexec me 
left join starsin si
on me.name = si.starname
where si.movietitle is null;


