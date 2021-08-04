%integralTrapezoid
clc;
clear;
a = 0; %batasbawah
b = 4; %batasatas
n = 10; %jumlahpartisi
h = (b-a)/n;
sum=0;
for i = a:h:b
    j = i+h;
    sum = sum +h*(fungsi(i)+fungsi(j))/2;
end
disp('Intgral dari x^2+x dari 0 sampai 4');
disp(sum);
return;