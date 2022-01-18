mean(1:10)

favorite_number <- 42

# c means concatenate and creates a vector
#looking at sleeping times below
times <- c(7, 6, 5, 4, 9, 5.3)

mean(times)

minutes <- 60 * times

#if multiplying a vector by another vector, the operation will apply to each matched pair if they are the same length
length(times)

1:6 * times

rep(1:6)

#different lengths; do not do this!!
rep(1:6) * 1:10

?mean
#trim is used to cut off outliers at the bottom 5% etc

mean (c(times, NA), na.rm = TRUE)

#saying trim = .1 would delete 20% total, 10% from each end
mean (times, trim = .1)
sd (times)
range (times)

#comparisons
times < 6
times
times > 6
times
times == 6
times 
times <= 6
times
times != 6

#comparing two
results <- (c(TRUE, TRUE, FALSE))
correct <- (c(TRUE, TRUE, FALSE))
results == correct
all (results == correct)

which (times < 6)
times

#subsetting
times
times [1]
times
times [2:4]
times
times [times >= 6]

#if the second value in a vector is not reliable, you can make it NA
times
times [2] <- NA
times

times
times [times < 5] <- NA
times

mtcars

head(mtcars)
tail(mtcars)
str(mtcars)

#how to look at one vector/column of a data frame     $
mtcars$cyl

mpg <- mtcars [["mpg"]]
mpg <- mtcars$mpg

mean(mtcars$mpg)

#hello! this is jude on 1/18