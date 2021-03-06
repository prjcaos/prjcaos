SELECT

	SUBSTRING(CONVERT(VARCHAR(10),rdi.DATREC,103),4,7) AS DATA,

	SUM(rdi.VLRREC) AS VALOR

FROM

	--RECDOC rd INNER JOIN RECDOCI rdi ON

	--	rd.NUMDUP = rdi.NUMDUP AND

	--	rd.CODFIL = rdi.CODFIL
	
	RECDOCI rdi

WHERE

	DATEADD(MONTH,0,rdi.DATREC) >= DATEADD(MONTH,-12,GETDATE()) AND

	rdi.DATREC <= GETDATE()

GROUP BY SUBSTRING(CONVERT(VARCHAR(10),rdi.DATREC,103),4,7),MONTH(rdi.DATREC),YEAR(rdi.DATREC)

ORDER BY YEAR(rdi.DATREC), MONTH(rdi.DATREC)