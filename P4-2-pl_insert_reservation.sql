CREATE OR REPLACE FUNCTION gds.pl_insert_reservation (une_date_debut timestamp without time zone, une_date_de_fin timestamp without time zone, un_nom_de_salle varchar(250)) RETURNS gds.reservation as $$
DECLARE
	une_reservation gds.reservation%ROWTYPE;
	un_numero_de_salle bigint;
BEGIN
	SELECT id INTO un_numero_de_salle FROM gds.salle WHERE nom = un_nom_de_salle;
	IF FOUND
		THEN
			INSERT INTO gds.reservation (date_debut,date_fin,date_creation,date_modification,id,salle_id)
			VALUES (une_date_debut,une_date_de_fin,now(),now(),nextval('gds.reservation_seq'),un_numero_de_salle)
			RETURNING * INTO une_reservation;
		ELSE
			RAISE NOTICE 'La salle n''existe pas';
		END IF;
		RETURN une_reservation;
END;
$$ LANGUAGE plpgsql
	