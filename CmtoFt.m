function v=CmtoFt(In)
x=(In/2.54);%inches
v=fix(x/12), rem(x/12);