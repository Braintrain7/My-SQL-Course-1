SELECT 
  PatientId
, AdmittedDate
, DischargeDate
, DATEADD(WEEK, -2, AdmittedDate) AS ReminderDate
, DATEADD(MONTH, 3, DischargeDate) AS AppointmentDate
, DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LengthofStay
, Hospital 
, Ward
FROM PatientStay
WHERE Hospital NOT IN ('kingston', 'PRUH')
ORDER BY AdmittedDate DESC, DischargeDate DESC, PatientId DESC
--------------------------------------------------------------------
SELECT TOP 5
     Hospital, Ward 
    ,COUNT(*) AS NumPatients 
    ,SUM(Tariff) AS TotalTariff
    ,AVG(Tariff) AS AvgTariff
  --,SUM(Tariff) / COUNT(*) AS AverageTariff
FROM PatientStay
GROUP BY Hospital, Ward
ORDER BY TotalTariff DESC

SELECT 
    ps.AdmittedDate
  , ps.PatientId
  , ps.Hospital
FROM PatientStay ps

SELECT 
     PatientId
    ,AdmittedDate
    ,ps.Hospital
    ,h.Hospital
    ,HospitalType
FROM PatientStay ps
LEFT JOIN DimHospitalBad h on ps.Hospital = h.Hospital 

SELECT * FROM PatientStay where Hospital='pruh'
select * from DimHospital
select * from DimHospitalBad

SELECT 
     ps.PatientId
    ,ps.Ethnicity 
    --,ISNULL(ps.Ethnicity, 'Missing') EthIsNull
    ,COALESCE (ps.Ethnicity,'Missing') AS EthIsNull2
    ,COUNT(PS.PatientId) AS Num1
FROM PatientStay ps 
---WHERE ps.Ethnicity IS NULL 

SELECT 
     COUNT (PatientId) as Num1
    ,COUNT (DISTINCT (PS.Ethnicity)) AS Num2
    FROM PatientStay ps 

    SELECT DISTINCT Ethnicity 
    FROM PatientStay











--SELECT 123 + 234 AS Result
--SELECT DATEADD(WEEK, -2, '2024-02-28') AS Result
--SELECT CAST(DATEADD(YEAR, 2, '2024-02-28')AS DATE) AS Result

--AND (AdmittedDate BETWEEN '2024-02-26' AND '2024-02-28'
--OR AdmittedDate BETWEEN '2024-03-02' AND '2024-03-05')
--AND Ward LIKE '%Surgery'
--AND Ward IN ('Day Surgery', 'General Surgery')
--AND Ward ='Dermatology'
