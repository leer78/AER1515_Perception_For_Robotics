AER 1515 – Perception for Robotics
Lecture 3 – Machine Learning
Prof. Steven Waslander

Machine Learning Improvements
• NNs
• ML
• Improve explanation and positioning of validation set and
• Fix maximum likelihood to be general, then train/valsplit (move to ML)
connect to least squares • Cut down backprop, gradient descent to two slides
• Update slides to highlight the pieces and workflow in CNN
• Add maximum a posteriori, by including a prior on
tutorial
the parameter distributions with limited data
• Convs
• Expand list of other ideas from classic ML to point • Actually do conv tutorials and add one for robotic vision in
pytorch
people to, and the reasons they are interesting
• Update slides to highlight the pieces and workflow in tutorial
• Connect these examples to the course.
• RNNs
• Slightly expand backpropthrough time
• Add examples from robotics, language, tracking
• Transformers
• Add a slide or two describing the idea
• Show results on vision tasks/lidar
• Diffusion
• Add a slide or two describing the idea
• Show some results on vision/lidar tasks
2

Outline
• Machine Learning
• Neural networks
• Convolutional Neural Networks
• Recurrent Neural Networks
• Transformers
3

Machine Learning
“A computer program is said to learn from experience, E, with respect to some class of tasks, T,
and performance measure, P, if its performance at tasks in T, as measured by P, improves with
experience, E.”
[Machine Learning - Mitchell 1997]
• Tasks, T
• Classification, Regression, Segmentation, Object Detection, Transcription, Translation, Anomaly
Detection, Clustering, Imputation, Denoising, Captioning
• Experience, E
• Datasets with many data points, usually fixed in advance
• Labelled or unlabeled, leading to supervised or unsupervised learning
• Non-fixed datasets occur in reinforcement learning where algorithm interacts with environment
• Performance measure, P
• Accuracy, error rate, average precision, uncertainty error
• Training and test set performance evaluation
4

Linear Regression
• Linear regression (task)
• Given sample input points x ~ x and outcomes y ~ y (experiences), we seek to find a linear relationship
i i
between random variables x and y which must hold approximately for each sample
• The ordinary least squares version of linear regression seeks to find parameters θ = (b A A …)T that
1 2
minimize the mean square error (MSE) (performance measure) between measured and expected values
of y
• Let and
• The well-known solution to the linear regression problem is:
5

Scikit-Learn Diabetes Dataset Example
• Diabetes dataset – 442 records, 10 numerical features, no missing data
• Use single feature regression to predict quantitative progression of disease
• Feature 2 = Body mass index
# Load the diabetes dataset
diabetes = datasets.load_diabetes()
# Use only one feature
diabetes_X = diabetes.data[:, np.newaxis, 2]
# Create linear regression object
regr = linear_model.LinearRegression()
# Train the model using the training sets
regr.fit(diabetes_X, diabetes_y)
# Make predictions using the testing set
diabetes_y_pred = regr.predict(diabetes_X)
6

Maximum Likelihood Estimation for Linear Regression
• Assume that the error term in our linear regression is drawn from a Gaussian distribution,
and that y is again a linear combination of x, we can write
• We can express the probability distribution for y given x and parameters θ = {b, A} as
• To identify strong parameters, we want to identify the maximum likelihood estimate for y, that is,
we want to identify parameters, θ, that maximize the likelihood of the outcomes y given inputs x,
• Given that we have n independent and identically distributed samples, we get
7

Maximum Likelihood Estimation
• As usual, we take the log and switch to minimization - the negative log likelihood (NLL)
• If x is known, the conditional distribution for y is defined by the error between measured
i i
and predicted values for y which we can assume is Gaussian (isn’t everything?)
i,
8

Maximum Likelihood Estimation
• Substituting in, we see the negative log likelihood (NLL) becomes
• Which simplifies to
• If we assume identity for the covariance of Σ and we eliminate constants that don’t affect the
ε
optimization result, we arrive at least squares once again
9

Maximum A Posteriori Estimation
• Maximum likelihood but with a prior and Bayes rule is known as maximum a posteriori
• For linear regression problem studied so far
• Add prior distribution on parameters θ, can also be Gaussian
• The MAP estimate and model distribution can then be derived for distributions with conjugate priors
• Can be used to update a model when new samples become available
• Used to update state estimates with known models for the evolution of the state and measurement
probabilities
10

Learning Process
• Learning seeks to generalize its performance over a set of tasks, and not just fit to existing
data
• We are interested in performance on the underlying unknown data distribution:
• We only have access to a finite number of samples from this distribution:
• So we divide data into training and test sets
• Develop a model from training data through optimization
• Evaluate on test to determine generalization performance
11

Bias-Variance Trade-off
• When we fit data, we want our model to have an appropriate capacity.
• The more ‘capacity’ our model has (i.e., the more variance it is able to sustain), the more likely it is
to overfit to the training data and therefore have poor generalization. However, a model with a
capacity too low will not be very useful.
Underfit Just right Overfit
(high capacity, high variance)
(low capacity, high bias)
12
Lecture 26: Introduction to Deep Learning

Classical Machine Learning
• Logistic regression
• Regression to perform a binary classification instead of a continuous estimation
• Assume y is from a Bernoulli distribution, perform maximum likelihood estimation
• Becomes classification if output is thresholded to estimate output class
• Decision Trees and Random Forest
• For multi-variate inputs, create decisions trees with learned thresholds on each variable to branch on
• Repeat on different sections of the data to create forests and combine outputs
• Boosting
• Train models one at a time to correct errors of previous models. Combines many weak learning
models into a collection that performs better
13

Scikit-Learn Diabetes Dataset Example
• But in machine learning, we want to know how well we learned the generic task, T
• Predicting  disease progression for new patients, given body mass index measurement
• Divide data into 342 training and 100 test examples
|       | MSE     | Variance |
| ----- | ------- | -------- |
| Train | 3930.79 | 0.33     |
| Test  | 3753.77 | 0.38     |
14

Outline
• Machine Learning
• Neural networks
• Convolutional Neural Networks
• Recurrent Neural Networks
• Transformers
15

