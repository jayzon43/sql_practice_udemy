　select 
    case c.gender
        when 1 then '男性'
        when 2 then '女性'
        end as gender
    ,case 
            when date_diff('2021-12-13', c.birthday, year) between 21 and 30 then 'a 21-30'
            when date_diff('2021-12-13', c.birthday, year) between 31 and 40 then 'b 31-40'
            when date_diff('2021-12-13', c.birthday, year) between 41 and 50 then 'c 41-50'
            when date_diff('2021-12-13', c.birthday, year) between 51 and 60 then 'd 51-60'
            when date_diff('2021-12-13', c.birthday, year) between 61 and 70 then 'e 61-70'
            end as age_group
    ,count(*) as num_purchase
    ,sum(p.quantity) as sum_quantity
    ,sum(p.sales_amount) as sum_sales
    ,sum(p.sales_amount) / sum(p.quantity) as avg_sales
from 
    `bq-sql-332715.sample.shop_purchases` p
    inner join `bq-sql-332715.sample.customers` c on p.user_id = c.user_id
where gender <> 3
group by gender
         ,case 
            when date_diff('2021-12-13', c.birthday, year) between 21 and 30 then 'a 21-30'
            when date_diff('2021-12-13', c.birthday, year) between 31 and 40 then 'b 31-40'
            when date_diff('2021-12-13', c.birthday, year) between 41 and 50 then 'c 41-50'
            when date_diff('2021-12-13', c.birthday, year) between 51 and 60 then 'd 51-60'
            when date_diff('2021-12-13', c.birthday, year) between 61 and 70 then 'e 61-70'
            end 
;
