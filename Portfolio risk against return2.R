# -----------------------------------------------------------
# Portfolio Optimisation Project in R
# -----------------------------------------------------------

# Install packages if not already installed
# install.packages(c("quantmod", "tidyverse"))

library(quantmod)   # for downloading financial data
library(tidyverse)  # for data wrangling & plotting

# -----------------------------------------------------------
# 1. Load Data
# -----------------------------------------------------------

# Choose assets: mix of stocks, ETF, and crypto
symbols <- c("AAPL", "MSFT", "SPY", "BTC-USD")

# Download daily prices from Yahoo Finance (2020–2025)
getSymbols(symbols, from = "2020-01-01", to = "2025-01-01", src = "yahoo")

# Extract only the Closing Prices
prices <- merge(Cl(AAPL), Cl(MSFT), Cl(SPY), Cl(`BTC-USD`))
colnames(prices) <- symbols   # rename for readability

# -----------------------------------------------------------
# 2. Calculate Daily Returns
# -----------------------------------------------------------

##ROC() computes % change in price between days.
##type = "discrete" = simple return formula: (P_t – P_(t-1)) / P_(t-1).
##na.omit() removes missing values (e.g., first row).
returns <- na.omit(ROC(prices, type = "discrete"))


# Preview the first few rows
head(returns)

# -----------------------------------------------------------
# 3. Risk-Return Summary of Individual Assets
# -----------------------------------------------------------
# Calculate mean return and risk (std deviation) for each asset
summary_stats <- data.frame(
  Asset = colnames(returns),
  MeanReturn = colMeans(returns),     # average daily return
  Risk = apply(returns, 2, sd)        # volatility = standard deviation
)

print(summary_stats)

# Plot assets individually
ggplot(summary_stats, aes(x = Risk, y = MeanReturn, label = Asset)) +
  geom_point(size = 4, colour = "blue") +
  geom_text(vjust = -1) +
  labs(title = "Risk vs. Return of Individual Assets",
       x = "Risk (Std. Dev. of Daily Returns)",
       y = "Expected Daily Return")
# geom_point() plots each asset as a dot.
# geom_text() labels them with ticker names.
# This chart shows the risk-return tradeoff for each asset.

# -----------------------------------------------------------
# 4. Monte Carlo Simulation of Random Portfolios
# -----------------------------------------------------------

set.seed(123)          # reproducibility
n_portfolios <- 5000   # number of random portfolios

# Empty containers
results <- data.frame(Return = numeric(), Risk = numeric())
weights_list <- list()

for (i in 1:n_portfolios) {
  # Generate random weights
  weights <- runif(length(symbols))
  weights <- weights / sum(weights) 
 
  # runif() generates random portfolio weights.
  # weights / sum(weights) ensures they add up to 1 (100% invested).

  ###Formula: portfolio variance = wᵀ Σ w.
  
  # Portfolio expected return (weighted average)
  portfolio_return <- sum(colMeans(returns) * weights)
  
  # Portfolio risk (variance formula: w^T * CovMatrix * w)
  portfolio_risk <- sqrt(t(weights) %*% cov(returns) %*% weights)
  
  ###cov(returns) gives covariance matrix (relationship between assets).
  
  # Save results
  results <- rbind(results, data.frame(Return = portfolio_return, Risk = portfolio_risk))
  weights_list[[i]] <- weights
}

# Convert weight list → dataframe
weights_df <- do.call(rbind, weights_list)
colnames(weights_df) <- symbols

# Combine into one dataframe
results_full <- cbind(results, weights_df)

# -----------------------------------------------------------
# 5. Approximate Efficient Frontier
# -----------------------------------------------------------

# For each risk level, keep the portfolio with highest return
frontier <- results_full %>%
  group_by(Risk = round(Risk, 3)) %>%
  slice_max(Return, n = 1, with_ties = FALSE) %>%
  ungroup()

# Plot all portfolios + efficient frontier
ggplot() +
  geom_point(data = results_full, aes(x = Risk, y = Return),
             alpha = 0.2, colour = "darkgreen") +
  geom_line(data = frontier, aes(x = Risk, y = Return),
            colour = "red", size = 1.2) +
  labs(title = "Efficient Frontier Approximation",
       x = "Risk (Std. Dev.)",
       y = "Expected Return")

# -----------------------------------------------------------
# 6. Show Portfolio Weights on the Efficient Frontier
# -----------------------------------------------------------

# Extract weights for frontier portfolios
frontier_portfolios <- frontier %>%
  select(Risk, Return, all_of(symbols))

# Show first 10 efficient portfolios
print(head(frontier_portfolios, 10))

# Example interpretation:
# Each row shows risk, return, and % allocation to GOOG, AMZN, VOO, TSLA
# e.g., 0.4 GOOG, 0.2 AMZN, 0.3 VOO, 0.1 TSLA = 40%, 20%, 30%, 10%



