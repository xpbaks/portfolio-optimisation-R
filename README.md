# Efficient Frontier Portfolio Analysis in R

## 📌 Project Overview
This project explores **portfolio optimisation** using the concept of the **Efficient Frontier** in Modern Portfolio Theory (MPT).  
The goal is to approximate the risk-return trade-off of portfolios formed from a small set of financial assets and identify optimal portfolio allocations.

This project was completed as part of my learning journey in **Data Science and Economics**, using R for financial data analysis and visualisation.

---

## 🎯 Objectives
- Collect and analyse real financial market data.
- Simulate random portfolios by varying asset weights.
- Compute **expected returns**, **portfolio risk (volatility)**, and **Sharpe ratios**.
- Approximate the **Efficient Frontier** and highlight optimal portfolios.
- Extract details of portfolio allocations (percentages of each stock).

---

## 🛠️ Tools & Skills
- **R Programming**
  - Packages: `tidyquant`, `dplyr`, `ggplot2`, `purrr`
- **Data Science Concepts**
  - Data wrangling, visualisation, and simulation
- **Financial Economics**
  - Risk-return trade-off, diversification, efficient frontier, Sharpe ratio

---

## 📂 Data
The project uses historical stock price data (e.g., `AAPL`, `MSFT`, `GOOG`, `AMZN`) sourced via `tidyquant`.  
You can easily replace these tickers with other assets (e.g., ETFs, commodities, cryptocurrencies).

---

## 📈 Methodology

1. **Import stock price data**  
   Daily adjusted closing prices were retrieved and converted to log returns.

2. **Simulate random portfolios**  
   Thousands of random weight combinations were generated to represent possible portfolio allocations.

3. **Calculate portfolio metrics**  
   - **Expected Return**: Weighted average of asset returns  
   - **Risk (Volatility)**: Portfolio standard deviation  
   - **Sharpe Ratio**: Return-to-risk efficiency

4. **Plot the Efficient Frontier Approximation**  
   Scatterplot of portfolio risk vs. return, highlighting the "frontier" of optimal trade-offs.

5. **Extract optimal portfolios**  
   Retrieve the asset weights (percent allocations) for portfolios lying on the efficient frontier.

---

## 📊 Results

### Portfolio Simulation Scatterplot
*(Insert your plot here)*

- **X-axis (Risk)**: Portfolio standard deviation (volatility)  
- **Y-axis (Return)**: Expected portfolio return  
- **Colour**: Sharpe ratio (higher is better)

### Efficient Frontier Approximation
*(Insert your plot here)*

- The smooth "frontier" line represents optimal portfolios that maximise return for a given risk.  
- Portfolios below the line are inefficient.

### Example Portfolio Allocations
*(Insert your portfolio weight table here)*

| Portfolio | AAPL | MSFT | GOOG | AMZN | Expected Return | Risk | Sharpe Ratio |
|-----------|------|------|------|------|----------------|------|--------------|
| 1         | 40%  | 30%  | 20%  | 10%  | 0.12           | 0.18 | 0.67         |
| 2         | 25%  | 25%  | 25%  | 25%  | 0.10           | 0.15 | 0.65         |

---

## 📘 Key Learnings
- Learned how to use R for **financial market data analysis**.  
- Applied **Modern Portfolio Theory** concepts to real data.  
- Gained experience with **simulation, data wrangling, and visualisation**.  
- Built a reproducible project showcasing both **data science** and **economics** knowledge.

---
