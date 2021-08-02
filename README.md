# Final_Project_10_UTA

# Project Overview

The aim of the project is to predict how seasonal changes and quarterly fiscal earnings affect the price of Apple Stock Market.

Multiple variables, such as date in months, years and different seasons of the year  will be analyzed to gauge their impact and predict potential price outcomes.

# Description of the communication protocols

	X: Gabriel 
	–Decide the technologies to be used for each step of the project & Create Dashboard

	Circle: Remi 
	– Database Integration

	Square: Ope
	– GitHub Repository & Presentation

	Triangle: Iry
	– Machine Learning Model

Each member communicated through slack channel for making posts and comments as necessary for the entire team to view outside of class. We had our personal email shared as well.

# Content

### Selected Topic
As it relates to human behavior, how do seasons and fiscal quarters compare in stock behavior, using AAPL stock?

### Why this topic?
This topic was chosen to demonstrate that all things are connected, from all things environmental, as it relates to human behavior, transferred into the stock market where humans often make decisions based on science, but even more so on emotions and gut feelings. This model is set to demonstrate this as we observe stock behavior of Apple, Inc.

### Data Source
The data utilized is from Kaggle.com, titled the “NYSE”.

Link: https://www.kaggle.com/varpit94/apple-stock-data-updated-till-22jun2021


### Questions we hope to answer
Do seasons, as in changes in the weather, trigger human behavior enough to show a trend in stock price highs?
Do fiscal quarters trigger a trend of stress in humans that affect human behavior and is reflected within the stock markets highs (or volume purchases?)
Do different months of the year trigger 

### Description of communication protocol
	
	X: Gabriel 
	–Decide the technologies to be used for each step of the project & Create Dashboard
	
	Circle: Remi 
	– Database Integration
	
	Square: Ope
	– GitHub Repository & Presentation
	
	Triangle: Iry
	– Machine Learning Model

# Dataset Overview

## Data Source

This dataset provides historical data of APPLE INC. stock (AAPL). The data is available at a daily level. Currency is USD.

The weblink: https://www.kaggle.com/varpit94/apple-stock-data-updated-till-22jun2021

This dataset contains:
Data 
High: Price from the first transaction of a trading day
Low:Minimum price in a  trading day
Close: Price from the last transcation of a trading day
Adj Close: Closing price adjusted to reflect the value after accounting for any corporate actions
Volume: Number of units traded in a day

## Data Quality
In the Kaggle webpage, this dataset is rated with a score of 10.0 for Data Usability.


#  Segment I

## Overview

As mentioned, we are using Apple, Inc's data set that consists of daily stock prices from 1980 - 2020. This data set is being analyzed by changes in open, close, high, and low prices on a daily base. Each of these changes are to be analyzed in their own separate databases where they will be analyzed against seasons and quarters. The following information will explain our plan from the raw data to machine learning model in effort to predict what seasons and quarters produce the most gains and losses of a stock. The following will be covered in this section:

- Database Mockup
- Machine Learning Mockup

## Database Mockup

In this section we will be discussing the databases we have created that will be utilized for our machine learning model. To get an idea as to what our database will look like once joined, the following is a snapshot of our ERD model:

![](Images/DB_Snaps/DB_ERD.png)

1. In our base APPL stock database, we will create two formulated columns. This example will be based on our database "AAPL_Mock_ML_Open.csv"
    - The first formulated column is based on the changes that occur every 24 hours of on the stock. The current day's price will be subtracted from the previous day's price. The very first row of that coumn is subtracted from zero.
    - Once this formula is applied throughout the database, we will then create a Gain_Loss column. This column will be formulated to state "Loss" if the price change is less than zero and will state "Gain" if the price change is zero or greater than 

2. Once the Price change and Gain_Loss columns are created, next we will format the date column in both databases to match. The date is the key that will bring both databases together. It is unique by every line having a different date. This will ensure that the information in database one is properly matched with all of the data of database two

3. Lastly, we will be joining the Season/Quarter database with the APPL stock price database using a SQL based program, ideally Postgres, or another program like it. The following images show the databases before the join, and a snapshot after the join that is already imported into a dataframe.


