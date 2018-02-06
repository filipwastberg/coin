# Scrape Twitter influencers
url <- "https://www.marketwatch.com/story/bitcoin-and-cryptocurrency-on-twitter-the-most-important-people-to-follow-2017-12-04"

# Scrape website
library(rvest)
influencers <- read_html(url) %>% 
    html_nodes('p') %>% 
    html_text()

influencers <- influencers[11:72]

# Clean text and extract twitter names
library(stringr)
infl_twitter <- influencers %>%
  str_extract_all("@[[:alpha:][:punct:]]*") %>%
  unlist(infl_twitter) %>%
  as_tibble() %>%
  rename(influencer = value) %>%
  mutate(influencer = str_replace(influencer, "[[:punct:]]$" , "")) %>%
  filter(influencer != "")

#library(readr)
#write_csv(infl_twitter, "twitter_influencers.csv")

# Get user info
library(purrr)
infl_twitter <- infl_twitter %>%
  filter(influencer != "@dydxderivatives")

user_data <- map_df(infl_twitter$influencer, ~ search_users(.x, n = 1))
