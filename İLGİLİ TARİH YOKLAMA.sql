

WITH CTE1
AS(
SELECT	AD.ID,
			AD.sicilno AS SICILNO,
			AD.adsoyad AS AD_SOYAD,
			YEAR(GELEN.tarih) AS YIL,
			MONTH(GELEN.tarih) AS AY,
			DAY(GELEN.tarih) AS G�N,
			CONVERT(time,GELEN.saat) AS SAAT,
			tarih as TAR�H
  FROM [dbo].[PDKSAD] AS AD 
  LEFT JOIN [dbo].[PDKSGELEN] AS GELEN ON AD.sicilno=GELEN.sicilno
 WHERE devam<>0
 )
 SELECT Date,CTE1.AD_SOYAD FROM [dbo].[Calendar] LEFT JOIN CTE1 ON Calendar.Date=CTE1.TAR�H
 WHERE Date>'2023-04-17' AND DATE<= (SELECT GETDATE())