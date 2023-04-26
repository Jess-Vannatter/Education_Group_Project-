# Education Group Project

# Overview
## Topic
The project will focus will focus on the education field, specifically mathematics achievement. Two of the three members are currently classroom teachers and are passionate about student learning. 

## Question
What factors best predict mathematics achievement?
Are there differences in math achievement by different demographic features?

## Data 
### Source 
Initially, we hoped to investigate data from the National Assessment of Educational Progress (NAEP). After exploring the website, it became clear we were more interested in individual student data which was not readily accessible. We chose to use a "fictional" dataset due to the ethical and legal concerns regardinng using real student data. The data was generated from the following website (http://roycekimmons.com/tools/generated_data/exams) which provides data solely for data science training purposes. This data set includes scores from three exams and a variety of personal, social, and economic factors that have interaction effects upon them.

### Data Dictionary
The dataset that we chose is a simulated dataset that contains information on mathematics performance/achievement of high school students. The dataset includes their scores in Math, reading, and writing and other demographic information. 
![Alt text](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Erica_dev/Resources/Data_Dictionary.png)

## Technologies, Languages, Tools, & Algorithms
* Python 
* SQL
* Jupyter Lab/ Notebook
* PostgreSQL/ PGAdmin
* Google Docs -QuickDB
* Google Slides
* PANDAS
* SKlearn
* IMBlearn
* Plotly
* Numpy
* Matplotlib
* SQL Alchemy
* Logistic regression
* Balanced Random Forrest

## Communication Protocol
We created a small group channel in Slack. The expectation is that responses to a post is made by end of day. It is expected that group members would check Slack minimally, once per day. The protocol can be revisited during each class meeting to determine if it is meeting the group's needs. In addition, we created a Google Drive to house relevant Google Sheets, Google Slides, and Segment Rubrics. In addition, we have committed to using designated class time efficiently, ensuring roles and tasks are clear.

# Data Exploration: Technical Work
## Splitting Data
Our initial data set came as one table. To meet project criteria, our goal was to split the data in to two tables containing demographic information of the students (Ethnicity, parental educational level, standard/ Free lunch (socio-eco), sex, and test preparation) and test scores (math, writing, and reading scores) respectively titled "demographics" and "exam_scores".  As a group, we discussed initial superficial updates to the data set including consistently naming columns. We also simplified naming of certain demographic descriptions for the sake of clarity. 

Jess utilized PANDAS and various techniques to successfuly extract and formulate the two desired tables( which can be referred to in the Resources folder on his git hub). In partuicular Jess used Regex to clean up the data set and allow it to be used later in the project. Please refer to the "Splitting_data.ipynb" file in the following location: https://github.com/Jess-Vannatter/Education_Group_Project-/tree/Jess_Dev/Resources

## SQL Work
Please refer to files table_joins.sql and QuickDBD-export.sql. The Quick Db website was utilized to assist with ERD compilation. Then the export code from QuickDB was used to build tables in SQL.
  
  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/200d54bcedd987322a155e07bc714eb0361fa122/Resources/QuickDBD-exams.png)

  ```
  CREATE TABLE "exam_scores" (
    "Student_ID" INT   NOT NULL,
    "Math_Score" INT   NOT NULL,
    "Reading_Score" INT   NOT NULL,
    "Writing_Score" INT   NOT NULL,
    CONSTRAINT "pk_exam_scores" PRIMARY KEY (
        "Student_ID"
     )
);

CREATE TABLE "demographics" (
    "Student_ID" INT   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "Ethnicity" VARCHAR   NOT NULL,
    "PLE" VARCHAR   NOT NULL,
    "Lunch" VARCHAR   NOT NULL,
    "Test_Prep" VARCHAR   NOT NULL
);

ALTER TABLE "exam_scores" ADD CONSTRAINT "fk_exam_scores_Student_ID" FOREIGN KEY("Student_ID")
REFERENCES "demographics" ("Student_ID");
```

Next, "exam_scores" table and "demographics" table were joined in SQL to create our intial data set, "Student_exams"
  ```
  SELECT "demographics"."Student_ID",
"demographics"."Sex",
"demographics"."Ethnicity",
"demographics"."PLE",
"demographics"."Lunch",
"demographics"."Test_Prep",
"exam_scores"."Math_Score",
"exam_scores"."Reading_Score",
"exam_scores"."Writing_Score"
INTO Student_exams
FROM "demographics"
JOIN "exam_scores" ON "demographics"."Student_ID" = "exam_scores"."Student_ID";
```

