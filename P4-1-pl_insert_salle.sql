CREATE FUNCTION gds.pl_insert_salle (un_nom varchar(250), un_nb_de_personnes_max int) RETURNS gds.salle as $$
DECLARE
    une_salle gds.salle%ROWTYPE;
BEGIN
    INSERT INTO gds.salle (nom,nb_personnes_max,date_creation,date_modification,id)
    VALUES (un_nom,un_nb_de_personnes_max,now(),now(),nextval('gds.salle_seq'))
        RETURNING * INTO une_salle;

    RETURN une_salle;
END;
$$ LANGUAGE plpgsql