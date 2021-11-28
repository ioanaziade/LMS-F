figure
x=[0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2];
plot(x, MaxCorrHell_r)
hold
plot(x, WienerCorr)
xticks([0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2])
title(['values for N=' num2str(n) ' and L=' num2str(q)])
xlabel("\mu")
ylabel("correlation")