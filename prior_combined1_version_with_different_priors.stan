generated quantities {
    // First set of priors
    real alpha = normal_rng(-6, 1.5);
    real beta1 = normal_rng(0.0083 * 3.33, 0.03);
    real age = normal_rng(60, 15);

    // Second set of priors
    real beta2 = normal_rng(0.00357 * 3.33, 0.003);
    real bps = normal_rng(140, 30);

    // Third set of priors
    real beta3 = normal_rng(0.00385 * 3.33, 0.003);
    real thalach = normal_rng(130, 30);

    // Combined probability using a logistic regression model
    real combined_linear_predictor = alpha + beta1 * age + beta2 * bps + beta3 * thalach;
    real<lower=0, upper=1> combined_heart_disease_prob = inv_logit(combined_linear_predictor);
}
