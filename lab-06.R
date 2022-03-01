# Exercise 1 - Singer

songs <- read_csv("https://raw.githubusercontent.com/bwiernik/progdata-class/master/data/singer/songs.csv")
locations <- read_csv("https://raw.githubusercontent.com/bwiernik/progdata-class/master/data/singer/loc.csv")

(time <- as_tibble(songs) |> 
    rename(song = title))

(album <- as_tibble(locations) |> 
    select(title, everything()) |> 
    rename(album = release,
           song  = title))

# 1. We really care about the songs in time. But, for which of those songs do we know its corresponding album?

time |> 
  left_join(album, by = c("song", "artist_name"))

# 2. Go ahead and add the corresponding albums to the time tibble, being sure to preserve rows even if album info is not readily available.

time |> 
  FILL_THIS_IN(album, by = FILL_THIS_IN)

# 3. Which songs do we have “year”, but not album info?

time |> 
  FILL_THIS_IN(album, by = "song")

# 4. Which artists are in time, but not in album?

time |> 
  anti_join(album, by = "artist_name")

# 5. You’ve come across these two tibbles, and just wish all the info was available in one tibble. What would you do?

time |> 
  full_join(album, by = "song")

# Exercise 2 - LOTR

fell <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")
ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")
retk <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

#binding rows stacks data frames on top of each other (also matching by column)

bind_rows(fell, ttow)

#binding cols combines in a wider fashion --> "join" functions are superior

bind_cols(fell, ttow)

# 1. Stack these into a single tibble.

bind_rows(fell, ttow, retk)

# 2. Which races are present in “The Fellowship of the Ring” (fell), but not in any of the other ones?

fell |> 
  anti_join(ttow, by = "Race") |> 
  anti_join(retk, by = "Race")

# Exercise 3 - Set Operations

# Let’s use three set functions: intersect, union and setdiff. We’ll work with two toy tibbles named y and z, similar to Data Wrangling Cheatsheet

(y <-  tibble(x1 = LETTERS[1:3], x2 = 1:3))

(z <- tibble(x1 = c("B", "C", "D"), x2 = 2:4))

# 1. Rows that appear in both y and z

inner_join(y, z)

# 2. You collected the data in y on Day 1, and z in Day 2. Make a data set to reflect that.

full_join(
  mutate(y, day = "Day 1"),
  mutate(z, day = "Day 2")
)

# 3. The rows contained in z are bad! Remove those rows from y.

FILL_THIS_IN(FILL_THIS_IN, FILL_THIS_IN)
