create table exam_pop as
select
e.student_id,
e.math_score,
e.reading_score,
e.writing_score,
d.ethnicity,
d.gender,
d.ple,
d.lunch,
d.test_prep

from exam_scores as e
inner join demographics as d
on (e.student_id = d.student_id)
;