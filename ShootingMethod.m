clc
clear
close all

k = 80;
m = 0.75;
f = @(y,v)(-k*y/m);                         % PDB
h = 0.01;                                   % step size
t = 0:h:9;
n = numel(t);
ye = zeros(1,numel(t));                     % y Euler
ve = zeros(1,numel(t));                     % y' Euler
ye(1) = 0.5;                                % initial cond: y(t=0)=1
ve(1) = -5;                                 % tebak nilai z = y'(t=0)=?
beta = 0;                                   % initial cond: beta = y(t=9)=0
yh = ye;                                    % y Heun
vh = ve;                                    % y' Heun

%find z
for j = 1 : 100
    for i = 2 : n                    
        %proses Euler
        [ve(i),ye(i)] = euler(f,ve(i-1),ye(i-1),h);
    end
    %kalo heun ye ve jadi yh vh
    v1(j) = ve(1);
    y1(j) = ye(end);
    ve(1) = ve(1)+0.1;
end
psi = y1 - beta;

%Plot (Psi,v)
figure(1)
plot(psi,v1)
grid on

%Bisection Method
left = 1;
right = j;
err = 1E7;
while err > 0.26
    if psi(left)*psi(right) > 0
        fprintf('Tidak ada akar di dalam rentang')
        break
    end
    mid = int16((right+left)/2);
    if psi(mid)*psi(left) < 0  
        right = mid;
    else
        left = mid;
    end
    err = abs(psi(mid));
end

%Output print
mid
fprintf('z= ')
psi(mid)
fprintf('v= ')
v1(mid)
fprintf('y(t=9)= ')
y1(mid)

%Solve PDB for BC y'(0) = v1(mid)
ve(1) = v1(mid);
for i = 2:numel(t)
    %Proses Euler
    [ve(i),ye(i)] = euler(f,ve(i-1),ye(i-1),h); 
end
v = ve;
y = ye;

%plot y and v
figure(2)
plot(t,y,'-b',t,v,'-r')
legend('simpangan','kecepatan')
grid on

%calculate Ek, Ep, Em
K = 1/2*m*v.^2;
U = 1/2*k*y.^2;
M = K + U;

%plot Ek, Ep, Em
figure(3)
plot(t,K,'-b',t,U,'-r',t,M,'-g')
legend('Energi Kinetik','Energi Potensial','Energy Mekanik')
grid on

function euler