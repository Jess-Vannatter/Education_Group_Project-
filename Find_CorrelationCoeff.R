#Find Correlation of the Continuous Scores
exam_pop <- read.csv("~/Desktop/Documents/Data Bootcamp/Final_Project/exam_pop.csv")
View(exam_pop)
cor(exam_pop$reading_score, exam_pop$writing_score)
cor(exam_pop$math_score, exam_pop$reading_score)
cor(exam_pop$math_score, exam_pop$writing_score)


