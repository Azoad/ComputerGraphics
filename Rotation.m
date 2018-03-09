% author: Mahfujul Alam
clear all
close all
clc

set(gca,'xtick',-10:1:10)
set(gca,'ytick',-10:1:10)
axis([-10 10 -10 10])
hold on

plot([-10 10],[0,0],'black','linewidth',1);
hold on

plot([0,0],[-10 10],'black','linewidth',1);
hold on
grid on

[x,y] = ginput(4);
plot(x,y,'b','linewidth',1,'marker','S');
hold on

nx = [x(4),x(1)];
ny = [y(4),y(1)];
plot(nx,ny,'b','linewidth',1,'marker','S');
hold on

set(gca,'xtick',-10:1:10)
set(gca,'ytick',-10:1:10)
grid on,axis([-10 10 -10 10])

rect = ones(3,4);
for i=1:1:2
    for j=1:1:4
        if(i==1)
            rect(i,j)=x(j);
        else
            rect(i,j)=y(j);
        end
    end
end

[a,b] = ginput(1);
plot(a,b,'r*')
hold on

ang = input('Enter the angle:');


Tv  = [1 0 -a;
       0 1 -b;
       0 0 1];
   
Tiv = [1 0 a;
       0 1 b;
       0 0 1];

Ra  = [cosd(ang) -sind(ang) 0;
       sind(ang)  cosd(ang) 0;
       0          0         1;];

res1 = Tiv*Ra*Tv;
res2 = res1*rect;


for i=1:1:2
    for j=1:1:4
        if(i==1)
            xx(j)=res2(i,j);
        else
            yy(j)=res2(i,j);
        end
    end
end

plot(xx,yy,'b','linewidth',1,'marker','S');
hold on
nxx = [xx(4),xx(1)];
nyy = [yy(4),yy(1)];
plot(nxx,nyy,'b','linewidth',1,'marker','S');