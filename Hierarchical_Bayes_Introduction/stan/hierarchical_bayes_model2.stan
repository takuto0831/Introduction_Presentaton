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
  real<lower=0> gamma[N,N_pref];
  real<lower=0> sigma[N];
}

model{
  // 身長は150cm程度, 2回目の影響は正で(0~10),給食タイプの影響は不明(裾の重い分布) 
  beta[1] ~ normal(150,10);
  beta[2] ~ uniform(0,10);
  beta[3] ~ cauchy(0,10);
  
  for(i in 1:N){
    // 階層事前分布
    sigma[i] ~  student_t(4,0,1);
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

