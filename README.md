# rFishTaxa 

## Introduction

`Eschmeyer's Catalog of Fishes` \url{https://www.calacademy.org/scientists/projects/catalog-of-fishes} is the authoritative reference for taxonomic fish names, featuring a searchable on-line database. This **rFishTaxa** package helps users to obtain valid taxonomic fish information for biodiversity estimates, conservation issues, etc.


## :arrow_double_down: Installation

### Current beta / GitHub release:

Installation using R package
[**devtools**](https://cran.r-project.org/package=devtools):
```r
if (!requireNamespace(c("devtools","tibble"), quietly = TRUE))
  install.packages("devtools","tibble")
    
devtools::install_github("Otoliths/rFishTaxa",build_vignettes = TRUE)

```

## :beginner: Example

##### Load the **rFishTaxa** package

```{r}
options(warn = -1)
library("rFishTaxa")
```

##### Genera/Species of Fishes by Family/Subfamily through 2022:

```{r }
species_family()
```


##### Searching for genera in a family:

```{r }
r1 <- search_cas(query = c("cyprinidae","balitoridae"),type = "genus_family")
head(r1)
```


##### Searching for species in a family:

```{r }
r2 <- search_cas(query = "balitoridae",type = "species_family")
head(r2)
```


##### Searching for species in a genus:

```{r}
r3 <- search_cas(query = "Brachyplatystoma",type = "species_genus")
head(r3)
```


##### Searching for species related to a species or subspecies:

```{r }
r4 <- search_cas(query = c("Anguilla nebulosa", "Clupisoma sinense"),type = "species")
head(r4)
r %>% dplyr::left_join(species_family()[,1:4],by = "family")
```


## :heart: Contribution

Latin-Chinese Dictionary of Fishes Names Introduction In the last 20-30 years, significant progress has been made in the work of fish. However the contents of a few published Latin-Chinese dictionaries of world's fish names are still incomplete and cannot satisfy the increasing demand by the Chinese language people for the purpose's such as research, teaching, conservation, fisheries, or aquatic trade use. Thus, we attempt to collect all currently valid fish species in the world from the literatures and give each genus and species a unique Chinese name. We hope that this dictionary can be used as the basis for the standardization of Chinese fish names for Chinese people in different regions such as China, Taiwan, and Hong Kong.

Future versions try to add [`Lantin-Chinese Dictionary of Fish Names by Classification System`](http://www.taiwan-fisheries.com.tw/news-preface-2e.htm) to this package.


Contributions to this package are welcome. 
The preferred method of contribution is through a GitHub pull request. 
Feel also free to contact us by creating [**an issue**](https://github.com/Otoliths/rFishTaxa/issues).
