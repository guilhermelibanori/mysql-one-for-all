SELECT
  song.song_name AS cancao,
  COUNT(history.user_id) AS reproducoes
FROM SpotifyClone.songs song
JOIN SpotifyClone.history history ON song.song_id = history.song_id
GROUP BY song.song_id, song.song_name
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;