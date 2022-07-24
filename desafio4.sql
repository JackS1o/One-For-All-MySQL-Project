SELECT name AS usuario,
  CASE
    WHEN MAX(H.history_date) BETWEEN '2021-01-01' AND '2021-12-31' THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
  END AS condicao_usuario
FROM SpotifyClone.user AS U
INNER JOIN SpotifyClone.history_play AS H
ON H.user_id = U.id
GROUP BY usuario ORDER BY usuario;
