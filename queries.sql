SELECT COUNT(*)
FROM part_nyc
WHERE on_hand > 70;

SELECT SUM(on_hand)
FROM
  (SELECT * FROM part_nyc
   UNION
   SELECT * FROM part_sfo) 
WHERE color = 'Red';

SELECT supplier FROM
  (SELECT supplier, SUM(on_hand)
  FROM part_nyc
  GROUP BY supplier

  LEFT JOIN

  SELECT supplier, SUM(on_hand)
  FROM part_sfo
  GROUP BY supplier)
WHERE part_nyc > part_sfo OR part_sfo = NULL;

SELECT supplier
FROM 
  (SELECT part_number, supplier
  FROM part_nyc
   
  EXCEPT
  
  SELECT part_number, supplier
  part_sfo);
  
UPDATE part_nyc
SET on_hand = on_hand - 10

DELETE
FROM part_nyc
WHERE on_hand < 30;