What is a Neural Network?
Up to 1 m in humans!
• An artificial neural network (ANN) is an U W p h a to le 2 s! 5 m in Blue
information processing algorithm inspired by a
simple model of the brain
• G. Hinton: “the brain must work somehow”
• It is a network of interconnected but simple
processing elements, neurons, that are used together
to solve a problem
Connections between neurons are weighted, similar to the way
in which synapses in the brain have varying strengths

Feedforward Neural Networks
• Functions to estimate:
• Object Classification: Image  Label
• Object Detection: Image  Labels + Bounding Boxes
• Depth Estimation: Image  Depth for every pixel
• Semantic Segmentation: Image  Label for every pixel
𝐶𝑎𝑟
𝑥 𝑓 𝑥; 𝜃 𝐶𝑦𝑎𝑟

Feedforward Neural Networks
• As with all machine learning models in this course, a Feedforward Neural Network (FNN)
| defines a mapping from input 𝒙 |     | to output 𝒚 | as:  |     |     |
| ------------------------------ | --- | ----------- | ---- | --- | --- |
𝑦 = 𝑓(𝑥;𝜃)
• An N-layer FNN is represented as the function composition:
|     | 𝑓 𝑥;𝜃 | = 𝑓 (cid:3015) | 𝑓 (cid:3015)(cid:2879)(cid:2869) | …𝑓 (cid:2870) | 𝑓 (cid:2869) 𝑥 |
| --- | ----- | -------------- | -------------------------------- | ------------- | -------------- |

Feedforward Neural Networks
| Hidden  |     | Hidden  |     | Hidden  |     |     |
| ------- | --- | ------- | --- | ------- | --- | --- |
| Layer 1 |     | Layer 2 |     | Layer 3 |     |     |
Input layer
Output Layer
|     | h1  |     | g1  |     | h1  |     |
| --- | --- | --- | --- | --- | --- | --- |
X1
|     | h2  |     | g2  |     | h2  | y   |
| --- | --- | --- | --- | --- | --- | --- |
X2
|            | h3    |            | g3         |                       | h3                              |                       |
| ---------- | ----- | ---------- | ---------- | --------------------- | ------------------------------- | --------------------- |
| (cid:2869) |       | (cid:2870) | (cid:2869) | (cid:2871) (cid:2870) | (cid:2872)(cid:2869) (cid:2871) | (cid:2870) (cid:2869) |
| 𝑓          | (𝑥) 𝑓 | 𝑓          | (𝑓𝑥)       | 𝑓                     | 𝑓𝑓 𝑓(𝑥)𝑓                        | 𝑓 (𝑥)                 |

Universal Approximation Theorem
• Neural networks with nonlinear activation functions are universal approximators.
• A NN with a single hidden layer (including a non-linearity) can approximate a given function and its
derivatives to arbitrary accuracy (with enough neurons).
• Intuitively, each neuron can learn a step function. Given enough step functions, we can approximate
any function.
f(x)
x f(x)
x
Arbitrary function f(x)
Approximation Capabilities of Muitilayer Feedforward Networks, Hornik et. al. (1991)
http://neuralnetworksanddeeplearning.com/chap4.html 20

Mode Of Action Of Neural Networks
• Training: Give neural network examples of 𝑓∗ 𝒙 . for a wide variation of the input 𝒙. Then,
| optimize its parameters 𝜽 |        |                            | to force 𝑓 | 𝒙;𝜽 | ≅ 𝑓∗ 𝒙 |
| ------------------------- | ------ | -------------------------- | ---------- | --- | ------ |
| • Pairs of 𝒙              | and 𝑓∗ | 𝒙 are called training data |            |     |        |
∗
|     | 𝒙   |     |     |     | 𝑓 𝒙 |
| --- | --- | --- | --- | --- | --- |
• Only output is specified by training data! Network is free to do anything with its hidden
layers

Hidden Units
Biological Neuron
• Hidden units are a linear combination of inputs passed through an
activation function
(cid:3021)
ℎ = 𝑔(𝑊 ℎ + 𝑏)
(cid:3041) (cid:3041)(cid:2879)(cid:2869)
• Activation function 𝑔
• Input ℎ
(cid:3041)(cid:2879)(cid:2869)
Artificial Neuron
• Weight matrix 𝑾
• Bias 𝒃
• Parameters 𝜽 are the weights and biases of all the layers of the
network
• Transformed parameters passed through activation function 𝑔
http://cs231n.github.io/neural-networks-1/

The Rectified Linear Unit: ReLU
• The ReLU hidden unit is currently the default choice of activation function for Feedforward
Neural Networks
• Why? Two distinct regions, one with a
stable gradient, the other with no effect.

