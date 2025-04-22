-- On October 31, 1987, at a Coconut Grove mansion masked ball, Leonard Pierce was found dead in the garden. Can you piece together all the clues to expose the true murderer?

SELECT * from crime_scene
WHERE date is "19871031"
AND location LIKE "%Coconut Grove%"


-- During a masked ball, a body was found in the garden. Witnesses mentioned a hotel booking and suspicious phone activity.

SELECT * from phone_records
WHERE call_date is "19871030"

-- id	caller_id	recipient_id	call_date	call_time	note
-- 117	11	58	19871030	23:30	Why did you kill him, bro? You should have left the carpenter do it himself!
-- 163	133	58	19871030	22:15	I will do it. Only if you give me that nice Lambo of yours.
