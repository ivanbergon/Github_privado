x_2 = diamond_final.drop(["LogPrice"],axis=1)
y_2 = diamond_final.LogPrice

train_x2, test_x2, train_y2, test_y2 = train_test_split(x_2, y_2,random_state = 2,test_size=0.3)


rig_reg = linear_model.Ridge()
rig_reg.fit(train_x2,train_y2)
y2_pred = rig_reg.predict(test_x2)
print("accuracy: "+ str(rig_reg.score(test_x2,test_y2)*100) + "%")
print("Mean absolute error: {}".format(mean_absolute_error(test_y2,y2_pred)))
print("Mean squared error: {}".format(mean_squared_error(test_y2,y2_pred)))
R2 = r2_score(test_y2,y2_pred)
print('R Squared: {}'.format(R2))
n=test_x2.shape[0]
p=test_x2.shape[1] - 1

adj_rsquared = 1 - (1 - R2) * ((n - 1)/(n-p-1))
print('Adjusted R Squared: {}'.format(adj_rsquared))

