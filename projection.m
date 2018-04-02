clear all
clc

A = [0;0;0];
B = [1;0;0];
C = [1;1;0];
D = [0;1;0];
E = [0;1;1];
F = [0;0;1];
G = [1;0;1];
H = [1;1;1];

V = [   A(1), B(1), C(1), D(1), E(1), F(1), G(1), H(1);
        A(2), B(2), C(2), D(2), E(2), F(2), G(2), H(2);
        A(3), B(3), C(3), D(3), E(3), F(3), G(3), H(3);
        1   , 1   , 1   , 1   , 1   , 1   , 1   , 1   ; ]
    
d = input('Enter the value of d: ');

PerK = [ d,0,0,0;
         0,d,0,0;
         0,0,0,0;
         0,0,1,d; ]
     
PerKV = PerK * V 

AA = [PerKV(1,1)/PerKV(4,1),PerKV(2,1)/PerKV(4,1),PerKV(3,1)/PerKV(4,1)]
BB = [PerKV(1,2)/PerKV(4,2),PerKV(2,2)/PerKV(4,2),PerKV(3,2)/PerKV(4,2)]
CC = [PerKV(1,3)/PerKV(4,3),PerKV(2,3)/PerKV(4,3),PerKV(3,3)/PerKV(4,3)]
DD = [PerKV(1,4)/PerKV(4,4),PerKV(2,4)/PerKV(4,4),PerKV(3,4)/PerKV(4,4)]
EE = [PerKV(1,5)/PerKV(4,5),PerKV(2,5)/PerKV(4,5),PerKV(3,5)/PerKV(4,5)]
FF = [PerKV(1,6)/PerKV(4,6),PerKV(2,6)/PerKV(4,6),PerKV(3,6)/PerKV(4,6)]
GG = [PerKV(1,7)/PerKV(4,7),PerKV(2,7)/PerKV(4,7),PerKV(3,7)/PerKV(4,7)]
HH = [PerKV(1,8)/PerKV(4,8),PerKV(2,8)/PerKV(4,8),PerKV(3,8)/PerKV(4,8)]
