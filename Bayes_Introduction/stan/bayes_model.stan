data{
  int N;
  int N_pref;
  matrix[N,N_pref] Mean_Y;
  matrix[N,N_pref] Sigma_Y;
  matrix[N,N_pref] X;
  matrix[N,N_pref] Age;
}

parameters{
  real beta[3];
}

model{
  for(i in 1:3){
    beta[i] ~ uniform(-10000,10000);
  }
  for(i in 1:N){
    for(j in 1:N_pref){
      Mean_Y[i,j] ~ normal(beta[1] + beta[2]*Age[i,j] + beta[3]*X[i,j]*Age[i,j], Sigma_Y[i,j]);
    }
  }
}

