# Education Group Project

# Overview
## Topic
The project will focus will focus on the education field, specifically mathematics achievement. Two of the three members are currently classroom teachers and are passionate about student learning. 

## Questions
* What factors best predict mathematics achievement?
* Are there differences in math achievement by different demographic features?

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
* KNeighbors
* Gradient Boosting

## Communication Protocol
We created a small group channel in Slack. The expectation is that responses to a post is made by end of day. It is expected that group members would check Slack minimally, once per day. The protocol can be revisited during each class meeting to determine if it is meeting the group's needs. In addition, we created a Google Drive to house relevant Google Sheets, Google Slides, and Segment Rubrics. In addition, we have committed to using designated class time efficiently, ensuring roles and tasks are clear.

# Data Exploration Phase: Technical Work
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

A function was created to print the outliers of the "Math_score", "Reading_Score", and "Writing Score" columns, which when applied to the data set revealed 6, 5, amd 5 statistical outliers, respectively, that were outside the lower fence using the Interquartile Rule.
  
  ![Screenshot 2023-04-23 094522](https://user-images.githubusercontent.com/117245167/233843411-b7d7851b-e0d1-4264-877d-3fa753ffd3ac.png)

Addtional exploratory data analysis was conducted in Tableau to investigate data distribution, correlations, and patterns. A linear trend model was computed using the Math and Reading scores, producing the results seen in the images below. The data are strongly and positively correlated with a Pearson's R of 0.81 and a least squares regression line of prediceted math score = 20.25 + 0.739(Reading Score). The coeffient of determination accounts for approximately 66% of the variance in the predicted Math Score.

  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/a81a12ce3aee275df7b47271cca4e76b2a1b2235/Resources/math%20v%20reading%20score%20eda.png)
  
A linear trend model was computed using the Math and Writing scores, producing the results seen in the images below. The data are strongly and positively correlated with a Pearson's R of 0.79 and a least squares regression line of prediceted math score = 17.12 + 0.766(Reading Score). The coeffient of determination accounts for approximately 82% of the variance in the predicted Math Score.

  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/a81a12ce3aee275df7b47271cca4e76b2a1b2235/Resources/math%20v%20writing%20score%20eda.png)


To determine if the the reading scores and writing scores were collinear, a linear trend model was computed. The resulting Pearson's R was 0.945, indicating that the two measures were collinear. As a result, the writing score was removed from further calculations.


  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/0766b7729796bc67709717272b63c57693fe07f2/Resources/reading_v_writing.png)


The distribution of Math Score data appears approximtely normal when divided by male/female data. 

  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/a81a12ce3aee275df7b47271cca4e76b2a1b2235/Resources/math%20distribution.png)

