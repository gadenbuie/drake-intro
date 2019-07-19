plan <- drake_plan(
  life_exp = read_csv(file_in("data/health_ineq_online_table_9.csv")),

  life_exp_tidy = tidy_life_exp(life_exp),

  life_exp_tidy_mean = tidy_mean_life_exp(life_exp_tidy),


  report = rmarkdown::render(
    knitr_in("report.Rmd"),
    output_file = file_out("report.html"),
    quiet = TRUE
  ),

  plot_life_exp = plot_life_exp_gender_income(life_exp_tidy),

  life_exp_model = model_life_exp(life_exp_tidy_mean)

)
