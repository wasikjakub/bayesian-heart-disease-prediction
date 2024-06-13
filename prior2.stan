parameters {
    real alpha; 
    real beta; 
    real <lower=94, upper=200> bps;
}

model {
    // Priors for the parameters
    alpha ~ normal(-15.5, 0.1);
    beta ~ normal(0.1, 0.001);
    bps ~ normal(140, 30);
}

generated quantities {
    real<lower=0, upper=1> heart_disease_prob;
    heart_disease_prob = inv_logit(alpha + beta * bps);
}