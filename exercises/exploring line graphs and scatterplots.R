library (tidyverse)

#line graph

(mauna <- tsibble::as_tsibble(co2) |> 
  rename(month = index, conc = value))

ggplot(mauna) +
  aes(x = month, y = conc) +
  geom_line() +
  tsibble:: scale_x_yearmonth()

#scatter plot

palmerpenguins::penguins

ggplot(penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) +
  geom_point() + 
  geom_smooth()

#to make the line straight

ggplot(penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) +
  geom_point() + 
  geom_smooth(method = lm)

#You can control aesthetics for individual layers by adding an aes() inside the layer function, like this:

ggplot(penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) +
  geom_point(aes(color = species)) + 
  geom_smooth()

ggplot(penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) +
  geom_point(aes(color = "blue")) + 
  geom_smooth()

ggplot(penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) +
  geom_point() + 
  geom_smooth(aes(color = species), method = lm)

#assigning muana plot to p; how to avoid running a whole plot each time -> just assign it to a variable

p <- ggplot(mauna) +
  aes(x = month, y = conc) +
  geom_line() +
  tsibble:: scale_x_yearmonth()

p

p +
  geom_smooth(color = "darkgreen")

#fixing graphs

library(gapminder)

ggplot(gapminder) +
  geom_point(x = gdpPercap, y = lifeExp, alpha = 0.1)

#fixed

ggplot(gapminder::gapminder) +
  aes(x = gdpPercap, y = lifeExp)
  geom_point(alpha = 0.1)

#second example
  
ggplot(cars) +
  geom_point(aes(x = speed, y = dist, color = "blue"))