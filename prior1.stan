parameters {
    real alpha;      // Intercept
    real beta;       // Slope for age
    real<lower=30, upper=85> age;
}

model {
    // Priors for the parameters
    alpha ~ normal(-6.5, 0.04);
    beta ~ normal(0.1, 0.001);
    age ~ normal(60, 15);
}

generated quantities {
    real<lower=0, upper=1> heart_disease_prob;
    heart_disease_prob = inv_logit(alpha + age * beta);
}