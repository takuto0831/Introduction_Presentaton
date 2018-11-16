parameters{
  real<lower=0,upper=1> a;
}
model{
  a ~ uniform(0,1);
}
