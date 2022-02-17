#Pivoting 2/17

#Lab 5A

library(tidyverse)

lotr  <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv") |> 
  rename(Species = Race)

#widen by species

(lotr_wide <- lotr |> 
    pivot_wider(id_cols = c(-Species, -Words), 
                names_from = Species, 
                values_from = Words))

#relengthen into one singular species column

lotr_wide |> 
  pivot_longer(cols = c(Elf, Hobbit, Man), 
               names_to  = "Species", 
               values_to = "Words")