close all;
clc;

setup();

% taking lower left and upper right point of viewport
[xmin,ymin] = ginput(1);
[xmax,ymax] = ginput(1);

view(xmax,xmin,ymax,ymin);

n = input('Enter the number of edges of the polygon to be clipped: ');
[x,y] = ginput(n);
plot(x,y,'red','linewidth',1);
hold on
plot([x(n),x(1)],[y(n),y(1)],'red','linewidth',1);
hold on

figure
subplot (2,2,1),title('After Bottom Clipping');
setup();
view(xmax,xmin,ymax,ymin);
p = 1;
for i = 1:n
    if(i == n)
        if(y(1)>=ymin && y(i)>=ymin)
            bcx(p) = x(i);
            bcy(p) = y(i);
            plot([x(1),x(i)],[y(1),y(i)],'cyan');
            hold on
        elseif(y(1)<ymin && y(i)>=ymin)
            bcx(p) = x(i);
            bcy(p) = y(i);
            p = p+1;
            bcy(p) = ymin;
            bcx(p) = x(i) + ((ymin-y(i))/(y(i)-y(1)))*(x(i)-x(1));
            plot([bcx(p),x(i)],[bcy(p),y(i)],'cyan');
            hold on
        elseif(y(1)>=ymin && y(i)<ymin)
            bcy(p) = ymin;
            bcx(p) = x(1) + ((ymin-y(1))/(y(i)-y(1)))*(x(i)-x(1));
            plot([bcx(p),x(1)],[bcy(p),y(1)],'cyan');
            hold on
        else
            continue
        end
    else
        if(y(i)<ymin && y(i+1)<ymin)
            continue
        elseif(y(i)<ymin && y(i+1)>=ymin)
            bcy(p) = ymin;
            bcx(p) = x(i) + ((ymin-y(i))/(y(i+1)-y(i)))*(x(i+1)-x(i));
            plot([bcx(p),x(i+1)],[bcy(p),y(i+1)],'red');
            hold on
            p = p+1;
        elseif(y(i)>=ymin && y(i+1)<ymin)
            bcx(p) = x(i);
            bcy(p) = y(i);
            p = p+1;
            bcy(p) = ymin;
            bcx(p) = x(i) + ((ymin-y(i))/(y(i+1)-y(i)))*(x(i+1)-x(i));
            plot([bcx(p),x(i)],[bcy(p),y(i)],'blue');
            hold on
            p = p+1;
        else
            bcx(p) = x(i);
            bcy(p) = y(i);
            plot([x(i),x(i+1)],[y(i),y(i+1)],'green');
            hold on
            p = p+1;
        end
    end
end

hold on
subplot (2,2,2),title('After Right Clipping');
setup();
view(xmax,xmin,ymax,ymin);
q = 1;
for i = 1:p
    if(i == p)
        if(bcx(1)<=xmax && bcx(i)<=xmax)
            rcx(q) = bcx(i);
            rcy(q) = bcy(i);
            plot([bcx(1),bcx(i)],[bcy(1),bcy(i)],'cyan');
            hold on
        elseif(bcx(1)<=xmax && bcx(i)>xmax)
            rcx(q) = xmax;
            rcy(q) = bcy(1) + (xmax-bcx(1))/(bcx(i)-bcx(1))*(bcy(i)-bcy(1));
            plot([bcx(1),rcx(q)],[bcy(1),rcy(q)],'cyan');
            hold on
        elseif(bcx(1)>xmax && bcx(i)<=xmax)
            rcx(q) = bcx(i);
            rcy(q) = bcy(i);
            q = q+1;
            rcx(q) = xmax;
            rcy(q) = bcy(i) + (xmax-bcx(i))/(bcx(i)-bcx(1))*(bcy(i)-bcy(1));
            plot([bcx(i),rcx(q)],[bcy(i),rcy(q)],'cyan');
            hold on
        else
            continue
        end
    else
        if(bcx(i)>xmax && bcx(i+1)>xmax)
            continue
        elseif(bcx(i)>xmax && bcx(i+1)<=xmax)
            rcx(q) = xmax;
            rcy(q) = bcy(i) + (xmax-bcx(i))/(bcx(i+1)-bcx(i))*(bcy(i+1)-bcy(i));
            plot([rcx(q),bcx(i+1)],[rcy(q),bcy(i+1)],'red');
            hold on
            q = q+1;
        elseif(bcx(i)<=xmax && bcx(i+1)>xmax)
            rcx(q) = bcx(i);
            rcy(q) = bcy(i);
            q = q+1;
            rcx(q) = xmax;
            rcy(q) = bcy(i) + (xmax-bcx(i))/(bcx(i+1)-bcx(i))*(bcy(i+1)-bcy(i));
            plot([rcx(q),bcx(i)],[rcy(q),bcy(i)],'blue');
            hold on
            q = q+1;
        else
            rcx(q) = bcx(i);
            rcy(q) = bcy(i);
            plot([bcx(i),bcx(i+1)],[bcy(i),bcy(i+1)],'green');
            hold on
            q = q+1;
        end
    end
end

