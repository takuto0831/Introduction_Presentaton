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
  real gamma[N,N_pref];
  real sigma[N];
}

model{
  for(i in 1:3){
    beta[i] ~ uniform(-10000,10000);
  }
  for(i in 1:N){
    // 階層事前分布
    sigma[i] ~ uniform(-10000,10000);
    for(j in 1:N_pref){
      gamma[i,j] ~ normal(0,sigma[i]);  
    }
  }
  for(i in 1:N){
    for(j in 1:N_pref){
      Mean_Y[i,j] ~ normal(beta[1] + gamma[1,j] + (beta[2] + beta[3]*X[i,j] + gamma[2,j])*Age[i,j],
                           Sigma_Y[i,j]);
    }
  }
}

