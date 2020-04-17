-- 1.Да се изведат различните модели компютри, чиято цена е по-ниска от най-евтиния
-- лаптоп, произвеждан от същия производител. 
select p.model as PCmodel, p.price as PCprice
from pc p
join product pr on p.model = pr.model
where p.price < all (select min(l2.price) from laptop l2
                                          join product pr2 on l2.model = pr2.model 
                                          where pr.maker = pr2.maker)
group by p.model;

-- 2.Да се напише заявка, която извежда всички модели лаптопи, за които се предлагат
-- както разновидности с 15" екран, така и с 11" екран. 
select model as laptopModel, screen as laptopScreen
from laptop
where screen = 11 or screen = 15;

-- 3.Един модел компютри може да се предлага в няколко разновидности с евентуално
-- различна цена. Да се изведат тези модели компютри, чиято средна цена (на
-- различните му разновидности) е по-ниска от най-евтиния лаптоп. 
select model, avg(price) as avgPCprice
from pc
group by model
having avgPCprice < (select min(price) from laptop);

-- 4.Да се напише заявка, която извежда за всеки компютър: код на продукта (code);
-- производител; брой компютри, които имат цена, по-голяма или равна на неговата. 
select pc1.code, p.maker, count(pc2.code)
from pc pc1, pc pc2, product p
where pc1.model = p.model and pc1.price <= pc2.price and pc2.model = p.model
group by pc1.code, p.maker;

-- 5.Един модел компютри може да се предлага в няколко разновидности с евентуално
-- различна цена. Да се изведат тези модели компютри, чиято сума от цените (на
-- различните му разновидности) е по-ниска от сумата на цените на лаптопите. 
select pc.model, sum(price) 
from pc
join product p on pc.model=p.model
group by pc.model
having sum(price) < (select sum(price) from laptop
	                                   join product t on laptop.model=t.model);

-- 6. Един модел компютри може да се предлага в няколко разновидности с евентуално
-- различна цена. Да се изведат тези модели компютри, чиято средна цена (на различните му
-- разновидности) е по-ниска от най-евтиния лаптоп, произвеждан от същия производител. 
select pc1.model, avg(pc1.price) as avgPCprice
from pc pc1 
join product p on pc1.model = p.model
group by pc1.model, p.maker
having avgPCprice < (select min(l.price)
				     from laptop l 
                     join product t on l.model = t.model
                     where t.maker = p.maker);
                     
    
    
    
    
    
