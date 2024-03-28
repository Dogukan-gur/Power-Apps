 SELECT		ID,
			Tarih,
			GorevNo,
			Poz,
			Firma,
			En,
			Boy,
			Adet,
			Bolum,
			AyrılmaSebebi,
			Personel,
			Fabrika,
			rn AS Tekrarlanansayı
FROM (
  SELECT DENSE_RANK() OVER (PARTITION BY month(tarih), Firma, Bolum, AyrılmaSebebi ORDER BY rn DESC) AS dr, q1.*,MONTH(Q1.Tarih) AS MON
  FROM (
    SELECT ROW_NUMBER() OVER (PARTITION BY month(tarih), Firma, Bolum, AyrılmaSebebi ORDER BY ID) AS rn, * 
    FROM [DOGUKANSSIS].[dbo].[KALITE_BILDIRIMLER]
  ) q1
) q2
WHERE q2.dr = 1 and q2.rn>=5
  order by q2.GorevNo,q2.rn


