
				SELECT	Q2.ID,
						REPLACE(REPLACE(Q2.ConvertedMETIN,'\',''),'''','') as ACIKLAMA,
						ROW_NUMBER() OVER (PARTITION BY Q2.ID ORDER BY Q2.ID DESC) AS RN,Q2.LFD_NR
				FROM (
						SELECT q1.ID,
							   REPLACE(
								   REPLACE(
									   REPLACE(
										   REPLACE(
											   REPLACE(
												   REPLACE(
													   REPLACE(
														   REPLACE(
															   REPLACE(
																   REPLACE(
																	   REPLACE(
																		   REPLACE(
																			   REPLACE(
																				   REPLACE(
																					   REPLACE(
																						   REPLACE(
																							   q1.METIN,
																							   'c7', 'Ç'),
																						   'e7', 'ç'),
																					   'dc', 'ü'),
																				   'f6', 'ö'),
																			   '11', 'ð'),
																		   'DD', 'Ý'),
																	   'C7', 'Ç'),
																   'E7', 'ç'),
															   'FC', 'ü'),
														   'F6', 'ö'),
													   '11', 'ð'),
												   'DD', 'Ý'),
											   'd6', 'Ö'),
										   '}', ''''),
									   'd0', 'Ð'),
								   'þ', 'Þ') AS ConvertedMETIN,q1.LFD_NR
						FROM (
							SELECT ID, POS_NR, SUBSTRING(BEZ, CHARINDEX('\fs20', BEZ) + LEN('\fs20') + 1, 1000) AS METIN,TEXT_ID,LFD_NR,DRUCK_KZ,
									MIN(POS_NR) OVER (PARTITION BY ID ) AS MINPOS
							FROM [SYSADM].[BW_AUFTR_TXT]
						) AS q1
				where q1.POS_NR = q1.MINPOS
					AND

				 q1.LFD_NR IN (1,2,3,4,5,6,7,8,9) AND  LEN(q1.ID) >=5 
				AND Q1.DRUCK_KZ ='P'

					) as Q2

