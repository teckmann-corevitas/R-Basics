#' Covariate balancing function
#'
#' `cov_bal` runs a specified type of balancing on the data using WeightIt
#'
#' You enter your data set, preferred method of balancing,
#' covariates to balance on, groups that you want to balance,
#' and further arguments to specify how to do the balancing
#' @param data Data frame
#' @param covs Balance covariates - a vector of covariate names from data
#' @param strata Grouping variable
#' @param remove_na Logical, default is TRUE, remove missing values
#' @param method Balancing method: default = "glm". Other options are ebal and cbps
#' @param estimand Default is "ATE", can also use "ATT" or "ATC"
#' @param stabilize Logical, default is TRUE
#' @return data set with weights and propensity scores (if not using ebal)
