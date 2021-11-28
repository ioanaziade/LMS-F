%if we substract we will still hear the noise 
%that is why we need weiner filter
load('SoundSamples.mat')
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
Filt_NiceSquares_r{k}={};
Filt_NiceSquares_l{k}={};
Err_r{k}={};
Err_l{k}={};
NoiseFilte_r{k}={};
NoiseFilte_l{k}={};
Music_r{k}={};
Music_l{k}={};
MaxCorrHell_r=zeros(k);
MaxCorrHell_l=zeros(k);
WienerCorr(1:k)=max(xcorr(E_r,x_r));
OriginalCorr(1:k)=max(xcorr(d_r,x_r));

n=100e3;
q=5;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

q=10;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

q=20;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

n=10e3;
q=5;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

q=10;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures
% for i=1:k
%     for j=1:q
%         figure
%         plot(Filt_NiceSquares_l{i}(j,:))
%         hold
%         Wiener_Weight(1:n)=Filt_Coeff_r(j);
%         plot(Wiener_Weight)
%         xlabel("k")
%         ylabel("Weight")
%         legend('w_k','wiener')
%     end
% end

q=20;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

n=1e3;
q=5;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

q=10;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

q=20;
for i=1:k
    mu=i*2/k;
    [Filt_NiceSquares_r{i},Err_r{i}]=LeastMeanSquares(x_r(1:n),d_r(1:n),mu,q);
    [Filt_NiceSquares_l{i},Err_l{i}]=LeastMeanSquares(x_l(1:n),d_l(1:n),mu,q);
end


for i=1:k
    NoiseFilte_r{i}=filter(Filt_NiceSquares_r{i}(:,end),1,x_r);
    Music_r{i}=d_r-NoiseFilte_r{i};
    corr=xcorr(Music_r{i},x_r);
    MaxCorrHell_r(i)=max(corr);
    NoiseFilte_l{i}=filter(Filt_NiceSquares_l{i}(:,end),1,x_l);
    Music_l{i}=d_l-NoiseFilte_l{i};
    corr=xcorr(Music_l{i},x_l);
    MaxCorrHell_l(i)=max(corr);
end
PlottingFigures

