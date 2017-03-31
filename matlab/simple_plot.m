load test_500hz.txt;
data = test_500hz;
t = data(1:50,1);
CH3 = data(1:50,2);
CH4 = data(1:50,3);
stem(t,CH3);
figure;
stem(t,CH4);