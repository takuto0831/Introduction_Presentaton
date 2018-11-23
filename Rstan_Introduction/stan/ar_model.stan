data{
  int N; 
  vector[N] Temp;
}

parameters{
  real alpha_0;
  real alpha_1;
  real<lower=0> sigma;
}

model{
  for(i in 2:N){
    Temp[i] ~ normal(alpha_0 + alpha_1*Temp[i-1],sigma);
  }
}

// generated quantities{
//   vector[N] Temp_new;
//   Temp_new[1] = 9999; 
//   for(i in 2:N){
//     Temp_new[i] = normal_rng(alpha_0 + alpha_1*Temp[i-1],sigma);
//   }
// }
