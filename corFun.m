function rho = corFun(aa,bt,ct)
A=[ 1. aa bt; 
    aa 1. ct; 
    bt ct 1.];
rho=corrcoef(A);
end
