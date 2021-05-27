close all; clear all;
% load Persian.dat %ASCII code of persian 
f=fopen('Persian2.dat','rt');
x= fread(f);
fclose(f);
x=x(1:10000);
% load English.dat  %ASCII code of English
f=fopen('English2.dat','rt');
y= fread(f);
fclose(f);
y=y(1:10000);
% load French.dat  %ASCII code of Arabic
f=fopen('Arabic2.dat','rt');
z= fread(f);
fclose(f);
z=z(1:10000);
figure(1)
subplot(3,1,1) ;
plot(x);
title('Persian');
subplot(3,1,2) ;
plot(y);
title ('English');
subplot(3,1,3) ;
plot(z);
title ('Arabic');
x_f = abs(fft(x));  % Fourier transform of x
x_f = x_f(2:end/2 +1);
y_f = abs(fft(y));  % Fourier transform of y
y_f = y_f(2:end/2 +1);
z_f = abs(fft(z));  % Fourier transform of z
z_f = z_f(2:end/2 +1);
figure(2)
subplot(3,1,1) ;
plot(real(x_f));
title ('Fourier transform of Persian');
subplot(3,1,2) ;
plot(real(y_f));
title ('Fourier transform of English');
subplot(3,1,3) ;
plot(real(z_f));
title ('Fourier transform of Arabic');
t_f = [1 3 5 3 1] ;   % filter 
var = fft(t_f ,10000);
var=var(1 : end/2 +1);
figure(3)
plot(real(var));
x_filter = conv(t_f, x);   
y_filter = conv(t_f, y);
z_filter = conv(t_f, z);
figure(4)
subplot(3,1,1) ;
plot(x_filter);
title ('filtered Persian signal');
subplot(3,1,2) ;
plot(y_filter);
title ('filtered English signal');
subplot(3,1,3) ;
plot(z_filter);
title ('filtered Arabic signal');
x_f_f = abs(fft(x_filter)); % Fiurier of filtered x
x_f_f = x_f_f(2:end/2 +1);
x_f_f(2001 : end)=0;
y_f_f = abs(fft(y_filter)); % Fiurier of filtered x
y_f_f = y_f_f(2:end/2 +1);
y_f_f(2001 : end)=0;
z_f_f = abs(fft(z_filter)); % Fiurier of filtered x
z_f_f = z_f_f(2:end/2 +1);
z_f_f(2001 : end)=0;
figure(5)
subplot(3,1,1) ;
plot(real(x_f_f)); 
title ('Fourier tranform of filtered Persian signal');
subplot(3,1,2) ;
plot(real(y_f_f));
title ('Fourier transform of filtered English signal');
subplot(3,1,3) ;
plot(real(z_f_f));  
title ('Fourier transform of filtered Arabic signal');







