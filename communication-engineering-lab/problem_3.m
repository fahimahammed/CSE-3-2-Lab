clc;
clear all;
close all;

dataBits = [1 0 1 0 0 1 1 0 1 1 1];
bitDuration = 2;

samplingRate = 100;
totalTime = length(dataBits) * bitDuration;
time = 0: 1/samplingRate: totalTime;


amplitude = 2;
f = 0.5;

carrierSignal = amplitude * sin(2 * pi * f * time);

index = 1;
modulatedCarrier = carrierSignal;
for i = 1 : length(carrierSignal)
     modulatedCarrier(i) = modulatedCarrier(i) * dataBits(index);
     if time(i)/bitDuration >= index
        index = index + 1;
     end
end


plot(time, modulatedCarrier);
ylim([-amplitude-2, amplitude+2]);
xlim([0, totalTime]);
grid on;
title("Modulation for ASK");
line ([0, totalTime], [0 0], "linestyle", "--", "color", "r");

demodulated = [];
index = 1;
for i = 1 : length(time)
    if time(i)/bitDuration >= index
        data = modulatedCarrier(i);

        if data == 0
            demodulated(index) = 0;
        else
            demodulated(index) = 1;
        end
        index = index + 1;
    end
end

disp("Orginal bits:");
disp(dataBits);

disp("Demodulation:");
disp(demodulated);