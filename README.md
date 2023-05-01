# Education_Group_Project
## Topic - Mathematics Achievement
Our group decided to focus our final project on Mathematics Achievement.  Having two math teachers in the group with firsthand knowledge of the challenges that students and teachers face when it comes to Mathematics Education; we began to search for data that might begin to shed some light on the factors that promote and/or detract from Mathematics achievement.  So much has been hypothesized, and experienced regarding success factors in Mathematics; however, we wanted to use our new skills to collect some empirical evidence.

## Data Set 
We went directly to the National Assessment of Educational Progress (NAEP) website to gather some data.  After using their query interface and attempting to download data, we quickly identified that we could easily get overwhelmed with data collection due to the vastness of the NAEP data.  We then pursues a more streamlined datasource so that we could focus more on the question at hand.
### Data Dictionary
The dataset that we chose is a simulated dataset that contains information on mathematics performance/achievement of high school students. The dataset includes their scores in Math, reading, and writing and other demographic information. 
![Alt text](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Erica_dev/Resources/Data_Dictionary.png)


## Analysis Question(s)
Our primary question is : What factors best predict mathematics achievement/performance for High School Math Students?
Additional, questions that we might be able to answer or shed some light on are as follows:

    - What factors indicate Mathematics achievement/Performance for High School Math Students
    - What factors are more important, Student Factors, Environmental/Demographics, of Instructional (School Setting, Class Size, Co-Taught)
    - Are there any factors that are not present, but can be inferred based existing data?
    - Are there any factors that we have believed intuitively , but show to be insignificant

?

## Tools
PostgreSQL
Tableau
Python Scikit Learn Library - Logistic Regression

## The Plan
Supervised Machine Learning, categorical?

## Exploratory Analysis
Outside of the pre-model development data cleansing, I chose to explore and understand the data by generating simple tables, dashboards, and drill downs in Tableau.
[link to story] https://public.tableau.com/app/profile/erica.jackson7297/viz/EDA_MathAchievemtn/FinalStory#1
Observations from the Exploratory Analysis are as follows:
### Gender

### Ethnicity

### Parent's Level of Education
Although Math Achievment seems to increases slightly as PLE increases, the 

### Test Prep
Although Math Achievment seems to increases slightly for students that have taken a Test Prep course; this lift in Math Achievement due to Test Prep seems more pronounced for Students in Ethnicity E.  Overall No Test prep is 44% Proficient, while Test Prep is 51% Proficient. For Ethnicity E, No Test Prep is 67% Proficient vs. Test Prep at 78% Proficient.

## Next Steps
  1. Dataset - If we had to do this project all again, we would most likely pick a different data source in order to get more features/factors.  We initially started researching the NAEP data, but it turned about to be overwhelming because there was so much data.  Due to the time constraints of the project we decided to go with a more streamlined dataset.
  2. Data Cleaning - Our dataset was already very streamlined. Primarily, because it is simulated data.  After exploring the data and looking at the features/factors versus the dependent, Math Score, there were probably some additional grouping that we could have done on some of the categorical features. For example, some of the ethnicities seem to perform very similiar. 
  3. Data Cleaning - Again, if we had a dataset with more features, I could definitely see more time spent on data wrangling and being more selective about including features.  This is assuming we have a good number of features so that we have more to choose from.

## Model Usage
While this model is very useful as an educator to help make general observations and possibly general instructional decisions, it most likely cannot be used to make individualized decision for students as some of these features could be considered prohibited basis and lead to tracking. If we wanted to use this model for things like differentiation, lesson planning, etc. we would have to remove any features/factors that could be considered as a prohibited basis (ie. race, gender, income, etc.).
