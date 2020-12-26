clear all
load('LP51.mat');
H0=abs(fft(num,512));
H0log=20*log10(H0);
H0_freq=H0log(1:256);
F=11;%fractional bits
h_fix=round(num*2^F);
h_fixed=h_fix*2^(-F);
sum=0;
for i=1:51
    sum=sum+h_fixed(i)*h_fixed(i);
end
SQNR=2^22*12/3*sum;
SQNRdb=10*log10(SQNR);

H=abs(fft(h_fixed,512));
Hlog=20*log10(H);
H_freq=Hlog(1:256);
v=linspace(0,0.5,256);
n=0:50;
% figure(1);
% stem(n,h_fixed);
% xlabel('n');
% ylabel('h(n)');
figure(2);
plot(v,H0_freq);hold on;plot(v,H_freq);
xlabel('Normalized frequency v');
ylabel('20log10|(H(v)|');
xticks([1/16 1/8 3/16 1/4 5/16 3/8 7/16 1/2]);