![](Images/DB_Snaps/DB_season_quarters.png)


![](Images/DB_Snaps/DB_AAPL.png)


![](Images/ML_Snaps/ML_Open_df_b4_ML_Model_Run.png)


Once the above steps are complete, the data will be ready for utilitzation in our chosen machine learning model. At the same time, something very important to note in the case of this project is that we have a total of four databases to create. One database for each type of stock pricing - Close, High, Low, and Open. The calculated column and Gain/Loss column formulas will be adjusted to calculate it's respective pricing column to the database's name. Therefore, here in this segment, we will be explaining our results of two sets of models, the Logistic Regression Model and the Random Forest Model. Each of them have their own set of databases with adjustments made to the formulated column to match each price variable. The list of database files are as follows:

- Logistic Regression Model Database Files

![](Images/DB_Snaps/DB_LR_Files.png)


- Random Forest Model Database Files

![](Images/DB_Snaps/DB_RFM_Files.png)


Once the databases are all complete and ready, we will move into using them for our chosen machine learning model.


## Machine Learning

In this section, we will be answering the following questions:
1. Which model did you choose and why?
2. How are you training your model?
3. What is the model's accuracy?
4. How does this model work?


### Which model did you choose and why?
We have chosen the Random Forest Model. It contains a “Rank the Importance of Features” that allows us to see which features have the most impact on the decision. This is part of Ensemble Learning.
Other reasons for choosing random forest algorithms include:
- Are robust against overfitting 
- Can be used to rank the importance of input variables in a natural way, which will be very important to our end result of identifying what is the greatest factor of identifying major influencers of stock rises and falls
- Can handle thousands of input variables without variable deletion
- Are robust to outliers and nonlinear data


### How are you training your model?
Features: the variables used to make a prediction.
- Our features are seasons and fiscal quarters.

Target: the predicted outcome
- Our target is the stock price based on Gains/Losses (based on high, low, open, and close – all in separate models from each other)
        
The photo below represents the four separate databases that we will run through the Random Forest Model individually:

![](Images/ML_Snaps/ML_files_snapshot.png)


Throughout the remaining explanation of the machine model, we will be referring to the results of running our model with the AAPL_Mock_ML_Open.csv file. This same process will be applied with each of the database files separately. 

In regard to the features, there are separate columns identifying the seasons and identifying the different quarters based on the stock pricing dates. The following photo is a snapshot of the fatures and target set being defined:

![](Images/ML_Snaps/Define_features_target.png)


This photo also shows the binary encoding, where we used get_dummies, as well as the dropping the column (Gain/Loss_Open, now known as "Gain_Loss_Open") so that it may be used as our target.

Following these methods, we then proceed through training as follows:
- Splitting data into Train and Test sets
- Creating a StandardScaler instance
- Scaling the data
- Creating a random forest classifier
- Fitting the model
- Making predictions using the testing data
- Calculating the confusion matrix to observe how well training and testing performed


### What is the model's accuracy?
Currently, we have two models with different accuracies. We will seek consultation to verify which is most appropriate due to uncertainties of formulated columns that contribute to the features of the models. Each model set explained below has 4 models within it, each with their own accuracies: Open, Close, High, and Low.

Accuracy of Model Set 1 - Logistic Regression:
- Open: 50%
- Close: 70%
- High: 70%
- Low: 70%

Accuracy of Model Set 2 - Random Forest Model:
- Open: 91%
- Close: 91%
- High: 91%
- Low: 91%
    - For the Model Set 2- RFM, all four models ended up with the same Confusion Matrix. See image below that is based on the price variable "Open":
    
    ![](Images/ML_Snaps/RFM_Open_CM.png)


### How does this model work? 

This model was intended to function in a way that helps us predict future gains and losses based on historical prices, and then take the successful model and utilize it for an even closer look of Gains and Losses by Seasons and Fiscal Quarters. 

*Two additional columns were added to the database for model functionality/support*

