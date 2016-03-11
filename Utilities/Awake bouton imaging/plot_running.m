R = diff (Running (1,:))';
t = Running (2 , :)';
figure;
plot (t(2:end),smoothG(R,5))