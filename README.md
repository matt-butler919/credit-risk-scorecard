Credit Risk Scorecard project

Link to full project - https://docs.google.com/spreadsheets/d/1EoVScUHOOCbYw27qcoee4lglyf9gMSShwA6fbE_ImaI/edit?gid=1528133994#gid=1528133994

Data from UC Irvine - Data from UCI - https://archive.ics.uci.edu/dataset/350/default+of+credit+card+clients

A credit risk scorecard translates a statistical model into a points-based system that assigns each loan applicant a score between 300 and 850. This scorecard was built using the UCI Default of Credit Card Clients dataset containing 30,000 credit card holders. I developed a logistic regression model in R using payment delay history, credit utilization, credit limit, age, and recent payment status as predictors, then translated the log-odds coefficients into a 300-850 scale. Finally, I used those scores to create an interactive calculator that accepts any input of predictors and will output an estimated score, risk category, and approve/refer/deny decision.
