clear all; close all; clc;


% question 1
[f, X] = question1();

figure(1);
subplot (3,1,1);
plot(f, abs(X));
title('Fourier Transform of x(t)');
xlabel('Frequency [Hz]');
ylabel('|X(f)|');

% question 2
fs_1 = 16000;
[t, x] = question2(fs_1);

player = audioplayer(x,fs_1);
play(player);


% question 3
figure(2);
subplot (2,1,1);  hold all;
plot(t,x,':');
title('x(t) f = 2000 Hz');
xlabel('t [sec]');
axis([2.99 3.01 -1 1]);

subplot (2,1,2);  hold all;
plot(t,x,':');
title('x(t) f = 800 Hz');
xlabel('t [sec]');
axis([2.99 3.01 -1 1]);

% question 4-9
fs_2 = 2000;
[ x_n_2 , n_2, X_k_shifted_2, x_ideal_2, x_ZOH_2, x_FOH_2] = Signal_Reconstruction( t, x , fs_2 );

% question 4
figure(2);
subplot(2,1,1);
stem(n_2, x_n_2, ':');
axis([2.99 3.01 -1 1]);

% question 5
figure(1);
subplot(3,1,2);
plot(linspace((-fs_2/2),(fs_2/2),length(X_k_shifted_2)), abs(X_k_shifted_2));
title('Discrete Fourier Transform of x[n] fs = 2000 Hz');
xlabel('Frequency [Hz]');
ylabel('|X(theta)|');

% question 7
figure(2);
subplot(2,1,1);
plot (t((2.99*fs_1+1):(3.01*fs_1)),x_ideal_2((2.99*fs_1+1):(3.01*fs_1)));

% question 8 
plot (t((2.99*fs_1+1):(3.01*fs_1)),x_ZOH_2((2.99*fs_1+1):(3.01*fs_1)));

% question 9
plot (t((2.99*fs_1+1):(3.01*fs_1)),x_FOH_2((2.99*fs_1+1):(3.01*fs_1)));
legend('x(t)','x[n]', 'x ideal', 'x ZOH', 'x FOH');

% question 10 
player_ideal = audioplayer(x_ideal_2,fs_1);
player_ZOH = audioplayer(x_ZOH_2,fs_1);
player_FOH = audioplayer(x_FOH_2,fs_1);

%  play(player_ideal);
%  play(player_ZOH);
%  play(player_FOH);

% question 11 
fs_3 = 800; 
[ x_n_3 , n_3, X_k_shifted_3, x_ideal_3, x_ZOH_3, x_FOH_3] = Signal_Reconstruction( t, x , fs_3 );


figure(1);
subplot(3,1,3);
plot(linspace((-fs_3/2),(fs_3/2),length(X_k_shifted_3)), abs(X_k_shifted_3));
title('Discrete Fourier Transform of x[n] fs = 800 Hz');
xlabel('Frequency [Hz]');
ylabel('|X(theta)|');

figure(2);
subplot(2,1,2);
stem(n_3, x_n_3, ':');
axis([2.99 3.01 -1 1]);
plot (t((2.99*fs_1+1):(3.01*fs_1)),x_ideal_3((2.99*fs_1+1):(3.01*fs_1)));
plot (t((2.99*fs_1+1):(3.01*fs_1)),x_ZOH_3((2.99*fs_1+1):(3.01*fs_1)));
plot (t((2.99*fs_1+1):(3.01*fs_1)),x_FOH_3((2.99*fs_1+1):(3.01*fs_1)));
legend('x(t)','x[n]', 'x ideal', 'x ZOH', 'x FOH');

% player_ideal = audioplayer(x_ideal_3,fs_1);
% player_ZOH = audioplayer(x_ZOH_3,fs_1);
% player_FOH = audioplayer(x_FOH_3,fs_1);

%  play(player_ideal);
%  play(player_ZOH);
%  play(player_FOH);