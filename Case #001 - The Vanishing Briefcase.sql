SELECT * from interviews where suspect_id in (SELECT id from suspects where scar is "left cheek" and attire is "trench coat") and transcript is not null
