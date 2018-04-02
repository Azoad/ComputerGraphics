#include<stdio.h>
int main()
{
    int n;
    printf("Enter the number of lines : ");
    scanf("%d",&n);
    int x[n],y[n],x1[n],y1[n];

    for(int i=1;i<=n;i++)
    {
            printf("\nEnter the endpoints of line %d :\n",i);
            scanf("%d %d",&x[i],&y[i]);
            scanf("%d %d",&x1[i],&y1[i]);
    }

    int xmin,ymin,xmax,ymax;

    printf("Enter the lower left corner :\n\tXmin = ");
    scanf("%d",&xmin);
    printf("\tYmin = ");
    scanf("%d",&ymin);
    printf("Enter the upper right corner :\n\tXmax = ");
    scanf("%d",&xmax);
    printf("\tYmax = ");
    scanf("%d",&ymax);

    int bit1,bit2,bit3,bit4;
    int bite1,bite2,bite3,bite4;
    for(int i=1;i<=n;i++)
    {
            if((y[i]-ymax)>0)
            {
                bit1 = 1;
            }
            else bit1 = 0;
            if((ymin-y[i])>0)
            {
                bit2 = 1;
            }
            else bit2 = 0;
            if((x[i]-xmax)>0)
            {
                bit3 = 1;
            }
            else bit3 = 0;
            if((xmin-x[i])>0)
            {
                bit4 = 1;
            }
            else bit4 = 0;

            if((y1[i]-ymax)>0)
            {
                bite1 = 1;
            }
            else bite1 = 0;
            if((ymin-y1[i])>0)
            {
                bite2 = 1;
            }
            else bite2 = 0;
            if((x1[i]-xmax)>0)
            {
                bite3 = 1;
            }
            else bite3 = 0;
            if((xmin-x1[i])>0)
            {
                bite4 = 1;
            }
            else bite4 = 0;


            if(bit1==0&&bit2==0&&bit3==0&&bit4==0&&bite1==0&&bite2==0&&bite3==0&&bite4==0)
            {
                printf("Line %d is visible.\n",i);
            }

            else
            {
                int a,b,c,d;

                a = bit1&bite1;
                b = bit2&bite2;
                c = bit3&bite3;
                d = bit4&bite4;

                if(a==0&&b==0&&c==0&&d==0)
                {
                    printf("Line %d is a clipping candidate.\n",i);
                }
                else
                    printf("Line %d is invisible.\n",i);
            }

    }
}
