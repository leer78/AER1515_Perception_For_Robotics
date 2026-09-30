AER 1515 – Perception for Robotics
Lecture 1 - Introduction
Prof. Steven Waslander

Syllabus – Contact Info
• Contact Info:
• Prof. Steven Waslander
• Office: UTIAS - 184
• steven.Waslander@robotics.utias.utoronto.ca
• Can Xu
• Assignments
• Can.xu@robotics.utias.utoronto.ca
2

What is Perception for Robotics?
Magic
3

Modular Robotic Perception Architecture
Sensors
|     |     | Scene         | Mission  |
| --- | --- | ------------- | -------- |
|     |     | Understanding | Planning |
Object Detection
Exteroceptive
Camera
| Lidar | Object Tracking | Object Prediction | Behaviour  |
| ----- | --------------- | ----------------- | ---------- |
Segmentation
| Radar |     |     | Planning |
| ----- | --- | --- | -------- |
Sonar
Localization
Motion
| Proprioceptive |     |     | Planning |
| -------------- | --- | --- | -------- |
Mapping
GNSS
INS
Wheel  Ego-motion
Control
Odometry estimation
4

|     |     | Perception |     | Planning |
| --- | --- | ---------- | --- | -------- |
Sensors
Proprioceptive
Ego-motion
GNSS
estimation
INS
Wheel
| Odometry | Localization |     | Scene         | Mission  |
| -------- | ------------ | --- | ------------- | -------- |
|          |              |     | Understanding | Planning |
Mapping
Exteroceptive
Camera
|     | Segmentation |     |     | Motion  |
| --- | ------------ | --- | --- | ------- |
Lidar Control
|     |     | Object Tracking | Object Prediction | Planning |
| --- | --- | --------------- | ----------------- | -------- |
Radar
Object Detection
Sonar
5

Course Sequence Overview
State Estimation  Control for
for Robotics Robotics
• Converting raw sensor  • Identifying a sequence
data into actionable  of actions that achieve a
information about the  goal based on the
| • Combining perception  |     | • Executing a sequence of  |
| ----------------------- | --- | -------------------------- |
robot state and the state  measurements over time  estimated robot state  actions reliably to
of its environment. and state of its
| to construct an accurate    |              | achieve a desired robot  |
| --------------------------- | ------------ | ------------------------ |
| estimate of the robot       | environment. | state and state of its   |
| state and the state of its  |              | environment              |
environment.
Perception for  Planning for
Robotics Robotics
6

Perception’s Biggest Consumers
• Localization, Ego Motion
Estimation
• Mapping, Reconstruction,
Photogrammetry
• Planning & Control
• Calibration
• Safety Assurance
7

From humble points to glorious objects
8

Course Content
| Lecture  | Date  |     | Title |
| -------- | ----- | --- | ----- |
Module 1: Foundations
| 1   | Sept. 10  | Introduction                              |     |
| --- | --------- | ----------------------------------------- | --- |
| 2   | Sept. 17  | Probability, Information and Optimization |     |
| 3   | Sept. 24  | Machine Learning                          |     |
| -   | Oct. 1    | No lecture, Prof. Waslander Traveling     |     |
| 4   | Oct. 8    | Sensor Modeling                           |     |
| 5   | Oct. 15   | Vision Sensor Modeling                    |     |
Module 2: Static World
| 6   | Oct. 22 | 3D Point Clouds Registration and 3D Features |     |
| --- | ------- | -------------------------------------------- | --- |
7 Oct. 29 Features – Detection, Description, Matching and Tracking
| 8   | Nov. 5  | Pose, Depth, Feature SLAM                          |     |
| --- | ------- | -------------------------------------------------- | --- |
| 9   | Nov. 12 | Direct Methods, Deep Methods and Place Recognition |     |
Module 3: Dynamic World
| 10  | Nov. 19 | 2D Classification, Detection and Segmentation |     |
| --- | ------- | --------------------------------------------- | --- |
| 11  | Nov. 26 | 3D Detection and Segmentation                 |     |
| 12  | Dec. 3  | 3D Tracking and Prediction                    |     |
9
| 13  | Dec. 7 | The Open World |     |
| --- | ------ | -------------- | --- |

Syllabus - Lectures
• Lectures:
• Main Lecture - Thursdays 9:10 PM – 11:00PM, UTIAS Lecture Hall and Zoom
• Communication:
• Announcements through Quercus
• Slides, videos, code, resources posted to Quercus throughout semester
• All corrections noted with revision number
• Assignments posted on scheduled dates
• Due 2-3 weeks later
10

Syllabus - Prerequisites
• Prerequisites
• Linear Algebra
• Probability Theory
• Optimization theory
• Python or Matlab
• Useful skills
• Deep Learning
• State Estimation theory
• Statistics
11

Syllabus - Resources
• Resources
• Lecture Slides
• Updated versions posted after lectures on Quercus
• Recommended Texts (none required)
• K. Murphy, Probabilistic Machine Learning: An Introduction, MIT Press, 2022.
• S. Thrun, W. Burgard, and D. Fox. Probabilistic Robotics. MIT Press, 2005. 3rd Ed.
• R. Szeliski, Computer Vision: Algorithms and Applications. 2nd. Ed., Springer-Nature., 2023.
• Also Multi-view Geometry, Hartley and Zisserman, Deep Learning, Courville, Bengio, Goodfellow.
12

