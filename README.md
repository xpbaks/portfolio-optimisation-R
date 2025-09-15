# Portfolio Optimisation in R

This project simulates random portfolios using real financial data (stocks, ETF, and crypto) 
to approximate the **Efficient Frontier**. It combines concepts from 
**Economics, Finance, and Data Science**.

## 📊 Methods
- Data from Yahoo Finance (GOOG, AMZN, VOO, TSLA, 2020–2025)
- Calculated daily returns using `quantmod`
- Monte Carlo simulation of 5,000 random portfolios
- Computed expected returns, risks (standard deviation), and weights
- Extracted efficient frontier portfolios with `dplyr`
- Visualised results with `ggplot2`

## 📈 Results
- Scatterplot of risk vs return for individual assets
- Simulated portfolios cloud
- Efficient frontier (approximation)
- Portfolio weights along the efficient frontier

## 🔧 Tools Used
- R, quantmod, tidyverse, ggplot2

## 🎯 Skills Showcased
- Financial data analysis
- Portfolio theory (risk-return tradeoff)
- Data visualisation
- Monte Carlo simulation
