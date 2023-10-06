%% Step 4: Run this before classification
%
% Run step1_download_human_activity_data_and_save_to_mat_file once
% before running this function.  It only
% needs to be done once.  After that, the .mat files will be stored
% on your local drive.
%
% Implement new features: 3 features (Mean, Principal Component Analysis
% and Standard Deviation) are already implemented. You are required to
% implement additional features from the Activity Recognition Paper [
% Activity Recognition using Cell Phone Accelerometers by Jennifer R.
% Kwapisz et al ] , which we previously studied. 
clearvars
%% Description of the Data
% The dataset consists of accelerometer and gyroscope data captured at 
% 50Hz. The raw sensor data contain fixed-width sliding windows of 2.56 sec 
% (128 readings/window). The activities performed by the subject include:
% 'Walking', 'ClimbingStairs', 'Sitting', 'Standing',and 'Laying'
load rawSensorData_train
%%
rawSensorDataTrain = table(...
    total_acc_x_train, total_acc_y_train, total_acc_z_train, ...
    body_gyro_x_train, body_gyro_y_train, body_gyro_z_train);

%% The three features that were implemented in the webinar
T_mean = varfun(@Wmean, rawSensorDataTrain);
T_std = varfun(@Wstd,rawSensorDataTrain);
T_pca  = varfun(@Wpca1,rawSensorDataTrain);

% Specifically, implement the following features in separate MATLAB files:

% Average Absolute Difference
T_add = varfun(@averageAbsoluteDifference,rawSensorDataTrain);
% Average Resultant Acceleration
acc_ara = averageResultantAcceleration(total_acc_x_train, total_acc_y_train, total_acc_z_train);
gyro_ara = averageResultantAcceleration(body_gyro_x_train, body_gyro_y_train, body_gyro_z_train);
T_ara = table(acc_ara, gyro_ara);
% Time Between Peaks
T_timeBetweenPeaks = varfun(@timeBetweenPeaks,rawSensorDataTrain);
% Binned Distribution
T_binnedDistribution = varfun(@binnedDistribution,rawSensorDataTrain);
%% Separately, 
% implement the features listed in table 2 of the paper [ A survey on human
% activity recognition using wearable sensors ] in separate MATLAB files.
% You will need to follow the paper's references for the exact formulas.
% 
% Variance
T_var = varfun(@variance,rawSensorDataTrain);
% Interquartile range (IQR)
T_iqr = varfun(@interquartileRange,rawSensorDataTrain);
% Mean Absolute Deviation (MAD)
T_mad = varfun(@meanAbsoluteDeviation,rawSensorDataTrain);
%% Correlation between axes
[corr_xy_acc,corr_xz_acc,corr_yz_acc] = correlationBetweenAxes(total_acc_x_train, total_acc_y_train, total_acc_z_train);
[corr_xy_gyro,corr_xz_gyro,corr_yz_gyro] = correlationBetweenAxes(body_gyro_x_train, body_gyro_y_train, body_gyro_z_train);
T_correlationBetweenAxes = table(corr_xy_acc,corr_xz_acc,corr_yz_acc,...
    corr_xy_gyro,corr_xz_gyro,corr_yz_gyro);
%% Entropy
T_entropy = varfun(@myEntropy,rawSensorDataTrain);
%% Kurtosis
T_kurtosis = varfun(@myKurtosis,rawSensorDataTrain);

%% Put together datasets for Step 5
%% 1. 
% only the 3 original features (mean, PCA and Standard deviation)?
humanActivityData_1 = [T_mean, T_std, T_pca];
humanActivityData_1.activity = trainActivity;

%% 2. 
% 3 original features (mean, PCA, Standard deviation) and also Average
% Absolute Difference (i.e. 4 features in total)?
humanActivityData_2 = [T_mean, T_std, T_pca, T_add];
humanActivityData_2.activity = trainActivity;

%% 3. 
% 3 original features (mean, PCA, Standard deviation) and also Average
% Absolute Difference and Average Resultant Acceleration (i.e. 5 features
% in total)?
humanActivityData_3 = [T_mean, T_std, T_pca, T_add, T_ara];
humanActivityData_3.activity = trainActivity;
%% 4. 
% 3 original features (mean, PCA, Standard deviation), and also Average
% Absolute Difference, Average Resultant Acceleration and Time Between
% Peaks (i.e. 6 features in total)?
humanActivityData_4 = [T_mean, T_std, T_pca, T_add, T_ara, T_timeBetweenPeaks];
humanActivityData_4.activity = trainActivity;
%% 5. 
% 3 original features (mean, PCA, Standard deviation) and also Average
% Absolute Difference, Average Resultant Acceleration, Time Between Peaks
% and Binned Distribution (i.e. 7 features in total)?
humanActivityData_5 = [T_mean, T_std, T_pca, T_add, T_ara, T_timeBetweenPeaks, T_binnedDistribution];
humanActivityData_5.activity = trainActivity;

%% 6. 
% 3 original features (mean, PCA, Standard deviation) and also
% Interquartilve Range (IQR) (i.e. 4 features in total)?
humanActivityData_6 = [T_mean, T_std, T_pca, T_iqr];
humanActivityData_6.activity = trainActivity;

%% 7. 
% 3 original features (mean, PCA, Standard deviation) and Interquartile
% range (IQR), Mean Absolute Deviation (MAD), Correlation between axes,
% Entropy, and Kurtosis (i.e. 8 features in total)?
humanActivityData_7 = [T_mean, T_std, T_pca, T_iqr, T_mad, T_correlationBetweenAxes, T_entropy, T_kurtosis];
humanActivityData_7.activity = trainActivity;

%% Step 5
% classificationLearner
%
% New Session > From Workspace
%
%  Data Set Variable > Select Input >
%   and choose humanActivityData_1 through humanActivityData_7 one at a time.
%    Response > From data set variable
%
% Use default Valication Scheme: "Cross-Validation"
%
% Start Session
%
% Models: All
%
% Train All
%
% Sort by Accuracy