Syllabus – Assignments
• Assignments (Three total)
• Three dataset exercises of different perception algorithms
• Convnet Classification, Stereo Matching and Point Cloud Registration, 2D Object Detection and 3D
Segmentation
• Helpful to have good computational resources for final assignment (GPU!)
• Independent write-up required, ok to work together in developing solution
• Submit as pdf, more instruction to follow as part of assignment handout.
• Do not include learning model in submissions!
13

Syllabus – Assignments
• Assignments (Four total)
• One supplemental topic presentation – Paper review
• Must be from 2019-2020 (ICRA, IROS, RSS, CoRL, CVPR, ICCV, ECCV, IJRR, JFR, T-RO)
• 10 minute presentation in third hour of lecture
• Select a slot based on topic of the day (try to match)
• Sign up on quercus before Friday at midnight!
• Name, Paper title
• Independent work required
14

Presentation Rubric
• Paper description (20%): What is the core problem or method addressed and
why is it challenging/interesting?
• Quality of Technical Content (50%): Are the concepts employed clearly
understood, explained and applied correctly, are derivations correct, reasoning
valid, content of use and well thought out? Is there an interesting example that
demonstrates or explores the performance of the method.
• Presentation Quality (30%): Was the presentation clear, concise, did it follow a
logical structure, could the presenter answer questions?
15

| Example Presentation – | PointPillars | (CVPR 2019) |
| ---------------------- | ------------ | ----------- |
16

Syllabus - Projects
• Team Size: Groups of one or two
• Project must be related to one of the main topics of the course
• From your own research
• From a Kaggle competition or established benchmark
• The application of existing methods to a new problem or dataset
• An extensive literature review on a topic with some evaluation of methods
• Four deliverables: Proposal, Initial results, 5 – minute Video and 6 page IEEE 2 column
format Report
• Must have some implemented and tested component to verify claims.
• Not just literature review, or running of existing libraries
• Can be existing code on a different dataset, or modified code on existing data
• Some measure of novelty is important – aim for publication, most won’t make it
17

Rubrics
• Video • Report
• Project Motivation/Applications (20%): • Introduction (20%)
• Is there a believable application for the work, • Motivation / Applications
does it relate to the course content, is there a
• Related Work
need that is fullled by the project?
• Quality of Technical Content (50%)
• Quality of Technical Content (30%):
• Problem Formulation
• Are the concepts employed clearly understood,
• Algorithm Denition
explained and applied correctly, is the work an
extension of the theory presented in class, are • Extensions to Course Knowledge
derivations correct, reasoning valid, content of
• Completion of Objectives (20%)
use and well thought out?
• Functional Simulations
• Overall Completion of Objectives (30%):
• Clear Presentation of Results
• Did the team set reasonable goals and achieve
those goals this semester, was sucient effort • Report Quality (10%)
expended to achieve those goals?
• Formatting, spelling, grammar
• Presentation Quality (20%):
• Images, labeling of axes
• Was the video clear, concise, did it document
progress well, could the presenter answer
questions?
18

19

Final Report in IEEE Two-column format
20

Syllabus
• AER 1515 Grading:
• 40% Assignments – 13.333% per assignment
• 60% Project –
• 5% Initial Results
• 20% Video
• 35% Report
• Sitting in on lectures
• No requirements, enjoy, ask questions!
• Just ask me for access to Quercus materials
21

Class Survey
• How many of you have…
• Used Matlab?
• Coded in Python?
• Used OpenCV?
• Used Point Cloud Library
• Used Pytorch or TensorFlow?
• Worked with GNSS, INS or wheel odometry sensor data?
• Worked with vision, lidar, radar or sonar sensor data?
• Studied probability theory? Information theory? Optimization theory?
• Defined a basic camera model?
• Seen the Iterated Closest Point algorithm?
• Corresponded features between images?
• Performed object detection or semantic segmentation on image data? Lidar data?
22

A few stories from my work
| Ego State    | Static World  |        | Dynamic World  |         |
| ------------ | ------------- | ------ | -------------- | ------- |
| Estimation – | Perception –  |        | Perception -   |         |
| Quadrotor    | Rover Sample  |        | Autonomous     |         |
| Operations   |               | Return |                | Driving |
23

A few stories from my work
| Ego State    | Static World  |        | Dynamic World  |         |
| ------------ | ------------- | ------ | -------------- | ------- |
| Estimation – | Perception –  |        | Perception -   |         |
| Quadrotor    | Rover Sample  |        | Autonomous     |         |
| Operations   |               | Return |                | Driving |
24

STARMAC Team 03-08
Dev
Rajnarayan
Prof. Claire Tomlin
Gabe Hoffmann, Steven Waslander, Mike
Vitus, Haomiao Huang, Vijay Pradeep
Jeremy Gillula
Jung Soon Jang Dave Dostal
25

