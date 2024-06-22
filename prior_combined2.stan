generated quantities {
    // First set of priors
    real alpha1 = normal_rng(-6.5, 0.04);
    real beta1 = normal_rng(0.1, 0.01);
    real<lower=30, upper=90> age = normal_rng(60, 15);

    // Second set of priors
    real alpha2 = normal_rng(-15.5, 0.1);
    real beta2 = normal_rng(0.1, 0.01);
    real<lower=94, upper=200> bps = normal_rng(140, 30);

    // Third set of priors
    real alpha3 = normal_rng(-17, 0.1);
    real beta3 = normal_rng(0.12, 0.01);
    real<lower=70, upper=190> thalach = normal_rng(130, 30);

    // Forth set of priors
    real alpha4 = normal_rng(-23, 6);
    real beta4 = normal_rng(0.06, 0.01);
    real<lower=130, upper=560> chol = normal_rng(300, 100);

    // Fifth set of priors
    real alpha5 = normal_rng(-1, 0.1);
    real beta5 = normal_rng(0.35, 0.1);
    real<lower=0, upper=6> old_peak = normal_rng(2, 1);

    // Combined probability using a logistic regression model
    real combined_linear_predictor = (alpha1 + beta1 * age) / 5 + (alpha2 + beta2 * bps) / 5 + (alpha3 + beta3 * thalach) / 5 + (alpha4 + beta4 * chol) / 5 + (alpha5 + beta5 * old_peak) / 5;
    real<lower=0, upper=1> combined_heart_disease_prob = inv_logit(combined_linear_predictor);
}