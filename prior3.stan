generated quantities {
    real alpha = normal_rng(-17, 0.1);
    real beta = normal_rng(0.12, 0.01);
    real<lower=70, upper=190> thalach = normal_rng(130, 30);
    real<lower=0, upper=1> heart_disease_prob = inv_logit(alpha + beta * thalach);
}