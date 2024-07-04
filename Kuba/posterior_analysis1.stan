data {
    int<lower=0> N;          // number of observations
    vector[N] age;           // age of the patient
    vector[N] trestbps;      // resting blood pressure
    vector[N] thalach;       // maximum heart rate achieved
    int<lower=0, upper=1> y[N]; // binary outcome (heart disease presence)
}

parameters {
    real alpha;              // intercept
    real beta1;              // coefficient for age
    real beta2;              // coefficient for resting blood pressure
    real beta3;              // coefficient for maximum heart rate
}

model {
    // Priors
    alpha ~ normal(-2, 0.75);
    beta1 ~ normal(0.0083, 0.00332);
    beta2 ~ normal(0.00357, 0.001428);
    beta3 ~ normal(0.00385, 0.00154);

    // Logistic regression likelihood
    y ~ bernoulli_logit(alpha + beta1 * age + beta2 * trestbps + beta3 * thalach);
}

generated quantities {
    vector[N] y_pred;
    for (n in 1:N)
        y_pred[n] = bernoulli_logit_rng(alpha + beta1 * age[n] + beta2 * trestbps[n] + beta3 * thalach[n]);
}
