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
FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers)
WHERE pid = ALL
        (SELECT pid
        FROM parts
        WHERE color = 'Green')
GROUP BY sname;

SELECT sname, MAX(cost)
FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers)
WHERE color IN('Red') AND color IN('Green')
GROUP BY color;
