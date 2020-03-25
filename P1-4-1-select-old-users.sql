SELECT username, date_created
FROM public.user
WHERE date_created < '01/09/2019'
ORDER BY username ASC