| STARMAC V3 (2006 - |     | 2009) - | Vehicle |     |     |     |
| ------------------ | --- | ------- | ------- | --- | --- | --- |
HHiigghh  LLeevveell  CCoonnttrrooll
CCaarrbboonn  FFiibbeerr
|     |     |     | GGuummssttiixx PPXXAA227700,,   |     | LLooww  LLeevveell  CCoonnttrrooll |     |
| --- | --- | --- | ------------------------------- | --- | ---------------------------------- | --- |
TTuubbiinngg
|     |     |     | oorr  AADDLL  PPCC110044 |     | RRoobboossttiixx | AAttmmeeggaa112288 |
| --- | --- | --- | ------------------------ | --- | ---------------- | ------------------ |
EElleeccttrroonniiccss
FFiibbeerrggllaassss
IInntteerrffaaccee
HHoonneeyyccoommbb
TTuubbee
SSttrraappss
SSeennssoorrlleessss
BBrruusshhlleessss  DDCC
GGPPSS MMoottoorrss
NNoovvaatteell AAxxii 22220088//2266
SSuuppeerrssttaarr  IIII
EElleecctt..  SSppeeeedd  CCoonntt..
IInneerrttiiaall
|     | UUllttrraassoonniicc |     |     |     |     | CCaassttllee  CCrreeaattiioonnss   |
| --- | -------------------- | --- | --- | --- | --- | ---------------------------------- |
MMeeaass..  UUnniitt
|     | RRaannggeerr |     |     | BBaatttteerryy |     | PPhhooeenniixx--2255 |
| --- | ------------ | --- | --- | -------------- | --- | -------------------- |
MMiiccrroossttrraaiinn
|     | SSeennssccoommpp |                | LLiitthhiiuumm  PPoollyymmeerr |     |     |     |
| --- | ---------------- | -------------- | ------------------------------ | --- | --- | --- |
|     | MMiinnii--AAEE   | 33DDMM--GGXX11 |                                |     |     |     |
26

Main Sensors
• IMU
• Microstrain 3DM-GX1
• Attitude, attitude rate, acceleration @ 76 Hz
• SODAR
• Senscomp Mini AE
• Up to 50 Hz update
• Up to 40 ft range
• GPS
• Novatel Superstar II
• Carrier Phase Position & velocity @10 Hz
27

Sensor Data
• Aeryon Scout quadrotor in hover flight
• Accelerometer Data
• Low pass hardware filter added to raw sensor output
• High vibration environment, particularly in z axis
• Magnetometer Data
• Relatively immune to vibration effects
• Oscillation on similar time scale to vehicle motion
• Large development effort to account for PCB current
• Sonar Data (Exteroceptive)
• Large reception cone leads to good performance over flat
plane
• Dropouts, false echoes quite common in cheap models
28

Sensor Data - GNSS
Coded Phase Solution: 25 Minutes Carrier Phase Solution: 24 Hours
Standard (3-5m CEP) Double Difference Technique
With DGPS corrections (WAAS, (1-2cm CEP)
PPP) (0.5 - 1.5m CEP)
2cm
5m
10m 29

Estimation and Control Structure
GPS
Motor Commands
IMU
SODAR
Plant
Altitude Controller
Altitude Filter
20 Hz
20 Hz
Attitude Controller
76 Hz
Joystick
Commands
(Optional)
Attitude Requests
Navigation
Position Controller
Filter
10 Hz
Trajectory
76 Hz,
Request
1 Hz updates
30

Estimation & Measurement model
• Altitude filter
• Outlier rejection
• Kalman Filter
• Standard EKF used for Navigation Filter
• GPS – inertial position, velocity
• Sodar, Barometer – inertial altitude
• Gyros – body angular rates + biases
• Magnetometers – body orientation vector + current calibration
• Accelerometers – body accelerations – gravity
31

STARMAC in flight
32

Ego State Perception
• Others Cool vids
• Dancing quads
• Robot racing cars
• Space X landing
33

A few stories from my work
| Ego State    | Static World  |        | Dynamic World  |         |
| ------------ | ------------- | ------ | -------------- | ------- |
| Estimation – | Perception –  |        | Perception -   |         |
| Quadrotor    | Rover Sample  |        | Autonomous     |         |
| Operations   |               | Return |                | Driving |
34

NASA Sample Return Robot Challenge Team (2012-2014)
35

The NASA Sample Return Robot Challenge
Problem: Explore an 80,000 square meter area within 2 hours, collect samples
of interest, return to 2m x 2m start platform
36

Vehicle and Sensors
Velodyne
Firefly MV3
HDL-32E
(x3) Cameras
Collection Unit
3DM-GX3
IMU
Wheel
Encoders
Computation: Two embedded i7 computers

Major Algorithms
• Mapping: Velodyne HDL-32 SLAM
• Planning: Global coverage and local obstacle
avoidance
• Sample Detection: detection and classification
of salient objects
38

Mapping Overview
• Requirements:
• Real-time performance (10Hz), on-board the robot moving 2 m/s
• Metrically consistent maps
• Determine obstacles
• Key Idea (1): Mapping in 3D not required
• Vehicle moves in 2D, just need to determine drivable ground
• Reliable dense, 3D mapping is slow, violates real-time requirements, not suitable for on-board hardware
• Key Idea (2): Remove the ground, use what remains to perform SLAM
• “Natural features” in the environment
• Questions:
• How do we remove the ground reliably?
• How to perform reliable 2D SLAM using 3D data without “loss” of information
• How do we keep the map metrically (globally) consistent?
• How can all of this be performed at 10Hz on board the vehicle?
39

Mapping Overview
AER 1515
AER 1513
40

Iterated Closest Point Scan Registration
• Minimize the sum of Euclidean
distances between corresponding
points
• Point to point
• Point to plane
• Generalized-ICP
41

Ground Segmentation
• Performed using 1D Gaussian Process (GP) based approach [Tongtong et al.,
2011]
• Works well for hills and undulating terrain
42

Point Classification
Ground adjacency classification Height Based outlier rejection
43

