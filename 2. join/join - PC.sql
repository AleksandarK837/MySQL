-- 1.Напишете заявка, която извежда производителя и честотата на тези лаптопи с
-- размер на диска поне 9 GB 
select maker, speed 
from product, laptop 
where product.model = laptop.model and laptop.ram > 9;

-- 2.Напишете заявка, която извежда номер на модел и цена на всички продукти,
-- произведени от производител с име ‘B’ 
select distinct p.model, l.price, p.type 
from product p, laptop l
where p.model = l.model and p.maker = 'B' union

select p.model, pc.price, p.type 
from product p, PC pc
where p.model = pc.model and p.maker = 'B' union 

select p.model, pr.price, p.type 
from product p, printer pr
where p.model = pr.model and p.maker = 'B';

-- 3.Напишете заявка, която извежда размерите на тези дискове, които се предлагат в
-- повече от два компютъра
select distinct pc1.hd
from pc as pc1, pc as pc2, pc as pc3
where pc1.model<>pc2.model and pc1.model<>pc3.model and pc2.model<>pc3.model 
and pc1.hd=pc2.hd and pc2.hd=pc3.hd
order by pc1.hd;

-- 4.Напишете заявка, която извежда всички двойки модели на компютри, които
-- имат еднаква честота и памет. Двойките трябва да се показват само по веднъж,
-- например само (i, j), но не и (j, i) 
select pc1.model, pc2.model 
from pc pc1, pc pc2
where pc1.speed = pc2.speed and pc1.ram = pc2.ram and pc1.model<>pc2.model;

-- 5.Напишете заявка, която извежда производителите на поне два различни
-- компютъра с честота поне 400. 
select distinct p1.maker, p1.model 
from product p1, product p2, pc pc1, pc pc2
where p1.maker = p2.maker and p1.model = pc1.model and p2.model = pc2.model and 
	  pc1.model<>pc2.model and pc1.speed>400 and pc2.speed>400;
