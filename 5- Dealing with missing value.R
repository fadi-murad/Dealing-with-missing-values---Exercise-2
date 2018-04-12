#first import titanic_original.xls file into Rstudio project

library(dplyr)
library(dummies)
View(titanic_original)
titanic_clean <- tbl_df(titanic_original)


#replacing the missing values in the embarked column with 'S'
titanic_clean$embarked[is.na(titanic_clean$embarked)] = "S"

#replacing the missing values in the age age column with the mean of this column
titanic_clean$age[is.na(titanic_clean$age)] = mean(titanic_clean$age,na.rm = TRUE)

#replacing the missing values in the age age column with 'NA'
titanic_clean$boat[is.na(titanic_clean$boat)] = "NA"

# Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise
titanic_clean <- dplyr::mutate(titanic_clean,has_cabin_number = ifelse(is.na(cabin),0,1))

#checking the new set
View(titanic_clean)

#export the output to csv file
write.csv(titanic_clean,"titanic_clean.csv")


