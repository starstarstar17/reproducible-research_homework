# Reproducible research: version control and R

## Version Control Assignment Answers Q4-5

### Q1/2/3) 

Answers in 'logistic_growth' repo: https://github.com/starstarstar17/logistic_growth/tree/main

### Q4) 

a) From the graphs showing paths of two random walks, I can observe that both seem to exhibit a spontaneous, jagged pattern where each step is unpredictable. These features are generally characteristic of brownian motion. Neither one of the walks seem to follow a clear direction from their distinct starting positions (shown by (0,0) coordinates) but both often seem to turn around a minimal space at certain points. For example, one of the walks stays within a limited space and keeps turning around their initial position, and also in the middle of the walk, whilst the other walk seems to walk away from their initial position quite rapidly but then turns and forms clusters of movement on the graph during the middle of their walk (~300s). The difference in spans of the x and y coordinate ranges suggest that there may be a difference in limits to movements (it is unclear if the walks are stimulated to all be independent or by the same individual). 


b) When computing a sequence of "random" numbers in which the same sequence of random numbers is produced every time the code is run, a random number generator based on a mathematical algorithm is used. Whilst the numbers generated may appear random, they are deterministic due to the algorithmic nature because a 'random seed' acts as a starting point and initial value for the algorithm. Setting this specific seed is essential for reproducibility in stimulations, debugging and reviewing experiments. 


c) Edited script making reproducible stimulation of Brownian Motion, file commited and pushed to fork of reproducible_research.homework rep.



d)

<img width="740" alt="Screenshot 2024-12-12 at 20 33 13" src="https://github.com/user-attachments/assets/d1c4c323-ee15-47d4-b1dd-a7eb991167b3" />




### Q5) 

a) The table containing the data for the dsDNA viruses has 33 rows and 13 columns. 

b) To fit a linear model to the virus data, a logarithmic transformation can be applied. This transformation was applied to 'Virion Volume' and 'Genome Length' variables on the Posit Cloud code. 

c)
* The exponent (β) and scaling factor (α) of the allometric law for dsDNA viruses can be obtained by fitting a linear model to the virus data and inputting the relevant linear coefficients into the allometric equation: 

   $V = \alpha L^{\beta}$

   The exponent (β) represents the rate of scaling between genome length and virion volume and is obtained from the coefficient for log genome length.

   **exponent (β) = 1.52 (2.d.p)**
   p-value = 6.44 x 10^-10 -> highly statistically significant


   The scaling factor (α) adjusts the proportionality based on the units and biological constraints and is obtained from exponentiating the intercept from the linear coefficient    summary. 

   **scaling factor (α) = 1180.12**
   p-value = 2.28 x 10^-10 -> highly statistically significant. 


* Compared to the values found in Table 2 of the paper, β = 1.52 (1.16–1.87) and α = 1,182 (246–5,675), the exponent that I computed was the same and the scaling factor only 2 less.


d) ## Code to reproduce figure ##

library(ggplot2) #Load ggplot2

ggplot(virus_data, aes(x = log_genome_length, y = log_virion_volume)) +
  geom_point(size = 2, colour = "black") +                #Change size and colour of data points 
  geom_smooth(method = "lm", colour = "blue", fill = "grey", alpha = 0.2) +  # Add the lm regression line with CI
  labs(
    x = "log [Genome length (kb)]",
    y = "log [Virion volume (nm3)]"
  ) +
  theme_minimal() + 
  theme(
    axis.title.x = element_text(face = "bold"),           # Make x-xis and y-axis bold
    axis.title.y = element_text(face = "bold")           
  )                                     

e) The estimated volume of a 300kb dsDNA virus can be obtained using the allometric linear relationship:

$log(V) = log(α) + βlog(L)$

Substitute in known parameters from linear model: 

log(V) = 7.0748 + (1.5152 X log(300))

V = e^10.8281341252 ≈ **6.70 x 10^6 nm^3**


## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers (also make sure that your username has been anonymised). All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points) \
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
