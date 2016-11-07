### 1. Data

The raw data was separated in two sets: "test" and "train". Both sets had the same kind of variables so, following the tidy data rules, they had to be put together.
In each set, there were the following data tables with the following data:
<ul>
<li>Features</li>
<li>Subjecs</li>
<li>Activities</li>
<li>9 tables with the values for body linear acceleration, body angular velocity and total linear acceleration on each axis (x, y and z)</li>
</ul>

There were also other files with the labels for the activities and the features.

#### 1.1 Readings table

The 9 tables with the accelerations and velocities were obtained with readings from the accelerometer and gyroscope of the smartphone (Samsung Galaxy S II) and, therefore composed of a single type of variable and should be put together in a single table.  
For that, it was necessary to melt the data tables individually before binding them together, for each set, and, then, bind the resulting tables from each set together as well.

#### 1.2 Features table

Then the features were decided to form another type of variable, since they were calculated later with the data from what now is the *readings* table. This one required to use the feature labels to name the columns properly and, then, filter only the columns needed, which were the means and standard deviations ones.  
Again, the data had to be molten and the labels had to be cleaned so that the names would be more meaningful.

#### 1.3 Subjects and activities data

The subjects and activities were part of the raw data, but they weren't obtained through readings of the smartphone. Because of that, they were decided to be put together as another type of variable.  
Their data was almost tidy the way they came, only requiring to bind them and to change the data for activities from numerical code to the respective strings, so that it would be more intuitive to use.

### 2. Tables and variables:

<ul>
<li>Table 1:
    <ul>
    <li>name: subjectsactivities</li>
    <li>variables:
        <ul>
        <li>set:
            <ul>
            <li>class: character</li>
            <li>values:
                    <ul>
                    <li>"test"</li>
                    <li>"train"</li>
                    </ul>
            </li>
            <li>description: determines if the observation belongs to the test or to the train set.</li>
            </ul>
        </li>
        <li>window:
            <ul>
            <li>class: integer</li>
            <li>values: 1 to 7352</li>
            <li>description: identification of the window of readings for each set.</li>
            <li>note: window for the test set goes only up to 2947.</li>
            </ul>
        </li>
        <li>subject:
            <ul>
            <li>class: integer</li>
            <li>values: 1 to 30</li>
            <li>description: identification of the subject.</li>
            </ul>
        </li>
        <li>activity:
            <ul>
            <li>class: character</li>
            <li>values:
                <ul>
                <li>"walking"</li>
                <li>"walking upstairs"</li>
                <li>"walking downstairs"</li>
                <li>"sitting"</li>
                <li>"standing"</li>
                <li>"laying"</li>
                </ul>
            </li>
            <li>descriptions: type of activity that was being executed.</li>
            </ul>
        </li>
        </ul>
    </li>
    </ul>
</li>

<li>Table 2:
    <ul>
    <li>name: readings</li>
    <li>variables:
        <ul>
        <li>set:
            <ul>
            <li>class: character</li>
            <li>values:
                    <ul>
                    <li>"test"</li>
                    <li>"train"</li>
                    </ul>
            </li>
            <li>description: determines if the observation belongs to the test or to the train set.</li>
            </ul>
        </li>
        <li>window:
            <ul>
            <li>class: integer</li>
            <li>values: 1 to 7352</li>
            <li>description: identification of the window of readings for each set.</li>
            <li>note: window for the test set goes only up to 2947.</li>
            </ul>
        </li>
        <li>reading:
            <ul>
            <li>class: integer</li>
            <li>values: 1 to 128</li>
            <li>description: identification of the readings for each window.</li>
            </ul>
        </li>
        <li>bodyaccelerationx:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: body linear acceleration on the x axis.</li>
            </ul>
        </li>
        <li>bodyaccelerationy:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: body linear acceleration on the y axis.</li>
            </ul>
        </li>
        <li>bodyaccelerationz:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: body linear acceleration on the z axis.</li>
            </ul>
        </li>
        <li>bodyvelocityx:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: body angular velocity on the x axis.</li>
            </ul>
        </li>
        <li>bodyvelocityy:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: body angular velocity on the y axis.</li>
            </ul>
        </li>
        <li>bodyvelocityz:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: body angular velocity on the z axis.</li>
            </ul>
        </li>
        <li>totalaccelerationx:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: total linear acceleration on the x axis.</li>
            </ul>
        </li>
        <li>totalaccelerationy:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: total linear acceleration on the y axis.</li>
            </ul>
        </li>
        <li>totalaccelerationz:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers</li>
            <li>description: total linear acceleration on the z axis.</li>
            </ul>
        </li>
        </ul>
    </li>
    </ul>
</li>            

<li>Table 3:
    <ul>
    <li>name: features</li>
    <li>variables:
        <ul>
        <li>set:
            <ul>
            <li>class: character</li>
            <li>values:
                    <ul>
                    <li>"test"</li>
                    <li>"train"</li>
                    </ul>
            </li>
            <li>description: determines if the observation belongs to the test or to the train set.</li>
            </ul>
        </li>
        <li>window:
            <ul>
            <li>class: integer</li>
            <li>values: 1 to 7352</li>
            <li>description: identification of the window of readings for each set.</li>
            <li>note: window for the test set goes only up to 2947.</li>
            </ul>
        </li>
        <li>signal:
            <ul>
            <li>class: character</li>
            <li>values: 33 different strings</li>
            <li>description: which signals were use to compute the features.</li>
            <li>the strings can be read like:
                <ul>
                <li>starts with:
                    <ul>
                    <li>"time": time domain signals (raw values)</li>
                    <li>"FFT": Fast Fourier Transformation applied</li>
                    </ul>
                </li>
                <li>contains:
                    <ul>
                    <li>"body acceleration": body linear acceleration</li>
                    <li>"gravity acceleration": gravity linear acceleration</li>
                    <li>"body velocity": body angular velocity</li>
                    <li>"jerk": jerk values (accelerations derived)</li>
                    </ul>
                </li>
                <li>ends with:
                    <ul>
                    <li>"x": on the x axis</li>
                    <li>"y": on the y axis</li>
                    <li>"z": on the z axis</li>
                    <li>"magnitude": the 3 axis values were calculated using an Euclidian norm, to get their magnitude</li>
                    </ul>
                </li>
                </ul>
            </li>
            </ul>
        </li>
        <li>mean:
            <ul>
            <li>class: numeric</li>
            <li>values: real numbers, normalized within [-1, 1]</li>
            <li>description: mean value of a signal respective to a window.</li>
            </ul>
        </li>
        <li>standarddeviation:
            <ul>
            <li>class: numeric, normalized within [-1, 1]</li>
            <li>values: real numbers</li>
            <li>description: standard deviation value of a signal respective to a window.</li>
            </ul>
        </li>
        <li>meanfrequency:
            <ul>
            <li>class: numeric, normalized within [-1, 1]</li>
            <li>values: real numbers</li>
            <li>description: mean frequency value of a signal respective to a window.</li>
            <li>note: it was applied only to FFT signals</li>
            </ul>
        </li>
        </ul>
    </li>
    </ul>
</li>
</ul>
