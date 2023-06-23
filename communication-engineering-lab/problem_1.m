clc;
clear all;
close all;

dataBits = [1 0 1 0 1 1 0 0 1 0 1 1];
%dataBits = [0 1 0 1 1 0 0 1 0 1];

bitRate = 1;
voltage = 3;
samplingRate = 1000;
samplingTime = 1 / samplingRate;
lastTime = length(dataBits)/bitRate;
sign = 1;
index = 1;

if(dataBits(index)==0)
    sign = -1*sign;
end

modulation = [];

time = 0:samplingTime:lastTime;

for i = 1:length(time)
    if(time(i)*bitRate < index-1/2)
        modulation(i) = sign*voltage;
    else
        modulation(i) = -sign*voltage;
    end
    if(time(i)*bitRate >= index)
        index = index+1;
        if(index <= length(dataBits) && dataBits(index)==1)
            sign = -1*sign;
        end
    end
end

plot(time, modulation, 'LineWidth', 2);
title("Modulation for Differential Manchester");
axis([0 lastTime -voltage-3 voltage+3]);
grid on;
line ([0, lastTime], [0 0], "linestyle", "-", "color", "r");


index = 1;
prev = voltage;
demodulation = [];

for i = 1:length(modulation)
    if(modulation(i) == prev && time(i)*bitRate < index-1/2)
        demodulation(index) = 1;
    end
    if(modulation(i) ~=prev && time(i)*bitRate < index-1/2)
        demodulation(index) = 0;
    end
    if(time(i)*bitRate >= index)
        index = index+1;
        prev = modulation(i);
    end
end

disp("Original :");
disp(dataBits);
disp("Demodulation: ");
disp(demodulation);
