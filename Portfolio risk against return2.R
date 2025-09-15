library(quantmod)
library(tidyverse)

# Choose a set of assets (mix of stocks, ETF)
symbols <- c("GOOG", "AMZN", "VOO", "TSLA")

# Download data from Yahoo Finance (from Jan 2020 to Jan 2025)
getSymbols(symbols, from = "2020-01-01", to = "2025-09-01", src = "yahoo")

# Extract only the closing prices (Cl = Closing price function)
prices <- merge(Cl(GOOG), Cl(AMZN), Cl(VOO), Cl(`TSLA`))

# Rename the columns for readability
colnames(prices) <- symbols

# Calculate daily returns using ROC (Rate of Change)
returns <- na.omit(ROC(prices, type = "discrete"))

# Display first few rows of returns
head(returns)

# Calculate mean return and risk (std deviation) for each asset
summary_stats <- data.frame(
  Asset = colnames(returns),
  MeanReturn = colMeans(returns),   # average daily return
  Risk = apply(returns, 2, sd)      # standard deviation of returns
)

summary_stats

# Scatterplot of individual assets (Risk vs Return)
ggplot(summary_stats, aes(x = Risk, y = MeanReturn, label = Asset)) +
  geom_point(size = 4, colour = "blue") +     # plot points
  geom_text(vjust = -1) +                     # add labels above points
  labs(title = "Risk vs. Return of Selected Assets",
       x = "Risk (Standard Deviation of Daily Returns)",
       y = "Expected Daily Return")


# Set seed for reproducibility (so results are same each run)
set.seed(123)

# Number of portfolios to simulate
n_portfolios <- 5000

# Empty dataframe to store results
results <- data.frame(Return = numeric(), Risk = numeric())

# Loop to generate portfolios
for (i in 1:n_portfolios) {
  # Step 1: Generate random weights for each asset
  weights <- runif(length(symbols))    # random numbers
  weights <- weights / sum(weights)    # normalise to sum = 1 (100%)
  
  # Step 2: Portfolio expected return = weighted average of asset returns
  portfolio_return <- sum(colMeans(returns) * weights)
  
  # Step 3: Portfolio risk = sqrt(w^T * CovarianceMatrix * w)
  portfolio_risk <- sqrt(t(weights) %*% cov(returns) %*% weights)
  
  # Step 4: Store results
  results <- rbind(results, data.frame(Return = portfolio_return, Risk = portfolio_risk))
}

# Scatterplot of simulated portfolios
ggplot(results, aes(x = Risk, y = Return)) +
  geom_point(alpha = 0.3, colour = "darkgreen") +
  labs(title = "Simulated Portfolios (Efficient Frontier Approximation)",
       x = "Risk (Std. Dev.)",
       y = "Expected Return")

