generated quantities {
    // First set of priors
    real alpha = normal_rng(-3, 0.5);
    real beta1 = normal_rng(0.0083, 0.00332);
    real age = normal_rng(60, 20);

    // Second set of priors
    real beta2 = normal_rng(0.00357, 0.001428);
    real bps = normal_rng(140, 47);

    // Third set of priors
    real beta3 = normal_rng(0.00385, 0.00154);
    real thalach = normal_rng(130, 43);

    // Forth set of priors
    real beta4 = normal_rng(0.00167, 0.000668);
    real chol = normal_rng(300, 100);

    // Fifth set of priors
    real beta5 = normal_rng(0.25, 0.1);
    real old_peak = normal_rng(2, 1);

    // Combined probability using a logistic regression model
    real combined_linear_predictor = alpha + beta1 * age + beta2 * bps + beta3 * thalach + beta4 * chol + beta5 * old_peak;
    real combined_heart_disease_prob = inv_logit(combined_linear_predictor);
}