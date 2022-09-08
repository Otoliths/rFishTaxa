## ----global-------------------------------------------------------------------
options(warn = -1)
library(rFishTaxa)
library(magrittr)
library(dplyr)

## -----------------------------------------------------------------------------
db <- species_family()

head(db)

## -----------------------------------------------------------------------------
r1 <- search_cas(query = c("cyprinidae","balitoridae"),type = "genus_family")

head(r1)

# Each matching row by family
db$family <- ifelse(!is.na(db$subfamily),paste0(db$family,"_",db$subfamily),db$family)
r1 <- r1 %>% left_join(db[,1:4],by = "family")
r1$family <- gsub("_.*","",r1$family)
head(r1)


## -----------------------------------------------------------------------------
r2 <- search_cas(query = "balitoridae",type = "species_family")

head(r2)

## -----------------------------------------------------------------------------
r3 <- search_cas(query = "Brachyplatystoma",type = "species_genus")

head(r3)

## -----------------------------------------------------------------------------
r4 <- search_cas(query = c("Anguilla nebulosa", "Clupisoma sinense"),type = "species")

head(r4)

# Each matching row by family
r4 %>% left_join(species_family()[,1:4],by = "family")


