stan Introduction
========================================================
author: Kotsubo Takuto
date: November 30th
autosize: true
font-family: 'Helvetica

stanについて
========================================================




simple model
========================================================

- verbose: Iterationを表示するか
- iter: サンプリング数
- chains: マルコフ連鎖の個数

```{r}
test <- 
"parameters{
  real<lower=0,upper=1> a;
}
model{
  a ~ uniform(0,1);
}"

fit <- stan(model_code = test, verbose = TRUE, iter = 500, chains = 1)
```



