# RecommendationMachine
This is my response to the Faber Ventures Data Science Challenge 2017

When we download the dataset (movies.txt.rar) we can see it is in Json String format, so a first milestone is to convert it to a more readable format, either in Python or R.
Even if it is not totally reliable, we used a simple Python script to convert the .txt file to a .csv file (conversion.py) that still has some parse errors but enables us to use a significant part of the dataset to study it (the file was written in Python 2.7.9)

The second step in this challenge is to study the dataset to understand the type of information within it. This can give us clues about how to approach the problem thereafter.

The third step will be to build the recommendation machine. As the time provided revealed to be quite short, it is unlikely that we may have much time to implement and test. Nonetheless, this is what I would have liked to experiment:

 - k-means clustering – we could set each user reviews in a vector and obtain the clusters. Each cluster would have the users with similar reviews. We could then calculate the closest reviewers to the given reviewer and choose recommendations from those (ex: our reviewer may have reviewed highly comedy movies so the cluster will be filled with comedy lovers. We can therefore suggest movies they like that our reviewer has not reviewed).
- collaborative filtering algorithm – it aims to predict the score a specific reviewer would have given to a specific movie based upon reviewers with similar movie reviews and would return those movies with a predicted higher score.

In order to perform a good study on how good these algorithms perform, the given dataset should be partitioned into two parts, being the biggest for testing, and the smaller for validation. Only after adjusting, fitting and validating the algorithms, they could be confronted with the full dataset with confidence.
