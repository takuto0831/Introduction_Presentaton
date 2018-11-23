data{
  int N; // data length
  int P; // multi level
  vector[N] Temp;
  matrix[N,P] Variables;
}

parameters{
  real beta0;
  row_vector[P] beta1;
  real<lower=0> sigma;
}

model{
  for(i in 1:N){
    Temp[i] ~ normal(beta0 + beta1 * Variables[i,1:P]',sigma);
  }
}
