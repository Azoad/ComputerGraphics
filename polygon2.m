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
for i=1:1:n-1
    if(x(i)<xmin && x(i+1)>xmin)
        IX = xmin;
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IY = slope*(xmin-x(i))+y(i);
        plot([IX,x(i+1)],[IY,y(i+1)],'blue','linewidth',1);
        hold on
    elseif(x(i)>xmin && x(i+1)<xmin)
        IX = xmin;
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IY = slope*(xmin-x(i))+y(i);
        plot([IX,x(i)],[IY,y(i)],'blue','linewidth',1);
        hold on
    elseif(x(i)<xmin && x(i+1)<xmin)
        continue;
    else
        plot([x(i),x(i+1)],[y(i),y(i+1)],'green','linewidth',1);
    end
end
if(x(n)<xmin && x(1)>xmin)
    IX = xmin;
    slope = (y(1)-y(n))/(x(1)-x(n));
    IY = slope*(xmin-x(n))+y(n);
    plot([IX,x(1)],[IY,y(1)],'blue','linewidth',1);
    hold on
elseif(x(n)>xmin && x(1)<xmin)
    IX = xmin;
    slope = (y(1)-y(n))/(x(1)-x(n));
    IY = slope*(xmin-x(n))+y(n);
    plot([IX,x(n)],[IY,y(n)],'blue','linewidth',1);
    hold on
else
    plot([x(n),x(1)],[y(n),y(1)],'green','linewidth',1)
end


%top side clipped
figure
plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
hold on
plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
hold on
plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
hold on
plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
hold on
for i=1:1:n-1
    if(y(i)>ymax && y(i+1)<ymax)
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IX = x(i) + ((ymax - y(i))/slope);
        IY = ymax;
        set(gca,'xtick',-20:1:20);
        set(gca,'ytick',-20:1:20);
        line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
        line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
        axis equal;
        grid on;
        hold on;
        axis([-20 20 -20 20]);
        plot([IX,x(i+1)],[IY,y(i+1)],'blue','linewidth',1);
        hold on
    elseif(y(i)<ymax && y(i+1)>ymax)
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IX = x(i) + ((ymax - y(i))/slope);
        IY = ymax;
        set(gca,'xtick',-20:1:20);
        set(gca,'ytick',-20:1:20);
        line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
        line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
        axis equal;
        grid on;
        hold on;
        axis([-20 20 -20 20]);
        plot([x(i),IX],[y(i),IY],'blue','linewidth',1);
        hold on
    elseif(y(i)>ymax && y(i+i)>ymax)
        continue;
    else
        plot([x(i),x(i+1)],[y(i),y(i+1)],'green','linewidth',1);
    end
end
if(y(n)>ymax && y(1)<ymax)
    slope = (y(1)-y(n))/(x(1)-x(n));
    IX = x(n) + ((ymax - y(n))/slope);
    IY = ymax;
    set(gca,'xtick',-20:1:20);
    set(gca,'ytick',-20:1:20);
    line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
    line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
    axis equal;
    grid on;
    hold on;
    axis([-20 20 -20 20]);
    plot([IX,x(1)],[IY,y(1)],'blue','linewidth',1);
    hold on
elseif(y(n)<ymax && y(1)>ymax)
    slope = (y(1)-y(n))/(x(1)-x(n));
    IX = x(n) + ((ymax - y(n))/slope);
    IY = ymax;
    set(gca,'xtick',-20:1:20);
    set(gca,'ytick',-20:1:20);
    line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
    line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
    axis equal;
    grid on;
    hold on;
    axis([-20 20 -20 20]);
    plot([IX,x(n)],[IY,y(n)],'blue','linewidth',1);
    hold on
else
    plot([x(n),x(1)],[y(n),y(1)],'green','linewidth',1);
end

%right side clipped
figure
plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
hold on
plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
hold on
plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
hold on
plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
hold on
for i=1:1:n-1
    if(x(i)<xmax && x(i+1)>xmax)
        IX = xmax;
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IY = slope*(xmax-x(i))+y(i);
        set(gca,'xtick',-20:1:20);
        set(gca,'ytick',-20:1:20);
        line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
        line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
        axis equal;
        grid on;
        hold on;
        axis([-20 20 -20 20]);
        plot([x(i),IX],[y(i),IY],'blue','linewidth',1);
        hold on
    elseif(x(i)>xmax && x(i+1)<xmax)
        IX = xmax;
        slope = (y(i+1)-y(i))/(x(i+1)-x(i));
        IY = slope*(xmax-x(i))+y(i);
        set(gca,'xtick',-20:1:20);
        set(gca,'ytick',-20:1:20);
        line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
        line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
        axis equal;
        grid on;
        hold on;
        axis([-20 20 -20 20]);
        plot([IX,x(i+1)],[IY,y(i+1)],'blue','linewidth',1);
        hold on
    elseif(x(i)>xmax && x(i+1)>xmax)
        continue;
    else
        plot([x(i),x(i+1)],[y(i),y(i+1)],'green','linewidth',1);
    end
end

if(x(n)>xmax && x(1)<xmax)
    IX = xmax;
    slope = (y(1)-y(n))/(x(1)-x(n));
    IY = slope*(xmax-x(n))+y(n);
    set(gca,'xtick',-20:1:20);
    set(gca,'ytick',-20:1:20);
    line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
    line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
    axis equal;
    grid on;
    hold on;
    axis([-20 20 -20 20]);
    plot([IX,x(1)],[IY,y(1)],'blue','linewidth',1);
    hold on
elseif(x(n)<xmax && x(1)>xmax)
    IX = xmax;
    slope = (y(1)-y(n))/(x(1)-x(n));
    IY = slope*(xmax-x(n))+y(n);
    set(gca,'xtick',-20:1:20);
    set(gca,'ytick',-20:1:20);
    line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
    line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
    axis equal;
    grid on;
    hold on;
    axis([-20 20 -20 20]);
    plot([IX,x(n)],[IY,y(n)],'blue','linewidth',1);
    hold on
else
    plot([x(n),x(1)],[y(n),y(1)],'green','linewidth',1);
end
