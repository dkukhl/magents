SELECT
  pos.title as pos_title,
  ARRAY_AGG(ARRAY[reports.barcode::varchar(30),  reports.price::varchar(30)]::text) as barcodes

FROM
  reports
INNER JOIN pos ON reports.pos_id = pos.id

GROUP BY
  pos_title;