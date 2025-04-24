-- On October 31, 1987, at a Coconut Grove mansion masked ball, Leonard Pierce was found dead in the garden. Can you piece together all the clues to expose the true murderer?

SELECT * FROM crime_scene
WHERE date is "19871031"
AND location LIKE "%Coconut Grove%"

-- During a masked ball, a body was found in the garden. Witnesses mentioned a hotel booking and suspicious phone activity.


SELECT * FROM witness_statements
WHERE crime_scene_id is (
  SELECT id FROM crime_scene
  WHERE date is "19871031"
  AND location LIKE "%Coconut Grove%"
)

-- id	crime_scene_id	witness_id	clue
-- 83	75	37	I overheard a booking at The Grand Regency.
-- 89	75	42	I noticed someone at the front desk discussing Room 707 for a reservation made yesterday.


SELECT * FROM hotel_checkins
JOIN surveillance_records ON hotel_checkins.id=surveillance_records.hotel_checkin_id
WHERE hotel_name is "The Grand Regency"
AND room_number is 707
AND check_in_date is "19871030"

-- id	person_id	hotel_name	check_in_date	room_number	id	hotel_checkin_id	note
-- 119	11	The Grand Regency	19871030	707	119	119	Subject was overheard yelling on a phone: "Did you kill him?"


SELECT * FROM person
WHERE id is 11

-- id	name	occupation	address
-- 11	Antonio Rossi	Auto Importer	999 Dark Alley


SELECT * FROM phone_records
WHERE caller_id is 11
OR recipient_id is 11

-- id	caller_id	recipient_id	call_date	call_time	note
-- 117	11	58	19871030	23:30	Why did you kill him, bro? You should have left the carpenter do it himself!
  

SELECT * FROM person
WHERE id is 58

-- id	name	occupation	address
-- 58	Victor DiMarco	Jobless	707 Cedarwood Avenue


SELECT * FROM phone_records
WHERE caller_id is 58
OR recipient_id is 58

-- id	caller_id	recipient_id	call_date	call_time	note
-- 117	11	58	19871030	23:30	Why did you kill him, bro? You should have left the carpenter do it himself!
-- 163	133	58	19871030	22:15	I will do it. Only if you give me that nice Lambo of yours.


SELECT * FROM catering_orders
WHERE person_id is 58

-- id	person_id	order_date	item	amount
-- 62	58	19871030	Screwdriver	1

SELECT * FROM final_interviews
WHERE id is 58

-- id	person_id	confession
-- 58	58	I didn’t kill Leo per se. I was just a middleman.


SELECT * FROM person
WHERE id is 133

-- id	name	occupation	address
-- 133	Unknown	Unknown	Unknown


SELECT * FROM person
LEFT JOIN vehicle_registry ON person.id=vehicle_registry.person_id
LEFT JOIN hotel_checkins ON person.id=hotel_checkins.person_id
LEFT JOIN surveillance_records ON surveillance_records.hotel_checkin_id=hotel_checkins.id
LEFT JOIN final_interviews ON person.id=final_interviews.person_id
LEFT JOIN catering_orders ON person.id=catering_orders.person_id
LEFT JOIN phone_records as p1 ON person.id=p1.caller_id
LEFT JOIN phone_records as p2 ON person.id=p2.recipient_id
WHERE person.id in (11, 58, 133)



-- SELECT COUNT(person_id) FROM vehicle_registry
-- WHERE car_make LIKE "%lambo%"
-- GROUP BY person_id ORDER BY person_id