| Example: Hidden Layer With ReLU |     |     |     |     |     |     |     | Activation Function |     |     |     |     |     |
| ------------------------------- | --- | --- | --- | --- | --- | --- | --- | ------------------- | --- | --- | --- | --- | --- |
−2 −18 −12
−6 −3 2
|     |     | −17 | 12  | −6  |     |     | 9   | −2  | 9   | 10  | −3  |       |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- |
| • ℎ | =   |     |     |     | ,   | 𝑊 = |     |     |     |     |     | , 𝑏 = |     |
−7 4 −9
| (cid:3041)(cid:2879)(cid:2869) |     | −14 | 2   | 7   |     |     | −3  | 10  | 4   | 6   | 3   |     |     |
| ------------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
−6 −12 −10
−8 4 −15
|                                               |     | 𝟐   | ×   | 𝟑   |     |     |     | 𝟐   | ×   | 𝟓   |     |     |     |
| --------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| • Evaluate affine transformation 𝑊(cid:3021)ℎ |     |     |     |     |     |     |     | +   | 𝑏:  |     |     | 𝟓 × | 𝟑   |
(cid:3041)(cid:2879)(cid:2869)
|     | 9   | −3  |     |     |     |     | −2  | −18 | −12 |     | −113 | 84  | −87 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- |
|     | −2  | 10  |     |     |     |     | −6  | −3  | 2   |     | −112 | −7  | 84  |
|     |     |     | −17 | 12  | −6  |     |     |     |     |     |      |     |     |
|     | 9   | 4   |     |     |     | +   | −7  | 4   | −9  | =   | −216 | 120 | −35 |
|     |     |     | −14 | 2   | 7   |     |     |     |     |     |      |     |     |
|     | 10  | 6   |     |     |     |     | −6  | −12 | −10 |     | −260 | 120 | −28 |
|     | −3  | 3   |     |     |     |     | −8  | 4   | −15 |     | 1    | −26 | 24  |
|     |     |     |     |     |     |     |     |     |     |     | 0    | 84  | 0   |
• Applying ReLU
|     |     |     |     |     |     |     |     |     |     |     | 0   | 0   | 84  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0,𝑊(cid:3021)ℎ
|     |     |     |     |     | ℎ =        | max |     |     | +                              | 𝑏   | = 0 | 120 | 0   |
| --- | --- | --- | --- | --- | ---------- | --- | --- | --- | ------------------------------ | --- | --- | --- | --- |
|     |     |     |     |     | (cid:3041) |     |     |     | (cid:3041)(cid:2879)(cid:2869) |     |     |     |     |
|     |     |     |     |     |            |     |     |     |                                |     | 0   | 120 | 0   |
|     |     |     |     |     |            |     |     |     |                                |     | 1   | 0   | 24  |

Other Common Activation Functions
• Sigmoid
• Tanh
• Maxout

Training Artificial Neural Networks
𝒙 𝑻𝒓𝒂𝒊𝒏𝒊𝒏𝒈 𝑫𝒂𝒕𝒂
∗
𝑥, 𝑓 𝑥
Hidden
𝜽
Neural
𝒏𝒆𝒘
Layers
Network
Output Layer
Optimization
Loss ∗
𝑦 = 𝑓 𝒙; 𝜽 𝑓 𝒙
Function

Neural Network Loss Functions
| • Thousands of training example pairs [𝒙, 𝑓∗ | 𝒙   | ]   |     |
| -------------------------------------------- | --- | --- | --- |
• The Loss function computed over all N training examples is termed the Training Loss and
can be written as:
(cid:3015)
1
,𝑓∗
| 𝐽 𝜃 = | (cid:3533)𝐿(𝑓 | 𝑥 ,𝜃       | (𝑥 ))      |
| ----- | ------------- | ---------- | ---------- |
|       |               | (cid:3036) | (cid:3036) |
𝑁
(cid:3036)(cid:2880)(cid:2869)
• The gradient of the training loss with respect to the parameters 𝜽 can be written as:
| (cid:3015) |     |     | (cid:3015) |
| ---------- | --- | --- | ---------- |
| 1          |     | 1   |            |
𝛻 𝐽 𝜃 = 𝛻 (cid:3533)𝐿(𝑓 𝑥 ,𝜃 ,𝑓∗ (𝑥 )) = (cid:3533)𝛻 𝐿(𝑓 𝑥 ,𝜃 ,𝑓∗ 𝑥 )
(cid:3087) (cid:3087) (cid:3036) (cid:3036) (cid:3087) (cid:3036) (cid:3036)
| 𝑁                              |     | 𝑁   |                                |
| ------------------------------ | --- | --- | ------------------------------ |
| (cid:3036)(cid:2880)(cid:2869) |     |     | (cid:3036)(cid:2880)(cid:2869) |

Backpropagation
• Question 1:
How can we compute the gradients of the parameters of an arbitrary neural network?
• Question 2:
How can we make the gradient computation efficient?
28

Chain Rule
• Given:
• Chain Rule:
…
• Backpropagation is just repeated application of the chain rule from Calculus 101.
29

Backpropagation (Chain Rule)
• Backpropagation:
1. Instantiate the computation as a directed acyclic graph, where
each intermediate quantity is a node
2. At each node, store
1. the intermediate quantity computed in the forward pass and
2. the partial derivative of the goal with respect to that node’s intermediate
quantity.
3. Initialize all partial derivatives to 0. …
4. Visit each node in reverse topological order. At each node, add its
contribution to the partial derivatives of its parents
• This algorithm is also called automatic differentiation in the
reverse-mode
30

Example of Backpropagation
• Binary classifier
(F) Loss
Output
…
Hidden Layer
…
Input
31

Example of Backpropagation
32

Example of Backpropagation
• So backpropagation allows us to efficiently compute the gradients for each set of network
parameters
(F) Loss
.
.
.
33

Parameter Optimization
• Batch Gradient Descent is an iterative first order optimization procedure
• Batch Gradient Descent Algorithm:
• Initialize parameters 𝜽
• While Stopping Condition is Not Met:
• Compute gradient of loss function over all training examples:
(cid:3015)
1
| 𝛻 𝐽 𝜃      | = (cid:3533)𝛻 | 𝐿 𝑓 𝑥 ,𝜃 ,𝑓∗ | 𝑥          |
| ---------- | ------------- | ------------ | ---------- |
| (cid:3087) | 𝑁 (cid:3087)  | (cid:3036)   | (cid:3036) |
(cid:3036)(cid:2880)(cid:2869)
• Update parameters according to:
|     | 𝜃 ← 𝜃 −𝜖𝛻 | 𝐽(𝜃) |     |
| --- | --------- | ---- | --- |
(cid:3087)

Batch Gradient Descent
𝜽
2
𝑱 𝜽
−𝝐𝛁 𝑱 𝜽
𝜽
∗
𝜽
(cid:2870)
Initialize parameters 𝜽
∗ 𝜽
𝜽
(cid:2869) 1

Parameter Initialization and Stopping Conditions
• Parameter Initialization:
• Weights: initialized by randomly sampling from a standard normal distribution
• Biases: initialized to 0
• Many other heuristics exist
• Stopping Conditions:
• Number of iterations: How many training iterations the neural network has performed
| • Change In 𝜽 | value: Stop if 𝜽 | − 𝜽 | < Threshold |
| ------------- | ---------------- | --- | ----------- |
𝑛𝑒𝑤 𝑜𝑙𝑑
| • Change In 𝑱(𝜽) | value: Stop if 𝐽(𝜽 | )   | − 𝐽(𝜽 ) < Threshold |
| ---------------- | ------------------ | --- | ------------------- |
|                  |                    | 𝑛𝑒𝑤 | 𝑜𝑙𝑑                 |

