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
k=1;
for i=1:1:(loop_top-1)
    if(clipped_left_y(i)>ymax && clipped_left_y(i+1)<ymax)
        slope = (clipped_left_y(i+1)-clipped_left_y(i))/(clipped_left_x(i+1)-clipped_left_x(i));
        IX = clipped_left_x(i) + ((ymax - clipped_left_y(i))/slope);
        clipped_top_x(k) = IX;
        IY = ymax;
        clipped_top_y(k) = IY;
        k=k+1;
        plot([IX,clipped_left_x(i+1)],[IY,clipped_left_y(i+1)],'blue','linewidth',1);
        hold on
    elseif(clipped_left_y(i)<ymax && clipped_left_y(i+1)>ymax)
        slope = (clipped_left_y(i+1)-clipped_left_y(i))/(clipped_left_x(i+1)-clipped_left_x(i));
        IX = clipped_left_x(i) + ((ymax - clipped_left_y(i))/slope);
        clipped_top_x(k) = IX;
        IY = ymax;
        clipped_top_y(k) = IY;
        k=k+1;
        plot([clipped_left_x(i),IX],[clipped_left_y(i),IY],'blue','linewidth',1);
        hold on
    elseif( ymax < clipped_left_y(i) && ymax < clipped_left_y(i+1))
        continue;
    else
        clipped_top_x(k) = clipped_left_x(i);
        clipped_top_y(k) = clipped_left_y(i);
        k=k+1;
        plot([clipped_left_x(i),clipped_left_x(i+1)],[clipped_left_y(i),clipped_left_y(i+1)],'green','linewidth',1);
        hold on
    end
end
clipped_top_x(k) = clipped_left_x(loop_top);
clipped_top_y(k) = clipped_left_y(loop_top);
k=k+1;
if(clipped_left_y(loop_top)>ymax && clipped_left_y(1)<ymax)
    slope = (clipped_left_y(1)-clipped_left_y(loop_top))/(clipped_left_x(1)-clipped_left_x(loop_top));
    IX = clipped_left_x(loop_top) + ((ymax - clipped_left_y(loop_top))/slope);
    clipped_top_x(k) = IX;
    IY = ymax;
    clipped_top_y(k) = IY;
    plot([IX,clipped_left_x(1)],[IY,clipped_left_y(1)],'blue','linewidth',1);
    hold on
elseif(clipped_left_y(loop_top)<ymax && clipped_left_y(1)>ymax)
    slope = (clipped_left_y(1)-clipped_left_y(loop_top))/(clipped_left_x(1)-clipped_left_x(loop_top));
    IX = x(loop_top) + ((ymax - clipped_left_y(loop_top))/slope);
    clipped_top_x(k) = IX;
    IY = ymax;
    clipped_top_y(k) = IY;
    plot([IX,clipped_left_x(loop_top)],[IY,clipped_left_y(loop_top)],'blue','linewidth',1);
    hold on
else
    plot([clipped_left_x(loop_top),clipped_left_x(1)],[clipped_left_y(loop_top),clipped_left_y(1)],'green','linewidth',1);
    hold on
end

size_top_clipped = size(clipped_top_x);


%right side clipped
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
loop_right = size_top_clipped(1,2);
l=1;
for i=1:1:loop_right-1
    if(clipped_top_x(i)<xmax && clipped_top_x(i+1)>xmax)
        IX = xmax;
        clipped_right_x(i) = IX;
        slope = (clipped_top_y(i+1)-clipped_top_y(i))/(clipped_top_x(i+1)-clipped_top_x(i));
        IY = slope*(xmax-clipped_top_x(i))+clipped_top_y(i);
        clipped_right_y(i) = IY;
        l=l+1;
        plot([clipped_top_x(i),IX],[clipped_top_y(i),IY],'blue','linewidth',1);
        hold on
    elseif(clipped_top_x(i)>xmax && clipped_top_x(i+1)<xmax)
        IX = xmax;
        clipped_right_x(i) = IX;
        slope = (clipped_top_y(i+1)-clipped_top_y(i))/(clipped_top_x(i+1)-clipped_top_x(i));
        IY = slope*(xmax-clipped_top_x(i))+clipped_top_y(i);
        clipped_right_y(i) = IY;
        l=l+1;
        plot([IX,clipped_top_x(i+1)],[IY,clipped_top_y(i+1)],'blue','linewidth',1);
        hold on
    elseif(clipped_top_x(i)>xmax && clipped_top_x(i+1)>xmax)
        continue;
    else
        clipped_right_x(i) = clipped_top_x(i);
        clipped_right_y(i) = clipped_top_y(i);
        l=l+1;
        plot([clipped_top_x(i),clipped_top_x(i+1)],[clipped_top_y(i),clipped_top_y(i+1)],'green','linewidth',1);
    end
