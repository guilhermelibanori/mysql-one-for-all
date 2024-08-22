SELECT
  users.user_name AS pessoa_usuaria,
  CASE
    WHEN MAX(history.played_at) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM SpotifyClone.users users
LEFT JOIN SpotifyClone.history history ON users.user_id = history.user_id
GROUP BY users.user_id, users.user_name
ORDER BY users.user_name;