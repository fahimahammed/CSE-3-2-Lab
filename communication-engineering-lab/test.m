clc;
clear all;
close all;

dataBits = [1 0 1 0 1 1 0 0 1 0 0 1 1 0];

bitRate = 1;
voltage = 3;
samplingRate = 100;
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

demodIndex = 1;
preVoltage = voltage;
demodulation = [];

for i = 1:length(modulation)
    if(modulation(i) == preVoltage && time(i)*bitRate < demodIndex-1/2)
        demodulation(demodIndex) = 1;
    end
    if(modulation(i) ~=preVoltage && time(i)*bitRate < demodIndex-1/2)
        demodulation(demodIndex) = 0;
    end
    if(time(i)*bitRate >= demodIndex)
        demodIndex = demodIndex+1;
        prevoltage = modulation(i);
    end
end

disp("Demodulation: ");
disp(demodulation);
