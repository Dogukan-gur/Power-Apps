
SELECT * 
FROM
	(SELECT	
			ROW_NUMBER() over( ORDER BY Degis_Tarih asc) as ID,
			Personel,
			Plaka,
			Cikis_KM,
			Donus_KM,
			CAST(Donus_KM AS bigint)-CAST(Cikis_KM AS bigint) AS KM_FARKI,
			Cikis_Saati,
			Donus_Saati,
			CONVERT(date,SUBSTRING(Cikis_Tarihi,1,10),104 )AS CIKIS_TARIHI,
			CONVERT(date,SUBSTRING(Donus_Tarihi,1,10),104 )AS DONUS_TARIHI,
			Degis_Tarih

	FROM ARACTAKIP )  AS Q1
WHERE 
Q1.KM_FARKI <2000 
AND 
Q1.KM_FARKI >0 
AND Q1.Degis_Tarih >'2022.01.01'
ORDER BY 1 DESC