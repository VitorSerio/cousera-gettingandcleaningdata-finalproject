### Tables and variables:

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
