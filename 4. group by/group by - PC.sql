-- 1.Напишете заявка, която извежда средната честота на компютрите
select avg(speed) as avgSpeed from pc;

-- 2.Напишете заявка, която извежда средния размер на екраните на лаптопите за
-- всеки производител
select p.maker, avg(l.screen) as avgScreen
from product p join laptop l on p.model = l.model
group by p.maker;

-- 3.Напишете заявка, която извежда средната честота на лаптопите с цена над 1000 
select avg(screen) as AvgScreen1000
from laptop where price > 1000;

-- 4.Напишете заявка, която извежда средната цена на компютрите произведени от
-- производител ‘A’ 
select prod.maker, avg(p.price) as avgPrice
from pc p join product prod on p.model = prod.model
where prod.maker = 'A'
group by prod.maker;

-- 5.Напишете заявка, която извежда средната цена на компютрите и лаптопите за
-- производител ‘B’
select avg(price) as AvgPrice
from
(
select maker, price
from product p, pc
where p.model=pc.model and maker='B'
union all
select maker, price
from product p, laptop l
where p.model=l.model and maker='B'
)T;

-- 6.Напишете заявка, която извежда средната цена на компютрите според
-- различните им честоти
select avg(price) as AvgPrice, speed 
from laptop
group by speed;

-- 7.Напишете заявка, която извежда производителя, които е произвел поне 3
-- различни модела компютъра
select pr.maker, count(pr.model) as CNT
from pc p join product pr on pr.model = p.model
group by pr.maker
having count(p.model)>=3;

-- 8.Напишете заявка, която извежда производителя с най-висока цена на компютър
select pr.maker, max(p.price) as MaxPrice
from product pr, pc p
where pr.model = p.model;

-- 9.Напишете заявка, която извежда средната цена на компютрите за всяка честота
-- по-голяма от 800 
select avg(price) as PCprice, speed
from pc
where speed > 800;

-- 10.Напишете заявка, която извежда средния размер на диска на тези компютри
-- произведени от производители, които произвеждат и принтери
select avg(p.hd) as avgHD, pr.maker
from pc p join product pr on p.model = pr.model
where pr.maker in (select maker from product where type = 'Printer');



