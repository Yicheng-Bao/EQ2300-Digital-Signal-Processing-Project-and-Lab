clear all
load('LP51.mat');
H0=abs(fft(num,512));
H0log=20*log10(H0);
H0_freq=H0log(1:256);
F=11;%fractional bits
h_fix=round(num*2^F);
h_fixed=h_fix*2^(-F);

uniform=rand([1 20000000]).*2^12-2^11;
LP=conv(uniform,num);
LQ=conv(uniform,h_fixed);
up=mean(LP.^2);
down=mean((LP-LQ).^2);
SQNR=10*log10(up/down);