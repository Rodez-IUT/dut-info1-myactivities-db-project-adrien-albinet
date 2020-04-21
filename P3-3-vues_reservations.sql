CREATE VIEW gds.vue_reservations AS
    SELECT 
    gds.reservation.id as id_reservation,
    gds.salle.nom as nom_salle,
    gds.reservation.date_debut,
    gds.reservation.date_fin
    FROM gds.reservation
    JOIN gds.salle
    ON gds.reservation.id = gds.salle.id
    ORDER BY nom_salle, gds.reservation.date_debut DESC;