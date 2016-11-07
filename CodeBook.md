### Variables:
<ul>
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
<li>other 79 columns labeled as follows:
      <ul>
      <li>starts with:
          <ul>
          <li>"time": time domain signals (raw values)</li>
          <li>"FFT": Fast Fourier Transformation applied to raw values</li>
          </ul>
      </li>
      <li>contains:
          <ul>
          <li>"body acceleration": body linear acceleration</li>
          <li>"gravity acceleration": gravity linear acceleration</li>
          <li>"body velocity": body angular velocity</li>
          <li>"jerk": jerk values (derived accelerations)</li>
          </ul>
      </li>
      <li>ends with (ignoring the "mean" which ends all of them):
          <ul>
          <li>"x": on the x axis</li>
          <li>"y": on the y axis</li>
          <li>"z": on the z axis</li>
          <li>"magnitude": the 3 axis values were calculated using an Euclidian norm, to get their magnitude</li>
          </ul>
      </li>
      <li> These columns are all the means of the variables with their respective names.
      </ul>
</li>
</ul>
