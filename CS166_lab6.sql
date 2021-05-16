SELECT sid, COUNT(pid)
FROM catalog
GROUP BY sid;

SELECT sid, COUNT(pid)
FROM catalog
WHERE COUNT(pid) > 2
GROUP BY sid;

SELECT sname, COUNT(pid)
FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers)
WHERE color = ALL('Green')
GROUP BY sid;

SELECT sname, MAX(cost)
FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers)
WHERE color = ANY('Red')
AND color = ANY('Green')
GROUP BY sname;
