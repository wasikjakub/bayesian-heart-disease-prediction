data {
    int<lower=0> N;  // Number of samples
    vector[N] age;     // Age of individuals
    array[N] int<lower=0, upper=1> heart_disease;  // Heart disease indicator (0 or 1)
}

parameters {
    real alpha;      // Intercept
    real beta;       // Slope for age
}

model {
    // Priors for the parameters
    alpha ~ normal(0, 10);
    beta ~ normal(0, 1);
    
    // Likelihood for the logistic regression
    heart_disease ~ bernoulli_logit(alpha + beta * age);
}

generated quantities {
    array[N] real<lower=0, upper=1> heart_disease_prob;  // Probability of heart disease for each individual
    
    for (n in 1:N) {
        heart_disease_prob[n] = inv_logit(alpha + beta * age[n]);
    }
}