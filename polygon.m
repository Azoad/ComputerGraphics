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
%left side clipping 
figure
for i=1:1:n
    if(x(i)<xmin && x(i+1)>xmin)
        nx(i) = xmin;
        ny(i) = y(i) + ((xmin-x(i))/(x(i+1)-x(i)))*(y(i+1)-y(i));
        set(gca,'xtick',-20:1:20);
        set(gca,'ytick',-20:1:20);
        line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
        line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
        axis equal;
        grid on;
        hold on;
        axis([-20 20 -20 20]);
        plot([nx(i),x(i+1)],[ny(i),y(i+1)],'blue','linewidth',1);
        hold on
        plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
        hold on
        plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
        hold on
        plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
        hold on
        plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
        hold on
    elseif (x(i)<xmin && x(i+1)<xmin)
        continue
    elseif(i == n)
        if(x(i)>xmin && x(1)>xmin)
            nx(i) = x(i);
            ny(i) = y(i);
            plot([x(i),x(1)],[y(i),y(1)],'black','linewidth',1);
            hold on   
        elseif(x(i)>xmin && x(1)<xmin)
            nx(i+1) = xmin;
            ny(i+1) = y(i) + ((xmin-x(i))/(x(i)-x(1)))*(y(i)-y(1));
            plot([nx(i+1),x(i)],[ny(i+1),y(i)],'cyan','linewidth',1);
        elseif(x(i)<xmin && x(1)>xmin)
            nx(i+1) = xmin;
            ny(i+1) = y(i) + ((xmin-x(i))/(x(i)-x(1)))*(y(i)-y(1));
            plot([nx(i+1),x(1)],[ny(i+1),y(1)],'yellow','linewidth',1);  
        end
    else
        if(x(i+1)<xmin)
            nx(i) = xmin;
            ny(i) = y(i) + ((xmin-x(i))/(x(i+1)-x(i)))*(y(i+1)-y(i));
            plot([nx(i),x(i)],[ny(i),y(i)],'magenta','linewidth',1);
            hold on
        else
            nx(i) = x(i);
            ny(i) = y(i);
            plot([x(i),x(i+1)],[y(i),y(i+1)],'red','linewidth',1);
            hold on
        end
    end
end

%top side clipping
figure
for i=1:1:n
    if(ny(i)>ymax && ny(i+1)<ymax)
        new_top_y(i) = ymax;
        new_top_x(i) = nx(i) + ((ymax-ny(i))/(ny(i+1)-ny(i)))*(nx(i+1)-nx(i));
        set(gca,'xtick',-20:1:20);
        set(gca,'ytick',-20:1:20);
        line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
        line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
        axis equal;
        grid on;
        hold on;
        axis([-20 20 -20 20]);
        plot([new_top_x(i),nx(i+1)],[new_top_y(i),ny(i+1)],'blue','linewidth',1);
        hold on
        plot([xmin,xmax],[ymin,ymin],'red','linewidth',1);
        hold on
        plot([xmin,xmax],[ymax,ymax],'red','linewidth',1);
        hold on
        plot([xmin,xmin],[ymin,ymax],'red','linewidth',1);
        hold on
        plot([xmax,xmax],[ymin,ymax],'red','linewidth',1);
        hold on
    elseif (ny(i)>ymax && ny(i+1)>ymax)
        continue
    elseif(i == n)
        if(ny(i)<ymax && ny(1)<ymax)
            plot([x(i),x(1)],[y(i),ny(1)],'black','linewidth',1);
            hold on   
        elseif(ny(i)<ymax && ny(1)>ymax)
            new_top_y(i) = ymax;
            new_top_x(i) = nx(i) + ((ymax-ny(i))/(ny(1)-ny(i)))*(nx(1)-nx(i));
            plot([new_top_x(i),nx(i)],[new_top_y,ny(i)],'cyan','linewidth',1);
        elseif(ny(i)>ymax && ny(1)<ymax)
            new_top_y(i) = ymax;
            new_top_x(i) = nx(i) + ((ymax-ny(i))/(ny(1)-ny(i)))*(nx(1)-nx(i));
            plot([new_top_x(i),nx(1)],[new_top_y(i),ny(1)],'yellow','linewidth',1);
        end
    else
        if(ny(i+1)>ymax)
            new_top_y = ymax;
            new_top_x(i) = nx(i) + ((ymax-ny(i))/(ny(i+1)-ny(i)))*(nx(i+1)-nx(i));
            plot([new_top_x(i),nx(i)],[new_top_y,ny(i)],'magenta','linewidth',1);
            hold on
        else
            new_top_y(i) = ny(i);
            new_top_x(i) = nx(i);
            plot([nx(i),nx(i+1)],[ny(i),ny(i+1)],'red','linewidth',1);
            hold on
        end
    end
end


