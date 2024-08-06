function y=Q2a(n)
y(1)=round(rand(1,1)*4)+1;
for i=2:1:n
    flag=0;
    while(flag==0)
        a=round(rand(1,1)*(n-1))+1;
        if (ismember(a,y))
            flag=0;
        else
            flag=1;
        end
    end
    y(i)=a;
end