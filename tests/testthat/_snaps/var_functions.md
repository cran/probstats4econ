# var_mean_indep works

    Code
      var_mean_indep(x_vectors)
    Output
                  [,1]       [,2]         [,3]
      [1,] 0.003989987 0.00000000 0.000000e+00
      [2,] 0.000000000 0.02412084 0.000000e+00
      [3,] 0.000000000 0.00000000 1.002678e-06

# var_prop_indep works

    Code
      var_prop_indep(pi_hat, nobs)
    Output
            [,1]    [,2]    [,3]
      [1,] 9e-05 0.00000 0.00000
      [2,] 0e+00 0.00024 0.00000
      [3,] 0e+00 0.00000 0.00021

# var_mean_onesample works

    Code
      var_mean_onesample(cps, c("educ", "age"))
    Output
                    educ           age
      educ  0.0015103246 -0.0001510177
      age  -0.0001510177  0.0201794244

