-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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