Batch Gradient Descent
• Backpropagation used to compute 𝛁 𝑱 𝜽 is very expensive to compute over the whole
𝜽
training dataset.
(cid:2869)
𝛁 𝑱 𝜽 =
∑(cid:3015)
𝛁 𝐿 [𝑓 𝑥,𝜃 ,𝑓
∗
𝑥 ] is a mean!
𝜽 (cid:3036) 𝜽 (cid:3036) (cid:3036)
(cid:2898)
(cid:3097)
• Standard error of the mean estimated from 𝑁 samples is , where 𝜎 is the standard deviation of the
√(cid:3015)
value of the samples
• Using all samples to estimate the gradient results in less than linear return in accuracy of this
estimate
• Instead, we can use a small subsample (Minibatch) of the training data to estimate the
gradient

Stochastic (minibatch) Gradient Descent
• Stochastic (minibatch) Gradient Descent Algorithm:
• Initialize parameters 𝜽
• While Stopping Condition is False:
• Sample a preset number 𝑁(cid:4593) of examples (minibatch) from the training data
• Compute gradient of Loss Function Over all training examples:
(cid:3015)(cid:4594)
1
𝛻 𝐽 𝜃 = (cid:3533)𝛻 𝐿 [𝑓 𝑥,𝜃 ,𝑓∗ 𝑥 ]
(cid:3087) (cid:3087) (cid:3036) (cid:3036)
𝑁′
(cid:3036)
• Update parameters according to:
𝜃 ← 𝜃 −𝜖𝛻 𝐽(𝜃)
(cid:3087)

What Minibatch Size To Use ?
• GPUs work better with powers of 2 batch sizes
• Large batch sizes > 256:
• Hardware underutilized with very small batch sizes.
• More accurate estimate of the gradient, but with less than linear returns
• Small batch size < 64
• Small batches can offer a regularizing effect. The best generalization error is often achieved with
batch size of 1.
• Small batch sizes allow for faster convergence, as the algorithm can compute the parameter updates
rapidly
• Always make sure dataset is shuffled before sampling minibatch

SGD Variations
• Many variations of SGD exist
• Momentum SGD, Nesterov Momentum SGD
• Ada-Grad, RMS-Prop
• ADAM (Adaptive Moment Estimation)
• Which one to use ?
• Usually ADAM: Implemented in most deep neural network libraries, fairly robust to the choice of
the learning rate and other hyperparameters
• http://deeplearningbook.org

Toy Example - XOR
𝒚
𝟐 𝟏
𝒙
𝟏 𝟐

Toy Example - XOR
Y
𝟐 𝟏
X
𝟏 𝟐
http://playground.tensorflow.org

Toy Example
𝒚
• Initial Design:
• 1 Layer NN, 2 Hidden Units/Layer
• Train set Loss: 0.264
• Val set Loss: 0.268 𝟏
• Minimum Loss achievable: 0.1
𝟐
𝒙
𝟏
http://playground.tensorflow.org

Toy Example
Y
• New Design:
• 6 Layer NN, 6 Hidden Units/Layer
• Train set Loss: 0.1
𝟐 𝟏
• Val set Loss: 0.45
• Minimum Loss achievable: 0.1
X
𝟏 𝟐
http://playground.tensorflow.org

| Regularization - |       | Parameter Norm Penalties |
| ---------------- | ----- | ------------------------ |
| • 𝐽 𝜃            | = 𝐽 𝜃 | + 𝛼Ω(𝜃)                  |
(cid:3045)(cid:3032)(cid:3034)
• 𝛼 is a hyperparameter that weights the relative contribution of the norm penalty to the value
of the loss function
• Ω(𝜽) is a measure of how large 𝜽’s value is, usually an Lp Norm
• We usually only constrain the size of weights and not biases
| • 𝐽 𝜃 | = 𝐽 𝜃 | + 𝛼Ω(𝑊) |
| ----- | ----- | ------- |
(cid:3045)(cid:3032)(cid:3034)

L2-Norm Parameter Penalty
|       | 1 1            |              |
| ----- | -------------- | ------------ |
| Ω 𝑊 = | 𝑊(cid:3021)𝑊 = | 𝑊 (cid:2870) |
(cid:2870)
|     | 2 2 |     |
| --- | --- | --- |
• New Design:
𝟐 𝟏
• 6 Layer NN, 6 Hidden Units/Layer
• Minimum Loss achievable: 0.1
• L2-Norm Penalty
• Train set Loss:0.1         0.176
• Val set Loss:   0.45       0.182
𝟏 𝟐
http://playground.tensorflow.org

Dropout
|     |     | 𝑃 = | 0.5 |     |     |
| --- | --- | --- | --- | --- | --- |
(cid:3038)(cid:3032)(cid:3032)(cid:3043)
|     | hhh111 | ggg111 |     | hhh111 |     |
| --- | ------ | ------ | --- | ------ | --- |
XXX111
|     | hhh222 | ggg222 |     | hhh222 | yyy |
| --- | ------ | ------ | --- | ------ | --- |
XXX222
|                  | hhh333 | ggg333 |                        | hhh333 |     |
| ---------------- | ------ | ------ | ---------------------- | ------ | --- |
| Multiply Weights |        | by 𝑃   | at the end of training |        |     |
(cid:3038)(cid:3032)(cid:3032)(cid:3043)
• Computationally inexpensive but powerful regularization method
• Does not significantly limit the type of model or training procedure that can be used
• Dropout layers are practically implemented in all neural network libraries

Early Stopping
Underfitting Overfitting
Training
Loss
Validation
Loss
Lowest
Validation
Loss

Outline
• Machine Learning
• Neural networks
• Convolutional Neural Networks
• Recurrent Neural Networks
• Transformers
49

