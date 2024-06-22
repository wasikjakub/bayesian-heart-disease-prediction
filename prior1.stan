generated quantities {
    real alpha = normal_rng(-6.5, 0.04);
    real beta = normal_rng(0.1, 0.01);
    real<lower=30, upper=90> age = normal_rng(60, 15);
    real<lower=0, upper=1> heart_disease_prob = inv_logit(alpha + age * beta);
}
