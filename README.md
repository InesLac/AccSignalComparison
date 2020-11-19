# AccSignalComparison
Comparison of vibration propagation in the hand using accelerometer signals

The main file calls all other functions present in the branch.
The process will enable the extraction of values from the csv file reccorded by the accelerometer array when using cpp file in the data_acquisition branch.

MAIN.M :

PART 1 : Load data from recorded file. Extract the 42(over 46) - accelerometer information and structure them to be organnized and process.
PART 2 : Operate signal treatments to reduce noise. 1) Moving average filter. 2) Bandpass 200-500 Hz.
PART 3 : Create dataset made of the extracted signals
PART 4 : use k-nn clissification
PART 5 : Visualize results from knn classification with confusion matrix
