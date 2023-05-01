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

# Mock Machine Learning Models
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

## Mock SVM
 - THe SVM machine learning model was able to produce substantial results with an 0.884 accuracy score when predicting Math achievement. this should be noted and will be tested with optimized data and compared to the optimized  Logistic Regression model.
 
 ![image](https://user-images.githubusercontent.com/117245167/235138858-4691519d-e992-4cc5-ae5f-148c4d34d91c.png)

## Mock Gradient Boost
 - The gradient boosted model produced similer results but came up slightly short when compared to the Logistic rgression and SVM models. You can see the optimization attempts in the optimization_trial_error folder.
 
 ![image](https://user-images.githubusercontent.com/117245167/235139474-67215baf-fe2a-4d99-9a51-4b22026c4b4e.png)

## Mock Decision Tree
 - The Decision tree model yeilded an accuracy score of 0.78 which when compared to the stronger models does not hold up.
 
 ![image](https://user-images.githubusercontent.com/117245167/235139885-74493b98-d0b1-4dec-b0c7-129541afbb6f.png)

## Mock KNN
 - he initial KNN model produced an accuracy score `0.80, but this was the first model where i attempted hyperparameter tuning. See below. i was not able to achieve a comparable accuracy score to the logistic regression model though.
 
 ![image](https://user-images.githubusercontent.com/117245167/235140467-2d91eff0-b348-4d1c-83b8-55cd1526c65f.png)

## Optimizing the model based on EDA
 - As a group we all worked on the EDA process and after our mock machine learning trials and applying them to our data we discovered a couple of optimization oppurtuniys. First we established the outliers in our data set. there were a toal of 9 scores in our data set between reading, writing, and math that feel below the lower Q1 limit (which can be seen above). Once thesewere identified we removed these from the data sets we used when optimizing our models. In addition, we ran feature correlation analysis on the 3 continuous features (math, reading, writing scores) and it was determined the reading and writing scores were statistically very similer to each other. With this being determined we decided to remove the weaker of the two in determining the math score, which was the writing_score.

## Hyperparameter Tuning
 - After analyzing the results of our mock machine learning models we narrowed the options for the model that we planned on using for our project to a logistic regression model and GradientBoosted_Classifier. the Logistic regression model had preformed the best in our mock trials. The GB_classifier i felt had a lot of promise if i was able to optimize the hyperparameters. This Model had multiple parameters to take in to consideration, and with the higher number of options i wanted to see if i could use them to achieve a higher accuracy result. I have an initial Hyperparameter tuning file which shows a side by side comparison of the mock models[Initial_Hyperparameter_tuning](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Initial_Hyperparameter_tuning.ipynb) , then a Hyperparameter tuning file which only compares the strongets models [Hyperparameter_tuning_best](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Hyperparameter_tuning_best_models.ipynb) , Logistic and GB_Classifier. Both of these are located in my "Hyperparmeter_Tuning file".

### Grid_Hyperpara_Optimized_Logistic_Regression_Model
 - Initially i had tried to optimize this model by manually changing the hyperparameters which took a long time and was not effective in yeilding a higher accuracy score. but after some research i was able to dig in to a couple of approachs that would cut down on time and allow us to run through essentially of the possible hyperparameter tuning by utilizung "GridSearchCV". This tool allows us to provide all the possible parameters in our code then by using GridSearchCV we apply our model to or data set and test all hyperparameter options to determine which sequence will yield the best accuracy results [Grid_Hyperpara_Optimized_Logistic_Regression_Model](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Grid_Hyperpara_Optimized_Logistic_Regression_Model.ipynb)  After utilizing the GridSaerchCVand testing the different Hyperparameters:
 ```
 param_grid = [    
    {'penalty' : ['l1', 'l2', 'elasticnet', 'none'],
    'C' : np.logspace(-4, 4, 20),
    'solver' : ['lbfgs','newton-cg','liblinear','sag','saga'],
    'max_iter' : [100, 1000,2500, 5000]
    }
]
```
We were able to come to the conclusion that our best possible sequesce was: ```LogisticRegression(C=1.623776739188721, solver='liblinear')``` .Which yeilded a 0.891 accuracy score.
 
### Hypertune_G_Boost
 - Similarly to the Logistic model, We utlized griSearchCV to tune the Hyperparameters for the GB_classifier model as well. AS compared to the logistic model though, The GB_Classifier had significantly more parameter options to choose from, or at least the range opf which the parameters could fall in:
 ```
 parameters = {
    "n_estimators":[5,50,250,500],
    'max_features':[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18],
    "max_depth":[1,3,5,7,9],
    "learning_rate":[0.01,0.1,1,10,100]
}
```
Using the parameters above with the GridSaerchCV approach did take a decent amount of computing power and took over an hour to run. This resulted in our best sequence of GB_Classifier hyperparameters being ```Best parameters are: {'learning_rate': 0.1, 'max_depth': 1, 'max_features': 4, 'n_estimators': 250}``` and an accuracy score of 0.8842. Which you can see in the [Hypertune__Boost file](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Hypertune_G_Boost.ipynb).

## Optimized Logistic Regression Model and Feature Importances
 - We Chose the logistic regression model because it yeilded the highest accuracy score out of the 6 initial mock models tested and in our HYperparameter tuning trials. In order to optemize the model we really didint have many options since the data was already reletivily cleaned and balanced. What we were ablet o do is remove all outliers identified in the EDA process and try to see if removing the resampling process had any impact ot he overall accuracy score. Iniitlaly I just removed the outliers for the Math Scoresz, but that did not yeild a positive outcome (accuracy score slightly lowered). By removing the outliers from all scoreing features, including Math, Reading, and Writing we were able to achieve an accuracy ~ 90%. Although it was determined that re-sampling was not needed considering our data set we relativly balanced as is. After the Hyperparameter tuning we were able to achieve ~89% accuracy score which was the highest wwe achieved between all models.

![image](https://user-images.githubusercontent.com/117245167/235442340-248706d4-f32f-40d1-ba23-f8ddead1d052.png)

 - As a part of this analysis it was our goal to determine which features/ factors would best determine Math scores at or above the achievement threshold of 70. So in oredr to pin point the features that had the most impact on the math score prediction also obtained the "Feature Importances" of the Logistic Regression by generating the normalized coefficientsof each feature in the "X" array. Then printed the coefficients, along with their "Feature Names" in ascending order. See below, as well as in our Resources folder under the Feature_Importances.csv file.

![image](https://user-images.githubusercontent.com/117245167/234839148-784f74bc-fb2c-4c81-90c2-4d9b6a17e979.png)

 - Once the feature importances were determined we attempted to further optimize our model by cultivating the feature importances via a feature selection process. We tried removing feature importances with "importances" lower than 0.4 and the again at .02. Lastly we tried running the same logistic regression model after removing the 2 least important features as presented above but were not able to achieve an accuracy score greater than 86%. So it was determined that the features in the list above should remain in the model. You can see these attempts in my "Optimization_Trial_Error" folder.


## Tableau EDA - Please see images folder
https://public.tableau.com/app/profile/jvannatter6/viz/Group_Project-Student_exams_Visualizations/PassingscoresbyEthnicity
