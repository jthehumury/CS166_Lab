SELECT * FROM part_nyc
SELECT * FROM part_sfo
SELECT * FROM supplier
SELECT * FROM color

SELECT COUNT(*)
FROM part_nyc
WHERE on_hand > 70;

SELECT COUNT(*)
FROM part_nyc, 
WHERE color = 'Red'

