CREATE FUNCTION gds.insert_reservation (une_date_debut timestamp without time zone, une_date_fin timestamp without time zone, un_nom_de_salle varchar(250)) RETURNS gds.reservation as $$
	INSERT INTO gds.reservation (date_debut,date_fin,date_creation,date_modification,id,salle_id)
    VALUES (une_date_debut,une_date_fin,now(),now(),nextval('gds.reservation_seq'),(SELECT id FROM gds.salle WHERE un_nom_de_salle = nom));
        SELECT * from gds.reservation
$$ LANGUAGE SQL;