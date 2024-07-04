data {
    int<lower=0> N;          // number of observations
    vector[N] age;           // age of the patient
    vector[N] trestbps;      // resting blood pressure
    vector[N] thalach;       // maximum heart rate achieved
    vector[N] chol;          // cholesterol level
    vector[N] oldpeak;       // ST depression induced by exercise relative to rest
    int<lower=0, upper=1> y[N]; // binary outcome (heart disease presence)
}

parameters {
    real alpha;              // intercept
    real beta1;              // coefficient for age
    real beta2;              // coefficient for resting blood pressure
    real beta3;              // coefficient for maximum heart rate
    real beta4;              // coefficient for cholesterol level
    real beta5;              // coefficient for oldpeak
}

model {
    // Priors
    alpha ~ normal(-3, 1);
    beta1 ~ normal(0.0083, 0.00332);
    beta2 ~ normal(0.00357, 0.001428);
    beta3 ~ normal(0.00385, 0.00154);
    beta4 ~ normal(0.00167, 0.000668);
    beta5 ~ normal(0.25, 0.1);

    // Logistic regression likelihood
    y ~ bernoulli_logit(alpha + beta1 * age + beta2 * trestbps + beta3 * thalach + beta4 * chol + beta5 * oldpeak);
}

generated quantities {
    vector[N] y_pred;
    for (n in 1:N)
        y_pred[n] = bernoulli_logit_rng(alpha + beta1 * age[n] + beta2 * trestbps[n] + beta3 * thalach[n] + beta4 * chol[n] + beta5 * oldpeak[n]);
}
