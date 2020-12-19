> library("dplyr")
> library("ggplot2")
> 
> chickwts
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
> 
> nrow(chickwts)
[1] 71
> 
> head(chickwts)
  weight      feed
1    179 horsebean
2    160 horsebean
3    136 horsebean
4    227 horsebean
5    217 horsebean
6    168 horsebean
> 
> chickwts$weight
 [1] 179 160 136 227 217 168 108 124 143 140 309 229 181 141 260 203 148 169 213
[20] 257 244 271 243 230 248 327 329 250 193 271 316 267 199 171 158 248 423 340
[39] 392 339 341 226 320 295 334 322 297 318 325 257 303 315 380 153 263 242 206
[58] 344 258 368 390 379 260 404 318 352 359 216 222 283 332
> 
> chickwts$feed
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
> 
> levels(chickwts$feed)
[1] "casein"    "horsebean" "linseed"   "meatmeal"  "soybean"   "sunflower"
> 
> 
> sapply(chickwts,class)
   weight      feed 
"numeric"  "factor" 
> 
> 
> chick_data = as_tibble(chickwts)
> chick_data
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
> 
> weight_feed = chick_data %>%
+ ggplot(aes(x=feed,y=weight, fill=feed))+
+ geom_boxplot()+ scale_fill_brewer(palette="BuPu") +
+ theme(legend.position = "none") +
+ labs(title = "Relationship Between Chick Weight & Type of Feed", x="Feed Type", y="Weight in Grams")
> 
> weight_feed
> 
> 
> num_feed = ggplot(chick_data, aes(x=as.factor(feed),fill=as.factor(feed))) +
+ geom_bar() + scale_fill_brewer(palette = "Set3")
> 
> num_feed
> num_feed + theme(legend.position = "none")+
+ labs(title = "Number of Chicks Fed by Each Type of Feed", x = "Feed Type", y = "Number of Chicks")
> 
> 
> Summarize = chick_data %>% group_by(feed)
> Summarize
# A tibble: 71 x 2
# Groups:   feed [6]
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
> 
> summarized = Summarize %>% summarise(min=min(weight),max=max(weight),mean=min(weight))
`summarise()` ungrouping output (override with `.groups` argument)
> summarized
# A tibble: 6 x 4
  feed        min   max  mean
  <fct>     <dbl> <dbl> <dbl>
1 casein      216   404   216
2 horsebean   108   227   108
3 linseed     141   309   141
4 meatmeal    153   380   153
5 soybean     158   329   158
6 sunflower   226   423   226
> 
> 
> 
> minimum = summarized %>%
+ ggplot(aes(x=feed, y=min)) + geom_point(color = "red")
> minimum
> minimum + labs(title = "Minimum Weight by TYpe of Feed", y = "Chick Weight(grams)", x = "Feed Type") + theme_minimal()
> 
> 
> maximum = summarized %>%
+ ggplot(aes(x=feed,y=max)) + geom_point(color = "blue") +
+ labs(title = "Maximum Weight by Type of Feed", x="Feed Type",y="Chick Weight (grams)") + theme_minimal()
> maximum
> 
> 
> mean_weight = summarized %>% 
+ ggplot(aes(x=feed,y=mean))+
+ geom_point(color="magenta")
> mean_weight +labs(title = "Mean Weight by Type of Feed",y="Chick Weight (grams)",x="Feed Type")+
+ theme_minimal()
> 
> 
