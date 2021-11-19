*ANOVA
   How different are the group means
   Comparision of the variability within each group to variability between groups
   Terminology;
*Measure of between group variability
     SSG: Sum of squares for groups/treatments/models: determines the group variability
           how far is each sample from the from the grand mean (df=(no of treatment-1)
     SSE: sum of squares for error, Measure of within group variability 
     mean squares (MSG, MSE) are derived by dividing by degree of respective freedom
    F statistics= MSG divided by MSE;
*Hypothesis
  Null: all means are same, alternative: at least one mean differ from rest;
*Conditions: All samples are random
             Samples are independet
             All populations are normal (have CLT as a back up if n >=30 for all each group 1
             All population variances are equal;
*P values presents the proportion of null distribution that is greater than or equal to the test statistics;

*One way ANOVA; 
     
 Data drug;
input drug $ response;/*infile datalines dlm = '09'x;*/
datalines;
A	7.3
A	8.2
A	10.1
A	6
A	9.5
B	7.1
B	10.6
B	11.2
B	9
B	8.5
B	10.9
B	7.8
C	5.8
C	6.5
C	8.8
C	4.9
C	7.9
C	8.5
C	5.2
;
run;



*proc ANOVA or Proc GLM: Balanced data, we use ANOVA, unbalanced data we use PROC GLM;

proc GLM data=drug order=data;
    class drug;
    model response=drug;
    means drug / tukey cldiff alpha=.05;
run;
quit;
