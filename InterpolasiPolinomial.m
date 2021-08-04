%Program Interpolasi Polinomial
%Kelompok Hansel
clc;
clear;
x = [1 3 4 6 9 12 20 25 30 40]; %nilai x yang diketahui
rentang = 1:1:50;  %data interpolasi dari 1 hingga 50 dengan kenaikan 1
F = [2.5; 2.5; 3; 8; 12; 16; 18; 17.5; 15.5; 8.5]; %nilai y dari x yang diketahui
X = zeros(size(x,2),size(x,2)); %mendeklarasi nilai awal matriks X dengan 0 semua
Y = zeros(1,size(rentang,2)); %mendeklarasi nilai awal matriks hasil interpolasi Y dengan 0 semua
sum = 0; %mendeklarasi sum dengan 0

for i=1:size(x,2) %looping untuk mengisi nilai matriks X
    for j=1:size(x,2)
        X(i,j)=x(1,i)^(j-1);
    end
end

A = inv(X)*F; %mendapatkan hasil matriks A dari X.A = F

for i=1:size(rentang,2) %looping untuk matriks hasil interpolasi dari nilai A
    for j=1:size(A,1)
        sum=sum+A(j,1)*(rentang(1,i)^(j-1));
    end
    Y(1,i)=sum;
    sum=0;
end

disp('Maka hasil Y dari interpolasi polinomial X 1 hingga 40 adalah : ');
disp(Y); %menunjukan hasil Y
for i=1:50 %memasukan dalam matriks biar plotingnya mudah
    nilai(i,1)=rentang(i);
    nilai(i,2)=Y(i);
end
disp('Selesai');