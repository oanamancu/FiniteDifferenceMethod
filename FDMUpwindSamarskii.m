function [] = FDMUpwindSamarskii(n)
   h=1/n;
   x=0:h:1;
   
   FDMUpwindSamarskiiEps(h,x,n,-1);
   FDMUpwindSamarskiiEps(h,x,n,-2);
   FDMUpwindSamarskiiEps(h,x,n,-3);
   
end


function FDMUpwindSamarskiiEps(h,x,n,powEps)
   uEx=solutieExacta(x,10^(powEps));
   Pe=h/2*10^(powEps);
   ux=ThomasAlgorithm(setA(n-1,10^(powEps),h,Pe),setB(n-1,h,Pe),n-1);
   ux=[0 ux 0];
   createFile(['FDMUpwindSamarskii' num2str(abs(powEps))],10^(powEps),x,uEx,ux);  
end


function A=setA(n,eps,h,Pe)
   A=zeros(n);
   for i=2:(n-1)
       A(i,i-1)=-2*eps*(1+Pe+Pe^2)-h*(1+Pe);
       A(i,i)=4*eps*(1+Pe+Pe^2);
       A(i,i+1)=-2*eps*(1+Pe+Pe^2)+h*(1+Pe);
   end
   A(1,1)=4*eps*(1+Pe+Pe^2);
   A(1,2)=-2*eps*(1+Pe+Pe^2)+h*(1+Pe);
   A(n,n-1)=-2*eps*(1+Pe+Pe^2)-h*(1+Pe); 
   A(n,n)=4*eps*(1+Pe+Pe^2);
end


function b=setB(n,h,Pe)
   b=zeros(1,n);
   for i=1:n
       b(i)=2*h^2*(1+Pe);
   end
end