CNN History
• First proposed by Kunihiko Fukushima in 1980,
the “neocognitron” included the two main
aspects of modern CNN, convolution and max
pooling layers.
• Alex Waibel then applied shared convolution
weights and backprop to the Temporal
Convolution Neural Network in 1987.
• In 1989, Yann LeCunn improved on these
works and applied backprop to CNNs on image
data, beating hand engineered performance on
the MNIST character recognition dataset in
1989.
50

Convolutional Neural Networks
Code at:https://github.com/oandrienko/fast-semantic-segmentation
Code at:https://github.com/kujason/avod

ImageNet Large Scale Visual Recognition Challenge (ILSVRC)
Ilya Alex
Sutskever Krizhevsky
Geoff
Hinton
Top 5
Error (%)
Human
Error (~5%)
52

Convolutional Neural Networks
Three types of operations
:
| 1. Convolution | 2. Pooling | 3. Non-Linearity (e.g, ReLU) |
| -------------- | ---------- | ---------------------------- |

Convolutional Neural Networks
• Used for processing data defined on grid
• 1D time series data, 2D images, 3D videos and voxel grids
• Two major type of layers:
• Convolution Layers
• Pooling Layers
• Example: VGG-16

Convolutions
• A window of weights called a ‘kernel’
or ‘filter’ is convolved with an input
image (here we see 5x5x3 input image)
• This results in significantly less
parameters than if we were to connect
each pixel to a weight!
• Each kernel can learn to pick out
specific features like edges
http://cs231n.github.io/convolutional-networks/

Convolution (Cross Correlation)
• Width: horizontal dimension of input volume
|     | 0 0 | 0 0 0 |     |
| --- | --- | ----- | --- |
• Height: vertical dimension of input volume
|     | 0 0 | 0 1 0 | W =3 |
| --- | --- | ----- | ---- |
• Depth: number of channels of input volume
|                                             | 0 0 | 2 0 0 |     |
| ------------------------------------------- | --- | ----- | --- |
|                                             | 0 2 | 1 0 0 |     |
|                                             | 0 0 | 0 0 0 | H=3 |
| • Padding size: essential to retain shape!  | 0 0 | 0 0 0 |     |
|                                             | 0 0 | 1 2 0 |     |
D=3
|     | 0 1 | 0 0 0 |     |
| --- | --- | ----- | --- |
|     | 0 1 | 0 0 0 |     |
|     | 0 0 | 0 0 0 |     |
|     | 0 0 | 0 0 0 |     |
|     | 0 2 | 1 0 0 |     |
P=1
|     | 0 0 | 1 0 0 |     |
| --- | --- | ----- | --- |
|     | 0 0 | 0 1 0 |     |
|     | 0 0 | 0 0 0 |     |

Convolution (Cross Correlation)
| 0 0 | 0 0 0 |         |
| --- | ----- | ------- |
| 0 0 | 0 1 0 |         |
| 0 0 | 2 0 0 |         |
| 0 2 | 1 0 0 |         |
| 0 0 | 0 0 0 |         |
| 0 0 | 0 0 0 | Weights |
| 0 0 | 1 2 0 |         |
| 0 1 | 0 0 0 |         |
| 0 1 | 0 0 0 |         |
| 0 0 | 0 0 0 |         |
| 0 0 | 0 0 0 |         |
| 0 2 | 1 0 0 | Bias    |
| 0 0 | 1 0 0 |         |
| 0 0 | 0 1 0 |         |
| 0 0 | 0 0 0 |         |

Convolution (Cross Correlation)
Output
| 0 0 | 0 0 0 |     |
| --- | ----- | --- |
2
| 0 0 | 0 1 0 |     |
| --- | ----- | --- |
+
| 0 0 | 2 0 0 |     |
| --- | ----- | --- |
| 0 2 | 1 0 0 |     |
0
| 0 0 | 0 0 0 |     |
| --- | ----- | --- |
| 0 0 | 0 0 0 | +   |
| 0 0 | 1 2 0 |     |
| 0 1 | 0 0 0 | 4   |
| 0 1 | 0 0 0 |     |
+
| 0 0 | 0 0 0 |     |
| --- | ----- | --- |
1
| 0 0 | 0 0 0 |     |
| --- | ----- | --- |
| 0 2 | 1 0 0 |     |
| 0 0 | 1 0 0 |     |
7
| 0 0 | 0 1 0 |     |
| --- | ----- | --- |
| 0 0 | 0 0 0 |     |

Cross Correlation
• Stride: The number of pixels the filter is moved in the vertical and horizontal
Output
direction.
| 0 0 | 0 0 0 |        |
| --- | ----- | ------ |
| 0 0 | 0 1 0 | Height |
| 0 0 | 2 0 0 |        |
| 0 2 | 1 0 0 |        |
Width
| 0 0 | 0 0 0 |     |
| --- | ----- | --- |
Depth
| 0 0 | 0 0 0 |     |
| --- | ----- | --- |
| 0 0 | 1 2 0 |     |
| 0 1 | 0 0 0 |     |
| 0 1 | 0 0 0 |     |
| 0 0 | 0 0 0 |     |
| 0 0 | 0 0 0 |     |
| 0 2 | 1 0 0 |     |
| 0 0 | 1 0 0 |     |
| 0 0 | 0 1 0 |     |
| 0 0 | 0 0 0 |     |

Output Volume Shape
| • Filters are size 𝒎 |     | × 𝒎 |     |     |
| -------------------- | --- | --- | --- | --- |
• Number of filters = 𝑲
| • Stride = 𝑺, | Padding | = 𝑷 |     |     |
| ------------- | ------- | --- | --- | --- |
𝑾 (cid:2879)(cid:3040)(cid:2878)(cid:2870)×(cid:3017)
𝒊𝒏
|     |     | 𝑾   | =   | +1  |
| --- | --- | --- | --- | --- |
𝒐𝒖𝒕
(cid:3020)
𝑯 (cid:2879)(cid:3040)(cid:2878)(cid:2870)×(cid:3017)
|     |     | 𝑯   | = 𝒊𝒏 | +1  |
| --- | --- | --- | ---- | --- |
𝒐𝒖𝒕
(cid:3020)
𝑫 = 𝐾
𝒐𝒖𝒕

