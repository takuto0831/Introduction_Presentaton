data{
  int N_i; // x size
  int N_j; // y size
  int Data[N_i,N_j]; // value
}
parameters{
  matrix<lower=0>[N_i,N_j] eff; // random effect
  real beta; // coef parameter
  real<lower=0> sigma; // covarianve parameter
}
model{
  matrix[N_i,N_j] weight;
  for(i in 1:N_i){
    for(j in 1:N_j){
      // zero matrix
      for(m in 1:N_i){
        for(n in 1:N_j){
          weight[m,n] = 0;
        }
      }
      // make adj matrix
      if(i > 1){
        weight[i-1,j] = 1;
      }
      if(i < N_i){
        weight[i+1,j] = 1;
      }
      if(j > 1){
        weight[i,j-1] = 1;
      }
      if(j < N_j){
        weight[i,j+1] = 1;
      }
      // weight
      eff[i,j] ~ normal(sum((weight/sum(weight)) .* eff),sigma/sum(weight));
      Data[i,j] ~ poisson_log(beta + eff[i,j]);
    }
  }
}
