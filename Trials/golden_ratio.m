F=1;
g=(1+sqrt(5))/2;
x=zeros(1,16);
y=zeros(1,16);
for n=1:15
    F(n+1)=F(n)*g;
    if rem(n,4)==1
        y(n)=F(n+1);
    elseif rem(n,4)==2
        x(n)=F(n);
    elseif rem(n,4)==3
        y(n)=-(F(n+1));
    else
        x(n)=-(F(n));
    end
    
end
t=1:length(x);
tt=linspace(t(1),t(end),101);
xx=spline(t,x,tt);
yy=spline(t,y,tt);
plot(x,y,'bs',xx,yy)
z=1:1:16;
plot3(x,y,z)