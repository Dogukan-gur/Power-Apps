SELECT *,CASE WHEN SAAT >'08:30' AND SAAT<'18:00' THEN 'GECÝKEN' END AS GECÝKEN

FROM 

	(SELECT	HAREKET,
			SM,
			ID,
			SICILNO,
			AD_SOYAD,
			YIL,
			AY,
			GÜN,
			SAAT,
			TARÝH,
			CASE	WHEN Q.HAREKET=1 AND TARÝH IS NOT NULL OR (Q.HAREKET=1 AND SM>1)  THEN 'GÝRÝÞ'

					WHEN Q.HAREKET =2 AND TARÝH IS NOT NULL OR (Q.HAREKET=1 AND SM=1) THEN  'ÇIKIÞ'
					WHEN TARÝH IS NULL THEN 'Gelmedi'
					ELSE 'DÝÐER'
					END AS HAREKETLER 
					   
 
				
	FROM 
	(
	  SELECT	GELEN.ID,
				AD.sicilno AS SICILNO,
				AD.adsoyad AS AD_SOYAD,
				YEAR(GELEN.tarih) AS YIL,
				MONTH(GELEN.tarih) AS AY,
				DAY(GELEN.tarih) AS GÜN,
				CONVERT(time,GELEN.saat) AS SAAT,
				tarih as TARÝH,	
				DENSE_RANK() OVER (PARTITION BY AD.sicilno,TARÝH ORDER BY SAAT )  AS HAREKET ,
				ROW_NUMBER() OVER (PARTITION BY AD.sicilno,GELEN.saat order by GELEN.saat) as rn,
				COUNT(*) OVER(PARTITION BY AD.sicilno ,TARÝH ORDER BY TARÝH) AS SM
	  FROM [dbo].[PDKSAD] AS AD 
	  LEFT JOIN [dbo].[PDKSGELEN] AS GELEN ON AD.sicilno=GELEN.sicilno
	  WHERE devam<>0
	  ) AS Q
	  where rn=1
	  AND 
	  TARÝH IS NOT NULL
	  
) AS Q2
--WHERE HAREKETLER <> 'DÝÐER'
ORDER BY SICILNO 