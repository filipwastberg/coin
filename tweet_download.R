#' Download tweets
library(rtweet)

coin_tweets <- search_tweets(
  "#bitcoin", n = 10000, include_rts = FALSE
)

ts_plot(coin_tweets, "1 minutes") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "#bitcoins",
    subtitle = "Tweets #bitcoins",
    caption = "\nFrån Twitter"
  )