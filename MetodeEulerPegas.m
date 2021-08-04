%Modul 7
%Kelompok Hansel
%Metode Euler dan Heun
clc;
clear;
m = 2;
k = 50;
h = 0.05;
b = 0;
n = 60;
vawal = 0; %nilaiv awal
yawal = 1; %inisial nila y
tawal = 0;
for i = 1:n
    tnew = tawal+h; %perubahan waktu
    y(i) = cos(5*tnew); %mencari hasil analitik
    vnew = vawal-(h*((k*yawal/m)+(b*vawal/m)));
    ynew = yawal+(h*vnew); % y nilai metode euler
    vheun = vnew-((b*vnew/m+(k*ynew/m))*h);
    yheun = yawal+((vheun+vnew)*h)/2; %ynilai metode heun
    t(i)=tnew;
    euler(i)=ynew;
    heun(i)=yheun;
    tawal = tnew;
    vawal = vnew;
    yawal = ynew;
end
plot(t,y,'-yO');hold on;    %plot hasil analitik warna kuning
plot(t,euler,'-rO');hold on; %plot hasil euler warna merah
plot(t,heun,'-gO'); %plot hasil heun warna hijau
title('Plot kurva Y dengan h=0,05'); %judul grafik
xlabel('t');            %label sumbu x
ylabel('y');      %label sumbu y