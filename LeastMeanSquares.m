function [h, Error]=LeastMeanSquares(Noise,MusicNoise,mu,N)
L=length(Noise);
h(1:N,L+1)=0;
x_pad=[zeros(N-1,1);Noise];
Error=zeros(L,1);
NewNoise=zeros(L,1);
for i =1:L
    phi=x_pad(i+(N-1):-1:i);
    NewNoise(i)=phi'*h(:,i);
    Error(i)=MusicNoise(i)-NewNoise(i);
    h_new=h(:,i)+(mu/(1+phi'*phi))*Error(i)*phi;
    h(:,i+1)=h_new;
end

end