close all;
clear all;
clc;

title('Rotating an Object Along a Fixed Point');
set(gca,'xtick',-20:1:20);
set(gca,'ytick',-20:1:20);
line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
axis equal;
grid on;
hold on;
axis([-20 20 -20 20]);

[x,y] = ginput(4);
plot(x,y,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','red');
hold on;

nx = [x(4),x(1)];
ny = [y(4),y(1)];
plot(nx,ny,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','red');
hold on;

tet = ones(3,4);
for i=1:1:2
    for j=1:1:4
        if(i==1)
            tet(i,j)=x(j);
        else
            tet(i,j)=y(j);
        end
    end
end

[a,b] = ginput(1);
plot(a,b,'r*','linewidth',2);
hold on;

xi = input('\nEnter the scale value of x: ');
yi = input('\nEnter the scale value of y: ');

Tv  = [1 0 -a;
       0 1 -b;
       0 0 1];
   
Tiv = [1 0 a;
       0 1 b;
       0 0 1];

S = [xi 0 0;
     0 yi 0;
     0  0 1;];

temp = Tiv*S*Tv;
res = temp*tet;


for i=1:1:2
    for j=1:1:4
        if(i==1)
            x1(j)=res(i,j);
        else
            y1(j)=res(i,j);
        end
    end
end

plot(x1,y1,'green','linewidth',1.5,'marker','O','MarkerEdgeColor','red');
hold on;
nx1 = [x1(4),x1(1)];
ny1 = [y1(4),y1(1)];
plot(nx1,ny1,'green','linewidth',1.5,'marker','O','MarkerEdgeColor','red');