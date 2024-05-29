data {
    int<lower=0> N;  // number of observations
    int<lower=0> K;  // number of predictors
    matrix[N, K] X;  // predictor matrix
    int<lower=0, upper=1> y[N];  // binary outcome
}
parameters {
    vector[K] beta;  // coefficients for predictors
    real alpha;  // intercept
}
model {
    y ~ bernoulli_logit(X * beta + alpha);  // likelihood
    beta ~ normal(0, 1);  // prior for coefficients
    alpha ~ normal(0, 1);  // prior for intercept
}
