-- On October 31, 1987, at a Coconut Grove mansion masked ball, Leonard Pierce was found dead in the garden. Can you piece together all the clues to expose the true murderer?

SELECT * from crime_scene
WHERE date is "19871031"
AND location LIKE "%Coconut Grove%"

