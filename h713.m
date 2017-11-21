function [ timer, xsol ] = h713( a,xo )

% Part 3: Write a function that takes two inputs - the initial condition x0
% and the a parameter and integrates the equation forward in time. Make
% your code return two variables - the timecourse of X and the time
% required for the population to reach 99% of its maximum value. 

rhs2=@(t,x) a*x.*(1-x);
interval=[0 10]; %from 0 to 10 hours 
sol=ode23(rhs2,interval,xo); 

xsol=sol.x;
ysol=sol.y;
plot(xsol,ysol);

timen=.99<ysol;
timep=min(ysol(timen)); %the first y value near .99
forx=min(ind2sub(size(ysol),find(timep==ysol))); %for finding the index
timer=xsol(forx);


end

