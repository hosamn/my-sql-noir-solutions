-- QuantumTech, Miami’s leading technology corporation, was about to unveil its groundbreaking microprocessor called “QuantaX.”
-- Just hours before the reveal, the prototype was destroyed, and all research data was erased. Detectives suspect corporate espionage.
-- Find who sabotaged the microprocessor.

SELECT *
FROM incident_reports
WHERE location LIKE "%QuantumTech%"

-- id	date	location	description
-- 74	19890421	QuantumTech HQ	Prototype destroyed; data erased from servers.


