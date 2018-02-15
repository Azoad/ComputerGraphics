fprintf('The line should be on the first quardent and values for X and Y must be less than 20\n');

set(gca,'xtick',0:1:20);
set(gca,'ytick',0:1:20);
axis([0 20 0 20]);
title('Give start and end points in Command Window');
grid on;

a = input('Enter the starting point: ');
b = input('Enter the ending point: ');


if(a(1)>b(1))
    x0 = b(1);
    y0 = b(2);
    x1 = a(1);
    y1 = a(2);
    if(y1>x1)
        fprintf('Wrong input. X must be grater than Y\n');
        close all;
        return;
    end
else
    x0 = a(1);
    y0 = a(2);
    x1 = b(1);
    y1 = b(2);
    if(y1>x1)
        fprintf('Wrong input. X must be grater than Y\n');
        close all;
        return;
    end
end

dx = x1-x0;
dy = y1-y0;
ddx = 2*dx;
ddy = 2*dy;
do = ddy-dx;
xn = x0;
yn = y0;

for n = 0:dx
    
    xo(n+1) = xn;
    yo(n+1) = yn;
    
    if(do>=0)
        yn = yn+1;
        dn = do+ddy-ddx;
    else
        dn = do+ddy;
    end
    
    xn = xn+1;
    plot(xo,yo,'b','linewidth',2,'marker','O','MarkerEdgeColor','red');
    do = dn;
    
end

set(gca,'xtick',0:1:20);
set(gca,'ytick',0:1:20);
axis([0 20 0 20]);

title("Bresenham's Line Drawing Algorithm");
grid on