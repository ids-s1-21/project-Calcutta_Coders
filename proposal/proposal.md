Project proposal
================
Calcutta_Coders

``` r
library(tidyverse)
library(broom)
library(ggridges)
```

## 1. Introduction

Our aim in this project is to find out how iMDb ratings compare for
films from different countries. We are using a data set called iMDb
movies that has come from kaggle. We will also compare how different
variables (title, year published, genre, budget, USA gross income,
Worldwide gross income, duration and actors) affect iMDb ratings and
also how many votes were cast for a film to recieve said rating.

## 2. Data

``` r
imdb <- read.csv(file = "../data/IMDb_movies.csv", header = TRUE, skip = 1)
glimpse(imdb)
```

    ## Rows: 85,855
    ## Columns: 19
    ## $ imdb_title_id         <chr> "tt0000009", "tt0000574", "tt0001892", "tt000210…
    ## $ title                 <chr> "Miss Jerry", "The Story of the Kelly Gang", "De…
    ## $ year                  <chr> "1894", "1906", "1911", "1912", "1911", "1912", …
    ## $ genre                 <chr> "Romance", "Biography, Crime, Drama", "Drama", "…
    ## $ duration              <int> 45, 70, 53, 100, 68, 60, 85, 120, 120, 55, 121, …
    ## $ country               <chr> "USA", "Australia", "Germany, Denmark", "USA", "…
    ## $ language              <chr> "None", "None", "", "English", "Italian", "Engli…
    ## $ director              <chr> "Alexander Black", "Charles Tait", "Urban Gad", …
    ## $ writer                <chr> "Alexander Black", "Charles Tait", "Urban Gad, G…
    ## $ production_company    <chr> "Alexander Black Photoplays", "J. and N. Tait", …
    ## $ actors                <chr> "Blanche Bayliss, William Courtenay, Chauncey De…
    ## $ avg_vote              <dbl> 5.9, 6.1, 5.8, 5.2, 7.0, 5.7, 6.8, 6.2, 6.7, 5.5…
    ## $ votes                 <int> 154, 589, 188, 446, 2237, 484, 753, 273, 198, 22…
    ## $ budget                <chr> "", "$ 2250", "", "$ 45000", "", "", "", "ITL 45…
    ## $ usa_gross_income      <chr> "", "", "", "", "", "", "", "", "", "", "", "", …
    ## $ worlwide_gross_income <chr> "", "", "", "", "", "", "", "", "", "", "", "", …
    ## $ metascore             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
    ## $ reviews_from_users    <dbl> 1, 7, 5, 25, 31, 13, 12, 7, 4, 8, 9, 9, 16, 8, N…
    ## $ reviews_from_critics  <dbl> 2, 7, 2, 3, 14, 5, 9, 5, 1, 1, 9, 28, 7, 23, 4, …

## 3. Data analysis plan

The outcome (response, Y) will be the average imdb ratings, The
predictor (explanatory, X) will be country. To properly explore more
relationships we will use gross and worlwide income to see if the movie
did well worldwide or just in the us. We can also take a look at how
factors such as genre, number of votes and duration impact the rating of
a movie. We can see how IMDb rates their films in comparison to another
rating site, metascore.

``` r
imdb_country <- imdb %>%
  mutate(country = case_when(
    country == "Hong Kong" ~ "Hong-Kong",
    genre == "South Korea" ~ "South-Korea",
    TRUE ~ country)) %>%
  separate_rows(country)
  
imdb_country %>%
  count(country) %>%
  arrange(desc(n))
```

    ## # A tibble: 226 × 2
    ##    country     n
    ##    <chr>   <int>
    ##  1 USA     34325
    ##  2 France   8311
    ##  3 UK       7490
    ##  4 India    6373
    ##  5 Italy    5056
    ##  6 Germany  4909
    ##  7 Japan    3701
    ##  8 Canada   3621
    ##  9 Spain    2731
    ## 10 Hong     1884
    ## # … with 216 more rows

``` r
imdb_country %>%
  filter(
    country == c("USA", "France", "UK", "India", "Italy", "Germany", "Japan", "Canada", "Spain", "Hong-Kong", "Turkey", "Belgium")
  ) %>%
  group_by(country) %>%
  summarise(
    mean_rating = mean(avg_vote, na.rm = TRUE),
    median_rating = median(avg_vote, na.rm = TRUE)
    ) %>%
  arrange(desc(mean_rating))
```

    ## Warning in country == c("USA", "France", "UK", "India", "Italy", "Germany", :
    ## longer object length is not a multiple of shorter object length

    ## # A tibble: 11 × 3
    ##    country mean_rating median_rating
    ##    <chr>         <dbl>         <dbl>
    ##  1 Japan          6.59          6.7 
    ##  2 Belgium        6.24          6.3 
    ##  3 France         6.24          6.4 
    ##  4 Germany        6.17          6.3 
    ##  5 India          6.14          6.4 
    ##  6 Italy          6.00          6.15
    ##  7 UK             5.99          6.2 
    ##  8 Spain          5.96          6.1 
    ##  9 Turkey         5.86          6.15
    ## 10 Canada         5.71          5.9 
    ## 11 USA            5.61          5.8

