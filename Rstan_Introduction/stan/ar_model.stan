data{
  int N; 
  vector[N] Temp;
}

parameters{
  real beta;
  real<lower=0> sigma;
}

model{
  for(i in 2:N){
    Temp[i] ~ normal(beta*Temp[i-1],sigma);
  }
}
