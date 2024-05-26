data {
    int<lower=0> N;  // Number of samples
    vector[N] thalach;  // Resting blood pressure of individuals
    array[N] int<lower=0, upper=1> heart_disease; // Heart disease indicator (0 or 1)
}

parameters {
    real alpha;      // Intercept
    real beta;  // Slope for blood pressure, constrained to be non-negative
}

model {
    // Priors for the parameters
    alpha ~ normal(0, 10);
    beta ~ normal(0, 1);  // Positive prior for beta to ensure higher BP leads to higher probability
    
    // Likelihood for the logistic regression
    heart_disease ~ bernoulli_logit(alpha + beta * thalach);
}

generated quantities {
    array[N] real<lower=0, upper=1> heart_disease_prob;  // Probability of heart disease for each individual
    
    for (n in 1:N) {
        heart_disease_prob[n] = inv_logit(alpha + beta * thalach[n]);
    }
}