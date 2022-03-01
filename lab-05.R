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

#Lab 5B

library(tidyverse)
set.seed(123)
missing_w2_parent <- sample(1:500, 30)
missing_w2_child <- c(missing_w2_parent[1:5], sample(1:500, 25))
family  <- read_csv(
  "https://raw.githubusercontent.com/bwiernik/progdata/main/inst/tutorials/data/family_data.csv"
) |> 
  mutate(
    across(
      starts_with("w2") & contains("parent"),
      ~ ifelse(family_id %in% missing_w2_parent, NA_real_, .x)
    ),
    across(
      starts_with("w2") & contains("child"),
      ~ ifelse(family_id %in% missing_w2_child, NA_real_, .x)
    )
  )

family |> 
  DT::datatable(rownames = FALSE)


# 1. Reshape the dataset to a “longer” format.
#      Make each row 1 score
#      Have columns for family_id, family_member, wave, scale, and score.

family_longest <- family |> 
  pivot_longer(
    cols = w1_comm_parent:w2_satis_child,
    names_to = c("wave", "scale", "family_member"), 
    names_sep = "_",
    values_to = "score"
  )

print(family_longest)

# 2. Reshape the dataset to a “longer” format.
#      Make each row 1 person
#      Have columns for family_id, family_member, wave, comm, and satis.

family_long <- family |> 
  pivot_longer(
    cols = w1_comm_parent:w2_satis_child,
    names_to = c("wave", ".value", "family_member"), 
    names_sep = "_",
    values_to = c("comm", "satis")
  )

print(family_long)

# 3. Some families are missing wave 2 data for parent, child, or both. 
#     Which families are missing wave 2 data for at least one person?
#       Question: Is is easier to easier to find the missing data in the wide or long format?

family:family_id

is.na(family) 

family |> 
  group_by(family_id) |> 
  which(is.na(c(family)))


#use filter instead



