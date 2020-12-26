clear all
load('LP51.mat');
impulse=(zeros(1,51));
impulse(1,26)=1;%m=(M-1)/2=25
h_HP=impulse-num;
H=abs(fft(h_HP,512));
Hlog=20*log10(H);
H_freq=Hlog(1:256);
v=linspace(0,0.5,256);
n=0:50;
figure(1);
stem(n,h_HP);
xlabel('n');
ylabel('h(n)');
figure(2);
plot(v,H_freq);
xlabel('Normalized frequency v');
ylabel('20log10|(H(v)|');
xticks([1/16 1/8 3/16 1/4 5/16 3/8 7/16 1/2]);
ylim([-200 0])