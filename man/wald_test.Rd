% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wald_test.R
\name{wald_test}
\alias{wald_test}
\title{Wald test statistic and p-value}
\usage{
wald_test(
  gamma_hat,
  var_gamma_hat,
  R = diag(length(gamma_hat)),
  c = default_test(R)
)
}
\arguments{
\item{gamma_hat}{L x 1 vector of parameter estimates}

\item{var_gamma_hat}{L x L variance-covariance matrix of parameter estimates}

\item{R}{Q x L matrix of linear constraints to be tested.
Defaults to identity matrix of size L}

\item{c}{Q x 1 vector of test values for the linear constraints.
Defaults to a vector of zeros of length Q to test that all
the contrasts are equal to zero.}
}
\value{
A list with the following elements:
\itemize{
\item W: Wald test statistic
\item p_value: p-value for the Wald test (\eqn{\chi^2_Q} distribution)
}
}
\description{
Given the parameter estimates and their variance-covariance matrix,
\code{wald_test} calculates the Wald test statistic and p-value for
a set of linear constraints on the parameters.
}
\examples{
# test that union workers earn the same as non-union workers
cps$union <- as.numeric(cps$unionstatus == "Union")
model <- lm(earnwk ~ union, data = cps)
gamma_hat <- coef(model)
var_gamma_hat <- vcov(model)
wald_test(gamma_hat, var_gamma_hat, R = c(0, 1))

# test that non-union workers make 900/week
# *and* union workers make 1000/week
wald_test(
  gamma_hat,
  var_gamma_hat,
  R = matrix(c(0, 1, 1, 1), nrow = 2),
  c = c(900, 1000)
)

}
