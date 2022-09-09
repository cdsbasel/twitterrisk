library(academictwitteR)
library(lubridate)
library(tidyverse)

# BEARER TOKEN ------

# Set bearer
# Run set_bearer(). This will open .Renviron file into which you should copy TWITTER_BEARER = BEARERTOKEN

# Test bearer token. If it shows token, then all set. 
get_bearer() 

# # SEARCH TWEETS BOTTOM UP ------
# 
# # set up dates
# start_date = "2006-04-01" %>% as_date()
# dates = seq(start_date, "2022-08-31" %>% as_date(), 7) 
# #write_lines(c(), "1_data/tweets/2006-04-01_complete.txt")
# 
# repeat {
# 
#   # gather new
#   complete = read_lines("1_data/tweets/2006-04-01_complete.txt")
#   new = dates[!dates %in% as_date(complete)][1]
# 
#   # break if needed
#   if(length(new) == 0) break
#   
#   # keep track
#   cat("\n\n",as.character(new),"\n\n")
#     
#   # get tweets
#   get_all_tweets(
#     query = c("risk","risky","risks","risking",
#               "#risk","#risky","#risks","#risking"),
#     start_tweets = paste0(new,"T00:00:00Z"),
#     end_tweets = paste0(new + 1,"T00:00:00Z"),
#     data_path = "1_data/tweets/2006-04-01/",
#     bind_tweets = FALSE,
#     n = Inf) %>% 
#     suppressWarnings()
#   
#   # update complete list
#   write_lines(c(complete, as.character(new)), 
#               "1_data/tweets/2006-04-01_complete.txt")
#   }

# SEARCH TWEETS TOP DOWN ------

# set up dates
start_date = "2006-04-01" %>% as_date()
dates = seq(start_date, "2022-08-31" %>% as_date(), 7) 
#write_lines(c(), "1_data/tweets/2006-04-01_complete.txt")

repeat {
  
  # gather new
  complete = read_lines("1_data/tweets/2006-04-01_complete.txt")
  news = dates[!dates %in% as_date(complete)]
  new = news[length(news)]
  
  # break if needed
  if(length(new) == 0) break
  
  # keep track
  cat("\n\n",as.character(new),"\n\n")
  
  # get tweets
  get_all_tweets(
    query = c("risk","risky","risks","risking",
              "#risk","#risky","#risks","#risking"),
    start_tweets = paste0(new,"T00:00:00Z"),
    end_tweets = paste0(new + 1,"T00:00:00Z"),
    data_path = "1_data/tweets/2006-04-01_td/",
    bind_tweets = FALSE,
    n = Inf) %>% 
    suppressWarnings()
  
  # update complete list
  write_lines(c(complete, as.character(new)), 
              "1_data/tweets/2006-04-01_complete.txt")
  }
  
# GATHER TWEETS ------

# tweets = bind_tweet_jsons("1_data/tweets/2006-04-01/")
