SELECT U.name AS usuario,
COUNT(H.user_id) AS qtde_musicas_ouvidas,
ROUND(SUM(S.duration) / 60,2) AS total_minutos
FROM SpotifyClone.history_play AS H
INNER JOIN SpotifyClone.user AS U
ON H.user_id = U.id
INNER JOIN SpotifyClone.songs AS S
ON H.song_id = S.id
GROUP BY usuario ORDER BY usuario;