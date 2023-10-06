%% Download Human Activity Data
% This code is from Machine Learning Made Easy webinar from
% MathWorks
% https://www.mathworks.com/matlabcentral/fileexchange/50232-machine-learning-made-easy
%
% We modified saveSensorDataAsMATFiles to also work on Mac and
% Linux.
%
% Run this script first before running anything else.  It only
% needs to be done once.  After that, the .mat files will be stored
% on your local drive.


%% Description of the Data
% The dataset consists of accelerometer and gyroscope data captured at 
% 50Hz. The raw sensor data contain fixed-width sliding windows of 2.56 sec 
% (128 readings/window). The activities performed by the subject include:
% 'Walking', 'ClimbingStairs', 'Sitting', 'Standing',and 'Laying'
%%
% *How to get the data:*
% Execute |downloadSensorData| and follow the instructions to download the
% and extract the data from the source webpage. After the files have been
% extracted run |saveSensorDataAsMATFiles|. This will create two MAT files: 
% |rawSensorData_train|  and |rawSensorData_test| with the raw sensor data
%%
% # *total_acc_(x/y/z)_train :*  Raw accelerometer sensor data
% # *body_gyro_(x/y/z)_train :*  Raw gyroscope sensor data 
% # *trainActivity :*  Training data labels
% # *testActivity  :*  Test data labels

%% Reference:
% 
% Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
% Reyes-Ortiz. Human Activity Recognition on Smartphones using a
% Multiclass Hardware-Friendly Support Vector Machine. International
% Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
% Spain. Dec 2012

%% Download data from source
% If you are running this script for the first time, make sure that you
% execute these functions. 
%%
% * |downloadSensorData| : This function will download the dataset and
% extract its contents to a folder called: UCI HAR Dataset
% This folder must be present before you execute |saveSensorDataAsMATFiles|
if ~exist('UCI HAR Dataset','file')
    downloadSensorData;
end

%% Load data frome individual files and save as MAT file for reuse
% * |saveSensorDataAsMATFiles| : This function will load the data from the individual
% source files and save the data in a single MAT file for easy accesss 
if ~exist('rawSensorData_train.mat','file') && ~exist('rawSensorData_test.mat','file')
    saveSensorDataAsMATFiles;
end
