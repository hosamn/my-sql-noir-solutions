SELECT name from suspects where id is (SELECT suspect_id from interviews where suspect_id in (SELECT id from suspects where bandana_color is "red" OR accessory is "gold watch") and transcript LIKE "%took%")


SELECT * from witnesses where crime_scene_id is (select id from crime_scene WHERE location is "West Hollywood Records")

SELECT * from suspects where bandana_color is "red" OR accessory is "gold watch"

SELECT * from interviews where suspect_id in (SELECT id from suspects where bandana_color is "red" OR accessory is "gold watch") and transcript is not null
