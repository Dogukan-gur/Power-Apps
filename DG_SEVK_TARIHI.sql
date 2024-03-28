
SELECT			ID AS [G�rev Numaras�],
				SYSADM.BW_AUFTR_KOPF.STATUS AS [Durum Noktas�], 
                  SYSADM.BW_AUFTR_KOPF.DATUM_LIEFER_TAT AS [Teslim Tarihi], 
				  SYSADM.BW_AUFTR_KOPF.AH_NAME1 AS [M��teri Ad�], 
				  SYSADM.BW_AUFTR_KOPF.AL_NAME1 AS Sevkiyat, 
                  SYSADM.BW_AUFTR_KOPF.SU_QM_FAKT AS [Gorev Metrekaresi],
				  SYSADM.BW_AUFTR_KOPF.SU_GEWICHT AS [G�rev Kg], 
				  CAST(SYSADM.BW_AUFTR_KOPF.SU_STUECK AS INT) AS [G�rev Adeti], 
                 -- CASE WHEN (Teslim_Tarihi < DATUM_LIEFER_TAT) THEN '�teleme var.' WHEN (Teslim_Tarihi > DATUM_LIEFER_TAT) THEN '�ne �ekildi.' ELSE 'De�i�iklik Yok.' END AS [G�rev De�i�ikli�i], 
                  SYSADM.BW_AUFTR_KOPF.DATUM_ERF AS [Kay�t Tarihi],
				  SYSADM.BW_AUFTR_KOPF.OR_FACHBERATER AS MT
FROM     [SYSADM].[BW_AUFTR_KOPF] 
WHERE  (SYSADM.BW_AUFTR_KOPF.STATUS > 1) AND (SYSADM.BW_AUFTR_KOPF.STATUS < 611) and DATEDIFF(MONTH,SYSADM.BW_AUFTR_KOPF.DATUM_LIEFER_TAT,GETDATE())<6
--AND DATEDIFF(MONTH,SYSADM.BW_AUFTR_KOPF.DATUM_ERF,GETDATE())>3






