clear
close all
clc

set(gca,'xtick',-10:1:10)
set(gca,'ytick',-10:1:10)
axis([-10 10 -10 10])
axis equal
hold on

plot([-10 10],[0,0],'black','linewidth',1);
hold on

plot([0,0],[-10 10],'black','linewidth',1);
hold on
grid on

[x,y] = ginput(2);
plot(x,y,'b','linewidth',1,'marker','.','MarkerSize',10);
text(x(1),y(1),['(' num2str(x(1)) ',' num2str(y(1)) ')']);
text(x(2),y(2),['(' num2str(x(2)) ',' num2str(y(2)) ')']);
hold on

[xmin,ymin] = ginput(1);
plot(xmin,ymin,'r','linewidth',1,'marker','.','MarkerSize',10);
text(xmin,ymin,['(' num2str(xmin) ',' num2str(ymin) ')']);
[xmax,ymax] = ginput(1);
plot(xmax,ymax,'r','linewidth',1,'marker','.','MarkerSize',10);
text(xmax,ymax,['(' num2str(xmax) ',' num2str(ymax) ')']);
amx = xmax;
amn = xmin;
bmx = ymax;
bmn = ymin;

plot([amn amx],[bmn bmn],'red','linewidth',1);
plot([amn amx],[bmx bmx],'red','linewidth',1);
plot([amn amn],[bmn bmx],'red','linewidth',1);
plot([amx amx],[bmn bmx],'red','linewidth',1);

if((y(1)-ymax)>0)
    b1 = 1;
else
    b1 = 0;
end
if((ymin-y(1))>0)
    b2 = 1;
else
    b2 = 0;
end
if((x(1)-xmax)>0)
    b3 = 1;
else
    b3 = 0;
end
if((xmin-x(1))>0)
    b4 = 1;
else
    b4 = 0;
end
if((y(2)-ymax)>0)
    b11 = 1;
else
    b11 = 0;
end
if((ymin-y(2))>0)
    b12 = 1;
else
    b12 = 0;
end
if((x(2)-xmax)>0)
    b13 = 1;
else
    b13 = 0;
end
if((xmin-x(2))>0)
    b14 = 1;
else
    b14 = 0;
end


if(b1==0 && b2==0 && b3==0 && b4==0 && b11==0 && b12==0 && b13==0 && b14==0)
    title('This line is visible');
else
    a = bitand(b1,b11);
    b = bitand(b2,b12);
    c = bitand(b3,b13);
    d = bitand(b4,b14);
    if(a==0&&b==0&&c==0&&d==0)
        title('This line is clipping candidate');
    else
        title('This line is invisible');
    end
end