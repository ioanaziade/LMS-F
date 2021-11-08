%if we substract we will still hear the noise 
%that is why we need weiner filter
fs=44100;
t=45; %%% time in seconds
N=t*fs; %%% number of samples

%define var for each channel 
%%%%%%%% DATA: x
x_r=Helicopter(:,1);
x_l=Helicopter(:,2);
%%%%%%%% REFERENCE: d
d_r=Rolling_noise(:,1);
d_l=Rolling_noise(:,2);

N_id=1e4; %%% limit the number of data samples
L_coef=10; %%% number of coefficients of the FIR filter

[Filt_Coeff_r]=WienerFilt(x_r,d_r,L_coef,N_id);
[Filt_Coeff_l]=WienerFilt(x_l,d_l,L_coef,N_id);

y_r=filter(Filt_Coeff_r,1,x_r);
y_l=filter(Filt_Coeff_l,1,x_l);

E_r=d_r-y_r;
E_l=d_l-y_l;
k=10;
L=1000;
Filt_NiceSquaresr{k}={};
Filt_NiceSquaresl{k}={};
Err_r{k}={};
Err_l{k}={};
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquaresr{i},Err_r{i}]=LeastMeanSquares(x_r,d_r,mu);
    [Filt_NiceSquaresl{i},Err_l{i}]=LeastMeanSquares(x_l,d_l,mu);
end
corr{k}={};
MaxCorr=zeros(k);
for i=1:k
    corr{i}=xcorr(Filt_NiceSquaresr{i},x_r);
    MaxCorr(i)=max(corr{i});
end
figure
plot(MaxCorr)
clear ('x_r','x_l','y_r','y_l','d_r','d_l'); %%% to avoid memory resources

rolling_Fullfilt=[E_r E_l];
rolling_Rfilt=E_r;
rolling_Lfilt=E_l;
% sound(rolling_Fullfilt(1:N,:),fs)