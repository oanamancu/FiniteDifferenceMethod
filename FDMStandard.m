
function FDMStandard(n)
   h=1/n;
   x=0:h:1;
   
   FDMStandardEps(h,x,n,-1);
   FDMStandardEps(h,x,n,-2);
   FDMStandardEps(h,x,n,-3);
   
end


function FDMStandardEps(h,x,n,powEps)
   uEx=solutieExacta(x,10^(powEps));
   ux=ThomasAlgorithm(setA(n-1,10^(powEps),h),setB(n-1,h),n-1);
   ux=[0 ux 0];
   createFile(['FDMStandard' num2str(abs(powEps))],10^(powEps),x,uEx,ux);  
end


function A=setA(n,eps,h)
   A=zeros(n);
   for i=2:(n-1)
       A(i,i-1)=-2*eps-h;
       A(i,i)=4*eps;
       A(i,i+1)=h-2*eps;
   end
   A(1,1)=4*eps; A(1,2)=h-2*eps;
   A(n,n-1)=-h-2*eps; A(n,n)=4*eps;
end


function b=setB(n,h)
   b=zeros(1,n);
   for i=1:n
       b(i)=2*h^2;
   end
end