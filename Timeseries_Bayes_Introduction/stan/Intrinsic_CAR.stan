data{
  int N; // data len
  int N_i; // x size
  int N_j; // y size
  int Index_x[N]; // x index
  int Index_y[N]; // y index
  int Val[N]; // value
}
parameters{
  matrix[N_i,N_j] eff; // random effect
  real beta; // coef parameter
  real sigma; // covarianve parameter
}
model{
  // adj = 2
  eff[1,1] ~ normal((eff[1,2] + eff[2,1])/2,sigma/2);
  eff[1,N_j] ~ normal((eff[1,N_j-1] + eff[2,N_j])/2,sigma/2);
  eff[N_i,1] ~ normal((eff[N_i-1,1] + eff[N_i,2])/2,sigma/2);
  eff[N_i,N_j] ~ normal((eff[N_i,N_j-1] + eff[N_i-1,N_j])/2,sigma/2);
  // adj = 3
  for(i in 2:N_i){
    eff[i,1] ~ normal((eff[i-1,1] + eff[i+1,1] + eff[i,2])/3,sigma/3);
    eff[i,N_j] ~ normal((eff[i-1,N_j] + eff[i+1,N_j] + eff[i,N_j-1])/3,sigma/3);
  }
  for(j in 2:N_j){
    eff[1,j] ~ normal((eff[1,j-1] + eff[1,j+1] + eff[2,j])/3,sigma/3);
    eff[N_i,j] ~ normal((eff[N_i,j-1] + eff[N_i,j+1] + eff[N_i-1,j])/3,sigma/3);
  }
  // adj = 4
  for(i in 2:(N_i-1)){
    for(j in 2:(N_j-1)){
      eff[i,j] ~ normal((eff[i-1,j]+eff[i+1,j]+eff[i,j-1]+eff[i,j+1])/4,sigma/4);
    }
  }
  // model
  for(i in 1:N){
    Val[i] ~ poisson_log(beta + eff[Index_x[i],Index_y[i]]);
  }
}