Pooling Layers: Max Pooling
|       |      | max | 21, 8, | 12, 19 | = 21  |
| ----- | ---- | --- | ------ | ------ | ----- |
| 21 8  | 8 12 |     |        |        |       |
| 12 19 | 9 7  |     |        |        | 21 12 |
| 8 10  | 4 3  |     |        |        | 18 10 |
| 18 9  | 10 9 |     |        |        |       |

Output Volume Shape
• Pool size 𝒏 × 𝒏
• Stride = 𝑺
|     | 𝑾 (cid:2879)(cid:3041) |     |
| --- | ---------------------- | --- |
𝒊𝒏
| 𝑾   | =   | +1  |
| --- | --- | --- |
𝒐𝒖𝒕
(cid:3020)
|     | 𝑯 (cid:2879)(cid:3041) |     |
| --- | ---------------------- | --- |
| 𝑯   | = 𝒊𝒏                   | +1  |
𝒐𝒖𝒕
(cid:3020)
| 𝑫   | = 𝑫 |     |
| --- | --- | --- |
|     | 𝒐𝒖𝒕 | 𝒊𝒏  |

Convolutions | What do they pick out?
Lower convolutional layers pick out edges and basic shapes.
Zeiler, Matthew D., and Rob Fergus. "Visualizing and understanding convolutional networks." European conference on computer vision. Springer, Cham, 2014.

Convolutions | What do they pick out?
Higher layers can pick out more complicated structures.
64

Convnet performance evaluation - Imagenet
65

| Convnet | performance - | Imagenet |
| ------- | ------------- | -------- |
66

Advantages of ConvNets
• Convolutional neural networks are a natural choice to process images by design
• Convolutional layers have fewer parameters than fully connected layers, reducing the
chances of overfitting
• Convolutional layers use the same parameters to process every block of the image. Along
with pooling layers, this leads to translation invariance, which is often important for image
understanding tasks

Putting it together – Fashion MNIST or MNIST Tutorials using Keras
• Fashion MNIST: 70,000 Ultra-small images of fashion items
• Easy instructions on using Keras in python to give it a go.
• https://www.datacamp.com/community/tutorials/convolutional-neural-
networks-python
• MNIST: The original CNN dataset
Fashion MNIST
• https://machinelearningmastery.com/how-to-develop-a-convolutional-
neural-network-from-scratch-for-mnist-handwritten-digit-classification/
• Challenge Problem: Achieve 94% classification accuracy on
CIFAR-10 using a Resnet-18 backbone. Needs all the tricks
• Regularization
MNIST
• Normalization
• Data augmentations
• Learning rate schedules, rates tuning
• Hyperparameter search
CIFAR-10

Outline
• Machine Learning
• Neural networks
• Convolutional Neural Networks
• Recurrent Neural Networks
• Transformers
69

Sequential Data (Time Series, Natural Language Processing, Object Tracking)
• Not all problems can be converted into one with fixed-length inputs and outputs
• Problems such as Speech Recognition or Time-series Prediction require a system
to store and use context information
• Simple case: Output YES if the number of 1s is even, else NO
1000010101 – YES, 100011 – NO, …
• Hard/Impossible to choose a fixed context window
• There can always be a new sample longer than anything seen
• Robotics often has time series problems, e.g. odometry, object tracking

Motivation for adding recurrence
• Recurrent Neural Networks take the previous output or hidden states as inputs. The composite
input at time t has some historical information about the happenings at time T < t
• RNNs are useful as their intermediate values (state) can store information about past inputs for a
time that is not fixed a priori
• RNNs proved difficult to train due to gradient vanishing and exploding when backpropagating
through time, and rigid in the way the system evolved, needing attention to amplify long range
connections.

The LSTM Cell
|     |     |     |     | x h   |     |     |     | x h   |
| --- | --- | --- | --- | ----- | --- | --- | --- | ----- |
|     |     |     |     | t t-1 |     |     |     | t t-1 |
• The LSTM uses this idea of “Constant
|                                   |     |            |     | W   |     |     |             | W   |
| --------------------------------- | --- | ---------- | --- | --- | --- | --- | ----------- | --- |
| Error Flow” for RNNs to create a  |     |            |     | i   |     |     |             | o   |
|                                   |     | Input Gate |     | i   |     |     | Output Gate | o   |
|                                   |     |            |     | t   |     |     |             | t   |
“Constant Error Carousel” (CEC)
which ensures that gradients don’t
decay
|     | x   | W   |     |     |     | Cell |     |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | --- |
t
c h
t t
• The key component is a memory cell
h
t-1
that acts like an accumulator (contains
the identity relationship) over time
f Forget Gate
t
W
f
• Instead of computing new state as a
matrix product with the old state, it
rather computes the difference
|     |     |     |     |     |     | x h   |     |     |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- |
|     |     |     |     |     |     | t t-1 |     |     |
between them. Expressivity is the
same, but gradients are better behaved
|     |     |     |     |     |     |     | æ æ | x ö ö |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- |
æ x ö
|     |     |      |     |         |     | f =s | W     | t +b  |
| --- | --- | ---- | --- | ------- | --- | ---- | ----- | ----- |
|     | c = | f Äc | +i  | Ä tanhW |     | t    |       |       |
|     |     |      |     |         | ç   | ÷ t  | ç f ç | ÷ f ÷ |
|     | t   | t    | t-1 | t       |     |      | è è h | ø ø   |
è h ø
t-1 72
t-1

Outline
• Machine Learning
• Neural networks
• Convolutional Neural Networks
• Recurrent Neural Networks
• Transformers
73

Transformers
• Natural language processing needs long-range relationships to be captured, but only those that matter
• Transformers provide a mechanism to focus attention on different relationships between data in a
sequence
• Turns out to be useful in visual data too, where context can sometimes be important at the image level.
74