Drivability Analysis
Robot height known, can drive under overhanging obstacles!
44

Results (Waterloo Park)
• Left: pose graph and vehicle path. Right: Vehicle path and ground truth collected
using Robotic Total Station (mean error: 0.274 m, max error: 1.264 m)
45

Results (Run Time)
46

Static World Perception - Exteroception
• Cool Vids
• Rovers
• VT&R
• Manipulator cal
47

A few stories from my work
| Ego State    | Static World  |        | Dynamic World  |         |
| ------------ | ------------- | ------ | -------------- | ------- |
| Estimation – | Perception –  |        | Perception -   |         |
| Quadrotor    | Rover Sample  |        | Autonomous     |         |
| Operations   |               | Return |                | Driving |
48

Biggest Achievements
• First Canadian made autonomous vehicle to
drive 100KM on public roads
• Top of Kitti 3D Object Detector
• Extreme Weather Capability
• 1000 KM Dataset with more images and more
diverse driving than anything publically available
• 10cm accurate localization engine capable of
running without GPS
• Unique Rule Engine Based Behaviour Planner
• Extremely Efficient Local Motion Planning
• Extensive, Integrated Safety Assessment
Procedure Developed at Waterloo
Bathurst Rd Route, Waterloo
●
9 unique intersections
●
15 intersection crosses
●
2 roundabouts
●
~4.07 Km

The public drive challenge
Bathurst
• Goal: 100 km on public roads with MTBI of 5
minutes
• Completed August 2018
• Colby test lap
• Industrial area with limited traffic
• 2 km loop, one stop sign
• Bathurst test circuit
• All residential, two lane roads
• 9.6 km sequence
• 32 separate scenarios encountered

Full Bathurst Drive

Autonomy System Architecture

Autonomoose Perception
Localization & Mapping Occupancy Mapping
Static Occupancy
Mapping
Static & Dynamic Object Detection Dynamic Object Tracking

Autonomous Vehicle Perception
Localization & Mapping Occupancy Mapping
Static & Dynamic Object Detection Dynamic Object Tracking

Localization through Sensor Fusion
• Fuse all available sensor measurements in real time to estimate state …
Sensor measurements Estimated state
| GPS         | Filter      | Position |
| ----------- | ----------- | -------- |
| IMU         | Orientation |          |
| Wheel speed | Velocity    |          |
Lidar
... relative to a reference point and fixed map
Motion model

Lidar Map Construction
• Data collected on multiple
runs of the environment
• Full pose graph optimization
• SE(3) formulation
• Integrated extrinsic calibration
• GPS-LIDAR especially important
• RTK-GPS and lidar filtering
incorporated

Lidar Localization Measurements
• Match lidar scan to a pre-built map
• ICP matching
• Initialization
• Need an initial estimate of pose in the
map from other sensors
• Motion correction
• Need an estimate of the vehicle motion
during scan capture as well

Localization Performance

Autonomous Vehicle Perception
Localization & Mapping Occupancy Mapping
Static & Dynamic Object Detection Dynamic Object Tracking

Occupancy Grid Mapping
• Create a two dimensional map of the environment from 3D Lidar data with
tracked objects removed
• Crop and Voxelize
• Transform to base frame
• Remove ground plane points and outliers
• Track occupancy via logit updates
• Find, track, predict and remove moving objects

Final Occupancy Grid Map
62

Autonomous Vehicle Perception
Localization & Mapping Occupancy Mapping
Static & Dynamic Object Detection Dynamic Object Tracking

3D object detection and datasets
• Multi-channel deep learning approach that
combines depth and RGB information
• 3D position, orientation and extent far more
challenging than 2D
• Best algorithms at 70% mean AP (detection box accuracy)

3D Object Detection Objectives
• Class identification
• Car, pedestrian, bicycle
• Centroid Estimation
• X,Y,Z position in camera frame
• Bounding box extent
• Intersection over Union with ground truth
• Vehicle Orientation
• Forward direction

AVOD-FPN Meta-Architecture
Region Proposal Stage Proposal Refinement Stage
Feature Pyramid
Feature Pyramid

3D Object Detection Results

Detection in Snow
https://www.youtube.com/watch?v=Q1f-s6_yHtw

Autonomous Vehicle Perception
Localization & Mapping Occupancy Mapping
Static & Dynamic Object Detection Dynamic Object Tracking

Dynamic Object Tracking
• Following the tracking-by-detection paradigm, tracker processes all outputs of a
object detector.
• Vehicles and Pedestrians are treated separately.
• Includes two parts: motion estimation and object identification
• The motion of each track is estimated by a 2D Cartesian space Kalman Filter.
• Object identification and correspondence based on windowed matching
70

Multi-Object Tracking
71

Dynamic World Perception
• Self-driving Zoox
• Obelix robot
• Multi-UAVs
72

The current era – A wild ride for robotics
• Getting rebranded as Physical AI or Embodied AI has led to huge investment
• Bigger models and more data are making new things possible, but rarely live up
to the demo video claims and are still not as general as we need
• LLMs, VLMs, MLLMs, VLAs, World Models, World-Action Models are everywhere
• Imitation Learning has replaced Reinforcement Learning as the go-to method to
make progress on robotic manipulation tasks.
• Open world perception and agentic reasoning are steadily improving too.
73

