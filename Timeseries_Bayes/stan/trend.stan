data{
  int N;
  vector[N] Width;
}
parameters{
  vector<lower=0>[N] alpha;
  real<lower=0> epsilon;
  real<lower=0> eta;
}
model{
  // システムモデル
  alpha[1] ~ normal(0,10);
  alpha[2] ~ normal(0,10);
  for(i in 3:N){
    alpha[i] ~ normal(2*alpha[i-1]-alpha[i-2],eta);
  }
  // 観測モデル
  for(i in 1:N){
    Width[i] ~ normal(alpha[i],epsilon);
  }
}
