Select * from {{ref('tel_plan')}}
where activated_on > current_date
