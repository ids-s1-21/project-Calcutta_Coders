library(tidyverse)
library(rvest)

imdb <- read.csv(file = "./data/IMDb_movies.csv", header = TRUE, skip = 1)
imdb_2019 <- imdb %>%
 filter(year > 2018)

first_url <- "https://www.imdb.com/title/tt11214590/ratings/?ref_=tt_ov_rt"

page <- read_html(first_url)
USrating <- page %>%
   html_element(".ratingTable.noLeftBorder+ .ratingTable .bigcell") %>%
   html_text()
id <- page %>%
   html_element(".parent a") %>%
   html_attr("href") %>%
   str_sub(8, 17)
USvotes <- page %>%
   html_element(".ratingTable.noLeftBorder+ .ratingTable a") %>%
   html_text() %>%
   str_remove_all("\\ ")
nonUSvotes <- page %>%
   html_element(".ratingTable.noLeftBorder~ .noRightBorder a") %>%
   html_text() %>%
   str_remove_all("\\ ")
nonUSrating <- page %>%
   html_element(".ratingTable.noLeftBorder~ .noRightBorder .bigcell") %>%
   html_text()
first <- tibble(
   id = id,
   us_votes = USvotes,
   non_us_votes = nonUSvotes,
   us_rating = USrating,
   non_us_rating = nonUSrating
 )
scrape_page <- function(url){
   
 page <- read_html(url)
   
USrating <- page %>%
   html_element(".ratingTable.noLeftBorder+ .ratingTable .bigcell") %>%
   html_text()
   
id <- page %>%
   html_element(".parent a") %>%
   html_attr("href") %>%
   str_sub(8, 17)
 
USvotes <- page %>%
   html_element(".ratingTable.noLeftBorder+ .ratingTable a") %>%
   html_text() %>%
   str_remove_all("\\ ")
     
nonUSvotes <- page %>%
    html_element(".ratingTable.noLeftBorder~ .noRightBorder a") %>%
   html_text() %>%
   str_remove_all("\\ ")
     
nonUSrating <- page %>%
   html_element(".ratingTable.noLeftBorder~ .noRightBorder .bigcell") %>%
   html_text()
     
  tibble(
     id = id,
     us_votes = USvotes,
     non_us_votes = nonUSvotes,
     us_rating = USrating,
     non_us_rating = nonUSrating
  )
}
root <- "https://www.imdb.com/title/"
number <- imdb_2019$imdb_title_id
end <- "/ratings/?ref_=tt_ov_rt"
urls <- paste0(root, number, end)
USArating <- map_dfr(urls, scrape_page)

write_csv(USArating, path = "./data/imdb-user-ratings.csv")
