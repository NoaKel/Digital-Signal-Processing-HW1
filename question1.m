function [ f , X ] = question1(  )

omega0 = 2*pi*250;
fs = 16000;
omega = linspace(-300,300,fs).*(2*pi); 
X = (1/2*1i) * ((1./(2+1i*(omega-omega0)))-(1./(2+1i*(omega+omega0))));
f = omega/(2*pi);

end