end
clipped_right_x(i) = clipped_top_x(loop_right);
clipped_right_y(i) = clipped_top_y(loop_right);
l=l+1;
if(clipped_top_x(loop_right)>xmax && clipped_top_x(1)<xmax)
    IX = xmax;
    clipped_right_x(l) = IX;
    slope = (clipped_top_y(1)-clipped_top_y(loop_right))/(clipped_top_x(1)-clipped_top_x(loop_right));
    IY = slope*(xmax-clipped_top_x(n))+clipped_top_y(n);
    clipped_right_y(l) = IY;
    plot([IX,clipped_top_x(1)],[IY,clipped_top_y(1)],'blue','linewidth',1);
    hold on
elseif(clipped_top_x(loop_right)<xmax && clipped_top_x(1)>xmax)
    IX = xmax;
    clipped_right_x(l) = IX;
    slope = (clipped_top_y(1)-clipped_top_y(loop_right))/(clipped_top_x(1)-clipped_top_x(loop_right));
    IY = slope*(xmax-clipped_top_x(loop_right))+clipped_top_y(loop_right);
    clipped_right_y(l) = IY;
    plot([IX,clipped_top_x(loop_right)],[IY,clipped_top_y(loop_right)],'blue','linewidth',1);
    hold on
else
    plot([clipped_top_x(loop_right),clipped_top_x(1)],[clipped_top_y(loop_right),clipped_top_y(1)],'green','linewidth',1);
end


size_right_clipped = size(clipped_right_x);
%bottom side clipped
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
loop_bottom = size_right_clipped(1,2);
for i=1:1:loop_bottom-1
    if(clipped_right_y(i)<ymin && clipped_right_y(i+1)>ymin)
        slope = (clipped_right_y(i+1)-clipped_right_y(i))/(clipped_right_x(i+1)-clipped_right_x(i));
        IX = clipped_right_x(i) + ((ymin - clipped_right_y(i))/slope);
        IY = ymin;
        plot([IX,clipped_right_x(i+1)],[IY,clipped_right_y(i+1)],'blue','linewidth',1);
        hold on
    elseif(clipped_right_y(i)>ymin && clipped_right_y(i+1)<ymin)
        slope = (clipped_right_y(i+1)-clipped_right_y(i))/(clipped_right_x(i+1)-clipped_right_x(i));
        IX = clipped_right_x(i) + ((ymin - clipped_right_y(i))/slope);
        IY = ymin;
        plot([clipped_right_x(i),IX],[clipped_right_y(i),IY],'blue','linewidth',1);
        hold on
    elseif(  clipped_right_y(i) < ymin && clipped_right_y(i+1) < ymin)
        continue;
    else
        plot([clipped_right_x(i),clipped_right_x(i+1)],[clipped_right_y(i),clipped_right_y(i+1)],'green','linewidth',1);
        hold on
    end
end
if(clipped_right_y(loop_bottom)<ymin && clipped_right_y(1)>ymin)
    slope = (clipped_right_y(1)-clipped_right_y(loop_bottom))/(clipped_right_x(1)-clipped_right_x(loop_bottom));
    IX = clipped_right_x(loop_bottom) + ((ymin - clipped_right_y(loop_bottom))/slope);
    IY = ymin;
    plot([IX,clipped_right_x(1)],[IY,clipped_right_y(1)],'blue','linewidth',1);
    hold on
elseif(clipped_right_y(loop_bottom)>ymin && clipped_right_y(1)<ymin)
    slope = (clipped_right_y(1)-clipped_right_y(loop_bottom))/(clipped_right_x(1)-clipped_right_x(loop_bottom));
    IX = clipped_right_x(loop_bottom) + ((ymin - clipped_right_y(loop_bottom))/slope);
    IY = ymin;
    plot([IX,clipped_right_x(loop_bottom)],[IY,clipped_right_y(loop_bottom)],'blue','linewidth',1);
    hold on
else
    plot([clipped_right_x(loop_bottom),clipped_right_x(1)],[clipped_right_y(loop_bottom),clipped_right_y(1)],'green','linewidth',1);
    hold on
end