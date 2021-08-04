%Modul 7
%Kelompok Hansel
%Metode Heun
clc;
clear;
m = 2;
k = 50;
h = 0.001;
b = 0;
n = 3000;
vawal = 0;
yawal = 1;
tawal = 0;
for i = 1:n
    tnew = tawal+h;
    vnew = vawal-(h*((k*yawal/m)+(b*vawal/m)));
    ynew = yawal+(h*vnew);
    vheun = vnew-((b*vnew/m+(k*ynew/m))*h);
    yheun = yawal+((vheun+vnew)*h)/2;
    a(i,1)=tnew;
    a(i,2)=yheun;
    tawal=tnew;
    vawal = vnew;
    yawal = ynew;

end

