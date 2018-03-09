clear all
clc
fprintf('The value of radius should be 0<r<10\n');

set(gca,'xtick',-10:1:10);
set(gca,'ytick',-10:1:10);
line([-10 10],[0 0],'LineWidth',1.5,'Color','black');
line([0 0],[-10 10],'LineWidth',1.5,'Color','black');
hold on;
axis([-10 10 -10 10]);
title('Give radius in Command Window');
grid on;

r = input('Enter the radius of the circle: ');

if(r<=0||r>10)
    fprintf('No circle drawing is possible\n');
    return;
end

x0 = 0;
y0 = r;
do = 3-(2*r);
xn = x0;
yn = y0;

while(xn < yn)
    
    plot(xn,yn,'b','linewidth',1.5,'marker','X','MarkerEdgeColor','blue');
    text(xn,yn,['(' num2str(xn) ',' num2str(yn) ')']);
    hold on;
    
    
    if(do>=0)
        dn = do+4*(xn-yn)+10;
        yn = yn-1;
        
    else
        dn = do+4*xn+6;
    end
    
    xn = xn+1;
    do = dn;
    
    if(xn==yn)
        plot(xn,yn,'b','linewidth',1.5,'marker','X','MarkerEdgeColor','blue');
        text(xn,yn,['(' num2str(xn) ',' num2str(yn) ')']);
        hold on;
    end
    
end

plot(0,0,'marker','O','MarkerEdgeColor','red','linewidth',3),hold on;
text(0,0,['(' num2str(0) ',' num2str(0) ')']);
% set(gca,'xtick',-10:1:10);
% set(gca,'ytick',-10:1:10);
% axis([-10 10 -10 10]);

title("Bresenham's Circle Drawing Algorithm");

