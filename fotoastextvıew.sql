USE [DOGUKANSSIS]
GO

/****** Object:  View [dbo].[FOTOASTEXTVIEW]    Script Date: 10.10.2023 10:52:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FOTOASTEXTVIEW] AS
select Q1.FOTOID
 , 'data:image/png;base64,' + Q1.FOTOASIMAGE as PhotoAsText,F.GOREVID,CAST(f.GOREVID AS varchar) + CAST(f.POZNO AS varchar) AS GOREVPOZ
from 

openjson(
  (
   select FOTOID,FOTOASIMAGE
   from FOTO_DENEME
   for json auto
  )
 ) with(FOTOID int, FOTOASIMAGE varchar(max), GOREVID INT,GOREVPOZ INT)
 AS Q1
 INNER JOIN FOTO_DENEME AS F 
 ON F.FOTOID=Q1.FOTOID
GO


