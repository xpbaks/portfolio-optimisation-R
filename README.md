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

Interpretion:
If GOOG is at Risk = 0.02, Return = 0.001, it means:
On average, Google’s stock grows 0.1% per day,
But daily prices fluctuate about 2% up or down.
If TSLA is at Risk = 0.035, Return = 0.003, it means:
Average daily return is higher (0.3% per day),
But volatility is much larger (3.5% swings daily).

Interpretation:
A dot at Risk = 0.02, Return = 0.0015 means:
The portfolio has average daily return of 0.15%,
With volatility of 2%.
Some dots are below others → worse portfolios (higher risk, lower return).
The top edge (efficient frontier) shows the best portfolios: maximum return for a given risk.
This plot demonstrates Modern Portfolio Theory (Markowitz): diversification shifts portfolios toward the efficient frontier.

## 🔧 Tools Used
- R, quantmod, tidyverse, ggplot2

## 🎯 Skills Showcased
- Financial data analysis
- Portfolio theory (risk-return tradeoff)
- Data visualisation
- Monte Carlo simulation
