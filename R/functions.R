

# Data Processing Functions -----------------------------------------------

#' Tidy up the life expectancy data frame
#'
tidy_life_exp <- function(life_exp) {
  life_exp %>%
    select(cz:year, contains("le_")) %>%
    gather(key, value, contains("le_")) %>%
    extract(
      col = key,
      into = c("variable", "adjustment", "income_quantile", "sex"),
      regex = "(sd_le|le)_(raceadj|agg)_q(\\d)_(\\w)"
    ) %>%
    mutate(
      adjustment = recode(adjustment, !!!adjustment_types),
      income_quantile = factor(
        income_quantile,
        levels = names(income_quantiles),
        labels = income_quantiles
      ),
      sex = recode(sex, "F" = "Female", "M" = "Male")
    ) %>%
    rename(state = stateabbrv) %>%
    spread(variable, value)
}

#' Calculate Mean (Male, Female) Life Expectancy
#'
tidy_mean_life_exp <- function(life_exp_tidy) {
  life_exp_tidy %>%
    gather(variable, value, le:sd_le) %>%
    nest(sex, value) %>%
    mutate(value = map_dbl(data, ~ mean(.$value))) %>%
    select(-data) %>%
    spread(variable, value)
}


# Plot Functions ----------------------------------------------------------

plot_life_exp_gender_income <- function(life_exp_tidy) {
  life_exp_tidy %>%
    filter(
      czname == "Tampa",
      adjustment == "Race Adjusted",
      income_quantile %in% c("Bottom", "Top")
    ) %>%
    ggplot() +
    aes(
      x = year, y = le,
      color = income_quantile,
      group = paste(income_quantile, sex)
    ) +
    geom_point(size = 0.75, show.legend = FALSE) +
    geom_line() +
    geom_smooth(method = "lm", se = FALSE) +
    facet_wrap(~ sex) +
    scale_color_manual(values = income_quantile_colors) +
    scale_x_continuous(breaks = seq(2002, 2018, 4)) +
    labs(
      title = "Tampa",
      x = NULL,
      y = "Life Expectancy",
      color = "Income Quantile"
    ) +
    theme_minimal() +
    theme(legend.position = "bottom")
}

plot_life_exp_income <- function() {
  # needs your help!
}


# Model Life Expectancy ---------------------------------------------------

model_life_exp <- function(life_exp_tidy_mean) {
  life_exp_tidy_mean %>%
    select(czname, state, pop2000, year, adjustment, income_quantile, le) %>%
    filter(
      adjustment == "Race Adjusted",
      income_quantile %in% c("Bottom", "Top")
    ) %>%
    nest(year, le) %>%
    mutate(
      lm = map(data, ~ lm(le ~ year, data = .x)),
      pred = map2(data, lm, modelr::add_predictions),
      est = map(lm, broom::tidy)
    )
}
