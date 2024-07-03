generated quantities {
    // First set of priors
    real alpha = normal_rng(-2, 0.75);
    real beta1 = normal_rng(0.0083, 0.00332);
    real age = normal_rng(60, 20);

    // Second set of priors
    real beta2 = normal_rng(0.00357, 0.001428);
    real bps = normal_rng(140, 47);

    // Third set of priors
    real beta3 = normal_rng(0.00385, 0.00154);
    real thalach = normal_rng(130, 43);

    // Combined probability using a logistic regression model
    real combined_linear_predictor = alpha + beta1 * age + beta2 * bps + beta3 * thalach;
    real<lower=0, upper=1> combined_heart_disease_prob = inv_logit(combined_linear_predictor);
}
