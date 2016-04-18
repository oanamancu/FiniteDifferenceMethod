function xn=ThomasAlgorithm(A,b,n)
  xn=zeros(1,n);
  
  for k=2:n
      m=A(k,k-1)/A(k-1,k-1);
      A(k,k)=A(k,k)-m*A(k-1,k);
      b(k)=b(k)-m*b(k-1);
  end
  
  xn(n)=b(n)/A(n,n);
  for k=n-1:-1:1
      xn(k)=(b(k)-A(k,k+1)*xn(k+1))/A(k,k);
  end
  
end