Key Takeaways
• This course is evolving, all contributions and suggestions welcome
• Perception grows in complexity with the challenges of the environments
• Ego motion
• Static environments
• Dynamic environments
• Core concepts to be developed
• Ego State: Sensor modeling and pre-processing
• Static World: Point clouds and registration, point features and matching
• Dynamic World: Identifying objects, tracking, predicting and scene understanding
74

Backup Slides
75

Normal Distributions Transform
• The likelihood of having measured point y
within cell c
i

Multi-Scale K-Means NDT
• Clustering of the scan at
multiple scales
• Led to stronger convergence
properties, more accurate
registrations
• Many variations have since been
proposed

Experiments
• Approach is tested using sweep path (important for coverage) and with large
loop closures (important for navigation and obstacle avoidance)
• Data collected at Waterloo park (400m x 400m largest area)
• Ground truth collected using Robotic Total Station
78

Results (Waterloo Park)
79

Results (Waterloo Park)
80

Multi-Camera Parallel Tracking and Mapping
Adam Harmat Mike Tribou
David Wang
Inna Sharf
Arun Das
Jason Rebello
81

Multi-Camera PTAM
|     |     |     | R  | t   |
| --- | --- | --- | --- | --- |
| T   |     |     |     |    |
| K T |     |     | K   | K   |
|     |     | T  | 2   | 2   |
| 2   |     |     |    |    |
C
K
|     | 2   | 2   | 0   | 1   |
| --- | --- | --- | --- | --- |
|     |     |     |    |    |
|     |     |     | R  | t  |
|     |     |     | C   | C   |
|     |     | T   |  2 | 2   |
|     |     |     |    |    |
C
|     |     | 2   | 0   | 1   |
| --- | --- | --- | --- | --- |
|     |     |     |    |    |
82

State Representation and Updates
• ⊞-Manifolds for singularity and constraint free updates
• Define ⊞ operator which respects manifold topology
• Perform optimization updates in local real vector space
• Store poses as homogeneous transformations
• Keyframe pose and camera baseline using transforms on SE(3)
• Exponential map from minimal representation of update on ℝ6 to SE(3)
• Only addition is needed for graph optimization
83

Map Feature Points
• Spherical feature position parametrization
• Defined in anchor keyframe where first observed
• Focuses uncertainty in one parameter, unlike Cartesian
• No overlap between cameras required, no IMU required
• Avoids singularity in inverse depth parametrization at 180∘
• Suited for wide-FOV cameras
• For a point j in ith keyframe
seen by camera k
 
j Azimuth
 
i,k
p  
  Elevation
j j
 r 
Depth
 
j
K
i
84

Multi-Camera PTAM
• Features observed in multiple keyframes can be related to the feature anchor
| keyframe through the following sequence of transformations |               |                |                  |     |     |     |     |     |
| ---------------------------------------------------------- | ------------- | -------------- | ---------------- | --- | --- | --- | --- | --- |
| • Feature j                                                | observed in C | from keyframes | K (anchor) and K |     |     |     |     |     |
|                                                            |               | 2              | 2                | 3   |     |     |     |     |
p 2,2
j
2,2
|     |     |     |     |     |     | T   | p   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
C j
|     |     |     | (cid:2870),(cid:2871) |     |     |     | 2   |     |
| --- | --- | --- | --------------------- | --- | --- | --- | --- | --- |
𝑦
(cid:3037)
|     |     |     |          |     |           | T T   | p 2,2 |     |
| --- | --- | --- | -------- | --- | --------- | ----- | ----- | --- |
|     |     |     |          |     |           | K C   | j     |     |
|     |     |     |          |     |           | 2     | 2     |     |
|     |     |     |          |     |           | 1    | 2,2   |     |
|     |     |     |          |     | T         | T T   | p     |     |
|     |     |     |          |     |           | K K C | j     |     |
|     |     |     |          |     |           | 3 2   | 2     |     |
|     |     |     |          |     | 1        | 1    | 2,2   |     |
|     |     |     |          |     | T T       | T T   | p     |     |
|     |     |     |          |     | C         | K K C | j     |     |
|     |     |     |          |     | 2         | 3 2   | 2     |     |
|     |     |     |          |    |           |       |      |     |
|     |     |     | y 2,3  | K   | T 1 T 1 | T T   | p 2,2 |     |
|     |     |     | j        | 2   | 2 C K     | K C   | j     | 85  |
|     |     |     |          |     | 2 3       | 2 2   |       |     |

Multi-Camera PTAM
• Measurement equation – non-overlapping camera viewpoints
• Features defined in first observed camera frame
• Map defined in initial camera 1 frame
|     |     |    |     |      |      |    |       |     |     |
| --- | --- | --- | --- | ---- | ---- | --- | ----- | --- | --- |
| 2,3 |     |     | r   | r    | 2,2  |     | 2,3   |     |     |
| y   |    | h x | , x | ,    | p    |   |       |     |     |
| j   |     | K   |     | K    | j    |     | j     |     |     |
|     |     |     | 2   | 3    |      |     |       |     |     |
|     |     |    |     |      |      |     |       |    |     |
|     |   | K   | T   | 1 T | 1 T | T   | p 2,2 |   | 2,3 |
|     |     | 2   | 2 C |      | K    | K C | j     |     | j   |
|     |     |     |     | 2    | 3    | 2   | 2     |     |     |
86

