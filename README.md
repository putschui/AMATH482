# Assignments from AMATH 482 - Computational Methods for Data Analysis

This is a repository of all the assignments I completed for AMATH 482. This course explored data analysis methods for a variety of applications.

## Assignments:
### Homework 1
The first assignment focused on using Fourier Transforms. Given a noisy ultrasound signal of a moving object, the frequency of the object had to first be found. Then, to find the location of the object at each point in time, a filter was applied in the frequency domain, centered around the frequency of the object.

### Homework 2
The second assignment delved into time-frequency analysis using Gabor transforms to create spectrograms. The effect of different parameters of the Gabor transform, such as window width, sampling amount, and translation distance, on the resulting spectrogram was investigated in the first part of the assignment. In the second part, the differences between the spectrograms of two musical instruments were investigated. Time-frequency analysis was also used to determine the exact notes and rhythm of the music being played by the instruments.

### Homework 3
The goal of the third assignment was to investigate the use of principal component analysis on the position data of a mass in a spring mass system recorded with cameras in different positions. There were four different situations for the apparent motion of the mass, such as rotation, horizontal motion, and camera shake. The position data was extracted from the videos and a snapshot matrix was constructed. PCA was then performed on the snapshot matrix.

### Homework 4
In the fourth assignment, three different music classifiers were created using linear discriminant analysis. Each classifier was trained with three classes of music, such as different bands or genres. Singular value decomposition was performed on the matrix of spectrogram data from the training set. The number of features from the SVD was reduced. Then, the optimal projection of the dataset that would best distinguish between the different classes was found using LDA.

### Homework 5
The fifth assignment also involved building classifiers, this time using neural networks. The classifiers were trained to identify articles of clothing from the Fashion-MNIST dataset. The first was a fully-connected neural network, and the second was a convolutional neural network. 