%AUTHOR ANTU
close all;
clear all;
clc;

left_corner_x = input('lower left corner x');
left_corner_y = input('lower left corner y');

right_corner_x = input('upper right corner x');
right_corner_y = input('upper right corner y');

fprintf('Enter first x co-ordinate')
x1 = input('');
fprintf('Enter first y co-ordinate')
y1 = input('');

fprintf('Enter first x co-ordinate')
x2 = input('');
fprintf('Enter first y co-ordinate')
y2 = input('');

if(x1 >= left_corner_x && y1>=left_corner_y && x2<=right_corner_x && y2<=right_corner_y)
    fprintf('visible')
else
    %for first point
    if(y1 - right_corner_y > 0)
        bi1=1;
    else
        bi1=0;
    end
    
    if(left_corner_y - y1> 0)
        bi2=1;
    else
        bi2=0;
    end
    
    if(x1 - right_corner_x> 0)
        bi3=1;
    else
        bi3=0;
    end
    
    if(left_corner_x - x1> 0)
        bi4=1;
    else
        bi4=0;
    end
    
    %for second point
    if(y2 - right_corner_y > 0)
        byt1=1;
    else
        byt1=0;
    end
    
    if(left_corner_y - y2> 0)
        byt2=1;
    else
        byt2=0;
    end
    
    if(x2 - right_corner_x> 0)
        byt3=1;
    else
        byt3=0;
    end
    
    if(left_corner_x - x2> 0)
        byt4=1;
    else
        byt4=0;
    end
    
    a = bitand(bi1,byt1) ;
    b = bitand(bi2,byt2) ;
    c = bitand(bi3,byt3) ;
    d = bitand(bi4,byt4) ;

    if(a==1 || b==1 ||c==1 ||d==1)
        fprintf('not visible')
    else
        fprintf('clipping candidate')
    end
end


set(gca,'xtick',-20:1:20);
set(gca,'ytick',-20:1:20);
line([-20 20],[0 0],'LineWidth',1.5,'Color','black');
line([0 0],[-20 20],'LineWidth',1.5,'Color','black');
axis equal;
grid on;
hold on;
axis([-20 20 -20 20]);


nx1 = [left_corner_x,left_corner_x];
ny1 = [left_corner_y,right_corner_y];
plot(nx1,ny1,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','red');
hold on;

nx2 = [left_corner_x,right_corner_x];
ny2 = [right_corner_y,right_corner_y];
plot(nx2,ny2,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','blue');
hold on;

nx3 = [right_corner_x,right_corner_x];
ny3 = [right_corner_y,left_corner_y];
plot(nx3,ny3,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','blue');
hold on;

nx4 = [right_corner_x,left_corner_x];
ny4 = [left_corner_y,left_corner_y];
plot(nx4,ny4,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','blue');
hold on;

nx5 = [x1,x2];
ny5 = [y1,y2];
plot(nx5,ny5,'b','linewidth',1.5,'marker','O','MarkerEdgeColor','blue');
hold on;
