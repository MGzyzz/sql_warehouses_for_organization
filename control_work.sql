§-- task_one
select
    p.name as product_name,
    sum(t.quantity) as total_quantity
from products p
join transitions t on p.id = t.product_id
where t.warehouse_to_id = '1' and t.timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name;

------------

-- task_two

select
    p.name as product_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
where t.warehouse_from_id = '3' and t.timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name;

------------

-- task_three

select
    c.name as category_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
join categories c on p.category_id = c.id
where t.warehouse_to_id = '5' and t.timestamp between '2023-01-01' and '2023-12-31'
group by c.name
order by c.name;

------------

-- task_four

select
    coalesce(b.name, 'Без бренда') as brand_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
left join brands b on p.brand_id = b.id
where t.warehouse_to_id = '1' and t.timestamp between '2023-01-01' and '2023-12-31'
group by b.name
order by brand_name;

------------

--task_six

select
    p.name as product_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
where t.contractor_id = '1' and t.timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name;

------------

-- task_seven

select
    p.name as product_name,
    sum(t.quantity)
from transitions t
join products p on t.product_id = p.id
where t.contractor_id = '4' and t.warehouse_to_id = '1' and t.timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name;

------------

-- task_eight

select
    p.name as product_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
where t.contractor_id = '3' and t.warehouse_from_id = '2' and t.timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name;

------------

-- task_nine

select
    c.name as contractor_name,
    sum(t.quantity) as total_quantity
from transitions t
join contractors c on c.id = t.contractor_id
where t.product_id = '5' and t.timestamp between '2023-01-01' and '2023-12-31'
group by c.name
order by total_quantity desc;

------------

-- task_ten

select
    c.name as contractor_name,
    sum(t.quantity) as total_quntity
from transitions t
join contractors c on c.id = t.contractor_id
where t.product_id = '5' and t.timestamp between '2023-01-01' and '2023-12-31'
group by c.name;

------------

-- task_eleven

select
    p.name as product_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
where t.warehouse_to_id = '1' and t.timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name;

--------------

-- task_twelve

select
    p.name as product_name,
    sum(t.quantity) as total_quantity
from transitions t
join products p on t.product_id = p.id
where t.warehouse_from_id = '3' and timestamp between '2023-01-01' and '2023-12-31'
group by p.name
order by p.name

--------------
