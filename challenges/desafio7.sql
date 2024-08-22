SELECT
  artists.artist_name AS artista,
  albums.album_name AS album,
  COUNT(follows.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artists
JOIN SpotifyClone.albums ON artists.artist_id = albums.artist_id
LEFT JOIN SpotifyClone.follows ON artists.artist_id = follows.artist_id
GROUP BY artists.artist_id, albums.album_id
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;