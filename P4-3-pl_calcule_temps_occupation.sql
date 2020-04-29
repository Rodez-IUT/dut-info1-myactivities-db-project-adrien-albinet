CREATE FUNCTION gds.pl_calcule_temps_occupation (un_nom_de_salle varchar(250)) RETURNS interval AS $$
DECLARE
    un_numero_de_salle bigint;
    reservation_recurrente gds.reservation%ROWTYPE;
    calcul interval := 0; -- init
BEGIN
    SELECT id INTO un_numero_de_salle FROM gds.salle WHERE nom = un_nom_de_salle;
    IF FOUND
        THEN
            FOR reservation_recurrente IN (SELECT * FROM gds.reservation WHERE salle_id = un_numero_de_salle) LOOP
                calcul := calcul + AGE(reservation_recurrente.date_fin, reservation_recurrente.date_debut);
            END LOOP;
        ELSE
            RAISE NOTICE 'La salle n''existe pas';
            calcul := null;
        END IF;
        RETURN calcul;
END;
$$ LANGUAGE plpgsql;