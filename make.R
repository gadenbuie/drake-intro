# A drake workflow replicating selected tables and figures from
#
# > Chetty R, Stepner M, Abraham S, et al.
# > The Association Between Income and Life Expectancy in the United States, 2001-2014.
# > JAMA. 2016;315(16):1750–1766. doi:10.1001/jama.2016.4226



# Set Up the Analysis Environment -----------------------------------------

source("R/packages.R")    # Load the packages...
source("R/global.R")    # ...some global variables
source("R/functions.R") # ...and the functions needed for the analysis

source("R/plan.R")      # Load the drake workflow plan


# Verify or Preview the Work Plan -----------------------------------------

# Optionally plot the graph of your workflow
# config <- drake_config(plan)
# vis_drake_graph(config)


# Run the Plan ------------------------------------------------------------

# Run the project to conduct the steps defined in R/plan.R
make(plan)
