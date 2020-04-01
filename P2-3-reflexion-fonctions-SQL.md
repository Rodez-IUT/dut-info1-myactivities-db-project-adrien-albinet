CREATE OR REPLACE FUNCTION create_activity_with_owner(
    an_act_id bigint, 
    an_act_title VARCHAR(200), 
    an_act_descr text, 
    a_user_id bigint,
    a_username VARCHAR(500)) 
RETURNS activity AS $$
    -- insert the owner
    INSERT INTO "user" (id, username, date_created) 
    VALUES (a_user_id, a_username, now());
    -- insert the activity
    INSERT INTO activity (id, title, description, creation_date, modification_date, owner_id)
    VALUES (an_act_id, an_act_title, an_act_descr, now(), now(), a_user_id);
    -- return the created activity
    SELECT * FROM activity where id = an_act_id ;
$$
LANGUAGE SQL;

- Il vaut mieux utiliser un RETURNING à la fin
- l'utilisation des alias -> prob de comprehension
- a_username VARCHAR(500) et an_act_title -> beaucoup trop long

Solution : 

CREATE OR REPLACE FUNCTION create_activity_with_owner(
        act_id bigint, 
        act_title VARCHAR(50), 
        act_descr text, 
        user_id bigint,
        username VARCHAR(20)) 
    RETURNS activity AS $$
        -- insert the owner
        INSERT INTO "user" (id, username, date_created) 
        VALUES (a_user_id, a_username, now());
        -- insert the activity
        INSERT INTO activity (id, title, description, creation_date, modification_date, owner_id)
        VALUES (an_act_id, an_act_title, an_act_descr, now(), now(), a_user_id)
        -- return the created activity
        RETURNING activity;
    $$
    LANGUAGE SQL;