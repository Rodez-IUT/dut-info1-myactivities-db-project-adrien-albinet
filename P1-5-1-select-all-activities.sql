SELECT act.title, act.description, usr.username
FROM activity act LEFT OUTER JOIN "user" usr ON act.owner_id = usr.id
WHERE creation_date > '01/09/2019'
ORDER BY title, username ASC