Keyframe Selection for Map Maintenance
• A buffer of keyframes is maintained
• For each possible keyframe, find predicted covariance of each point tracked by the tracker.
• The predicted point covariance is calculated as
h
| J  | j   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
p
j p
pˆ
j
• Insert the keyframe which maximizes the total sum of point entropy reduction
|          |     |        |     |     | 1    |    |    |
| -------- | --- | ------ | --- | --- | ---- | --- | --- |
|          |     |        |     |    |     | n  |     |
| M*       |   |      |    |     |      |    |     |
|  argmax | h   | pˆ  h | p   | h p |  ln | 2e |    |
|          | e   | j e    | j   | e   | j    |     | j   |
2 87
M  pM
i i

MCPTAM Architecture
Tracking Mapping
Map update
including
Feature Extraction:
Factor Graph
Optimization:
keyframes
Fast Corners
and features
Levenberg-
Marquardt
Image Capture:
Latest Feature Matching:
⊞-Manifold
Synchronous
images Patch Warping Formulation
Multi-Frame
Pixel Error
Spherical
Feature Param.
Localization:
Latest pose,
Analytic
Jacobian
NLLS on SE(3) using
multi-keyframe
⊞-Manifolds
and features
At Optimization rate:
At camera
1-10+ seconds
framerate:
10-100 Hz
Code available at https://github.com/wavelab/mcptam 88

MCPTAM Indoor Results – Stable Map
89

MCPTAM Indoor Results – Stable Map
90

MCPTAM Indoor Results - Initialization
91

MCPTAM Indoor Results - Initialization
92

MCPTAM Outdoor Flight
93

Vehicle Control Using MCPTAM at 7 Hz
• Closed loop outdoor control using MCPTAM on Draganflyer X8
94

Evaluation
• 4 km loop, 10 m elevation range
• A map of the route was constructed on July
25
• Localizer was run on data from July 27
• GPS input was disabled shortly into the run
• Ground truth prepared from July 27 data,
using Inertial Explorer RTK solution with
fixed base station

Translation error in the body frame
GPS disabled Back in garage

Horizontal translation error
• RMSE between
the marks is
0.090 m
GPS disabled Back in garage

Vehicle motion correction
without motion correction with motion correction

Real-Time Removal of Snow in Lidar Data
• Lidar captures falling snow, causing noisy point clouds
• Noisy point clouds can hinder the ability to perform
autonomous driving tasks
(e.g. mapping, localization, object detection and tracking)
100

Real-Time Removal of Snow in Lidar Data
• Results
| Raw Point Cloud | Radius Outlier Removal | DROR Filter |
| --------------- | ---------------------- | ----------- |
(ROR)
101

Preparing the obstacle Point Cloud
• Crop & Voxelize
• Transform from Lidar to base link frame
• Ground segmentation implementation used to create obstacle point cloud
• Outliers removed through radius outlier removal

Updating the occupancy grid
• Transfer old map cell values into the new map cells
• Old map cell values are faded
• Probabilistically update map cells with given pointcloud
• Map stored is in log odds

Tracked object removal
• Find cells occupied by the tracked object and set the values to 0
• Store previous car states to better remove cells when a track object accelerates
or decelerates

Input processing
• Kitti Dataset Images
• RGB images at 1392 X 512
• Uniform lighting
• City driving
• Summer conditions
• Kitti Lidar Data
• Velodyne HDL-64E
• Converted to 6 channel Bird’s Eye View Map
• 0.1 m grid cells with 5 horizontal slices
• Maximum point height per horizontal slice
• 6th channel is grid cell point density

Second stage regression
• Second stage performs classification, bounding box offset and orientation
regression
• Orientation encoded as [cos ϴ, sin ϴ ]
• Bounding box representation had a significant impact on regression performance
• 4% improvement from 8 to 4 corner + heights.
• Ambiguity in corner ordering likely culprit
• Anchors designed based on class statistics to minimize second stage effort

## Extracted Images

### Page 1

![page001_img001.jpeg](img/page001_img001.jpeg)

### Page 2

![page002_img001.jpeg](img/page002_img001.jpeg)

### Page 3

![page003_img001.jpeg](img/page003_img001.jpeg)
![page003_img002.jpeg](img/page003_img002.jpeg)
![page003_img003.jpeg](img/page003_img003.jpeg)
![page003_img004.jpeg](img/page003_img004.jpeg)
![page003_img005.jpeg](img/page003_img005.jpeg)

### Page 6

![page006_img001.png](img/page006_img001.png)

### Page 7

![page007_img001.jpeg](img/page007_img001.jpeg)
![page007_img002.jpeg](img/page007_img002.jpeg)
![page007_img003.jpeg](img/page007_img003.jpeg)
![page007_img004.jpeg](img/page007_img004.jpeg)
![page007_img005.jpeg](img/page007_img005.jpeg)

### Page 8

![page008_img001.jpeg](img/page008_img001.jpeg)
![page008_img002.jpeg](img/page008_img002.jpeg)
![page008_img003.jpeg](img/page008_img003.jpeg)
![page008_img004.jpeg](img/page008_img004.jpeg)
![page008_img005.jpeg](img/page008_img005.jpeg)

### Page 13

![page013_img001.jpeg](img/page013_img001.jpeg)
![page013_img002.jpeg](img/page013_img002.jpeg)

### Page 16

![page016_img001.jpeg](img/page016_img001.jpeg)
![page016_img002.jpeg](img/page016_img002.jpeg)

### Page 19

![page019_img001.jpeg](img/page019_img001.jpeg)
![page019_img002.jpeg](img/page019_img002.jpeg)