## Logistic_regression
Please refer to "Mock_Logistic_Regression.ipynb". After analyzing the data, Jess ran an initial Logistic regression model to see if and how efficiently we would be able to determine the math scores of the students based on the features/ columns in the Student_exams data set/ table. The initial step taken for this was to convert the "Math_Score" column in to 1's and 0's based on the student's score in relation to being above/ below a score of 70. Scores of 70 or greater were assigned a 1 and anything below 70 was assigned a 0. Next Jess created the features and placed them into the X variable and the target feature (Math_score) into the y variable. He double checked the "X" dtypes and the value counts of "y". Once it was determined that the variables were correctly allocated, I instantiated the train_test_split and applied random oversampling to the data set. Next the model was trained on the data set and calculated the results (which can be seen below).
 
 ![image](https://user-images.githubusercontent.com/117245167/233060496-13d702a4-f328-46a3-8ecb-cfff5b049d5e.png)


## Balanced_Random_forest/ Feature Importances
In addition to the Logistic regression model, a balanced random forest model was run on the data to compare accuracy scores and to also retrieve the feature importances. The feature importances may be an important detail in answering our intial question of determining which features best predicted the math test scores. The code found in the "Bala_Rando_Forest.ipynb" file essentially was an initial boiler plate when compared to the logistic regression code. Next the math_score column was converted, the features and targets were created, and the train_test_split. Then instead of sampling the data via random oversampling, a balanced Random Forest Classifier was applied to obtain the balanced accuracy score and Geometric mean. Please see the reults below:
 
 ![image](https://user-images.githubusercontent.com/117245167/233061911-5e9470fa-c455-4e19-965d-67fc94470d3d.png)

Lastly, the feature importances of the data set were pulled out and inspected to help determine which features impacted the predictablility the most, which can be seen below:
 
 ![image](https://user-images.githubusercontent.com/117245167/233062144-2e06cf76-72be-4dab-baf0-cbeeafd63cba.png)

## Mock Easy_Ensamble_AdaBoost
In Another attempt to compare models, Jess tested our data against an additional supervised machine learning model. The data was not optimized in any way in order to see what results we could get trying to predict the match scores using the Easy Ensamble AdaBoost method. The data was pre-processed very similerly to the previous two models and imported via the connection string linked to my SQL/ PGadmin account. The results below were similer to the balanced Random forrest classifier, but not as effective as the logistic regression model.

![Screenshot 2023-04-22 081531](https://user-images.githubusercontent.com/117245167/233784159-21fa94a9-1d0c-4943-aa33-c71ac08c8c57.png)

## Mock SVM
The SVM machine learning model was able to produce substantial results with an 0.884 accuracy score when predicting Math achievement; this should be noted and will be tested with optimized data and compared to the optimized Logistic Regression model.
 
 ![image](https://user-images.githubusercontent.com/117245167/235138858-4691519d-e992-4cc5-ae5f-148c4d34d91c.png)

## Mock Gradient Boost
The gradient boosted model produced similer results but came up slightly short when compared to the Logistic Regression and SVM models. You can see the optimization attempts in the optimization_trial_error folder.
 
 ![image](https://user-images.githubusercontent.com/117245167/235139474-67215baf-fe2a-4d99-9a51-4b22026c4b4e.png)

## Mock Decision Tree
The Decision tree model yeilded an accuracy score of 0.78 which when compared to the stronger models does not hold up.
 
 ![image](https://user-images.githubusercontent.com/117245167/235139885-74493b98-d0b1-4dec-b0c7-129541afbb6f.png)

## Mock KNN
The initial KNN model produced an accuracy score `0.80, but this was the first model where i attempted hyperparameter tuning. See below. i was not able to achieve a comparable accuracy score to the logistic regression model though.
 
 ![image](https://user-images.githubusercontent.com/117245167/235140467-2d91eff0-b348-4d1c-83b8-55cd1526c65f.png)

### Optimizing the model based on EDA
As a group we all worked on the EDA process and after our mock machine learning trials and applying them to our data we discovered a couple of optimization oppurtunities. First we established the outliers in our data set. There were a toal of 9 scores in our data set between reading, writing, and math that feel below the lower Q1 limit (discussed above). Once identified, we removed these from the data sets we used when optimizing our models. In addition, we ran feature correlation analysis on the 3 continuous features (math, reading, writing scores) and it was determined the reading and writing scores were statistically very similer to each other. With this being determined we decided to remove the weaker of the two in determining the math score, which was the writing_score.

## Hyperparameter Tuning
After analyzing the results of our mock machine learning models we narrowed down the options for the model that we planned on using for our project. Based on the initial Hyperparameter tuning, [Initial_Hyperparameter_tuning](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Initial_Hyperparameter_tuning.ipynb) the two top preforming models were the Logistic regression model and the GB_Classifier model. We have an initial Hyperparameter tuning file which shows a side by side comparison of the mock models[Initial_Hyperparameter_tuning](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Initial_Hyperparameter_tuning.ipynb) , then a Hyperparameter tuning file which only compares the strongets models [Hyperparameter_tuning_best](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Hyperparameter_tuning_best_models.ipynb) , Logistic and GB_Classifier. Both of these are located in my "Hyperparmeter_Tuning file".

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
Using the parameters above with the GridSaerchCV approach did take a decent amount of computing power and took over an hour to run. This resulted in our best sequence of GB_Classifier hyperparameters being ```Best parameters are: {'learning_rate': 0.1, 'max_depth': 1, 'max_features': 4, 'n_estimators': 250}``` and an accuracy score of 0.8842. You can see my hypertune process in the [Hypertune__Boost file](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Hyperparameter_tuning/Hypertune_G_Boost.ipynb) and the optimized model in the [Optimized_G_Boost](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/Jess_Dev/Optimized_G_Boost.ipynb).

## Optimized Logistic Regression Model and Feature Importances
 - We Chose the logistic regression model because it yeilded the highest accuracy score out of the 6 initial mock models tested and in our HYperparameter tuning trials. In order to optemize the model we really didint have many options since the data was already reletivily cleaned and balanced. What we were ablet o do is remove all outliers identified in the EDA process and try to see if removing the resampling process had any impact ot he overall accuracy score. Iniitlaly I just removed the outliers for the Math Scoresz, but that did not yeild a positive outcome (accuracy score slightly lowered). By removing the outliers from all scoreing features, including Math, Reading, and Writing we were able to achieve an accuracy ~ 90%. Although it was determined that re-sampling was not needed considering our data set we relativly balanced as is. After the Hyperparameter tuning we were able to achieve ~89% accuracy score which was the highest wwe achieved between all models.

![image](https://user-images.githubusercontent.com/117245167/235442340-248706d4-f32f-40d1-ba23-f8ddead1d052.png)

 - As a part of this analysis it was our goal to determine which features/ factors would best determine Math scores at or above the achievement threshold of 70. So in oredr to pin point the features that had the most impact on the math score prediction also obtained the "Feature Importances" of the Logistic Regression by generating the normalized coefficientsof each feature in the "X" array. Then printed the coefficients, along with their "Feature Names" in ascending order. See below, as well as in our Resources folder under the Feature_Importances.csv file.

![Screenshot 2023-05-01 192959](https://user-images.githubusercontent.com/117245167/235549199-82ff53e2-9e90-4701-ad70-db7bfb7f058d.png)

 - Once the feature importances were determined we attempted to further optimize our model by cultivating the feature importances via a feature selection process. We tried removing feature importances with "importances" lower than 0.4 and the again at .02. Lastly we tried running the same logistic regression model after removing the 2 least important features as presented above but were not able to achieve an accuracy score greater than 86%. So it was determined that the features in the list above should remain in the model. You can see these attempts in my "Optimization_Trial_Error" folder.






# Analysis Phase

## Question 1: What factors best predict mathematics achievement?

### Confusion Matrix
 ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/57c3b474d9066e9e575a30e29e4990f89c7a3eba/Resources/confusion%20matrix.png)

The confusion matrix, shown above, reveals the following:
* The True Positives (TP) are the correct predictions of the "Pass" class - In this case, we have 108 true positives.
* The False Positives (FP) are the incorrect predictions of the "Pass" class - In this case, we have 8 false positives.
* The True Negatives (TN) are the correct predictions of the "Fail" class - In this case, we have 113 true negatives.
* The False Negatives (FN) are the incorrect predictions of the "Fail" class - In this case, we have 19 false negatives.

In summary, this confusion matrix indicates that the model correctly predicted 221 instances (113 true negatives + 1108 true positives) and made 27 errors (8 false positives + 19 false negatives) in total. Additionally, the model appears to perform well overall since it has a high number of true positives and true negatives and a relatively low number of false positives and false negatives.  

### Classification Report
 ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/e5f58982a2f4100277829331e0a7c07ede71ef49/Resources/classification%20report.png)
 
The classification report shows the precision, recall, specificity, F1-score, geometric mean, and index balanced accuracy (IBA) for each class as well as the average values across all classes.

* The precision for Fail is 0.86, which means that out of all the predicted negatives, 89% of them are truly negative (true negatives / (true negatives + false negatives)).
* The recall for Fail is 0.93, which means that out of all the true negatives, 91% of them are correctly identified as negative (true negatives / (true negatives + false positives)).
* The specificity for Fail is 0.85, which means that out of all the actual negatives, 89% of them are correctly identified as negative (true negatives / (true negatives + false positives)).
* The F1-score for Fail is 0.89, which is the harmonic mean of precision and recall, and is a measure of the classifier's overall accuracy for this class.
* The geometric mean for Fail is 0.89, which is a measure of the classifier's overall ability to balance both recall and specificity.
* The IBA for Fail is 0.80, which is a measure of the classifier's overall performance for this class.

The same set of metrics is reported for Pass, and in this case, the precision, recall, specificity, F1-score, geometric mean, and IBA are 0.93, 0.85, 0.93, 0.89, 0.89, and 0.79, respectively. Finally, the average values across both classes are also reported in the report. In this case, the average precision, recall, specificity, F1-score, geometric mean, and IBA are 0.89, 0.89, 0.89, 0.89, 0.89, and 0.79, respectively. Overall, based on this report, the model appears to perform well for both classes with high precision, recall, and F1-score, indicating that it is able to accurately classify instances from both classes. 

### Feature Importances

  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/e4b577141983c4e20dcab3f3debb92dce41a61b6/Resources/featureimportance%20graph.png)
  ![image](https://github.com/Jess-Vannatter/Education_Group_Project-/blob/e4b577141983c4e20dcab3f3debb92dce41a61b6/Resources/feature%20importances.png)


These feature importances indicate the relative importance of each feature in predicting math achievement in the model. The features are ranked in descending order of their importance, with the most important feature listed first.

* From the output, we can see that the top 4 most important features, in descending order, are: Sex_female, Lunch_reduced, Test_Prep_completed, and Test_Prep_none. This suggests that these features have the greatest impact on math achievement, and should be considered when making predictions.
* Other important features include Ethnicity, Parental Level of Education (PLE), and Reading Score. It's worth noting that some features have very low importance scores, such as Ethnicity_group E and Reading Score, indicating that they have little impact on math achievement.

## Question 2: Are there differences in math achievement by different demographic features?

[Link to Erica's tableau](https://public.tableau.com/shared/R3C5BQX2S?:display_count=n&:origin=viz_share_link) 
### Overall Observations
Math proficiency is: 
* lower for females
* lower for students receiving free or reduced lunch
* highest for Ethnic Group E
* increases as Parent Level of Education increases
* higher for students who completed a test prep course 


# [Formal Presentation](https://docs.google.com/presentation/d/1Kom-E46sPTH8pOhf19zlzoUs71fJabneA08JeBoC3dM/edit?usp=sharing)