``` r
imdb_country %>%
  filter(country == c("USA", "France", "UK", "India", "Italy", "Germany", "Japan", "Canada", "Spain", "Hong-Kong", "Turkey", "Belgium")) %>%
  ggplot(aes(x = avg_vote, y = country)) +
  geom_density_ridges(alpha = 0.5)
```

    ## Warning in country == c("USA", "France", "UK", "India", "Italy", "Germany", :
    ## longer object length is not a multiple of shorter object length

    ## Picking joint bandwidth of 0.28

![](proposal_files/figure-gfm/data-analysis-country-1.png)<!-- --> After
filtering for the top 12 countries who produce the largest number of
films, the distribution of `avg_vote` is observed. The countries with
the higher ratings include Japan, Belgium, France, Germany and India.
Even though the USA has the largest number of films produced, their mean
rating is the lowest of these countries.

``` r
imdb_genre <- imdb %>%
  mutate(genre = case_when(
    genre == "Sci Fi" ~ "Sci-Fi",
    genre == "Film Noir" ~ "Film-Noir",
    TRUE ~ genre)) %>%
  separate_rows(genre)
  

imdb_genre %>%
  group_by(genre) %>%
  summarise(
    mean_rating = mean(avg_vote, na.rm = TRUE),
    median_rating = median(avg_vote, na.rm = TRUE)
    ) %>%
  arrange(desc(mean_rating))
```

    ## # A tibble: 28 × 3
    ##    genre       mean_rating median_rating
    ##    <chr>             <dbl>         <dbl>
    ##  1 Documentary        7.3            7.3
    ##  2 Film               6.64           6.7
    ##  3 Noir               6.64           6.7
    ##  4 Biography          6.62           6.7
    ##  5 History            6.54           6.6
    ##  6 War                6.43           6.6
    ##  7 News               6.4            6.4
    ##  8 Animation          6.38           6.6
    ##  9 Musical            6.25           6.4
    ## 10 Music              6.24           6.4
    ## # … with 18 more rows

``` r
imdb_genre %>%
  ggplot(aes(x = avg_vote, y = genre)) +
  geom_density_ridges(alpha = 0.5)
```

    ## Picking joint bandwidth of 0.252

![](proposal_files/figure-gfm/data-analysis-genre-1.png)<!-- --> This
graph reveals the distribution of `avg_vote`, which is the rating, for
every `genre`. As shown by the graph and the summary statistics, some
high rated genres include Documentary, Film Noir, Biography, History,
War and News. In these data analyses, films with multiple genres were
counted in each of their catagories.

``` r
imdb_income <- imdb %>%
  mutate( 
  worlwide_gross_income = na_if(worlwide_gross_income, "")) %>%
  transform(worlwide_gross_income = as.numeric(gsub("\\$", "", worlwide_gross_income)))
```

    ## Warning in eval(substitute(list(...)), `_data`, parent.frame()): NAs introduced
    ## by coercion

``` r
imdb_income %>%
  ggplot(aes(x = worlwide_gross_income, y = avg_vote)) +
  geom_point(alpha = 0.1) +
  theme(axis.text.x = element_text(angle = 90))
```

    ## Warning: Removed 54900 rows containing missing values (geom_point).

![](proposal_files/figure-gfm/data-analysis-income-1.png)<!-- --> This
graph explores the relationship between the `avg_vote` and
`worlwide_gross_income`. This graph has a weak positive association
suggesting that the more money that is gained from the film, the more
likely the film is to be rated well.

``` r
imdb %>%
  ggplot(aes(x = votes, y = avg_vote)) +
  geom_point(alpha = 0.1)
```

![](proposal_files/figure-gfm/data-analysis-votes-1.png)<!-- --> This
graph compared `avg_vote` to `votes`, which indicates a movie’s
popularity. This graph reveals a positive association, suggesting that
the more popular a film is the more likely it will be rated higher.

``` r
imdb %>%
  ggplot(aes(x = duration, y = avg_vote)) +
  geom_point(alpha = 0.1)
```

![](proposal_files/figure-gfm/data-analysis-duration-1.png)<!-- --> This
graph reveals there is little to no association between the `avg_vote`
and `duration` of a movie.

``` r
imdb %>%
  ggplot(aes(x = metascore, y = avg_vote)) +
  geom_point(alpha = 0.1)
```

    ## Warning: Removed 72550 rows containing missing values (geom_point).

![](proposal_files/figure-gfm/data-analysis-metascore-1.png)<!-- -->
This graph shows a positive association between the IMDb rating and the
metascore. The graph also reveals that IMDb often rate their moves less
than metascore rates them.
