How does the country a film was made in affect iMDb ratings?
================
Calcutta_Coders

Introduction:

Our aim in this project is to find out how iMDb ratings compare for
films from different countries. We are using a data set called iMDb
movies that has come from kaggle. We will also compare how different
variables (title, year published, genre, budget, USA gross income,
Worldwide gross income, duration and actors) affect iMDb ratings and
also how many votes were cast for a film to recieve said rating.

Data analysis plan:

The outcome (response, Y) will be the average imdb ratings, The
predictor (explanatory, X) will be country. To properly explore these
realtionships we will use gross and worlwide income to see if the movie
did well worldwide or just in the us, we can also …

We will use comparison groups such as worldwide gross to see if this
film sold well worldwide or just in the US, if it did well worldwide

## Summary

Write-up of your project and findings go here. Think of this as the text
of your presentation. The length should be roughly 5 minutes when read
out loud. Although pacing varies, a 5-minute speech is roughly 750
words. To use the word count addin, select the text you want to count
the words of (probably this is the Summary section of this document, go
to Addins, and select the `Word count` addin). This addin counts words
using two different algorithms, but the results should be similar and as
long as you’re in the ballpark of 750 words, you’re good! The addin will
ignore code chunks and only count the words in prose.

You can also load your data here and present any analysis results /
plots, but I strongly urge you to keep that to a minimum (maybe only the
most important graphic, if you have one you can choose). And make sure
to hide your code with `echo = FALSE` unless the point you are trying to
make is about the code itself. Your results with proper output and
graphics go in your presentation, this space is for a brief summary of
your project.

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.3     ✓ dplyr   1.0.7
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   2.0.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    ##   imdb_title_id                                               title year
    ## 1     tt0000009                                          Miss Jerry 1894
    ## 2     tt0000574                         The Story of the Kelly Gang 1906
    ## 3     tt0001892                                      Den sorte drøm 1911
    ## 4     tt0002101                                           Cleopatra 1912
    ## 5     tt0002130                                           L'Inferno 1911
    ## 6     tt0002199 From the Manger to the Cross; or, Jesus of Nazareth 1912
    ##                       genre duration          country language
    ## 1                   Romance       45              USA     None
    ## 2   Biography, Crime, Drama       70        Australia     None
    ## 3                     Drama       53 Germany, Denmark         
    ## 4            Drama, History      100              USA  English
    ## 5 Adventure, Drama, Fantasy       68            Italy  Italian
    ## 6          Biography, Drama       60              USA  English
    ##                              director                                writer
    ## 1                     Alexander Black                       Alexander Black
    ## 2                        Charles Tait                          Charles Tait
    ## 3                           Urban Gad Urban Gad, Gebhard Schätzler-Perasini
    ## 4                  Charles L. Gaskill                      Victorien Sardou
    ## 5 Francesco Bertolini, Adolfo Padovan                       Dante Alighieri
    ## 6                       Sidney Olcott                         Gene Gauntier
    ##              production_company
    ## 1    Alexander Black Photoplays
    ## 2                J. and N. Tait
    ## 3                      Fotorama
    ## 4 Helen Gardner Picture Players
    ## 5                   Milano Film
    ## 6                 Kalem Company
    ##                                                                                                                                                                                  actors
    ## 1                                                                                                                                    Blanche Bayliss, William Courtenay, Chauncey Depew
    ## 2            Elizabeth Tait, John Tait, Norman Campbell, Bella Cola, Will Coyne, Sam Crewes, Jack Ennis, John Forde, Vera Linden, Mr. Marshall, Mr. McKenzie, Frank Mills, Ollie Wilson
    ## 3                                                                                              Asta Nielsen, Valdemar Psilander, Gunnar Helsengreen, Emil Albes, Hugo Flink, Mary Hagen
    ## 4 Helen Gardner, Pearl Sindelar, Miss Fielding, Miss Robson, Helene Costello, Charles Sindelar, Mr. Howard, James R. Waite, Mr. Osborne, Harry Knowles, Mr. Paul, Mr. Brady, Mr. Corker
    ## 5                                                                 Salvatore Papa, Arturo Pirovano, Giuseppe de Liguoro, Pier Delle Vigne, Augusto Milla, Attilio Motta, Emilise Beretta
    ## 6                                       R. Henderson Bland, Percy Dyer, Gene Gauntier, Alice Hollister, Samuel Morgan, James D. Ainsley, Robert G. Vignola, George Kellog, J.P. McGowan
    ##   avg_vote votes  budget usa_gross_income worlwide_gross_income metascore
    ## 1      5.9   154                                                       NA
    ## 2      6.1   589  $ 2250                                               NA
    ## 3      5.8   188                                                       NA
    ## 4      5.2   446 $ 45000                                               NA
    ## 5      7.0  2237                                                       NA
    ## 6      5.7   484                                                       NA
    ##   reviews_from_users reviews_from_critics
    ## 1                  1                    2
    ## 2                  7                    7
    ## 3                  5                    2
    ## 4                 25                    3
    ## 5                 31                   14
    ## 6                 13                    5

## Presentation

Our presentation can be found [here](presentation/presentation.html).

## Data

Include a citation for your data here. See
<http://libraryguides.vu.edu.au/c.php?g=386501&p=4347840> for guidance
on proper citation for datasets. If you got your data off the web, make
sure to note the retrieval date.

## References

List any references here. You should, at a minimum, list your data
source.
