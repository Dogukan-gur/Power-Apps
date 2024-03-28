

SELECT
    [Görev Numarasý] as GorevNo,
    [Çalýþma Noktasý] as Hat,
    [Planlanan Ýmalat Tarihi],
    q1.SIRA

FROM (
    SELECT
        [Çalýþma Noktasý],
        [Görev Numarasý],
        Poz,
        [Planlanan Ýmalat Tarihi],
        DGHS.SIRA,
        ROW_NUMBER() OVER (PARTITION BY [Görev Numarasý], [Çalýþma Noktasý] ORDER BY [Planlanan Ýmalat Tarihi]) AS RN,
        MIN(Poz) OVER (PARTITION BY [Görev Numarasý]) AS MINPOZ
    FROM
        DG_CAPACITY AS DG
        INNER JOIN DG_HAT_SIRA AS DGHS ON DG.[Çalýþma Noktasý] = DGHS.HAT
    WHERE
        [Planlanan Ýmalat Tarihi] <= GETDATE() + 60
        AND [Planlanan Ýmalat Tarihi] >= GETDATE() - 60
) q1
WHERE RN = 1  





