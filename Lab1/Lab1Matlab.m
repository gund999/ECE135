% Vars
rmsVoltage = 110; % RMS voltage [V]
peakVoltage = rmsVoltage * sqrt(2); % [V]
frequency = 60; % frequency [Hz]
T = 1/frequency; % period of the waveform [s]

% Define time vector
t = 0:0.0001:3*T; % Time vector for 3 cycles [s]

% Calculate voltage waveform (sine function)
voltage_waveform = peakVoltage * sin(2*pi*frequency*t);

% Plot the waveform
plot(t, voltage_waveform);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('AC Signal for at least 2 Cycles');


