data {
    int<lower=1> N; // number of samples
    array[N] int<lower=0> age;
    array[N] int<lower=0> bps;
    array[N] int<lower=0> thalach;
}

generated quantities {
    // First set of priors
    real alpha1 = normal_rng(-6.5, 0.04);
    real beta1 = normal_rng(0.1, 0.01);

    // Second set of priors
    real alpha2 = normal_rng(-15.5, 0.1);
    real beta2 = normal_rng(0.1, 0.01);

    // Third set of priors
    real alpha3 = normal_rng(-17, 0.1);
    real beta3 = normal_rng(0.12, 0.01);

    // Combined probability using a logistic regression model
    array[N] real combined_heart_disease_prob;
    for (n in 1:N) {
        real combined_linear_predictor = (alpha1 + beta1 * age[n]) / 3 + (alpha2 + beta2 * bps[n]) / 3 + (alpha3 + beta3 * thalach[n]) / 3;
        combined_heart_disease_prob[n] = inv_logit(combined_linear_predictor);
    }
}
