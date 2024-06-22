generated quantities {
    real alpha = normal_rng(-15.5, 0.1);
    real beta = normal_rng(0.1, 0.01);
    real<lower=94, upper=200> bps = normal_rng(140, 30);
    real<lower=0, upper=1> heart_disease_prob = inv_logit(alpha + beta * bps);
}