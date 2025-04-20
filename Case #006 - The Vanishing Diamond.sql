SELECT * FROM crime_scene WHERE location LIKE "%Fontainebleau%"

-- id	date	location	description
-- 48	19870520	Fontainebleau Hotel	The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".


SELECT * FROM guest WHERE occupation IS "Actor" OR (occupation IS "Consultant" AND name LIKE "%an %")


SELECT * FROM guest
  FULL OUTER JOIN witness_statements ON guest.id = witness_statements.guest_id
  FULL OUTER JOIN attire_registry ON guest.id = attire_registry.guest_id
  FULL OUTER JOIN marina_rentals ON guest.id = marina_rentals.renter_guest_id
  FULL OUTER JOIN final_interviews ON guest.id = final_interviews.guest_id
  WHERE occupation IS "Actor" OR (occupation IS "Consultant" AND name LIKE "%an %")


SELECT * FROM guest
  FULL OUTER JOIN witness_statements ON guest.id = witness_statements.guest_id
  FULL OUTER JOIN attire_registry ON guest.id = attire_registry.guest_id
  FULL OUTER JOIN marina_rentals ON guest.id = marina_rentals.renter_guest_id
  FULL OUTER JOIN final_interviews ON guest.id = final_interviews.guest_id
  WHERE guest.id IN (116, 129)

-- I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.
-- I overheard someone say, "Meet me at the marina, dock 3.


SELECT * FROM guest
  FULL OUTER JOIN witness_statements ON guest.id = witness_statements.guest_id
  FULL OUTER JOIN attire_registry ON guest.id = attire_registry.guest_id
  FULL OUTER JOIN marina_rentals ON guest.id = marina_rentals.renter_guest_id
  FULL OUTER JOIN final_interviews ON guest.id = final_interviews.guest_id
  WHERE marina_rentals.dock_number IS 3


SELECT * FROM guest
  FULL OUTER JOIN witness_statements ON guest.id = witness_statements.guest_id
  FULL OUTER JOIN attire_registry ON guest.id = attire_registry.guest_id
  FULL OUTER JOIN marina_rentals ON guest.id = marina_rentals.renter_guest_id
  FULL OUTER JOIN final_interviews ON guest.id = final_interviews.guest_id
  WHERE (guest.invitation_code LIKE "%-R" AND attire_registry.note IS "navy suit, white tie")


-- id	name	occupation	invitation_code	id	guest_id	clue	id	guest_id	note	id	dock_number	renter_guest_id	rental_date	boat_name	id	guest_id	confession
-- 105	Mike Manning	Wealth Reallocation Expert	VIP-R	NULL	NULL	NULL	48	105	navy suit, white tie	44	3	105	19870520	Coastal Spirit	105	105	I was the one who took the crystal. I guess I need a lawyer now?

