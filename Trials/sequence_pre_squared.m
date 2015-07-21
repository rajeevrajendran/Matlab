F=1;
F(2)=1;
for n=2:15
    F(n+1)=F(n)+F(n-1);
end
z=1:1:16;
plot3(sin(F),cos(F),z)