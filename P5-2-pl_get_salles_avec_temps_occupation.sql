CREATE OR REPLACE FUNCTION gds.pl_get_salles_avec_temps_occupation(curs refcursor) RETURNS refcursor as $$
    BEGIN
        OPEN curs FOR SELECT nom, gds.pl_calcule_temps_occupation(nom) as time_occupation
                      FROM gds.salle
                      ORDER BY time_occupation DESC, nom;
        RETURN curs;
    END;
$$ LANGUAGE plpgsql;
