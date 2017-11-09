function [ x_n , n, X_k_shifted, x_ideal, x_ZOH, x_FOH] = Signal_Reconstruction( t, x, fs_2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

fs_1 = 16000;
% question 4 

x_n = downsample(x,fs_1/fs_2);
n = downsample(t,fs_1/fs_2);

% question 5
X_k=fft(x_n);
X_k_shifted=fftshift(X_k);

% question 7
x_scattered = upsample(x_n,fs_1/fs_2);
t_ideal = fs_2/fs_1*(-256:1:255)';
i_ideal = sinc(t_ideal);
x_ideal = conv(x_scattered, i_ideal);

part = round((length(x_ideal)-length(t))/2);
x_ideal = x_ideal((part+1):(length(t)+part-1));


% question 8 
i_ZOH(1:(fs_1/fs_2)) = 1;
x_ZOH = conv(x_scattered, i_ZOH);

% question 9
Ts_2 = 1/fs_2;
Ts_1 = 1/fs_1;
t_FOH = -Ts_2:Ts_1:Ts_2;
i_FOH(1:1:2*Ts_2/Ts_1+1) = (1-abs(t_FOH/Ts_2)); 
x_FOH = conv(x_scattered, i_FOH);

part = round((length(x_FOH)-length(t))/2);
x_FOH = x_FOH((part+1):(length(t)+part-1)); 

end

