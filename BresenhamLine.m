a = input('Enter the starting point: ');
b = input('Enter the ending point: ');

if(a(1)>b(1))
    x0 = b(1);
    y0 = b(2);
    x1 = a(1);
    y1 = a(2);
else
    x0 = a(1);
    y0 = a(2);
    x1 = b(1);
    y1 = b(2);
end

dx = x1-x0;
dy = y1-y0;
ddx = 2*dx;
ddy = 2*dy;
do = ddy-dx;
xn = x0;
yn = y0;

for n = 0:dx
    
    plot(xn,yn,'r*');
    xo(n+1) = xn;
    yo(n+1) = yn;
    
    if(do>=0)
        yn = yn+1;
        dn = do+ddy-ddx;
    else
        dn = do+ddy;
    end
    
    xn = xn+1;
    plot(xo,yo,'b','linewidth',2);
    do = dn;
    
end

axis([x0-10 x1+10 y0-10 y1+10]);
title("Bresenham's Line Drawing Algorithm");
grid on