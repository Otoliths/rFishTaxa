# rFishTaxa 

## Introduction

[`Eschmeyer's Catalog of Fishes`](https://www.calacademy.org/scientists/projects/catalog-of-fishes) is the authoritative reference for taxonomic fish names, featuring a searchable online database. This **rFishTaxa** package helps users to obtain valid taxonomic fish information for biodiversity estimates, conservation issues, etc.


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
```
****************************************
Eschmeyer's Catalog of Fishes online database show that the number of available names for use at the species level as of 8 August 2022 is 61,376, the number of valid genera is 5,229, and the number of valid species is 36,292, of which 18,372 are found in freshwater.
****************************************
# A tibble: 1,036 x 10
   class order family subfamily available_genera valid_genera genera_last_ten~ available_speci~ valid_species species_last_te~
   <chr> <chr> <chr>  <chr>                <int>        <int>            <int>            <int>         <int>            <int>
 1 Myxi~ Myxi~ Myxini Myxini                  NA           NA               NA               NA            NA               NA
 2 Myxi~ Myxi~ Myxin~ Myxinifo~               NA           NA               NA               NA            NA               NA
 3 Myxi~ Myxi~ Myxin~ Myxinidae               19            6                1              104            88               13
 4 Rubi~ Rubi~ Rubic~ Rubicund~                1            1                1                4             4                0
 5 Epta~ Epta~ Eptat~ Eptatret~               10            1                0               65            55               10
 6 Myxi~ Myxi~ Myxin~ Myxininae                8            4                0               35            29                3
 7 Petr~ Petr~ Petro~ Petromyz~               NA           NA               NA               NA            NA               NA
 8 Petr~ Petr~ Petro~ Petromyz~               NA           NA               NA               NA            NA               NA
 9 Petr~ Petr~ Petro~ Petromyz~               19            8                0              102            43                4
10 Geot~ Geot~ Geotr~ Geotriid~                9            1                0               14             2                0
# ... with 1,026 more rows
```

##### Searching for genera in a family:

```{r }
r1 <- search_cas(query = c("cyprinidae","balitoridae"),type = "genus_family")
head(r1)
```
```
# A tibble: 6 x 6
  query                    genus_author               genus          author        family     status    
  <chr>                    <chr>                      <chr>          <chr>         <chr>      <chr>     
1 asptosyax, B             Aaptosyax Rainboth 1991    Aaptosyax      Rainboth 1991 Cyprinidae Validation
2 yprininae, tribe         Labeo Cuvier 1816          Labeo          Cuvier 1816   Cyprinidae Synonym   
3 tautonymy, fifteen       Labeo Cuvier 1816          Labeo          Cuvier 1816   Cyprinidae Synonym   
4 ccrossocheilus, Kottelat Acrossocheilus Oshima 1919 Acrossocheilus Oshima 1919   Cyprinidae Validation
5 yprininae, tribe         Puntioplites Smith 1929    Puntioplites   Smith 1929    Cyprinidae Synonym   
6 genneiogarra, Kottelat   Ageneiogarra Garman 1912   Ageneiogarra   Garman 1912   Cyprinidae Validation
```

##### Searching for species in a family:

```{r }
r2 <- search_cas(query = "balitoridae",type = "species_family")
head(r2)
```
```
# A tibble: 6 x 6
  query                       species_author                                         species                     author        family status
  <chr>                       <chr>                                                  <chr>                       <chr>         <chr>  <chr> 
1 abbreviata, Homaloptera     Jinshaia abbreviata (Günther 1892)                     Jinshaia abbreviata         (Günther 189~ Balit~ Valid~
2 acuticauda, Sinohomaloptera Hemimyzon yaotanensis (Fang 1931)                      Hemimyzon yaotanensis       (Fang 1931)   Balit~ Synon~
3 amphisquamata, Homaloptera  Homalopterula amphisquamata (Weber & de Beaufort 1916) Homalopterula amphisquamata (Weber & de ~ Balit~ Valid~
4 anisura, Platycara          Balitora brucei Gray 1830                              Balitora brucei             Gray 1830     Balit~ Synon~
5 annamitica, Balitora        Balitora annamitica Kottelat 1988                      Balitora annamitica         Kottelat 1988 Balit~ Valid~
6 annandalei, Bhavania        Bhavania annandalei Hora 1920                          Bhavania annandalei         Hora 1920     Balit~ Valid~
```

##### Searching for species in a genus:

```{r}
r3 <- search_cas(query = "Brachyplatystoma",type = "species_genus")
head(r3)
```
```
# A tibble: 6 x 6
  query                        species_author                                    species                       author          family status
  <chr>                        <chr>                                             <chr>                         <chr>           <chr>  <chr> 
1 affine, Platystoma           Brachyplatystoma filamentosum (Lichtenstein 1819) Brachyplatystoma filamentosum (Lichtenstein ~ Pimel~ Synon~
2 capapretum, Brachyplatystoma Brachyplatystoma capapretum Lundberg & Akama 2005 Brachyplatystoma capapretum   Lundberg & Aka~ Pimel~ Valid~
3 cunaguaro, Ginesia           Brachyplatystoma juruense (Boulenger 1898)        Brachyplatystoma juruense     (Boulenger 189~ Pimel~ Synon~
4 dawall, Hypophthalmus        Brachyplatystoma vaillantii (Valenciennes 1840)   Brachyplatystoma vaillantii   (Valenciennes ~ Pimel~ Synon~
5 filamentosus, Pimelodus      Brachyplatystoma filamentosum (Lichtenstein 1819) Brachyplatystoma filamentosum (Lichtenstein ~ Pimel~ Valid~
6 gigas, Platystoma            Brachyplatystoma filamentosum (Lichtenstein 1819) Brachyplatystoma filamentosum (Lichtenstein ~ Pimel~ Synon~
```


##### Searching for species related to a species or subspecies:

```{r }
r4 <- search_cas(query = c("Anguilla nebulosa", "Clupisoma sinense"),type = "species")
head(r4)
r4 %>% dplyr::left_join(species_family()[,1:4],by = "family")
```
```
# A tibble: 2 x 9
  query                  species_author                    species           author          family      status     class    order subfamily
  <chr>                  <chr>                             <chr>             <chr>           <chr>       <chr>      <chr>    <chr> <chr>    
1 nebulosa, Anguilla     Anguilla nebulosa McClelland 1844 Anguilla nebulosa McClelland 1844 Anguillidae Validation Anguill~ Angu~ Anguilli~
2 sinensis, Platytropius Clupisoma sinense (Huang 1981)    Clupisoma sinense (Huang 1981)    Ailiidae    Validation Ailiidae Aili~ Ailiidae 
```

## :heart: Contribution

Latin-Chinese Dictionary of Fishes Names Introduction In the last 20-30 years, significant progress has been made in the work of fish. However the contents of a few published Latin-Chinese dictionaries of world's fish names are still incomplete and cannot satisfy the increasing demand by the Chinese language people for the purpose's such as research, teaching, conservation, fisheries, or aquatic trade use. Thus, we attempt to collect all currently valid fish species in the world from the literatures and give each genus and species a unique Chinese name. We hope that this dictionary can be used as the basis for the standardization of Chinese fish names for Chinese people in different regions such as China, Taiwan, and Hong Kong.

Future versions try to add [`Lantin-Chinese Dictionary of Fish Names by Classification System`](http://www.taiwan-fisheries.com.tw/news-preface-2e.htm) to this package.


Contributions to this package are welcome. 
The preferred method of contribution is through a GitHub pull request. 
Feel also free to contact us by creating [**an issue**](https://github.com/Otoliths/rFishTaxa/issues).
