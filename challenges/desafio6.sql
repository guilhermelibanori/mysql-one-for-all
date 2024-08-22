SELECT
  ROUND(MIN(plans.plan_value), 2) AS faturamento_minimo,
  ROUND(MAX(plans.plan_value), 2) AS faturamento_maximo,
  ROUND(AVG(plans.plan_value), 2) AS faturamento_medio,
  ROUND(SUM(plans.plan_value), 2) AS faturamento_total
FROM SpotifyClone.users
JOIN SpotifyClone.plans ON users.user_plan = plans.plan_name;