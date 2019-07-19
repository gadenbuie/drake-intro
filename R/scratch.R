
#" Plotting mean life expectancy by income quantile
life_exp_tidy_mean %>%
  filter(
    czname == czname,
    adjustment == "Race Adjusted"
  ) %>%
  ggplot() +
  aes(x = year, y = le, color = income_quantile) +
  geom_point(show.legend = FALSE) +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(2002, 2018, 4)) +
  theme_minimal() +
  labs(
    title = czname,
    x = NULL,
    y = "Life Expectancy",
    color = "Income Quantile"
  ) +
  scale_color_manual(values = income_quantile_colors) +
  theme(legend.position = "bottom")