### Page 20

![page020_img001.jpeg](img/page020_img001.jpeg)

### Page 25

![page025_img001.jpeg](img/page025_img001.jpeg)
![page025_img002.jpeg](img/page025_img002.jpeg)
![page025_img003.jpeg](img/page025_img003.jpeg)
![page025_img004.jpeg](img/page025_img004.jpeg)
![page025_img005.jpeg](img/page025_img005.jpeg)
![page025_img006.jpeg](img/page025_img006.jpeg)

### Page 26

![page026_img001.jpeg](img/page026_img001.jpeg)

### Page 27

![page027_img001.jpeg](img/page027_img001.jpeg)
![page027_img002.jpeg](img/page027_img002.jpeg)
![page027_img003.jpeg](img/page027_img003.jpeg)
![page027_img004.jpeg](img/page027_img004.jpeg)

### Page 28

![page028_img001.jpeg](img/page028_img001.jpeg)
![page028_img002.jpeg](img/page028_img002.jpeg)

### Page 29

![page029_img001.jpeg](img/page029_img001.jpeg)
![page029_img002.jpeg](img/page029_img002.jpeg)

### Page 30

![page030_img001.jpeg](img/page030_img001.jpeg)
![page030_img002.jpeg](img/page030_img002.jpeg)

### Page 32

![page032_img001.jpeg](img/page032_img001.jpeg)

### Page 35

![page035_img001.jpeg](img/page035_img001.jpeg)
![page035_img002.jpeg](img/page035_img002.jpeg)

### Page 36

![page036_img001.jpeg](img/page036_img001.jpeg)

### Page 37

![page037_img001.jpeg](img/page037_img001.jpeg)

### Page 38

![page038_img001.jpeg](img/page038_img001.jpeg)

### Page 40

![page040_img001.jpeg](img/page040_img001.jpeg)

### Page 41

![page041_img001.jpeg](img/page041_img001.jpeg)

### Page 42

![page042_img001.jpeg](img/page042_img001.jpeg)

### Page 43

![page043_img001.jpeg](img/page043_img001.jpeg)

### Page 44

![page044_img001.jpeg](img/page044_img001.jpeg)

### Page 45

![page045_img001.jpeg](img/page045_img001.jpeg)
![page045_img002.jpeg](img/page045_img002.jpeg)

### Page 46

![page046_img001.jpeg](img/page046_img001.jpeg)

### Page 49

![page049_img001.jpeg](img/page049_img001.jpeg)
![page049_img002.jpeg](img/page049_img002.jpeg)
![page049_img003.jpeg](img/page049_img003.jpeg)

### Page 50

![page050_img001.jpeg](img/page050_img001.jpeg)
![page050_img002.jpeg](img/page050_img002.jpeg)

### Page 51

![page051_img001.jpeg](img/page051_img001.jpeg)
![page051_img002.jpeg](img/page051_img002.jpeg)
![page051_img003.jpeg](img/page051_img003.jpeg)
![page051_img004.jpeg](img/page051_img004.jpeg)

### Page 52

![page052_img001.jpeg](img/page052_img001.jpeg)
![page052_img002.jpeg](img/page052_img002.jpeg)
![page052_img003.jpeg](img/page052_img003.jpeg)

### Page 53

![page053_img001.jpeg](img/page053_img001.jpeg)

### Page 54

![page054_img001.jpeg](img/page054_img001.jpeg)
![page054_img002.jpeg](img/page054_img002.jpeg)
![page054_img003.jpeg](img/page054_img003.jpeg)
![page054_img004.jpeg](img/page054_img004.jpeg)

### Page 55

![page055_img001.jpeg](img/page055_img001.jpeg)
![page055_img002.jpeg](img/page055_img002.jpeg)
![page055_img003.jpeg](img/page055_img003.jpeg)
![page055_img004.jpeg](img/page055_img004.jpeg)
![page055_img005.jpeg](img/page055_img005.jpeg)
![page055_img006.jpeg](img/page055_img006.jpeg)
![page055_img007.jpeg](img/page055_img007.jpeg)

### Page 56

![page056_img001.jpeg](img/page056_img001.jpeg)

### Page 57

![page057_img001.jpeg](img/page057_img001.jpeg)

### Page 58

![page058_img001.jpeg](img/page058_img001.jpeg)

### Page 59

![page059_img001.jpeg](img/page059_img001.jpeg)

### Page 60

![page060_img001.jpeg](img/page060_img001.jpeg)
![page060_img002.jpeg](img/page060_img002.jpeg)
![page060_img003.jpeg](img/page060_img003.jpeg)
![page060_img004.jpeg](img/page060_img004.jpeg)
![page060_img005.jpeg](img/page060_img005.jpeg)
![page060_img006.jpeg](img/page060_img006.jpeg)
![page060_img007.jpeg](img/page060_img007.jpeg)

### Page 61

![page061_img001.jpeg](img/page061_img001.jpeg)

### Page 62

![page062_img001.jpeg](img/page062_img001.jpeg)

### Page 63

![page063_img001.jpeg](img/page063_img001.jpeg)
![page063_img002.jpeg](img/page063_img002.jpeg)
![page063_img003.jpeg](img/page063_img003.jpeg)
![page063_img004.jpeg](img/page063_img004.jpeg)
![page063_img005.jpeg](img/page063_img005.jpeg)
![page063_img006.jpeg](img/page063_img006.jpeg)
![page063_img007.jpeg](img/page063_img007.jpeg)

