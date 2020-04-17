-- 1.Напишете заявка, която извежда производителите на персонални компютри с
-- честота поне 500.
select maker
from product 
where model in (select model from pc
                where speed > 500);

-- 2.Напишете заявка, която извежда принтерите с най-висока цена. 
select model, price
from printer
where price >= all(select price from printer);

-- 3.Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
-- честотата на който и да е персонален компютър. 
select *
from laptop
where speed < all(select distinct speed from pc);

-- 4.Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена
select *
from product 
where model in (select model from printer where color = 'y' and 
                price <= all(select price from printer where color = 'y'));

-- 5.Напишете заявка, която извежда производителите на тези персонални компютри
-- с най-малко RAM памет, които имат най-бързи процесори. 
select * from product
where model in (select model from pc p where
                ram <= all(select ram from pc) and 
				speed >= all(select speed from pc where ram = p.ram));

