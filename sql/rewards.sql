SELECT
  user_id,
  SUM(CASE WHEN 
  	    date_part('year', created_at) = 2019 
  	  THEN 
  	    reward 
  	  ELSE 
  	    0 
  	  END) as rewards_sum
  
FROM reports

GROUP BY user_id

HAVING date_part('year', MIN(created_at)) = 2018;
