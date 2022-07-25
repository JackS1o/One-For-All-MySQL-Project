SELECT COUNT(id) AS quantidade_musicas_no_historico FROM SpotifyClone.user AS U
INNER JOIN SpotifyClone.history_play AS H
ON H.user_id = U.id
WHERE U.name = 'Bill'
GROUP BY U.id;