subplot (2,2,3),title('After Top Clipping');
setup();
view(xmax,xmin,ymax,ymin);
r = 1;
for i = 1:q
    if(i == q)
        if(rcy(1)<=ymax && rcy(i)<=ymax)
            tcx(r) = rcx(i);
            tcy(r) = rcy(i);
            plot([rcx(1),rcx(i)],[rcy(1),rcy(i)],'cyan');
            hold on
        elseif(rcy(1)<=ymax && rcy(i)>ymax)
            tcy(r) = ymax;
            tcx(r) = rcx(1) + ((ymax-rcy(1))/(rcy(i)-rcy(1)))*(rcx(i)-rcx(1));
            plot([rcx(1),tcx(r)],[rcy(1),tcy(r)],'cyan');
            hold on
        elseif(rcy(1)>ymax && rcy(i)<=ymax)
            tcx(r) = rcx(i);
            tcy(r) = rcy(i);
            r = r+1;
            tcy(r) = ymax;
            tcx(r) = rcx(i) + ((ymax-rcy(i))/(rcy(i)-rcy(1)))*(rcx(i)-rcx(1));
            plot([rcx(i),tcx(r)],[rcy(i),tcy(r)],'cyan');
            hold on
        else
            continue
        end
    else
        if(rcy(i)>ymax && rcy(i+1)>ymax)
            continue
        elseif(rcy(i)>ymax && rcy(i+1)<=ymax)
            tcy(r) = ymax;
            tcx(r) = rcx(i) + ((ymax-rcy(i))/(rcy(i+1)-rcy(i)))*(rcx(i+1)-rcx(i));
            plot([tcx(r),rcx(i+1)],[tcy(r),rcy(i+1)],'red');
            hold on
            r = r+1;
        elseif(rcy(i)<=ymax && rcy(i+1)>ymax)
            tcx(r) = rcx(i);
            tcy(r) = rcy(i);
            r = r+1;
            tcy(r) = ymax;
            tcx(r) = rcx(i) + ((ymax-rcy(i))/(rcy(i+1)-rcy(i)))*(rcx(i+1)-rcx(i));
            plot([tcx(r),rcx(i)],[tcy(r),rcy(i)],'blue');
            hold on
            r = r+1;
        else
            tcx(r) = rcx(i);
            tcy(r) = rcy(i);
            plot([rcx(i),rcx(i+1)],[rcy(i),rcy(i+1)],'green');
            hold on
            r = r+1;
        end
    end
end

subplot (2,2,4),title('After Left Clipping');
setup();
view(xmax,xmin,ymax,ymin);
s = 1;
for i = 1:r
    if(i == r)
        if(tcx(1)>=xmin && tcx(i)>=xmin)
            lcx(s) = tcx(i);
            lcy(s) = tcy(i);
            plot([tcx(1),lcx(s)],[tcy(1),lcy(s)],'cyan');
            hold on
        elseif(tcx(1)>=xmin && tcx(i)<xmin)
            lcx(s) = xmin;
            lcy(s) = tcy(1) + (xmin-tcx(1))/(tcx(i)-tcx(1))*(tcy(i)-tcy(1));
            plot([tcx(1),lcx(s)],[tcy(1),lcy(s)],'red');
            hold on
        elseif(tcx(1)<xmin && tcx(i)>=xmin)
            lcx(s) = tcx(i);
            lcy(s) = tcy(i);
            s = s+1;
            lcx(s) = xmin;
            lcy(s) = tcy(i) + (xmin-tcx(i))/(tcx(i)-tcx(1))*(tcy(i)-tcy(1));
            plot([tcx(i),lcx(s)],[tcy(i),lcy(s)],'yellow');
            hold on
        else
            continue
        end
    else
        if(tcx(i)<xmin && tcx(i+1)<ymin)
            continue
        elseif(tcx(i)>=xmin && tcx(i+1)<xmin)
            lcx(s) = xmin;
            lcy(s) = tcy(i) + (xmin-tcx(i))/(tcx(i+1)-tcx(i))*(tcy(i+1)-tcy(i));
            plot([lcx(s),tcx(i)],[lcy(s),tcy(i)],'red');
            hold on
            s = s+1;
        elseif(tcx(i)<xmin && tcx(i+1)>=xmin)
            lcx(s) = tcx(i);
            lcy(s) = tcy(i);
            s = s+1;
            lcx(s) = xmin;
            lcy(s) = tcy(i) + (xmin-tcx(i))/(tcx(i+1)-tcx(i))*(tcy(i+1)-tcy(i));
            plot([lcx(s),tcx(i+1)],[lcy(s),tcy(i+1)],'blue');
            hold on
            s = s+1;
        else
            lcx(s) = tcx(i);
            lcy(s) = tcy(i);
            plot([tcx(i),tcx(i+1)],[tcy(i),tcy(i+1)],'green');
            hold on
            s = s+1;
        end
    end
end

% function for setting up grid
function setup()
set(gca,'xtick',-10:1:10);
set(gca,'ytick',-10:1:10);
line([-20 20],[0 0],'LineWidth',1,'Color','black');
line([0 0],[-20 20],'LineWidth',1,'Color','black');
axis equal;
grid on;
hold on;
axis([-10 10 -10 10]);
end

%function for drawing the viewport
function view(xmax,xmin,ymax,ymin)
plot([xmin,xmax],[ymin,ymin],'black','linewidth',1);
hold on
plot([xmin,xmax],[ymax,ymax],'black','linewidth',1);
hold on
plot([xmin,xmin],[ymin,ymax],'black','linewidth',1);
hold on
plot([xmax,xmax],[ymin,ymax],'black','linewidth',1);
hold on
end