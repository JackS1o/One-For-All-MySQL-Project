SELECT name AS artista, A.album_name AS album,
COUNT(F.user_id) AS seguidores FROM SpotifyClone.artists Ar
INNER JOIN SpotifyClone.albums A
ON A.artist_id = Ar.id
INNER JOIN SpotifyClone.follow_artist F
ON F.artist_id = Ar.id
GROUP BY artista, album ORDER BY seguidores DESC, artista ASC, album ASC;