generated quantities {
    // First set of priors
    real alpha1 = normal_rng(-6.5, 0.04);
    real beta1 = normal_rng(0.1, 0.001);
    real<lower=30, upper=90> age = normal_rng(60, 15);

    // Second set of priors
    real alpha2 = normal_rng(-15.5, 0.1);
    real beta2 = normal_rng(0.1, 0.001);
    real<lower=94, upper=200> bps = normal_rng(140, 30);

    // Third set of priors
    real alpha3 = normal_rng(-20, 0.1);
    real beta3 = normal_rng(0.12, 0.001);
    real<lower=70, upper=190> thalach = normal_rng(130, 30);

    // Combined probability using a logistic regression model
    real combined_linear_predictor = (alpha1 + beta1 * age) / 3 + (alpha2 + beta2 * bps) / 3 + (alpha3 + beta3 * thalach) / 3;
    real<lower=0, upper=1> combined_heart_disease_prob = inv_logit(combined_linear_predictor);
}
