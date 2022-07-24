SELECT MIN(price) AS faturamento_minimo,
MAX(price) AS faturamento_maximo,
ROUND(AVG(price), 2) AS faturamento_medio,
SUM(price) AS faturamento_total FROM SpotifyClone.user_plan AS US
INNER JOIN SpotifyClone.user AS U
ON US.id = U.plan_id;
