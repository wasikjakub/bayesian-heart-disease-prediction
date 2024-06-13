parameters {
    real alpha;      // Intercept
    real beta;  // Slope for blood pressure, constrained to be non-negative
    real<lower=70, upper=190> thalach;
}

model {
    alpha ~ normal(-1, 0.2);
    beta ~ normal(1.6, 0.2);
}

generated quantities {
    array[N] real<lower=0, upper=1> heart_disease_prob;  // Probability of heart disease for each individual
    
    for (n in 1:N) {
        heart_disease_prob[n] = inv_logit(alpha + beta * thalach[n]);
    }
}