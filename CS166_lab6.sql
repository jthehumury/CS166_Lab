SELECT pid FROM Catalog WHERE cost < 10;
SELECT pname FROM (catalog NATURAL JOIN parts) WHERE cost < 10;
SELECT address FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers) WHERE pname = 'Fire Hydrant Cap';
SELECT sname FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers) WHERE color = 'Green';
SELECT sname, pname FROM ((parts NATURAL JOIN catalog) NATURAL JOIN suppliers);
