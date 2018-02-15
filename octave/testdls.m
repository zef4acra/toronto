function y=testdls(p,q)
P=p(1,1)+p(2,1)+p(3,1);
Q=q(1,1)+q(2,1)+q(3,1);
y=(p(1,1)*log((p(1,1)/P)/(q(1,1)/Q)))+(p(2,1)*log((p(2,1)/P)/(q(2,1)/Q)))+(p(3,1)*log((p(3,1)/P)/(q(3,1)/Q)))
endfunction
