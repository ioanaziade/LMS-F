function [Filt_Coeff_r]=WienerFilt(x,d,L_coef,N_id)

%limit the nmb of samples  to N_id
% x=x_r(1:N_id);
% d=d_r(1:N_id);
X=zeros(N_id,L_coef);
%create matrix X 
for i =1:L_coef
    X(i:N_id,i)=x(1:N_id-i+1);
end
Filt_Coeff_r=((X'*X)^(-1))*X'*d(1:N_id);
end