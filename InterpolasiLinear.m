%interpolasi linear
%Kelompok Hansel
clc;
clear;
x1=3; %titik x pertama yang diketahui
y1=20; %titik y pertama yang diketahui
x2=6;   %titik x kedua yang diketahui
y2=28;  %titik y kedua yang diketahui
x=4; %nilai y yang dicari pada titik ini

y=((x-x1)/(x2-x1)*(y2-y1))+y1; %mencari nilai y

disp('nilai f(4) adalah= ');
disp(y); %menampilkan nilai y