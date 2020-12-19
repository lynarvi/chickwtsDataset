# Relationship Between Chick Weights by Feed Type: A Data Science Project

## Details

chickwts is a built-n data set in r that includes 2 variables and 71 observations, in which newly hatched chicks were randomly allocated into six groups, and each group was given a different feed suplement, namely:

* **horsebean**
* **linseed**
* **soyybeen**
* **sunflower**
* **meatmeal**
* **casein**

The following data and graphs displays the relationship between the type of feed and weight of the chicks in a six week period of time.

## Variables

* **weight** - numeric variable that holds the chick's given weight
* **feed** - a factor that gives the feed type 


## Packages installed

**dplyr** is a grammar of data manipulation providing a consistent set of verbs that help you solve the most common data manipulation challenges. These are combined naturally with `group_by()` which allows you to perform any operation "by group". 

    install.packages("dplyr")
 
**ggplot2** is a system for declaratively creating graphics, based on The Grammar of Graphics. You provide the data , tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

    install.packages(ggplot2)

The easiest way to install these two packages is to install the whole tidyverse package. But at this instance we will just separately install them.

# Viewing chickwts data set

    chickwts
  
  
  
         weight      feed
    1     179 horsebean
    2     160 horsebean
    3     136 horsebean
    4     227 horsebean
    5     217 horsebean
    6     168 horsebean
    7     108 horsebean
    8     124 horsebean
    9     143 horsebean
    10    140 horsebean
    11    309   linseed
    12    229   linseed
    13    181   linseed
    14    141   linseed
    15    260   linseed
    16    203   linseed
    17    148   linseed
    18    169   linseed
    19    213   linseed
    20    257   linseed
    21    244   linseed
    22    271   linseed
    23    243   soybean
    24    230   soybean
    25    248   soybean
    26    327   soybean
    27    329   soybean
    28    250   soybean
    29    193   soybean
    30    271   soybean
    31    316   soybean
    32    267   soybean
    33    199   soybean
    34    171   soybean
    35    158   soybean
    36    248   soybean
    37    423 sunflower
    38    340 sunflower
    39    392 sunflower
    40    339 sunflower
    41    341 sunflower
    42    226 sunflower
    43    320 sunflower
    44    295 sunflower
    45    334 sunflower
    46    322 sunflower
    47    297 sunflower
    48    318 sunflower
    49    325  meatmeal
    50    257  meatmeal
    51    303  meatmeal
    52    315  meatmeal
    53    380  meatmeal
    54    153  meatmeal
    55    263  meatmeal
    56    242  meatmeal
    57    206  meatmeal
    58    344  meatmeal
    59    258  meatmeal
    60    368    casein
    61    390    casein
    62    379    casein
    63    260    casein
    64    404    casein
    65    318    casein
    66    352    casein
    67    359    casein
    68    216    casein
    69    222    casein
    70    283    casein
    71    332    casein

