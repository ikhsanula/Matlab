%integralRieman
clc;
clear;
a = 0; %batasbawah
b = 4; %batasatas
n = 8; %jumlahpartisi
h = (b-a)/n;
sum=0;
for i = a:n
    sum = sum +h*fungsi(i*h-h/2);
end
disp('Intgral dari x^2+x dari 0 sampai 4');
disp(sum);
return;