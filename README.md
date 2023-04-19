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
  - 

## Logistic_regression

## Balanced_Random_forrest/ Feature_Importances

