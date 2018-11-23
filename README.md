# Bayes_Introduction

- ベイズ推定に関するまとめ
- mcmcについて
- 階層ベイズなど, 複雑なモデルについての備忘録
- 発表する際にわかりやすくまとめおく

# Rstan_Introduction

- stanに関するまとめ, mcmcの説明, 実行例と解釈方法, 応用例について
- 自己回帰モデル, 単回帰モデル, 重回帰モデルの分析,可視化

## Directory

```
├── README.md
├── Bayes_Introduction
│   ├── data
│   │   └── data.RData
│   ├── rmd
│   │   ├── Intro.Rmd
│   │   └── Intro.html
│   └── stan
│       ├── bayes_model.stan
│       └── hierarchical_bayes_model.stan
└── Rstan_Introduction
    ├── Rstan_Introduction.Rproj
    ├── csv
    │   ├── Tokyo_2017_rain.csv
    │   ├── Tokyo_2017_sun.csv
    │   ├── Tokyo_2017_temp.csv
    │   ├── Tokyo_2017_weather.csv
    │   └── Tokyo_2017_wind.csv
    ├── fit
    │   ├── fit_ar.rds
    │   ├── fit_mul.rds
    │   └── fit_sim.rds
    ├── model
    │   └── simple_model.rds
    ├── output
    │   └── image
    │       ├── temperature_time_series.png
    │       └── weather_corr_map.png
    ├── rmd
    │   ├── Intro.Rmd
    │   └── Intro.html
    ├── script
    │   └── function.R
    └── stan
        ├── ar_model.stan
        ├── multi_linear_reg.stan
        ├── simple_linear_reg.stan
        └── simple_model.stan
```
