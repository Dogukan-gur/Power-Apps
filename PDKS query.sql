
/*INSERT INTO PDKSAD (sicilno,adsoyad,telno)
VALUES (200001,'Abdulkadir AKSOY',5452749164),
(200002,'Adem ZENC�R',5558791453),
(200003,'Ali Can KAYGISIZ',5312656205),
(200004,'Ali ERDO�AN',5346033788),
(200005,'Bekta� A�IKG�Z',5520096265),
(200006,'Berham G�LER',5358323204),
(200007,'Berkay KARAK�LAH',5334240915),
(200008,'Bo�a� �elik',5064434691),
(200009,'Burak G�NDO�DU',5392941910),
(200010,'�elebi AKDO�AN',5435453341),
(200011,'Emrah Duman',5312561363),
(200012,'Emrah TORTAMIS',5428006785),
(200013,'Emre Can KARAKA�',5380115254),
(200014,'Emre �NC�',5356103831),
(200015,'Eren YANARDA�',5075266335),
(200016,'Erol CEYLAN',5362319276),
(200017,'Hakan Galip Dorlay',5325864645),
(200018,'Halil KAYA',5302330666),
(200019,'Hayri ULUER',5526314511),
(200020,'H�seyinCan BARLAS',5523387848),
(200021,'�brahim �nginar',5535037387),
(200022,'Kemal �ENTEL',5376429561),
(200023,'Mehmet Pi�kin',5426830180),
(200024,'Mert YAL�IN',5415223376),
(200025,'Mert Y�cel',5363601342),
(200026,'Mesut SONSUZ',5414326190),
(200027,'Muhammer �ak�r',5071925177),
(200028,'Muhammet G�ksel VURAL',5075147452),
(200029,'Muhsin PINAR',5444760600),
(200030,'Murat YOLCU',5538758747),
(200031,'Mustafa DEM�RAY',5322018935),
(200032,'Mustafa �MRAK',5362084919),
(200033,'M�sl�m BAYSAL',5380770543),
(200034,'O�uzhan DO�AN',5433788766),
(200035,'O�uzhan YEN�CE',5531857568),
(200036,'Onur �NG�LL�',5394859412),
(200037,'Ramazan ADIG�ZEL',5067371116),
(200038,'Salih BABAY���T',5385224403),
(200039,'Selahattin �ZCAN',5532570169),
(200040,'Semih �ak�r',5426806999),
(200041,'Semih �NVER',5417908826),
(200042,'Semihcan GEN�',5301654207),
(200043,'Serdar ARKIN',5374705692),
(200044,'Sergen BEZEN',5335992366),
(200045,'Serta� SARI',5313562377),
(200046,'Seyit SEVER',5427160564),
(200047,'Sinan TA�CI',5332858123),
(200048,'U�ur ACAR',5468502312),
(200049,'Umutcan ula�',5414970447),
(200050,'Veysel Can SALMAN',5414034006),
(200051,'Yusuf Umut G�rg�l�',5549858995),
(200052,'Zeynel ERO�LU',null)

*/



select * from PDKSAD
order by 2 asc

SELECT * FROM PDKSGELEN

SELECT adsoyad,tarih, CONVERT(time,saat) FROM PDKSAD AS A 
INNER JOIN PDKSGELEN AS G
ON A.sicilno=g.sicilno 