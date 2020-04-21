CREATE FUNCTION gds.insert_salle (un_nom varchar(250), un_nb_personnes_max integer) RETURNS gds.salle as $$
    INSERT INTO gds.salle (nom,nb_personnes_max,date_creation,date_modification,id)
    VALUES (un_nom,un_nb_personnes_max,now(),now(),nextval('gds.salle_seq'));
        SELECT * FROM gds.salle
$$ LANGUAGE SQL;