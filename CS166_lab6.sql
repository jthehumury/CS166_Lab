SELECT pid, COUNT(pid) FROM catalog GROUP BY sid;
SELECT pid, COUNT(pid) FROM catalog WHERE COUNT(pid) > 2 GROUP BY sid;
SELECT sname, COUNT(pid) FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers) WHERE color = ALL
  (SELECT 
    
    );
SELECT sname FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers) WHERE color = 'Green';
