SELECT
  barcode,
  price,
  pos.title as pos_title

FROM
  reports
INNER JOIN pos ON reports.pos_id = pos.id

GROUP BY
  barcode, price, pos.title

HAVING
  COUNT(pos.id) > 1;

-- Не совсем понял задание, в данном случае выбираются все штрихкоды 
-- и цены из точек продаж с дублирующимся названием