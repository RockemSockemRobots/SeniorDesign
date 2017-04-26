fileNum = sprintf('%d',1);
path = 'tests/IQsim500/';
filename = strcat(path, fileNum, '.txt');
data = load(filename);
length = 100;
t = data(1:length,1);
CH2 = data(1:length,2);
CH3 = data(1:length,3);
plot(t,CH2,'b.','Markersize',15);
hold on
plot(t,CH3,'g.','Markersize',15);
title('Sampled Function Generated IQ Data');
xlabel('n');
ylabel('Voltage (V)');
legend('I','Q');

figure;
plot3(t,CH2,CH3,'b.','Markersize',15);
title('Sampled Function Generated IQ Data (Complex Form)');
xlabel('n');
ylabel('Voltage I');
zlabel('Voltage Q');