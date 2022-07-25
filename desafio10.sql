SELECT song_name AS nome, COUNT(H.song_id) AS reproducoes FROM SpotifyClone.songs AS S
INNER JOIN SpotifyClone.history_play AS H
ON S.id = H.song_id
INNER JOIN SpotifyClone.user AS U
ON H.user_id = U.id
WHERE U.plan_id = 1 OR U.plan_id = 4
GROUP BY H.song_id ORDER BY nome ASC;
