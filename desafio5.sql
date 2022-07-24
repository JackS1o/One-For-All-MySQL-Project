SELECT song_name AS cancao, COUNT(H.song_id) AS reproducoes
FROM SpotifyClone.songs AS S 
INNER JOIN SpotifyClone.history_play AS H
ON H.song_id = S.id
GROUP BY H.song_id ORDER BY reproducoes DESC, cancao LIMIT 2;