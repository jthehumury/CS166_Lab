SELECT * FROM suppliers;
SELECT * FROM parts;
SELECT * FROM catalog;

SELECT sid, COUNT(pid)
FROM catalog
GROUP BY sid;

SELECT sid, COUNT(pid)
FROM catalog
GROUP BY sid
HAVING COUNT(pid) >= 3;

SELECT sname, COUNT(pid)
FROM supplier NATURAL JOIN catalog
WHERE sname IN
	(SELECT sname
	FROM parts p1, catalog c1, suppliers s1
	WHERE p1.pid = c1.pid
	AND s1.sid = c1.sid

	EXCEPT

	SELECT sname
	FROM parts p2, catalog c2, suppliers s2
	WHERE p2.pid = c2.pid
	AND s2.sid = c2.sid
	AND p2.color <> 'Green')
GROUP BY sname;

SELECT sname, MAX(cost)
FROM supplier NATURAL JOIN catalog
WHERE sname IN
	(SELECT sname
	FROM parts p1, catalog c1, suppliers s1
	WHERE p1.pid = c1.pid
	AND s1.sid = c1.sid
	AND p1.color = 'Green'
	GROUP BY sname

	INTERSECT

	SELECT sname
	FROM parts p2, catalog c2, suppliers s2
	WHERE p2.pid = c2.pid
	AND s2.sid = c2.sid
	AND p2.color = 'Red')
GROUP BY sname
