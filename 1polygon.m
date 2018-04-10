%author ANTU
close all;
clear all;
clc;

set(gca,'xtick',-20:1:20);
set(gca,'ytick',-20:1:20);
line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
axis equal;
grid on;
hold on;
axis([-20 20 -20 20]);

[xmin,ymin] = ginput(1);
[xmax,ymax] = ginput(1);

plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
hold on
plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
hold on
plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
hold on
plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
hold on

n = input('Enter the number of edges in the polygon');

[x,y] = ginput(n);
plot(x,y,'red','linewidth',1);
hold on
plot([x(n),x(1)],[y(n),y(1)],'red','linewidth',1);
hold on

%left side clipped
figure
set(gca,'xtick',-20:1:20);
set(gca,'ytick',-20:1:20);
line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
axis equal;
grid on;
hold on;
axis([-20 20 -20 20]);
plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
hold on
plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
hold on
plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
hold on
plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
hold on
j=1;
for i=1:1:n-1
    if(x(i)<xmin && x(i+1)>xmin)
        IX = xmin;
        clipped_left_x(j) = IX;
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IY = slope*(xmin-x(i))+y(i);
        clipped_left_y(j) = IY;
        j=j+1;
        plot([IX,x(i+1)],[IY,y(i+1)],'blue','linewidth',1);
        hold on
    elseif(x(i)>xmin && x(i+1)<xmin)
        IX = xmin;
        clipped_left_x(j) = IX;
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IY = slope*(xmin-x(i))+y(i);
        clipped_left_y(j) = IY;
        j=j+1;
        plot([IX,x(i)],[IY,y(i)],'blue','linewidth',1);
        hold on
    elseif(x(i)<xmin && x(i+1)<xmin)
        continue;
    else
        clipped_left_x(j) = x(i);
        clipped_left_y(j) = y(i);
        j=j+1;
        plot([x(i),x(i+1)],[y(i),y(i+1)],'green','linewidth',1);
    end
end
clipped_left_x(j) = x(n);
clipped_left_y(j) = y(n);
j=j+1;
if(x(n)<xmin && x(1)>xmin)
    IX = xmin;
    clipped_left_x(j) = IX;
    slope = (y(1)-y(n))/(x(1)-x(n));
    IY = slope*(xmin-x(n))+y(n);
    clipped_left_y(j) = IY;
    plot([IX,x(1)],[IY,y(1)],'blue','linewidth',1);
    hold on
elseif(x(n)>xmin && x(1)<xmin)
    IX = xmin;
    clipped_left_x(j) = IX;
    slope = (y(1)-y(n))/(x(1)-x(n));
    IY = slope*(xmin-x(n))+y(n);
    clipped_left_y(j) = IY;
    plot([IX,x(n)],[IY,y(n)],'blue','linewidth',1);
    hold on
else
    plot([x(n),x(1)],[y(n),y(1)],'green','linewidth',1)
end

size_left_clipped = size(clipped_left_x);

%top side clipped
figure
set(gca,'xtick',-20:1:20);
set(gca,'ytick',-20:1:20);
line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
axis equal;
grid on;
hold on;
axis([-20 20 -20 20]);
plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
hold on
plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
hold on
plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
hold on
plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
hold on
loop_top = size_left_clipped(1,2);
for i=1:1:(loop_top-1)
    if(clipped_left_y(i)>ymax && clipped_left_y(i+1)<ymax)
        slope = (clipped_left_y(i+1)-clipped_left_y(i))/(clipped_left_x(i+1)-clipped_left_x(i));
        IX = clipped_left_x(i) + ((ymax - clipped_left_y(i))/slope);
        IY = ymax;
        plot([IX,clipped_left_x(i+1)],[IY,clipped_left_y(i+1)],'blue','linewidth',1);
        hold on
    elseif(clipped_left_y(i)<ymax && clipped_left_y(i+1)>ymax)
        slope = (clipped_left_y(i+1)-clipped_left_y(i))/(clipped_left_x(i+1)-clipped_left_x(i));
        IX = clipped_left_x(i) + ((ymax - clipped_left_y(i))/slope);
        IY = ymax;
        plot([clipped_left_x(i),IX],[clipped_left_y(i),IY],'blue','linewidth',1);
        hold on
    elseif( ymax < clipped_left_y(i) && ymax < clipped_left_y(i+1))
        continue;
    else
        plot([clipped_left_x(i),clipped_left_x(i+1)],[clipped_left_y(i),clipped_left_y(i+1)],'green','linewidth',1);
        hold on
    end
end
if(clipped_left_y(loop_top)>ymax && clipped_left_y(1)<ymax)
    slope = (clipped_left_y(1)-clipped_left_y(loop_top))/(clipped_left_x(1)-clipped_left_x(loop_top));
    IX = clipped_left_x(loop_top) + ((ymax - clipped_left_y(loop_top))/slope);
    IY = ymax;
    plot([IX,clipped_left_x(1)],[IY,clipped_left_y(1)],'blue','linewidth',1);
    hold on
elseif(clipped_left_y(loop_top)<ymax && clipped_left_y(1)>ymax)
    slope = (clipped_left_y(1)-clipped_left_y(loop_top))/(clipped_left_x(1)-clipped_left_x(loop_top));
    IX = x(loop_top) + ((ymax - clipped_left_y(loop_top))/slope);
    IY = ymax;
    plot([IX,clipped_left_x(loop_top)],[IY,clipped_left_y(loop_top)],'blue','linewidth',1);
    hold on
else
    plot([clipped_left_x(loop_top),clipped_left_x(1)],[clipped_left_y(loop_top),clipped_left_y(1)],'green','linewidth',1);
    hold on
end
