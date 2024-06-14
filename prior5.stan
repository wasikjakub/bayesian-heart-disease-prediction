generated quantities {
    real alpha = normal_rng(-2, 0.01);
    real beta = normal_rng(0.5, 0.1);
    real<lower=0, upper=6> old_peak = normal_rng(2, 1);
    real<lower=0, upper=1> heart_disease_prob = inv_logit(alpha + beta * old_peak);
}