d = dir('ClassificationLearnerSession*.mat');
for k = 1:length(d)
    disp('Type dbcont to continue, dbquit to quit')
    classificationLearner(d(k).name);
    keyboard
end
disp('done')