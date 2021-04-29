-- 1. feladat
CREATE DATABASE webshop
CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
-- 3. feladat
ALTER TABLE szamlatetel
ADD FOREIGN KEY (szamlafejid) REFERENCES szamlafej(id);

ALTER TABLE szamlatetel
ADD FOREIGN KEY (termekid) REFERENCES termekek(id);

ALTER TABLE szamlafej
ADD FOREIGN KEY (vevoid) REFERENCES vevok(id);

-- 4. feladat
SELECT megnevezes,ar 
FROM termekek
ORDER BY ar ASC;

-- 5. feladat
UPDATE termekek 
SET ar=(ar*0.95)
WHERE ar>5000;

-- 6. feladat
SELECT SUM(szamlatetel.bruttoegysegar*szamlatetel.mennyiseg) AS 'arbevetel'
FROM szamlatetel
JOIN szamlafej
ON szamlatetel.szamlafejid=szamlafej.id
WHERE szamlafej.teljesites BETWEEN '2018-01-01' AND '2018-01-15';

-- 7. feladat
SELECT vevok.nev,vevok.telepules
FROM vevok
WHERE vevok.id NOT IN(SELECT vevoid FROM szamlafej)
GROUP BY vevok.nev
ORDER BY vevok.nev ASC;

-- 8. feladat
SELECT termekek.megnevezes,SUM(szamlatetel.bruttoegysegar*szamlatetel.mennyiseg) AS 'bevetel'
FROM termekek
JOIN szamlatetel
ON termekek.id=szamlatetel.termekid
GROUP BY termekek.megnevezes
ORDER BY bevetel DESC
LIMIT 3;

