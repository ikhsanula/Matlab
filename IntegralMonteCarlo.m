%IntegralMonteCarlo
a=0; b=4; n=1000;
c=0; d=65;
sum = 0;
for i = 1:n
    x = rand*abs(b-a);
    if fungsi(x)>=0;
        y = rand*abs(d-c);
        if y<fungsi(x)
            sum = sum+1;
        end
    else
        y = rand*abs(d-c)*(-1);
        if fungsi(x)>y
            sum = sum+1;
        end
    end
end
hasil = abs(a-b)*abs(c-d)*sum/n;
disp(hasil);
return;
