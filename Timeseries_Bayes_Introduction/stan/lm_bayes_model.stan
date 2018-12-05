data{
  int N;
  vector[N] Mean_Y;
  vector[N] X;
}

parameters{
  real beta[2];
  real<lower=0> sigma;
}

model{
  for(i in 1:2){
    beta[i] ~ uniform(-10000,10000);
  }
  for(i in 1:N){
    Mean_Y[i] ~ normal(beta[1] + beta[2]*X[i] , sigma);
    }
}

