clc; 
clear all;
close all;

dataBits = [1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1];
voltage = 3;

zeroCount = 0;
prvNonZeroVoltage = -voltage;

modulated = [];

for i = 1 : length(dataBits)
    if dataBits(i) == 0
        zeroCount = zeroCount + 1;
    else
        modulated(i) = -prvNonZeroVoltage;
        prvNonZeroVoltage = -prvNonZeroVoltage;
        zeroCount = 0;
    end
    if zeroCount == 8
        modulated(i-4) = prvNonZeroVoltage;
        modulated(i-1) = -prvNonZeroVoltage;
        modulated(i) = prvNonZeroVoltage;
        zeroCount = 0;
    end
end

bitDuration = 1;
samplingRate = 100;
totalTime = length(dataBits) * bitDuration;
time = 0: 1/ samplingRate: totalTime;

index = 1;
signal = [];
for i = 1 : length(time)
    signal(i) = modulated(index);
    if time(i) / bitDuration >= index
        index = index + 1;
    end
end

% ploting
plot(time, signal, 'LineWidth', 2);
axis([0 totalTime -voltage-3 voltage+3]);
grid on;
title("Modulation for B8ZS");
line ([0, totalTime], [0 0], "linestyle", "-", "color", "r");


%Demodulation
demodulated = [];
index = 1;
prvNonZeroVoltage = -voltage;
for i = 1 : length(time)
    if time(i)/bitDuration >= index
        data = signal(i);

        if data == 0
            demodulated(index) = 0;
        elseif (data == prvNonZeroVoltage)
            demodulated(index) = 0;
            demodulated(index+1) = 0;
            demodulated(index+3) = 0;
            demodulated(index+4) = 0;

            index = index + 4;
        else
            demodulated(index) = 1;
            prvNonZeroVoltage = -prvNonZeroVoltage;
        end
        index = index + 1;
    end
end

disp("Orginal bits:");
disp(dataBits);

disp("Demodulation:");
disp(demodulated);
