/* 1 Tambahkan satu personal dalam table dengan nama employee Albert dengan posisi enginner,
 join date 24 Januari 2024, dengan Year of experience 2.5 year. With salary $50.*/

INSERT INTO Employees (Name, Position, JoinDate, YearOfExperience, Salary) 
VALUES ('Albert', 'Engineer', '2024-01-24', 2.5, 50);

-- Update table dengan posisi enginner with salaray $85

UPDATE Employees 
SET Salary = 85 
WHERE Position = 'Engineer';

-- Hitung total pengeluaran salary saat tahun 2021

SELECT SUM(Salary) AS Total_Salary_2021 FROM Employees 
WHERE (JoinDate <= '2021-12-31') 
 AND (ReleaseDate IS NULL OR ReleaseDate >= '2021-01-01');

-- Sorting menampilkan 3 employee paling banyak yang memiliki Years of Experience

SELECT Name, Position, YearOfExperience, Salary FROM Employees 
ORDER BY YearOfExperience
DESC LIMIT 3;

-- Tuliskan subquery untuk employee dengan posisi engginer yang memiliki exeperience kurang dari sama dengan 3 tahun
SELECT * FROM Employees 
WHERE Position = 'Engineer'
 AND YearOfExperience <= 3;





