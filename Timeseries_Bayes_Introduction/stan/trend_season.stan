data{
  int N;
  vector[N] Data;
}
parameters{
  vector[N] alpha;
  vector[N] season;
  real<lower=0> epsilon;
  real<lower=0> eta;
  real<lower=0> delta;
}
model{
  // システムモデル
  alpha[1] ~ normal(0,10);
  for(i in 2:N){
    alpha[i] ~ normal(alpha[i-1],eta);
  }
  // 季節調整項
  for(i in 4:N){
    season[i] ~ normal(-sum(season[(i-3):(i-1)]), delta);
  }
  // 観測モデル
  for(i in 1:N){
    Data[i] ~ normal(alpha[i] + season[i],epsilon);
  }
}
