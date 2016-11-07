### Variables:
* subject:
  * class: integer
  * values: 1 to 30
  * description: identification of the subject.
* activity:
  * class: character
  * values:
    * "walking"
    * "walking upstairs"
    * "walking downstairs"
    * "sitting"
    * "standing"
    * "laying"
  * descriptions: type of activity that was being executed.
* other 79 columns labeled as follows:
  * starts with:
    * "time": time domain signals (raw values)
    * "FFT": Fast Fourier Transformation applied to raw values
  * contains:
    * "body acceleration": body linear acceleration
    * "gravity acceleration": gravity linear acceleration
    * "body velocity": body angular velocity
    * "jerk": jerk values (derived accelerations)
  * ends with (ignoring the "mean" which ends all of them):
    * "x": on the x axis
    * "y": on the y axis
    * "z": on the z axis
    * "magnitude": the 3 axis values were calculated using an Euclidian norm, to get their magnitude
  * These columns are all the means of the variables with their respective names.
