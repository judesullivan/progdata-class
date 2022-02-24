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

# Exercise 2 - LOTR

fell <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")
ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")
retk <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

#binding rows stacks data frames on top of each other (also matching by column)

bind_rows(fell, ttow)

#binding cols combines in a wider fashion --> "join" functions are superior

bind_cols(fell, ttow)
