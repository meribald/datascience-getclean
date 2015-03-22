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
	- BodyAcceleration<br/>
		The body acceleration signal obtained by subtracting the gravity from the total acceleration in standard gravity units 'g'. 
	- GravityAcceleration<br/>
		The gravity acceleration signal in standard gravity units 'g'.
	- BodyAccelerationJerk<br/>
		Jerk signals in standard gravity units 'g' obtained from the body linear acceleration.
	- BodyGyro<br\>
		The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
	- BodyGyroJerk<br/>
		Jerk signals in standard radians/second obtained from the angular velocity.
