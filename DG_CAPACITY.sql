

SELECT SYSADM.ZW_AUFTR_ZEIT.AGG AS [Makine Kodu], SYSADM.ZW_AGGREGATE.AGG_BEZ AS [�al��ma Noktas�], SYSADM.ZW_BEATYPEN.BEA_TYPBEZ AS [�al��ma Tipi], 
                  SYSADM.BA_PRODUKTE_BEZ.BA_BEZ1 AS [�r�n Tan�m Kodu], SYSADM.BW_AUFTR_KOPF.AH_IDENT AS [M��teri kodu], SYSADM.BW_AUFTR_KOPF.AH_NAME1 AS M��teri, SYSADM.BW_AUFTR_KOPF.ID AS [G�rev Numaras�], 
                  SYSADM.BW_AUFTR_POS.POS_KOMMISSION AS Komisyon, SYSADM.BW_AUFTR_KOPF.STATUS AS DURUM, 
                  SYSADM.BW_AUFTR_POS.PROD_BEZ1 + SYSADM.BW_AUFTR_POS.PROD_BEZ2 + SYSADM.BW_AUFTR_POS.PROD_BEZ3 AS URUN, SYSADM.ZW_AUFTR_ZEIT.KZ_SELECTED AS [Makine Mod], 
                  SYSADM.ZW_AUFTR_ZEIT.BOM_ID AS [Bom Numaras�], SYSADM.ZW_AUFTR_ZEIT.DATUM_PROD AS [Planlanan �malat Tarihi], SYSADM.ZW_AUFTR_ZEIT.POSNR AS Poz, SYSADM.ZW_AUFTR_ZEIT.STUECK AS Adet, 
                  SYSADM.ZW_AUFTR_ZEIT.FERTIG AS Tamamlanan, SYSADM.ZW_AUFTR_ZEIT.SCHICHT AS Vardiya, SYSADM.BW_AUFTR_POS.PP_BREITE AS Geni�lik, SYSADM.BW_AUFTR_POS.PP_HOEHE AS Y�kseklik, 
                  SYSADM.ZW_AUFTR_ZEIT.ZEIT
FROM     SYSADM.BW_AUFTR_POS INNER JOIN
                  SYSADM.BW_AUFTR_KOPF ON SYSADM.BW_AUFTR_POS.ID = SYSADM.BW_AUFTR_KOPF.ID INNER JOIN
                  SYSADM.ZW_AGGREGATE INNER JOIN
                  SYSADM.ZW_AUFTR_ZEIT ON SYSADM.ZW_AGGREGATE.AGG_ID = SYSADM.ZW_AUFTR_ZEIT.AGG ON SYSADM.BW_AUFTR_POS.ID = SYSADM.ZW_AUFTR_ZEIT.AUFNR AND 
                  SYSADM.BW_AUFTR_POS.POS_NR = SYSADM.ZW_AUFTR_ZEIT.POSNR INNER JOIN
                  SYSADM.ZW_BEATYPEN ON SYSADM.ZW_AUFTR_ZEIT.ARBART = SYSADM.ZW_BEATYPEN.BEA_TYP INNER JOIN
                  SYSADM.BA_PRODUKTE_BEZ ON SYSADM.ZW_AUFTR_ZEIT.BOM_PRODUKT = SYSADM.BA_PRODUKTE_BEZ.BA_PRODUKT INNER JOIN
                  SYSADM.BA_PRODUKTE ON SYSADM.BA_PRODUKTE_BEZ.BA_PRODUKT = SYSADM.BA_PRODUKTE.BA_PRODUKT
GROUP BY SYSADM.ZW_AGGREGATE.AGG_BEZ, SYSADM.ZW_BEATYPEN.BEA_TYPBEZ, SYSADM.BA_PRODUKTE_BEZ.BA_BEZ1, SYSADM.BW_AUFTR_KOPF.ID, SYSADM.ZW_AUFTR_ZEIT.KZ_SELECTED, SYSADM.ZW_AUFTR_ZEIT.BOM_ID, 
                  SYSADM.ZW_AUFTR_ZEIT.AGG, SYSADM.ZW_AUFTR_ZEIT.DATUM_PROD, SYSADM.ZW_AUFTR_ZEIT.POSNR, SYSADM.ZW_AUFTR_ZEIT.STUECK, SYSADM.ZW_AUFTR_ZEIT.FERTIG, SYSADM.ZW_AUFTR_ZEIT.SCHICHT, 
                  SYSADM.BW_AUFTR_POS.PROD_BEZ1, SYSADM.BW_AUFTR_POS.PROD_BEZ2, SYSADM.BW_AUFTR_POS.PP_BREITE, SYSADM.BW_AUFTR_POS.PP_HOEHE, SYSADM.BW_AUFTR_POS.POS_KOMMISSION, 
                  SYSADM.ZW_AUFTR_ZEIT.ZEIT, SYSADM.BW_AUFTR_KOPF.STATUS, SYSADM.BW_AUFTR_POS.PROD_BEZ1 + SYSADM.BW_AUFTR_POS.PROD_BEZ2 + SYSADM.BW_AUFTR_POS.PROD_BEZ3, SYSADM.BW_AUFTR_KOPF.AH_IDENT, 
                  SYSADM.BW_AUFTR_KOPF.AH_NAME1
HAVING (SYSADM.ZW_AUFTR_ZEIT.KZ_SELECTED = 1) AND (SYSADM.BW_AUFTR_KOPF.STATUS < 900) 