Transformer Basics
• Estimates how strongly correlated one element is to its neighbours in a sequence.
• 3 sets of inputs: Queries (Q) and Key (K), Value (V) pairs
• Attention map measures correlation between Q and K, and reweights V based on it
• Lots of uses in vision, point clouds, popping up everywhere
75
• [8] https://lilianweng.github.io/posts/2018-06-24-attention/
• [9] Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., Kaiser, Ł., & Polosukhin, I. (2017). Attention is all you need. Advances in Neural Information Processing Systems, 2017-Decem(Nips), 5999–6009.

Self-attention
• Each of the tokens (=vectors) attends to all tokens
• Extra tricks: learned key, query, and value projections,
inverse-sqrt scaling in the softmax, and multi-headed
attention (omit for simplicity)
• It’s a set operation (permutation-invariant)
• ...and hence need “position embeddings” to “remember”
the spatial structure
• It’s a global operation
• Aggregates information from all tokens
Simplified! Multi-headed attention not shown

Transformer self-attention layer
| Input:     | (matrix    | of n embedding | vectors, each | dim m) |
| ---------- | ---------- | -------------- | ------------- | ------ |
| Parameters | (learned): |                |               |        |
Compute:
n

Transformer self-attention
|        | n      | x n attention | map (each | row-sum | =1) |
| ------ | ------ | ------------- | --------- | ------- | --- |
| Output | matrix | H =           |           |         |     |
Self-attention explicitly models interactions between all pairs of input embeddings

Multi-Head attention

Transformers for vision?
| ●   | “LSTM | →   | Transformer” |     |     | ~ “ConvNet |     | →   | ??? | ”   |     |     |     |     |
| --- | ----- | --- | ------------ | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
● Issue with self-attention for vision: computation is quadratic in the input
|     | sequence |      | length,   | quickly |         | gets | very       | expensive |         |           |          |             |          |         |
| --- | -------- | ---- | --------- | ------- | ------- | ---- | ---------- | --------- | ------- | --------- | -------- | ----------- | -------- | ------- |
|     |          |      |           |         |         |      |            |           |         |           | (with    | > few       | thousand | tokens) |
|     | ○        | For  | ImageNet: |         | 224x224 |      | pixels     | →         | ~50,000 |           | sequence |             | length   |         |
|     | ○        | Even | worse     | for     | higher  |      | resolution |           | and     | video     |          |             |          |         |
|     |          |      | How       | can     | we      | deal | with       |           | this    | quadratic |          | complexity? |          |         |

Vision Transformer (ViT)
Idea: Take a
transformer and apply
it directly to image
patches
Cordonnieretal., On theRelationshipbetweenSelf-AttentionandConvolutional Layers,ICLR2020
Dosovitskiyetal.,An ImageisWorth16x16Words:TransformersforImageRecognitionatScale,ICLR2021

ResNet-ViT Hybrid
BichenWuetal.VisualTransformers:Token-basedImageRepresentationandProcessingforComputerVision,arXiv2020
Dosovitskiyetal.,An ImageisWorth16x16Words:TransformersforImageRecognitionatScale,ICLR2021

Scaling Laws
How many images do you need for a big model & vice-versa?
84.86%top-1accuracyon10-shot
ImageNet(<1%oftrainset) ImageNetSOTA ImageNet(OOD/re-label)variants 19diversetasks
| ViT-G/14: | 2B params, | 3B  |
| --------- | ---------- | --- |
images
| XiaohuaZhaiet | al., ScalingVision | Transformers, arXiv2021 |
| ------------- | ------------------ | ----------------------- |

Summary
• Machine learning is an important and powerful tool for extracting understanding from input
and relies on converting patterns in input to features
• Learning can be thought of as a generalization of maximum likelihood estimation, where the
task is not just to fit existing data but instead to build a model for future data from the same
input source.
• Neural Networks are extremely effective at a wide range of learning tasks, and use back
propagation to
• Convolutional Neural Networks are particularly well suited to processing sensor data, due to
inherent spatial invariance and ability to extract low-dimensional representation from high-
dimensional data
• Sequential data (time-series, NLP) need long-range relationships to be maintained, and so
recurrent networks and transformers have been proposed to address this
84

## Extracted Images

### Page 1

![page001_img001.jpeg](img/page001_img001.jpeg)

### Page 6

![page006_img001.jpeg](img/page006_img001.jpeg)

### Page 12

![page012_img001.jpeg](img/page012_img001.jpeg)

### Page 14

![page014_img001.jpeg](img/page014_img001.jpeg)

### Page 16

![page016_img001.jpeg](img/page016_img001.jpeg)

### Page 17

![page017_img001.jpeg](img/page017_img001.jpeg)
![page017_img002.jpeg](img/page017_img002.jpeg)
![page017_img003.jpeg](img/page017_img003.jpeg)
![page017_img004.jpeg](img/page017_img004.jpeg)

### Page 19

![page019_img001.jpeg](img/page019_img001.jpeg)
![page019_img002.jpeg](img/page019_img002.jpeg)
![page019_img003.jpeg](img/page019_img003.jpeg)
![page019_img004.jpeg](img/page019_img004.jpeg)
![page019_img005.jpeg](img/page019_img005.jpeg)
![page019_img006.jpeg](img/page019_img006.jpeg)
![page019_img007.jpeg](img/page019_img007.jpeg)

### Page 20

![page020_img001.jpeg](img/page020_img001.jpeg)
![page020_img002.jpeg](img/page020_img002.jpeg)
![page020_img003.jpeg](img/page020_img003.jpeg)
![page020_img004.jpeg](img/page020_img004.jpeg)
![page020_img005.jpeg](img/page020_img005.jpeg)
![page020_img006.jpeg](img/page020_img006.jpeg)

### Page 21

![page021_img001.jpeg](img/page021_img001.jpeg)
![page021_img002.jpeg](img/page021_img002.jpeg)

### Page 22

![page022_img001.jpeg](img/page022_img001.jpeg)
![page022_img002.jpeg](img/page022_img002.jpeg)

### Page 23

![page023_img001.jpeg](img/page023_img001.jpeg)

### Page 25

