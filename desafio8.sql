SELECT name AS artista, A.album_name As album FROM SpotifyClone.artists Ar
INNER JOIN SpotifyClone.albums A
ON A.artist_id = Ar.id
WHERE Ar.name = 'Walter Phoenix'
ORDER BY album;