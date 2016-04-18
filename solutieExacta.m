function xEx= solutieExacta(x,eps)
  xEx=x-(1-exp(x/eps))/(1-exp(1/eps));
end