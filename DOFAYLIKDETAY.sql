


DECLARE @my_var INT;
SET @my_var =  month(getdate())
select * from
(
SELECT 	COUNT(*) over (PARTITION BY  Firma,Bolum,AyrılmaSebebi) AS C  ,
		*
FROM
 (
 select * from (
 SELECT ROW_NUMBER() OVER (PARTITION BY MONTH(tarih),Firma,Bolum,AyrılmaSebebi order by ID) as rn,* 
  FROM [DOGUKANSSIS].[dbo].[KALITE_BILDIRIMLER]
  ) q1
  where 
 
  MONTH(q1.Tarih)=@my_var
 ) Q2
 )q3
 where C>=5
 
 order by q3.Firma,q3.rn
 

 
