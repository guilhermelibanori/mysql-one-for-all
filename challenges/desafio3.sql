SELECT
  users.user_name AS pessoa_usuaria,
  COUNT(history.song_id) AS musicas_ouvidas,
  ROUND(SUM(song.song_duration / 60), 2) AS total_minutos
FROM SpotifyClone.users users
JOIN SpotifyClone.history history ON users.user_id = history.user_id
JOIN SpotifyClone.songs song ON history.song_id = song.song_id
GROUP BY users.user_name
ORDER BY users.user_name;