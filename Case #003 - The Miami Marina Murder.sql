SELECT *
  FROM crime_scene
  WHERE location IS "Coral Bay Marina"
  AND date IS "19860814"

# id	date	location	description
# 43	19860814	Coral Bay Marina	The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".

  
SELECT *
  FROM person
  WHERE address LIKE "3__ Ocean Drive"
  OR name LIKE "%ul %ez"

# id	name	alias	occupation	address
# 101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
# 102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave

