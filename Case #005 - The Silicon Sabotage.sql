-- QuantumTech, Miami’s leading technology corporation, was about to unveil its groundbreaking microprocessor called “QuantaX.”
-- Just hours before the reveal, the prototype was destroyed, and all research data was erased. Detectives suspect corporate espionage.
-- Find who sabotaged the microprocessor.

SELECT *
FROM incident_reports
WHERE location LIKE "%QuantumTech%"

-- id	date	location	description
-- 74	19890421	QuantumTech HQ	Prototype destroyed; data erased from servers.

SELECT *
FROM witness_statements
WHERE incident_id is (
  SELECT id
  FROM incident_reports
  WHERE location LIKE "%QuantumTech%"
  )

-- id	incident_id	employee_id	statement
-- 40	74	145	I heard someone mention a server in Helsinki.
-- 59	74	134	I saw someone holding a keycard marked QX- succeeded by a two-digit odd number.


SELECT *
FROM employee_records AS R
LEFT JOIN keycard_access_logs ON R.id=keycard_access_logs.employee_id
LEFT JOIN computer_access_logs ON R.id=computer_access_logs.employee_id
LEFT JOIN facility_access_logs ON R.id=facility_access_logs.employee_id
LEFT JOIN email_logs AS E1 ON R.id=E1.sender_employee_id
LEFT JOIN email_logs AS E2 ON R.id=E2.recipient_employee_id
WHERE R.id IN (145, 134)
LIMIT 10


SELECT *
FROM employee_records AS R
LEFT JOIN keycard_access_logs ON R.id=keycard_access_logs.employee_id
LEFT JOIN computer_access_logs ON R.id=computer_access_logs.employee_id
WHERE computer_access_logs.server_location IS "Helsinki"
AND keycard_access_logs.keycard_code LIKE "QX-0_5"
LIMIT 10

-- id	employee_name	department	occupation	home_address	id	employee_id	keycard_code	access_date	access_time	id	employee_id	server_location	access_date	access_time
-- 99	Elizabeth Gordon	Engineering	Solutions Architect	147 Coastal Pine Rd, Doral, FL	89	99	QX-035	19890421	08:30	91	99	Helsinki	19890421	09:00


SELECT *
FROM employee_records AS R
LEFT JOIN keycard_access_logs ON R.id=keycard_access_logs.employee_id
LEFT JOIN computer_access_logs ON R.id=computer_access_logs.employee_id
LEFT JOIN facility_access_logs ON R.id=facility_access_logs.employee_id
LEFT JOIN email_logs AS E1 ON R.id=E1.sender_employee_id
LEFT JOIN email_logs AS E2 ON R.id=E2.recipient_employee_id
WHERE R.id IS 99
LIMIT 10

-- id	employee_name	department	occupation	home_address	id	employee_id	keycard_code	access_date	access_time	id	employee_id	server_location	access_date	access_time	id	employee_id	facility_name	access_date	access_time	id	sender_employee_id	recipient_employee_id	email_date	email_subject	email_content	id	sender_employee_id	recipient_employee_id	email_date	email_subject	email_content
-- 99	Elizabeth Gordon	Engineering	Solutions Architect	147 Coastal Pine Rd, Doral, FL	89	99	QX-035	19890421	08:30	91	99	Helsinki	19890421	09:00	23	99	Facility 11	19890421	11:56	NULL	NULL	NULL	NULL	NULL	NULL	126	263	99	19890421	Alarm System Concern	I noticed something strange with the alarm system. There might be a potential malfunction near the chip. Thought you should check it out to be safe.


SELECT *
FROM employee_records AS R
LEFT JOIN keycard_access_logs ON R.id=keycard_access_logs.employee_id
LEFT JOIN computer_access_logs ON R.id=computer_access_logs.employee_id
LEFT JOIN facility_access_logs ON R.id=facility_access_logs.employee_id
LEFT JOIN email_logs AS E1 ON R.id=E1.sender_employee_id
LEFT JOIN email_logs AS E2 ON R.id=E2.recipient_employee_id
WHERE R.id IS 263
LIMIT 10

-- id	employee_name	department	occupation	home_address	id	employee_id	keycard_code	access_date	access_time	id	employee_id	server_location	access_date	access_time	id	employee_id	facility_name	access_date	access_time	id	sender_employee_id	recipient_employee_id	email_date	email_subject	email_content	id	sender_employee_id	recipient_employee_id	email_date	email_subject	email_content
-- 263	Norman Owens	Quantum Computing	Quantum Systems Engineer	234 Quantum Waters Lane, Key Biscayne, FL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	126	263	99	19890421	Alarm System Concern	I noticed something strange with the alarm system. There might be a potential malfunction near the chip. Thought you should check it out to be safe.	140	NULL	263	19890421	Execute Phase Window	Unlock 18 quietly by 9. He’ll use his own credentials to access it shortly after L leaves. No questions. Just ensure the timing lines up. The trail will lead exactly where it needs to.
-- 263	Norman Owens	Quantum Computing	Quantum Systems Engineer	234 Quantum Waters Lane, Key Biscayne, FL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	126	263	99	19890421	Alarm System Concern	I noticed something strange with the alarm system. There might be a potential malfunction near the chip. Thought you should check it out to be safe.	138	NULL	263	19890421	Realign Asset Trajectory	L’s schedule puts her close enough, but we need her inside F18 before 9. Trigger a minor alert or routine checkup to send her in by 8:30. Make sure she logs the visit. That part matters.

SELECT *
FROM employee_records
LEFT JOIN facility_access_logs ON employee_records.id=facility_access_logs.employee_id
WHERE facility_access_logs.facility_name is "Facility 18"



