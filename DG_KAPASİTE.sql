

SELECT
    [G�rev Numaras�] as GorevNo,
    [�al��ma Noktas�] as Hat,
    [Planlanan �malat Tarihi],
    q1.SIRA

FROM (
    SELECT
        [�al��ma Noktas�],
        [G�rev Numaras�],
        Poz,
        [Planlanan �malat Tarihi],
        DGHS.SIRA,
        ROW_NUMBER() OVER (PARTITION BY [G�rev Numaras�], [�al��ma Noktas�] ORDER BY [Planlanan �malat Tarihi]) AS RN,
        MIN(Poz) OVER (PARTITION BY [G�rev Numaras�]) AS MINPOZ
    FROM
        DG_CAPACITY AS DG
        INNER JOIN DG_HAT_SIRA AS DGHS ON DG.[�al��ma Noktas�] = DGHS.HAT
    WHERE
        [Planlanan �malat Tarihi] <= GETDATE() + 60
        AND [Planlanan �malat Tarihi] >= GETDATE() - 60
) q1
WHERE RN = 1  





