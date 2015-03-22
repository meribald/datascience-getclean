# Codebook
##Fixed Variables
### Subject
	The id of the person the experiment is done with.
		1..30

### Activity
	The activity the person is doing.
		- LAYING
		- SITTING
		- STANDING
		- WALKING
		- WALKING_DOWNSTAIRS
		- WALKING_UPSTAIRS

## Measured and Calculated Variables
	Each variable in this section is the result of calculating the mean of measured mean and standard deviation values of an activity for a subject.
	
	The names are in the format <Domain><MeasuredVariable>.<Type>.<Axis>, e.g. TimeDomainBodyAcceleration.mean.X-axis.
	- Domain: Either time domain (TimeDomain) or frequency domain (FreqDomain).
	- Type: mean or std (standard deviation)
	- Axis: The axis of the measurement; X-axis, Y-axis, or Z-axis.
	
### Measured Variables
	- BodyAcceleration
	- GravityAcceleration
	- BodyAccelerationJerk
	- BodyGyro
	- BodyGyroJerk
