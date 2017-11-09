function [ t, x ] = 	question2( freq )

omega1 = 2*pi*250;
omega2 = 2*pi*315;
omega3 = 2*pi*375;
omega4 = 2*pi*500;
t = linspace(0,4,freq*4)';
x = zeros(length(t),1);

for i=1:length(t)
    if (t(i)>=0 && t(i)<1)
        x(i) = sin(omega1*t(i))*exp(-2*t(i));
    elseif (t(i)>=1 && t(i)<2)
        x(i) = sin(omega2*(t(i)-1))*exp(-2*(t(i)-1));
    elseif (t(i)>=2 && t(i)<3)
        x(i) = sin(omega3*(t(i)-2))*exp(-2*(t(i)-2));
    elseif (t(i)>=3 && t(i)<4)
        x(i) = sin(omega4*(t(i)-3))*exp(-2*(t(i)-3));
    end 
end
 

end

