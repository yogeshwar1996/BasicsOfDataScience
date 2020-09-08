# 
# Web scraping is extracting data from a website.
# The rvest web harvesting package includes functions to extract nodes of an HTML document: html_nodes() extracts all nodes of different types, and html_node() extracts the first node.
# html_table() converts an HTML table to a data frame.

# import a webpage into R
library(rvest)
url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
h <- read_html(url)
class(h)
h

tab <- h %>% html_nodes("table")
tab <- tab[[2]]

tab <- tab %>% html_table
class(tab)

tab <- tab %>% setNames(c("state", "population", "total", "murders", "gun_murders", "gun_ownership", "total_rate", "murder_rate", "gun_murder_rate"))
head(tab)