## Exploratory Data Analysis
Once the tables were joined in SQL, the data was imported into Jupyter Notebook. A basic analysis was carried out in an attempt to learn about our data by getting the shape and using ```.info()``` to see null values and data types. In addition it was determined that there were no duplicate rows with ```.duplicated()```. Next Jess employed for loops to get the value counts and modes for the different catagorical values. This was specifically helpful because it listed the values for each catagorical feature in one output (See below). In addition, we attained the modes for each category which printed the value that appeared most often common in each respective column.
  
  - **Value Counts**
   
  ![image](https://user-images.githubusercontent.com/117245167/233054765-da374cb2-a3b9-4a89-9033-4bd2fd2c7e37.png)
  
  - **Mode**
   
  ![image](https://user-images.githubusercontent.com/117245167/233056421-b39a25fe-e204-4339-9cbb-7ee6230e3281.png)
  
Based on our definition of a "passing" math score (70 or higher), a dataframe was extracted showing just the passing students. 
  
  ![image](https://user-images.githubusercontent.com/117245167/233055155-1f8f22b6-0aac-4bb5-b07f-cee20cbde2c3.png)

A function was created to print the outliers of the "Math_score" column, which when applied to the data set revealed 6 statistical outliers that were outside the lower fence using the Interquartile Rule.
  
  ![image](https://user-images.githubusercontent.com/117245167/233055852-b77a2337-7036-4366-94df-ff71700eb234.png)

Addtional exploratory data analysis was conducted in Tableau to investigate data distribution, correlations, and patterns. A linear trend model was computed using the Math and Reading scores, producing the results seen in the images below. The data are strongly and positively correlated with a Pearson's R of 0.89 and a least squares regression line of prediceted math score = 17.86 + 0.77 (Reading Score). The coeffient of determination accounts for approximately 67% of the variance in the predicted Math Score.

  ![image]()
  
A linear trend model was computed using the Math and Writing scores, producing the results seen in the images below. The data are strongly and positively correlated with a Pearson's R of 0.82 and a least squares regression line of prediceted math score = 13.94 + 0.81 (Reading Score). The coeffient of determination accounts for approximately 82% of the variance in the predicted Math Score.

  ![image]()

The distribution of Math Score data appears approximtely normal when divided by male/female data. 

  ![image]()

## Logistic_regression
Please refer to "Mock_Logistic_Regression.ipynb". After analyzing the data, Jess ran an initial Logistic regression model to see if and how efficiently we would be able to determine the math scores of the students based on the features/ columns in the Student_exams data set/ table. The initial step taken for this was to convert the "Math_Score" column in to 1's and 0's based on the student's score in relation to being above/ below a score of 70. Scores of 70 or greater were assigned a 1 and anything below 70 was assigned a 0. Next Jess created the features and placed them into the X variable and the target feature (Math_score) into the y variable. He double checked the "X" dtypes and the value counts of "y". Once it was determined that the variables were correctly allocated, I instantiated the train_test_split and applied random oversampling to the data set. Next the model was trained on the data set and calculated the results (which can be seen below).
 
 ![image](https://user-images.githubusercontent.com/117245167/233060496-13d702a4-f328-46a3-8ecb-cfff5b049d5e.png)


## Balanced_Random_forest/ Feature Importances
In addition to the Logistic regression model, a balanced random forest model was run on the data to compare accuracy scores and to also retrieve the feature importances. The feature importances may be an important detail in answering our intial question of determining which features best predicted the math test scores. The code found in the "Bala_Rando_Forest.ipynb" file essentially was an initial boiler plate when compared to the logistic regression code. Next the math_score column was converted, the features and targets were created, and the train_test_split. Then instead of sampling the data via random oversampling, a balanced Random Forest Classifier was applied to obtain the balanced accuracy score and Geometric mean. Please see the reults below:
 
 ![image](https://user-images.githubusercontent.com/117245167/233061911-5e9470fa-c455-4e19-965d-67fc94470d3d.png)

Lastly, the feature importances of the data set were pulled out and inspected to help determine which features impacted the predictablility the most, which can be seen below:
 
 ![image](https://user-images.githubusercontent.com/117245167/233062144-2e06cf76-72be-4dab-baf0-cbeeafd63cba.png)

# 


# Formal Presentation
[Work-in-Progress](https://docs.google.com/presentation/d/1Kom-E46sPTH8pOhf19zlzoUs71fJabneA08JeBoC3dM/edit?usp=sharing)

