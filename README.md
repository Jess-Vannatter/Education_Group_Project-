# Education_Group_Project-
Group Project

## Data Set 
We chose to use a "fictional" dataset due to the ethical and legal concerns about using real student data. The data was generated from the following website (http://roycekimmons.com/tools/generated_data/exams).

## Question
What factors best predict mathematics achievement?

## Action Plan
Use ML model to determine which faeatures/ factors best determine highre math score achievment.

## Languages
- Python 
- SQL

## Tools
- PostgreSQL/ PG Admin
- Google Docs
 -QuickDB
- Jupyter Lab
- Tableau

## Libraires
- PANDAS
- SKlearn
- IMBlearn
- Plotly
- Numpy
- Matplotlib
- SQL Alchemy

## Algorithms/ ML tested
- Logistic regression
- Balanced Random Forrest


# Technical Work
## Splitting Data
  - Our initial data set came as one table. To meet project criteria our goal was to split the data in to  two tables containing demographic information of the students (Ehtnicity, parental edu., standard/ Free lunch (socio-eco), Sex, and test preparation) and test scores (Math. writing, and Reading scores) respectivly - "demographics" and "exam_scores". Please refer to the "Splitting_data.ipynb" file. I Utilized PANDAS and various techniques to successfuly extract and formulate the two desired tables( which can be referred to  in the Resources folder on my git hub). In partuicular I used Regex to clean up the data set and allow it to bne used later in the project. 
    - https://github.com/Jess-Vannatter/Education_Group_Project-/tree/Jess_Dev/Resources

## SQL Work
  - PLease refer to files table_joins.sql and QuickDBD-export.sql. Utilized Quick Db website to assist with ERD complilation. Then used the export code from QuickDB to build tables in SQL.
  
  ![image](https://user-images.githubusercontent.com/117245167/233049683-0f6e5ebd-b760-45ab-a916-fffb420973f4.png)
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

  - Joined "exam_scores" table and "demographics" table in SQL to create our intial data set, "Student_exams"
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

## EDA
  - Once the tables were joined in SQL using the connection string, we carried out A basic analysis  in an attempt to learn about our data. First getting the shape and using ```.info()``` to see null values and data types. In addition i determined there were no duplicate rows with ```.duplicated()```. Next i utlized a couple of for loops to get the value-counts and modes for the diffnerent catagorical values. This was specifically helpful because it listed the values for each catagorical feature in one output (See below) and simplify i did the same for themodes, which printed which value was seen more frequently/ more common in its respected column.
  
  - **Value_counts**
   
  ![image](https://user-images.githubusercontent.com/117245167/233054765-da374cb2-a3b9-4a89-9033-4bd2fd2c7e37.png)
  
  - **Mode**
   
  ![image](https://user-images.githubusercontent.com/117245167/233056421-b39a25fe-e204-4339-9cbb-7ee6230e3281.png)
  
  - Based on our definition of a "passing" math score (being 70 or higher) I then extracted a df showing just the pasing students. In Addition i created a function to print the outliers of the Math_score" column, which when applied to te data set above found 6 statistical outliers that were below the lower_limit/ q1
  
  ![image](https://user-images.githubusercontent.com/117245167/233055155-1f8f22b6-0aac-4bb5-b07f-cee20cbde2c3.png)

  - In Addition i created a function to print the outliers of the Math_score", "Reading_Score", and "Writing_Score" columns, which when applied to the data set above found multiple statistical outliers that were below the lower_limit/ q1.
  
  ![Screenshot 2023-04-23 094522](https://user-images.githubusercontent.com/117245167/233843411-b7d7851b-e0d1-4264-877d-3fa753ffd3ac.png)


## Mock Logistic_regression
 - Please refer to "Mock_Logistic_Regression.ipynb". After analyzing the data, my next task was to appply the data set to an initial Logistic regression model to see if/ how efficient we would be able to determine the math scores of the students based on the features/ columns in the Student_exams data set/ table. the initial step taken for this was to conver the "MAth_Score" column in to 1's and 0's based on the students score in ralation to being above/ below a score of 70. Where a score of 70 or greater was a 1 and anything below 70 was a 0.Next i created my features and placed in the the X variable, and the target feature (Math_score) in to the y variable. I Double checked the "X" dtypes and the value_counts of "y". Once determined that the variables were correctly allocated, I instanciated the train_test_split and applied random over sampling to the data set. Next I trained the model on the data set and calculated the results (which can be seen below).
 
 ![image](https://user-images.githubusercontent.com/117245167/233060496-13d702a4-f328-46a3-8ecb-cfff5b049d5e.png)


## Mock Balanced_Random_forrest/ Feature_Importances
 - In addition to the Logistic regression model i wanted to test our a balanced random forrest model on the data to compare accuracy scores and to also retrieve the feature iportances. I felt the feature importances could be an important detail in answering our intial question of determining which features best determined the math test scores. The coed in the "Bala_Rando_Forest.ipynb file essentially was initially boiler plate when compared to the logistic regression code. Converting the math_score column, creationg the features and targets, and the train_test_split. Then instead of random_over_sampling to sample the data, I applied a balanced Random Forest Clasifier to botain the balanced accuracy score and Geometric mean. Please see the reults below:
 
 ![image](https://user-images.githubusercontent.com/117245167/233061911-5e9470fa-c455-4e19-965d-67fc94470d3d.png)

 - My last step was to pull out and inspect the feature importances of the data set to help determine which features impacted the predictablility the most, which can be seen below:
 
 ![image](https://user-images.githubusercontent.com/117245167/233062144-2e06cf76-72be-4dab-baf0-cbeeafd63cba.png)


## Mock Easy_Ensamble_AdaBoost
 - In Another attempt to compare models I wanted to test our data against an additional supervised Machine learning model. I did not optemize the data in any way and wanted to see what results we could get trying to predict the match scores using the Easy Ensamble AdaBoost method. The data was pre-processed very similerly to the previous two models and imported via the connection string linked to my SQL/ PGadmin account. The results below were similer to the balanced Random forrest classifier, but not as effective as the logistic regression model.

![Screenshot 2023-04-22 081531](https://user-images.githubusercontent.com/117245167/233784159-21fa94a9-1d0c-4943-aa33-c71ac08c8c57.png)


## Optimized Logistic Regression Model and Feature Importances
 - We Chose the logistic regression model because it yeilded the highest accuracy score out of the 3 models tested. In order to optemize the model we really didint have many options since the data was already reletivily cleaned and balanced. What we were ablet o do is remove all outliers identified in the EDA process and try to see if removing the resampling process had any impact ot he overall accuracy score. Iniitlaly I just removed the outliers for the Math Scoresz, but that did not yeild a positive outcome (accuracy score slightly lowered). By removing the outliers from all scoreing features, including Math, Reading, and Writing we were able to achieve an accuracy ~ 90%. Although it was determined that re-sampling was not needed considering our data set we relativly balanced as is. in addition after runing voefficient correlation ont he 3 scores it was determined that the reading and Writing scores were very similer, so the weaker of the 2 (Reading score) was removed from the model. AFter removing the resampling and the reading_score from the model our linear regression model was able to achieve an accuracy score of ~88%.

![image](https://user-images.githubusercontent.com/117245167/234833428-2057a5e5-1e00-4c5a-b520-7d3ad817a0b0.png)

 - As a part of this analysis it was our goal to determine which features/ factors would best determine Math scores at or above the achievement threshold of 70. So in oredr to pin point the features that had the most impact on the math score prediction also obtained the "Feature Importances" of the Logistic Regression by generating the normalized coefficientsof each feature in the "X" array. Then printed the coefficients, along with their "Feature Names" in ascending order. See below, as well as in our Resources folder under the Feature_Importances.csv file.

![image](https://user-images.githubusercontent.com/117245167/234839148-784f74bc-fb2c-4c81-90c2-4d9b6a17e979.png)

 - Once the feature importances were determined we attempted to further optimize our model by cultivating the feature importances via a feature selection process. We tried removing feature importances with "importances" lower than 0.4 and the again at .02. Lastly we tried running the same logistic regression model after removing the 2 least important features as presented above but were not able to achieve an accuracy score greater than 86%. So it was determined that the features in the list above should remain in the model. You can see these attempts in my "Optimization_Trial_Error" folder.


