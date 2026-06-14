df <- read.csv("default_of_credit_card_clients.csv", skip = 1)
names(df)[ncol(df)] <- "default"

df$months_delayed <- rowSums(
  df[, c("PAY_0","PAY_2","PAY_3","PAY_4","PAY_5","PAY_6")] > 0
)
df$utilization <- pmin(df$BILL_AMT1 / (df$LIMIT_BAL + 1), 2)
df$log_limit   <- log(df$LIMIT_BAL + 1)

df$EDUCATION[df$EDUCATION %in% c(0,5,6)] <- 4
df$MARRIAGE[df$MARRIAGE == 0] <- 3

model <- glm(
  default ~ months_delayed + utilization + 
    log_limit + AGE + PAY_0,
  data   = df,
  family = binomial
)

df$pred_prob <- predict(model, type = "response")
df$score <- pmax(300, pmin(850,
                           round(-log(df$pred_prob / (1 - df$pred_prob)) *
                                   (20 / log(2)) + (600 - (20 / log(2)) * log(50)), 0)
))

coef_table <- data.frame(
  Variable    = names(coef(model)),
  Coefficient = round(coef(model), 4),
  Odds_Ratio  = round(exp(coef(model)), 4)
)

write.csv(coef_table, "model_results.csv", row.names = FALSE)
write.csv(df, "credit_scored.csv", row.names = FALSE)