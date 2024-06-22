generated quantities {
    real alpha = normal_rng(-23, 6);
    real beta = normal_rng(0.06, 0.01);
    real<lower=130, upper=560> chol = normal_rng(300, 100);
    real<lower=0, upper=1> heart_disease_prob = inv_logit(alpha + beta * chol);
}