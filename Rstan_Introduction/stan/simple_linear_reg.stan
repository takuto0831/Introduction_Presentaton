data{
  int N; 
  vector[N] Temp;
  vector[N] Wind_speed;
}

parameters{
  real beta0;
  real beta1;
  real<lower=0> sigma;
}

model{
  for(i in 1:N){
    Temp[i] ~ normal(beta0 + beta1*Wind_speed[i],sigma);
  }
}
