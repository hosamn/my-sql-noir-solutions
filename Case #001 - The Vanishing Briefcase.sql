SELECT name from suspects where id is (SELECT suspect_id from interviews where transcript Like "%steal%" and suspect_id in (SELECT id from suspects where scar is "left cheek" and attire is "trench coat"))


SELECT * from interviews where suspect_id in (SELECT id from suspects where scar is "left cheek" and attire is "trench coat") and transcript is not null

SELECT * from interviews where transcript Like "%steal%" and suspect_id in (SELECT id from suspects where scar is "left cheek" and attire is "trench coat")
