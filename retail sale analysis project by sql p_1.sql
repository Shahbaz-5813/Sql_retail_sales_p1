-- SQl retail sale analysis_p1
create database sql_projects_p2;

-- create table 
drop table if exists retail_sales;
create table retail_sales
(
	transactions_id int primary key,
	sale_date date,
	sale_time time,
	customer_id int,
    gender varchar(15),
    age int,
	category varchar (15),
	quantiy int,
	price_per_unit	float,
    cogs	float,
    total_sale float
)

select count(*) from retail_sales;
select * from retail_sales
where transactions_id is null

-- Data exploaration
-- How many sales we have?
select count(*) as total_sale from retail_sales


-- How many unique customers we have?
select count(distinct customer_id)as total_sale from retail_sales



-- How many unique category we have?
select count(distinct category)as total_sale from retail_sales
select distinct category from retail_sales



-- Data analysis & Bussines key key problem & answers
-- Q.1 Write a sql query to retrieve all columns fro sales made on '2022-11-05'
select * 
from retail_sales
where sale_date = '2022-11-05';


-- Q.2 write a sql query to retrieve all transactions where the category is clothing and the quantity sold is more the month of nov-2022?
select 
   *
from retail_sales
where
   category = 'clothing'
  
  
-- Q.3 Write a sql query to calculate the total sales(total_sales) for each category.
select
    category,
    sum(total_sale) as net_sale,
    count(*) as total_orders
from retail_sales
group by 1
 
 
--  Q.3 write a sql query to find the average age of customers who purchased item from the 'beauty'category?
select 
    avg(age) as avg_age
    from retail_sales
    where category = 'beauty'
    
    
    -- Q.3 write a sql query to find all transaction where the total_sale is greater than 1000.
select * from retail_sales
where total_sale > 1000
    

-- Q.4--  write a sql query to find the total number of transaction made by each gender in each category.
select 
    category,
	gender,
    count(*) as total_trans
from retail_sales
group 
    by
    category,
    gender
    
    
-- Q.7 write a sql query to calculate the average sale for each month.find out the best selling month in each year.
select
    extract(year from sale_date) as year,
    extract(month from sale_date) as month,
    avg(total_sale) as avg_sale,
    rank() over(partition by extract(year from sale_date) order by avg(total_sale)desc) 
from retail_sales
group by 1,2
-- order by 1,3 desc


-- Q.8 write a sql query to find the top 5 customers based on the highest total sales.
select
     customer_id,
     sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5


Q.9 write a sql query to find the number of unique customers who purchased item fro each category.
select
     category,
     count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category


-- Q.10 write a sql query to create each shift and number of orders(example morning <12,afternoon between 12 & 17,evening > 17).

select *,
	case 
        when extract(hour from sale_time) < 12 then 'morning'
        when extract(hour from sale_time)between 12 and 17 then 'aftrenoon'
        else 'evening'
	end as shift
from retail_sales

select extract (hour from current_time)

-- End of project
  



