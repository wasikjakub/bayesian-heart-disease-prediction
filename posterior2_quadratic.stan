data {
    int<lower=1> N;          // number of observations
    array[N] int<lower=0> age;
    array[N] int<lower=0> trestbps;
    array[N] int<lower=0> thalach;
    array[N] int<lower=0> chol;
    array[N] real<lower=0> oldpeak;      
    array[N] int<lower=0, upper=1> y; // binary outcome (heart disease presence)
}

parameters {
    real alpha;              // intercept
    real beta1;              // coefficient for age
    real beta2;              // coefficient for resting blood pressure
    real beta3;              // coefficient for maximum heart rate
    real beta4;              // coefficient for cholesterol level
    real beta5;              // coefficient for oldpeak
}

transformed parameters {
    array[N] real combined_linear_predictor;
    for (n in 1:N) {
        combined_linear_predictor[n] = alpha + beta1 * age[n]^2 + beta2 * trestbps[n]^2 + beta3 * thalach[n]^2 + beta4 * chol[n]^2 + beta5 * oldpeak[n]^2;
    }
}

model {
    // Priors
    alpha ~ normal(-4, 1);
    beta1 ~ normal(0.0083, 0.0332);
    beta2 ~ normal(0.00385, 0.0154);
    beta3 ~ normal(0.00357, 0.01428);
    beta4 ~ normal(0.00167, 0.0668);
    beta5 ~ normal(0.25, 0.1);

    // Logistic regression likelihood
    y ~ bernoulli_logit(combined_linear_predictor);
}

generated quantities {
    array[N] real<lower=0, upper=1> combined_heart_disease_prob;
    array[N] real log_lik;
    
    for (n in 1:N) {
        combined_heart_disease_prob[n] = inv_logit(combined_linear_predictor[n]);
        log_lik[n] = bernoulli_logit_lpmf(y[n] | combined_linear_predictor[n]);
    }
}