![page025_img001.jpeg](img/page025_img001.jpeg)
![page025_img002.jpeg](img/page025_img002.jpeg)

### Page 26

![page026_img001.jpeg](img/page026_img001.jpeg)
![page026_img002.jpeg](img/page026_img002.jpeg)
![page026_img003.jpeg](img/page026_img003.jpeg)
![page026_img004.jpeg](img/page026_img004.jpeg)

### Page 42

![page042_img001.jpeg](img/page042_img001.jpeg)
![page042_img002.jpeg](img/page042_img002.jpeg)

### Page 43

![page043_img001.jpeg](img/page043_img001.jpeg)
![page043_img002.jpeg](img/page043_img002.jpeg)

### Page 44

![page044_img001.jpeg](img/page044_img001.jpeg)
![page044_img002.jpeg](img/page044_img002.jpeg)

### Page 46

![page046_img001.jpeg](img/page046_img001.jpeg)

### Page 47

![page047_img001.jpeg](img/page047_img001.jpeg)
![page047_img002.jpeg](img/page047_img002.jpeg)
![page047_img003.jpeg](img/page047_img003.jpeg)
![page047_img004.jpeg](img/page047_img004.jpeg)
![page047_img005.jpeg](img/page047_img005.jpeg)
![page047_img006.jpeg](img/page047_img006.jpeg)

### Page 48

![page048_img001.jpeg](img/page048_img001.jpeg)
![page048_img002.jpeg](img/page048_img002.jpeg)

### Page 50

![page050_img001.jpeg](img/page050_img001.jpeg)

### Page 51

![page051_img001.jpeg](img/page051_img001.jpeg)
![page051_img002.jpeg](img/page051_img002.jpeg)
![page051_img003.jpeg](img/page051_img003.jpeg)

### Page 52

![page052_img001.jpeg](img/page052_img001.jpeg)
![page052_img002.jpeg](img/page052_img002.jpeg)
![page052_img003.jpeg](img/page052_img003.jpeg)
![page052_img004.jpeg](img/page052_img004.jpeg)

### Page 53

![page053_img001.jpeg](img/page053_img001.jpeg)

### Page 54

![page054_img001.jpeg](img/page054_img001.jpeg)

### Page 55

![page055_img001.jpeg](img/page055_img001.jpeg)

### Page 56

![page056_img001.png](img/page056_img001.png)

### Page 57

![page057_img001.jpeg](img/page057_img001.jpeg)
![page057_img002.png](img/page057_img002.png)
![page057_img003.png](img/page057_img003.png)

### Page 58

![page058_img001.jpeg](img/page058_img001.jpeg)
![page058_img002.jpeg](img/page058_img002.jpeg)
![page058_img003.jpeg](img/page058_img003.jpeg)

### Page 59

![page059_img001.jpeg](img/page059_img001.jpeg)
![page059_img002.jpeg](img/page059_img002.jpeg)
![page059_img003.jpeg](img/page059_img003.jpeg)
![page059_img004.png](img/page059_img004.png)

### Page 63

![page063_img001.jpeg](img/page063_img001.jpeg)

### Page 64

![page064_img001.jpeg](img/page064_img001.jpeg)

### Page 65

![page065_img001.jpeg](img/page065_img001.jpeg)

### Page 66

![page066_img001.jpeg](img/page066_img001.jpeg)
![page066_img002.jpeg](img/page066_img002.jpeg)

### Page 67

![page067_img001.jpeg](img/page067_img001.jpeg)

### Page 68

![page068_img001.jpeg](img/page068_img001.jpeg)
![page068_img002.jpeg](img/page068_img002.jpeg)
![page068_img003.jpeg](img/page068_img003.jpeg)

### Page 71

![page071_img001.jpeg](img/page071_img001.jpeg)
![page071_img002.jpeg](img/page071_img002.jpeg)

### Page 72

![page072_img001.jpeg](img/page072_img001.jpeg)

### Page 74

![page074_img001.jpeg](img/page074_img001.jpeg)

### Page 75

![page075_img001.jpeg](img/page075_img001.jpeg)
![page075_img002.jpeg](img/page075_img002.jpeg)
![page075_img003.jpeg](img/page075_img003.jpeg)

### Page 76

![page076_img001.jpeg](img/page076_img001.jpeg)
![page076_img002.jpeg](img/page076_img002.jpeg)
![page076_img003.jpeg](img/page076_img003.jpeg)
![page076_img004.jpeg](img/page076_img004.jpeg)
![page076_img005.jpeg](img/page076_img005.jpeg)
![page076_img006.jpeg](img/page076_img006.jpeg)
![page076_img007.jpeg](img/page076_img007.jpeg)
![page076_img008.jpeg](img/page076_img008.jpeg)
![page076_img009.jpeg](img/page076_img009.jpeg)
![page076_img010.jpeg](img/page076_img010.jpeg)

### Page 77

![page077_img001.jpeg](img/page077_img001.jpeg)
![page077_img002.jpeg](img/page077_img002.jpeg)
![page077_img003.jpeg](img/page077_img003.jpeg)
![page077_img004.jpeg](img/page077_img004.jpeg)
![page077_img005.jpeg](img/page077_img005.jpeg)
![page077_img006.jpeg](img/page077_img006.jpeg)
![page077_img007.jpeg](img/page077_img007.jpeg)

### Page 78

![page078_img001.jpeg](img/page078_img001.jpeg)

### Page 79

![page079_img001.jpeg](img/page079_img001.jpeg)

### Page 81

![page081_img001.jpeg](img/page081_img001.jpeg)
![page081_img002.jpeg](img/page081_img002.jpeg)
![page081_img003.jpeg](img/page081_img003.jpeg)
![page081_img004.jpeg](img/page081_img004.jpeg)
![page081_img005.jpeg](img/page081_img005.jpeg)

### Page 82

![page082_img001.jpeg](img/page082_img001.jpeg)

### Page 83

![page083_img001.jpeg](img/page083_img001.jpeg)
![page083_img002.jpeg](img/page083_img002.jpeg)
![page083_img003.jpeg](img/page083_img003.jpeg)
