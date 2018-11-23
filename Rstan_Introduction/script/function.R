########## ar model 用 ##########
ans_stan_ar <- function(fit,data){
  fit_ext <- rstan::extract(fit,permuted=T); 
  # parameters
  alpha_0 <- fit_ext$alpha_0 %>% mean(); alpha_1 <- fit_ext$alpha_1 %>% mean(); 
  Sigma <- fit_ext$sigma %>% mean()
  # Estimate condition mean 
  num = length(data); mu_hat <- c() 
  for(i in 2:num){
    tmp <- alpha_0 + ( alpha_1 * data[i-1] )
    mu_hat <- cbind(mu_hat, tmp)
  }
  # Estimate moment function
  fn <- function(k,mu,Sigma) k*dnorm(x=k, mu, Sigma) # theta func
  ########################## Estimate value ################################
  len <- length(mu_hat); mom <- c();
  for(i in 1:len){
    mom[i] <- integrate(fn, lower=-Inf, upper=Inf, mu=mu_hat[i], Sigma=Sigma)$value
  }
  data.frame(real=data,
             pred=c(NA,mom)) %>% 
    mutate(index = row_number()) %>%
    top_n(wt=index,n=2000) %>% 
    ggplot(aes(x=index)) +
    geom_line(aes(y=real, colour= "real")) + 
    geom_line(aes(y=pred, colour= "pred")) +
    scale_colour_manual("",
                        values = c("real"="black","pred"="blue")
    ) 
}

########## ar model 用 ##########
ans_stan_ar <- function(fit,P,data){
  fit_ext <- rstan::extract(fit,permuted=T); 
  # parameters
  alpha_0 <- fit_ext$alpha_0 %>% mean(); alpha_1 <- c(); Sigma <- fit_ext$sigma %>% mean()
  for(i in 1:P){ tmp <- fit_ext$alpha_1[,i] %>% mean(); alpha_1 <- cbind(alpha_1, tmp);}
  # Estimate condition mean 
  num = length(data); mu_hat <- c() 
  for(i in (1+P):num){
    tmp <- alpha_0 + ( alpha_1 %*% data[(i-1):(i-P)] )
    mu_hat <- cbind(mu_hat, tmp)
  }
  # Estimate moment function
  fn <- function(k,mu,Sigma) k*dnorm(x=k, mu, Sigma) # theta func
  
  ########################## Estimate value ################################
  len <- length(mu_hat); theta.mom <- c();
  for(i in 1:len){
    theta.mom[i] <- integrate(fn.theta, lower=-Inf, upper=Inf, mu=mu_hat[i], Sigma=Sigma)$value
  }
  # Estimate predict theta value
  return(data.frame(predict= c(rep(NA,P),theta.mom)))
}