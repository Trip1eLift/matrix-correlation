B=10;
a=1:B; b=1:B; c=1:B;
f=2*B+1;
X(1:f,1:f,1:f,1:B)=0;
Y(1:f,1:f,1:f,1:B)=0;
Z(1:f,1:f,1:f,1:B)=0;
%%Assign the values for Xvb,Yvb,Zvb can be more efficient.

for I=1:f
    for J=1:f
        for K=1:f
            Xvb(I,J,K)=(I-B-1)/(B+1);
            Yvb(I,J,K)=(J-B-1)/(B+1);
            Zvb(I,J,K)=(K-B-1)/(B+1);
            rho2=corFun((I-B-1)/(B+1),(J-B-1)/(B+1),(K-B-1)/(B+1));
                for i = 1:B
                   
                   a(i)=rho2(1,2);
                   b(i)=rho2(1,3);
                   c(i)=rho2(2,3);
                  % disp([(I-B-1)/(B+1),(J-B-1)/(B+1),(K-B-1)/(B+1)]);
                  % rho1=rho2
                   rho1=rho2;
                   rho2=corrcoef(rho1);
                end
                X(I,J,K,1:B)=a(1:B);
                Y(I,J,K,1:B)=b(1:B);
                Z(I,J,K,1:B)=c(1:B);
        end
    end
end
Xv=reshape(X(:,:,:,B),[f^3,1]);
Yv=reshape(Y(:,:,:,B),[f^3,1]);
Zv=reshape(Z(:,:,:,B),[f^3,1]);
Xv2=round(Xv,1);
Yv2=round(Yv,1);
Zv2=round(Zv,1);

%%%cleaning data 
Xv2(Xv2==-.1)=0;
Yv2(Yv2==-.1)=0;
Zv2(Zv2==-.1)=0;


G2=findgroups(Xv2,Yv2,Zv2);
%%starting point is (Xvb,Yvb,Zvb), end point is (Xv2,Yv2,Zv2)
Xvb=reshape(Xvb,[f^3,1]);
Yvb=reshape(Yvb,[f^3,1]);
Zvb=reshape(Zvb,[f^3,1]);
%for visualization

for i=1:max(G2)
Xd=[Xvb(G2==i),Xv2(G2==i)];
Xd=Xd';
Xd=reshape(Xd,[2*sum(G2==i),1]);

Yd=[Yvb(G2==i),Yv2(G2==i)];
Yd=Yd';
Yd=reshape(Yd,[2*sum(G2==i),1]);

Zd=[Zvb(G2==i),Zv2(G2==i)];
Zd=Zd';
Zd=reshape(Zd,[2*sum(G2==i),1]);


plot3(Xd,Yd,Zd);
hold on;
end
hold off



Cx=(Xv2==-1);
Cy=(Yv2==-1);
Cz=(Zv2==-1);
Cc=Cx.*Cy.*Cz;
Cx=(Xv2==-.5);
Cy=(Yv2==-.5);
Cz=(Zv2==-.5);
Cc=Cx.*Cy.*Cz;
rho2=corFun(X(2,1,1,1),Y(2,1,1,1),Z(2,1,1,1));
for i = 1:B
                   
                   a(i)=rho2(1,2);
                   b(i)=rho2(1,3);
                   c(i)=rho2(2,3);
                  % disp([(I-B-1)/(B+1),(J-B-1)/(B+1),(K-B-1)/(B+1)]);
                  % rho1=rho2
                   rho1=rho2;
                   rho2=corrcoef(rho1);
end
                
Xcount=1:f^3;
Xindex=reshape(Xcount,f,f,f);
Xcheck=reshape(Xindex,f^3,1);

for i=1:max(G2)
    j=sum(G2==i);
    disp([i,j])
    end
%Ci=reshape(Cc,f,f,f

%hold on;
%plot(b);
%plot(c)
%hold off;