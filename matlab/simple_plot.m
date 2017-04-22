fileNum = sprintf('%d',1);
filename = strcat('tests/', fileNum, '.txt');
data = load(filename);
length = 100;
t = data(1:length,1);
CH2 = data(1:length,2);
CH3 = data(1:length,3);
stem(t,CH2,'b');
hold on
stem(t,CH3,'g');