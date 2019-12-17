data{
  int N;
  vector[N] Width;
}
parameters{
  vector[N] alpha;
  real<lower=0> epsilon;
  real<lower=0> eta;
}
model{
  // システムモデル
  alpha[1] ~ normal(0,10);
  for(i in 2:N){
    alpha[i] ~ normal(alpha[i-1],eta);
  }
  // 観測モデル
  for(i in 1:N){
    Width[i] ~ normal(alpha[i],epsilon);
  }
}
