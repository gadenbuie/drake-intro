# Reproducible Data Workflows

## An introduction to `drake`


<!-- badges: start -->
<!-- badges: end -->

[drake]: https://ropensci.github.io/drake/
[slides]: https://pkg.garrickadenbuie.com/drake-intro/
[rstudio-cloud]: https://rstudio.cloud/project/405721


This is a one-hour talk/workshop introduction to the basic concepts of [drake].

&#x1F4FA; [View slides][slides]

&#x1F5A5; [Run project in RStudio Cloud][rstudio-cloud]

&#x1F4BE; Run locally: `usethis::use_course("gadenbuie/drake-intro")`

&#x26A0;&#xFE0F; Required Packages: [view online](https://pkg.garrickadenbuie.com/drake-intro/requirements/), [view in repo](docs/requirements/index.Rmd)

You can explore [a notebook version of the analysis](https://pkg.garrickadenbuie.com/drake-intro/notebook/) to see the project before it became a [drake] project.
The example drake project (and interactive coding portion) focuses on a drake workflow recreating tables and figures from

> Chetty R, Stepner M, Abraham S, et al. 
> The Association Between Income and Life Expectancy in the United States, 2001-2014. 
> JAMA. 2016;315(16):1750–1766. doi:10.1001/jama.2016.4226

The mission of [The Health Inequality Project](https://healthinequality.org/) is to improve health outcomes for low-income Americans using big data.
This example project uses the data from **[Table 9](https://healthinequality.org/data/)** that provides 

> life expectancy point estimates and standard errors for men and women at age 40 for each quartile of the national income distribution by commuting zone of residence and year. Both race-adjusted and unadjusted estimates are reported. Estimates are reported for the 100 largest CZs (populations greater than 590,000) only.