### Page 64

![page064_img001.jpeg](img/page064_img001.jpeg)
![page064_img002.jpeg](img/page064_img002.jpeg)

### Page 65

![page065_img001.jpeg](img/page065_img001.jpeg)

### Page 66

![page066_img001.jpeg](img/page066_img001.jpeg)
![page066_img002.jpeg](img/page066_img002.jpeg)
![page066_img003.jpeg](img/page066_img003.jpeg)

### Page 67

![page067_img001.jpeg](img/page067_img001.jpeg)

### Page 68

![page068_img001.jpeg](img/page068_img001.jpeg)

### Page 69

![page069_img001.jpeg](img/page069_img001.jpeg)
![page069_img002.jpeg](img/page069_img002.jpeg)
![page069_img003.jpeg](img/page069_img003.jpeg)
![page069_img004.jpeg](img/page069_img004.jpeg)
![page069_img005.jpeg](img/page069_img005.jpeg)
![page069_img006.jpeg](img/page069_img006.jpeg)
![page069_img007.jpeg](img/page069_img007.jpeg)

### Page 70

![page070_img001.jpeg](img/page070_img001.jpeg)

### Page 71

![page071_img001.jpeg](img/page071_img001.jpeg)

### Page 76

![page076_img001.jpeg](img/page076_img001.jpeg)
![page076_img002.jpeg](img/page076_img002.jpeg)

### Page 77

![page077_img001.jpeg](img/page077_img001.jpeg)

### Page 78

![page078_img001.jpeg](img/page078_img001.jpeg)
![page078_img002.jpeg](img/page078_img002.jpeg)
![page078_img003.jpeg](img/page078_img003.jpeg)

### Page 79

![page079_img001.jpeg](img/page079_img001.jpeg)
![page079_img002.jpeg](img/page079_img002.jpeg)

### Page 80

![page080_img001.jpeg](img/page080_img001.jpeg)

### Page 81

![page081_img001.jpeg](img/page081_img001.jpeg)
![page081_img002.jpeg](img/page081_img002.jpeg)
![page081_img003.jpeg](img/page081_img003.jpeg)
![page081_img004.jpeg](img/page081_img004.jpeg)
![page081_img005.jpeg](img/page081_img005.jpeg)
![page081_img006.jpeg](img/page081_img006.jpeg)

### Page 83

![page083_img001.jpeg](img/page083_img001.jpeg)

### Page 84

![page084_img001.jpeg](img/page084_img001.jpeg)

### Page 87

![page087_img001.jpeg](img/page087_img001.jpeg)
![page087_img002.jpeg](img/page087_img002.jpeg)
![page087_img003.jpeg](img/page087_img003.jpeg)
![page087_img004.jpeg](img/page087_img004.jpeg)
![page087_img005.jpeg](img/page087_img005.jpeg)
![page087_img006.jpeg](img/page087_img006.jpeg)
![page087_img007.jpeg](img/page087_img007.jpeg)

### Page 89

![page089_img001.jpeg](img/page089_img001.jpeg)

### Page 90

![page090_img001.jpeg](img/page090_img001.jpeg)

### Page 91

![page091_img001.jpeg](img/page091_img001.jpeg)
![page091_img002.jpeg](img/page091_img002.jpeg)

### Page 92

![page092_img001.jpeg](img/page092_img001.jpeg)
![page092_img002.jpeg](img/page092_img002.jpeg)

### Page 93

![page093_img001.jpeg](img/page093_img001.jpeg)

### Page 94

![page094_img001.jpeg](img/page094_img001.jpeg)
![page094_img002.jpeg](img/page094_img002.jpeg)
![page094_img003.jpeg](img/page094_img003.jpeg)

### Page 95

![page095_img001.jpeg](img/page095_img001.jpeg)

### Page 96

![page096_img001.jpeg](img/page096_img001.jpeg)
![page096_img002.jpeg](img/page096_img002.jpeg)

### Page 97

![page097_img001.jpeg](img/page097_img001.jpeg)

### Page 98

![page098_img001.jpeg](img/page098_img001.jpeg)
![page098_img002.jpeg](img/page098_img002.jpeg)

### Page 99

![page099_img001.jpeg](img/page099_img001.jpeg)
![page099_img002.jpeg](img/page099_img002.jpeg)

### Page 100

![page100_img001.jpeg](img/page100_img001.jpeg)
![page100_img002.jpeg](img/page100_img002.jpeg)

### Page 101

![page101_img001.jpeg](img/page101_img001.jpeg)
![page101_img002.jpeg](img/page101_img002.jpeg)
![page101_img003.jpeg](img/page101_img003.jpeg)

### Page 102

![page102_img001.jpeg](img/page102_img001.jpeg)
![page102_img002.jpeg](img/page102_img002.jpeg)
![page102_img003.jpeg](img/page102_img003.jpeg)
![page102_img004.jpeg](img/page102_img004.jpeg)

### Page 103

![page103_img001.jpeg](img/page103_img001.jpeg)
![page103_img002.jpeg](img/page103_img002.jpeg)

### Page 104

![page104_img001.jpeg](img/page104_img001.jpeg)

### Page 105

![page105_img001.jpeg](img/page105_img001.jpeg)

### Page 106

![page106_img001.jpeg](img/page106_img001.jpeg)

### Page 107

![page107_img001.jpeg](img/page107_img001.jpeg)
