
function xn = GaussSeidel(A,b,n)
  xn=zeros(1,n);
  itr=0;
  xPrev=xn;
  while(calcErr(xn,xPrev)>0 || itr<64000)
    xPrev=xn;
    xn=calcXn(A,b,n,xn);
    itr=itr+1;  
  end
end

function xn= calcXn(A,b,n,xn)
 for i=1:n
     sum=0;
     for j=1:n
         if(i~=j)
             sum=sum+A(i,j)*xn(j);
         end
     end
     xn(i)=(b(i)-sum)/A(i,i);        
 end    
end


function err=calcErr(xn,xPrev)
  err=sum(abs(xPrev-xn));
end