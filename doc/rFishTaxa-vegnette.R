## -----------------------------------------------------------------------------
options(warn = -1)
library("rFishTaxa")

## -----------------------------------------------------------------------------

species_family()


## -----------------------------------------------------------------------------
r1 <- search_cas(query = c("cyprinidae","balitoridae"),type = "genus_family")

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
library(magrittr)
r4 %>% dplyr::left_join(species_family()[,1:4],by = "family")


