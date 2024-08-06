function n=Q2b(C,L,W)
%Q2b i
n=0;
flag=0;
while(flag==0)
a=round(rand(1,1)*9)+1;
b=round(rand(1,1)*9)+1;
c=round(rand(1,1)*9)+1;
n=n+1;
if (a>=C)&&(b>=L)&&(c>=W)
    flag=1;
    disp('Search Times:')
end
end
    