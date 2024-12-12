## Q4) Code for simulating reproducible Brownian Motion ##

# Install packages if needed
install.packages("ggplot2")
install.packages("gridExtra")

# Load relevant packages
library(ggplot2)
library(gridExtra)

# Random walk function with added seed parameter
random_walk <- function(n_steps, seed = NULL) {
  
  # Set the random seed 
  if (!is.null(seed)) {
    set.seed(seed)
  }
  

  df <- data.frame(x = rep(NA, n_steps), 
                   y = rep(NA, n_steps), 
                   time = 1:n_steps)
  

  df[1, ] <- c(0, 0, 1)
  
 
  for (i in 2:n_steps) {
    h <- 0.25  # Step size
    angle <- runif(1, min = 0, max = 2 * pi)  
    df[i, 1] <- df[i - 1, 1] + cos(angle) * h 
    df[i, 2] <- df[i - 1, 2] + sin(angle) * h  
    df[i, 3] <- i  
  }
  
  return(df)
}

# Generate two reproducible random walks with seeds
data1 <- random_walk(500, seed = 123)  # Using seed 123
data2 <- random_walk(500, seed = 456)  # Using seed 456

# 1st random walk plot
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  geom_path(aes(colour = time)) +
  theme_bw() +
  xlab("x-coordinate") +
  ylab("y-coordinate") +
  ggtitle("1st Random Walk")

# Second random walk plot
plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  geom_path(aes(colour = time)) +
  theme_bw() +
  xlab("x-coordinate") +
  ylab("y-coordinate") +
  ggtitle("2nd Random Walk")

grid.arrange(plot1, plot2, ncol = 2)
    