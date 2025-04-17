SELECT *
  FROM crime_scene
  WHERE location IS "Coral Bay Marina"
  AND date IS "19860814"

-- id	date	location	description
-- 43	19860814	Coral Bay Marina	The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".

  
SELECT *
  FROM person
  WHERE address LIKE "3__ Ocean Drive"
  OR name LIKE "%ul %ez"

-- id	name	alias	occupation	address
-- 101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
-- 102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave



SELECT name, alias, occupation, address, transcript, hotel_name, check_in_date, suspicious_activity, confession
  FROM person
  JOIN interviews ON person.id = interviews.person_id
  JOIN hotel_checkins ON person.id = hotel_checkins.person_id
  JOIN surveillance_records ON person.id = surveillance_records.person_id
  JOIN confessions ON person.id = confessions.person_id
  WHERE address LIKE "3__ Ocean Drive"
  OR name LIKE "%ul %ez"

-- name	alias	occupation	address	transcript	hotel_name	check_in_date	suspicious_activity	confession
-- Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive	I saw someone check into a hotel on August 13. The guy looked nervous.	Coral View Resort	19860812	Asked for room service menu	This is just a misunderstanding.
-- Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave	I heard someone checked into a hotel with "Sunset" in the name.	Marina Paradise Inn	19860815	NULL	Alright! I've been running a blackmail operation.

SELECT name, alias, occupation, address, transcript, hotel_name, check_in_date, suspicious_activity, confession
  FROM person
  JOIN interviews ON person.id = interviews.person_id
  JOIN hotel_checkins ON person.id = hotel_checkins.person_id
  JOIN surveillance_records ON person.id = surveillance_records.person_id
  JOIN confessions ON person.id = confessions.person_id
  WHERE surveillance_records.suspicious_activity IS NOT NULL
