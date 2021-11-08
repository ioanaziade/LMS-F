function [music, Error]=LeastMeanSquares(Noise,MusicNoise,mu)
L=min(length(Noise),1000);
phi(1:length(Noise))=0;
h(1:length(Noise))=0;
for i =1:L-1
    phi(2:i+1)=phi(1:i);
    phi(1)=Noise(i);
    NewNoise=phi*h';
    Error=MusicNoise-NewNoise;
    h=h+(mu/(1+phi*phi'))*Error(i)*phi;
end
NoiseFilter=filter(h(1:L),1,Noise);
music=MusicNoise-NoiseFilter;
end