So far, we have gotten as far as creating models based on historical prices. The way that this works is that two formulated colums were added to our raw APPL dataset before joining the seasons and quarters database by date to the stock raw data by date. The first formulated column of the two was a "change variable" column. This column was formulated by taking one of the price variables (open, close, low, high) of the current day and subtracting it from the previous day's price. This would tell us how much the price has changed that day from the day before (the earliest day was subtracted from 0 as our starter). The second formulated column was a Gain_Loss column that was based on that change. This column was formulated to state "Loss" if the change was less than zero, and say "Gain" if the change was zero or greater. Because this file is a .csv file, the formula did not remain once the file was saved, the values became unformulated values instead. This situation does tie into why we have two separate sets of models rather than just one to choose from. This will be discussed a bit later.


*Model Set 1: Logistic Regression - Average 65% Accuracy, 3 out of 4 models at 70% accuracy*

In model set 1, which is based on logistic regression, the database that was entered into the model was processed differently than the Random Forest Model, not just by the rules of the model itself, but also by the columns involved. To optain majority 70% accuracy, a change column was produced, not only on the price variable, but also on the volumes of stock purchased on a daily basis. 

Within one of the failed models, the change column was initially created to determine the Gain_Loss column, and then it was dropped within the "determine feature" section of the code. This was done for all price variables and I received very low accuracy scores. The accuracy was 56% and less for everything. When this process was done on the volume column of the stock, the model had a 70% accuracy score. It was at that moment that we explored the possibility of using volume change in addition to price changes to support the accuracy of the model's predictions on price variables further. As a result, the "Volume_24hr_Change" column became a set feature within the model along the other features. See the photo below (based on "Open" price variable):

![](Images/ML_Snaps/Open_Volume_Change_Snap.png)


*Model Set 2: Random Forest Model - Average 91% Accuracy, 4 out of 4 models at 91% accuracy* 

In model set 2, which is based on the random forest model, the database that was entered into the model was processed differently than the Logistic Regression Model, not just by the rules of the model itself, but also by the columns involved. To optain majority 91% accuracy, The change column of the price variable that was used determine the Gain_Loss column was kept in the database rather than dropped with the Gain_Loss column as the features' set was defined. See photo below:

![](Images/ML_Snaps/Open_Change_Snap.png)


The situation that makes choosing this model difficult is that we were told that the change column actually gives the machine model the answers to its own prediction, making it an inappropriate model, despite the 91% accuracy. We will continue consultation and testing, but if nothing works, we may seek out other options. A couple of items suggested is to bring in an additional dataset supporting APPL that can add additional features, or create my own features with the dataset we already have.

One of the main reasons this model was selected was because of its ability to rank the importance of our input variables to see how each variable influences the model overall. As you can see from the snapshots below, the change price variable column that remains in the database has the strongest weight above all other variables. Below is a snapshot of our rank of importance by each price variable:


- Open:

![](Images/ML_Snaps/RFM_Open_Features_Importance.png)


- Close:

![](Images/ML_Snaps/RFM_Close_Features_Importance.png)


- Low:

![](Images/ML_Snaps/RFM_Low_Features_Importance.png)


- High:

![](Images/ML_Snaps/RFM_High_Features_Importance.png)


From the snapshots, most of these look alike because many of the prices, are the same, or have very small differences. The dataset is from a sample of APPL's early years.


*Conclusion to Segment 1*

In conclusion, we will continue testing models and seeking consultation based on our model experiences so far. By next class, we whould have found an additional dataset to help predict APPL stock fluctuations by bringing in more feature columns, if not create our own features through the dataset that we already have.


# Segment 2

## Software and applications used include:

Group GitHub account
Python 3.7.6
Pandas
R
SQL
AWS
pgAdmin
Tableau
Tableau Dashboards

## Analysis and Workflow

### Machine Learning Model

### Database

Database link:

### Result

### Summary (Dashboard)

The dashboard contains worksheets, dashboard and stories that explains the connection between Seasonal, Quarterly and Monthly Gain/Loss. Attached id the link to the dashboard:

https://public.tableau.com/app/profile/opy.shoffy/viz/Final_Project_10_16277782240420/QuarterlyGainLoss


![](SEGMENT%202/Dashboard_screenshot_7_31.png)


# Final_Project_10_UTA