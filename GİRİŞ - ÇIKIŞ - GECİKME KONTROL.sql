SELECT *,CASE WHEN SAAT >'08:30' AND SAAT<'18:00' THEN 'GEC�KEN' END AS GEC�KEN

FROM 

	(SELECT	HAREKET,
			SM,
			ID,
			SICILNO,
			AD_SOYAD,
			YIL,
			AY,
			G�N,
			SAAT,
			TAR�H,
			CASE	WHEN Q.HAREKET=1 AND TAR�H IS NOT NULL OR (Q.HAREKET=1 AND SM>1)  THEN 'G�R��'

					WHEN Q.HAREKET =2 AND TAR�H IS NOT NULL OR (Q.HAREKET=1 AND SM=1) THEN  '�IKI�'
					WHEN TAR�H IS NULL THEN 'Gelmedi'
					ELSE 'D��ER'
					END AS HAREKETLER 
					   
 
				
	FROM 
	(
	  SELECT	GELEN.ID,
				AD.sicilno AS SICILNO,
				AD.adsoyad AS AD_SOYAD,
				YEAR(GELEN.tarih) AS YIL,
				MONTH(GELEN.tarih) AS AY,
				DAY(GELEN.tarih) AS G�N,
				CONVERT(time,GELEN.saat) AS SAAT,
				tarih as TAR�H,	
				DENSE_RANK() OVER (PARTITION BY AD.sicilno,TAR�H ORDER BY SAAT )  AS HAREKET ,
				ROW_NUMBER() OVER (PARTITION BY AD.sicilno,GELEN.saat order by GELEN.saat) as rn,
				COUNT(*) OVER(PARTITION BY AD.sicilno ,TAR�H ORDER BY TAR�H) AS SM
	  FROM [dbo].[PDKSAD] AS AD 
	  LEFT JOIN [dbo].[PDKSGELEN] AS GELEN ON AD.sicilno=GELEN.sicilno
	  WHERE devam<>0
	  ) AS Q
	  where rn=1
	  AND 
	  TAR�H IS NOT NULL
	  
) AS Q2
--WHERE HAREKETLER <> 'D��ER'
ORDER BY SICILNO 