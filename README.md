# Charity Funding Predictor

A deep learning neural network model was developed to predict the success of funded project based on historical data. A csv file containing the data of past applicants was provided. The data was imported to Google Colab to use the neural network models in latest version of tensor flow. A snapshot of the data is shown in the image below.

![data](Images/data.png)

### Preprocessing

The data consisit of 4 features (EIN, STATUS, ASK_AMT, IS_SUCCESSFUL) with numerical data and the remaining features are categorical. The features EIN and NAME were dropped from the data as they should not influence the outcome (IS_SUCCESSFUL) of the funding. After dropping the features, the final data considered for the analysis is shown below.

![](Images/data2.png)

The above data needs to be converted to numerical data for fitting the neural network model. Before using one hot encoding to transform the data, the number of unique values in the categorical columns are determined using pandas `nunique()`. The result is shown below.

![](Images/nunique.png)

From the above, it can be seen that categorical features APPLICATION_TYPE and CLASSIFICATION have ~90 unique values which can make the number of features large after one hot encoding. To reduce the dimensionality, the number of unique values was reduced based on `value_counts()`. Following is a summary of the value counts for APPLICATION_TYPE.

![](Images/app_type.png)

To reduce the number of unique values in APPLICATION_TYPE a cut_off value of 150 was chosen and all other values were bundled into `Other` as shown below.

![](Images/group.png)

A similar exercise was done for CLASSIFICATION category and the result is shown below.

![](Images/class.png)

The feature data was one hot encoded with `pd.dummies()` and the data was split into training and testing data using sklearn `traintestsplit`. Further the data was scaled using sklearn `StandardScaler()`. 

### Logistic Regression

A logistic regression model was first fit to the data to see the model score.

![](Images/log_model.png)



### Deep Learning

A deep learning model with 2 hidden layers was fit to the data as shown below:

![](Images/nn.png)

This model resulted in a model score of 0.728 which is no better than simple logistic regression.

![](Images/n_2layer.png)

### Model Optimization

The number of hidden layers was increased to 4 to see if the fit will be better.

![](Images/n_4layer.png)

The 4 layer model resulted in an accuracy of 0.727. The result did not improve.

![](Images/attempt2.png)



The data of ASK_AMT category was seen to have outliers that can impact the model fit. 

![](Images/outlier.png)

To remove the outlier data, seaborn `strip plot()` was used to see the data density of ASK_AMT.

![](Images/sparse.png)

![](Images/dense.png)

Based on the above plots ASK_AMT data greater than 1e+6 was removed from the feature data and the model was fit again to see the accuracy.

![](Images/attempt3.png)

The model accuracy improved to 0.73 after removing outlier data. The outler data is further reduced to include only ASK_AMT < 1e+5 to see the effect on the result.

![](Images/vdense.png)

The model accuracy increased to 0.74.

![](Images/attempt4.png)
