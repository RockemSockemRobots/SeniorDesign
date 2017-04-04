load test_250hz.txt;
data = test_250hz;
length = 100;
t = data(1:length,1);
CH3 = data(1:length,2);
CH4 = data(1:length,3);
stem(t,CH3);
figure;
stem(t,CH4);