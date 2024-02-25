create table customers( 
	customer_id  integer PRIMARY KEY,
	first_name text,
	last_name text,
	gender text,
	DOB varchar(10),
	job_title text,
	job_industry_category text,
	wealth_segment text,
	deceased_indicator text, 
	owns_car text,
	address text,
	postcode integer,
	state text,
	country text,
	property_valuation integer
	)

create table transactions( 
	transaction_id integer PRIMARY KEY,
	product_id integer,
	customer_id integer,
	transaction_date varchar(10),
	online_order bool,
	order_status text,
	brand text,
	product_line text,
	product_class text,
	product_size text,
	list_price float(4),
	standard_cost float(4)
	)
	
/*Вывести распределение (количество) клиентов по сферам деятельности, отсортировав результат по убыванию количества.*/
select job_industry_category, count(*) as customers_count
	from customers
	group by job_industry_category
	order by customers_count
	
/*Найти сумму транзакций за каждый месяц по сферам деятельности, отсортировав по месяцам и по сфере деятельности.*/
select date_trunc('month', t.transaction_date::date) as transaction_month, c.job_industry_category, sum(t.list_price) as transaction_sum
	from transactions t left join customers c on t.customer_id = c.customer_id
	group by transaction_month, c.job_industry_category
	order by transaction_month, c.job_industry_category 
	
/*Вывести количество онлайн-заказов для всех брендов в рамках подтвержденных заказов клиентов из сферы IT.*/	
select t.brand, c.job_industry_category, count(*) as orders_count
	from transactions t left join customers c on t.customer_id = c.customer_id
	where t.online_order = true and c.job_industry_category = 'IT' 
	group by t.brand, c.job_industry_category
	order by t.brand
	
/*Найти по всем клиентам сумму всех транзакций (list_price), максимум, минимум и количество транзакций, отсортировав результат 
 по убыванию суммы транзакций и количества клиентов. Выполните двумя способами: используя только group by и используя только оконные функции. 
 Сравните результат.*/
	
-- Вариант запроса c group by
select t.customer_id, sum(t.list_price) as transaction_sum, max(t.list_price) as transaction_max, 
	min(t.list_price) as transaction_min, count(t.list_price) as transaction_count
	from transactions t
	group by t.customer_id
	order by transaction_sum desc, transaction_count desc
	
-- Вариант запроса с оконными функциями	
select  distinct
	t.customer_id, 
    sum(t.list_price) over (partition by customer_id) as transaction_sum 
    ,max(t.list_price) over (partition by customer_id) as transaction_max 
    ,min(t.list_price) over (partition by customer_id) as transaction_min
    ,count(t.list_price) over (partition by customer_id) as transaction_count  
	from 	transactions t 
	order by transaction_sum desc, transaction_count desc  	

/*Найти имена и фамилии клиентов с минимальной/максимальной суммой транзакций за весь период (сумма транзакций не может быть null). 
 Напишите отдельные запросы для минимальной и максимальной суммы.*/

select c.customer_id, c.first_name, c.last_name, sum(t.list_price) as transaction_min
	from transactions t left join customers c on t.customer_id = c.customer_id
	group by c.customer_id, c.first_name, c.last_name
	order by transaction_min
	limit 1
	
select c.customer_id, c.first_name, c.last_name, sum(t.list_price) as transaction_max
	from transactions t left join customers c on t.customer_id = c.customer_id
	group by c.customer_id, c.first_name, c.last_name
	order by transaction_max desc 
	limit 1
	
/*Вывести только самые первые транзакции клиентов. Решить с помощью оконных функций.*/

-- вывод с использованием только оконных функций
select  distinct 
		t.customer_id
		,first_value (t.transaction_date) over (partition by customer_id) as first_date
        ,first_value (t.transaction_id) over (partition by customer_id) as first_transacrion_id
        ,first_value (t.list_price) over (partition by customer_id) as first_transacrion_sum 
        from transactions t 

        
/*Вывести имена, фамилии и профессии клиентов, между транзакциями которых был максимальный интервал (интервал вычисляется в днях)*/
 create view  transaction_interval_view as 
	select t.customer_id, c.first_name, c.last_name, c.job_title
		,(lead (t.transaction_date::date)  over (partition by t.customer_id order by t.transaction_date::date)) - t.transaction_date::date  
		as transaction_interval 
	from 	transactions t right join customers c	on t.customer_id = c.customer_id 

select   *  from  transaction_interval_view 
	where transaction_interval  is not null 
	order by transaction_interval desc  limit 10;