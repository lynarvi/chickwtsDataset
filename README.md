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

## Codes

### Viewing chickwts data set

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

### Row Count

We use `nrow()` to know how many rows are the in the data set.

    nrow(chickwts)
    [1] 71
    
### Head Count

We use **`head()`** for displaying the first 6 columns of the data set.

    head(chickwts)
 
         weight   feed
    1    179 horsebean
    2    160 horsebean
    3    136 horsebean
    4    227 horsebean
    5    217 horsebean
    6    168 horsebean
    
### Selecting weight column

    chickwts$weight
    
    [1] 179 160 136 227 217 168 108 124 143 140 309 229 181 141 260 203 148 169 213
    [20] 257 244 271 243 230 248 327 329 250 193 271 316 267 199 171 158 248 423 340
    [39] 392 339 341 226 320 295 334 322 297 318 325 257 303 315 380 153 263 242 206
    [58] 344 258 368 390 379 260 404 318 352 359 216 222 283 332

### Selecting feed column

    chickwts$feed
    
     [1] horsebean horsebean horsebean horsebean horsebean horsebean horsebean
     [8] horsebean horsebean horsebean linseed   linseed   linseed   linseed  
    [15] linseed   linseed   linseed   linseed   linseed   linseed   linseed  
    [22] linseed   soybean   soybean   soybean   soybean   soybean   soybean  
    [29] soybean   soybean   soybean   soybean   soybean   soybean   soybean  
    [36] soybean   sunflower sunflower sunflower sunflower sunflower sunflower
    [43] sunflower sunflower sunflower sunflower sunflower sunflower meatmeal 
    [50] meatmeal  meatmeal  meatmeal  meatmeal  meatmeal  meatmeal  meatmeal 
    [57] meatmeal  meatmeal  meatmeal  casein    casein    casein    casein   
    [64] casein    casein    casein    casein    casein    casein    casein   
    [71] casein   
    Levels: casein horsebean linseed meatmeal soybean sunflower

### Determining feed levels

    levels(chickwts$feed)
    
    [1] "casein"    "horsebean" "linseed"   "meatmeal"  "soybean"   "sunflower"

### Classification of the variables

    sapply(chickwts,class)
    
    weight      feed 
    "numeric"  "factor" 

### Tibbled Data set

We use **`as_tibble()`** for instant creation of data frames.

    chick_data = as_tibble(chickwts)
    chick_data
    
    # A tibble: 71 x 2
        weight feed     
        <dbl> <fct>    
     1    179 horsebean
     2    160 horsebean
     3    136 horsebean
     4    227 horsebean
     5    217 horsebean
     6    168 horsebean
     7    108 horsebean
     8    124 horsebean
     9    143 horsebean
    10    140 horsebean
    # ... with 61 more rows

## Plotting

### Boxplot

The boxplot compactly displays the distribution of a continuous variable. It visualises five summary statistics (the median, two hinges and two whiskers), and all "outlying" points individually.

We will use **`geom_boxplot()`** to find the outliers and looking at the symmetry of the distribution.

    weight_feed = chick_data %>%
    + ggplot(aes(x=feed,y=weight, fill=feed))+
    + geom_boxplot()+ scale_fill_brewer(palette="BuPu") +
    + theme(legend.position = "none") +
    + labs(title = "Relationship Between Chick Weight & Type of Feed", x="Feed Type", y="Weight in Grams") 
    weight_feed

<div align="left">
    <img width="1024" height="690"
         src="https://github.com/lynarvi/chickwtsDataset/blob/main/relationship%20of%20the%20variables.jpeg">
<div/>

### Geom_bar 

`geom_bar()` was used as it counts the number of cases at each "x" position, in this case the "x" position is the number of times each type feed was used. This translates into the number of chicks that were fed by a particular type of feed.

    num_feed = ggplot(chick_data, aes(x=as.factor(feed),fill=as.factor(feed))) +
    + geom_bar() + scale_fill_brewer(palette = "Set3") +
    + theme(legend.position = "none")+
    + labs(title = "Number of Chicks Fed by Each Type of Feed", x = "Feed Type", y = "Number of Chicks")
    num_feed

<div align="left">
    <img width="586" height="586"
         src="https://github.com/lynarvi/chickwtsDataset/blob/main/number%20of%20chicks%20fed%20by%20type%20of%20feed.jpeg">
<div/>

