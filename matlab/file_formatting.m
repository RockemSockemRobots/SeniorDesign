clear;

fileID = fopen('test.bin','r');
A = fread(fileID,'uint16');
fclose(fileID);

fileID = fopen('test.txt','w');
n = 1;
i = 1;
while i<=size(A,1)
    temp = sprintf('%07d\t%04d\t%04d\n',n,A(i),A(i+1));
    fwrite(fileID, temp);
    n = n + 1;
    i = i + 2;
end
fclose(fileID);