A=rand(3,3);
%a
B=A(2,:);
A(2,:)=A(3,:); %interchange columns 2, 3
A(3,:)=B
%b
A(4,:)=[0;0;0] % add fourth column of 0s
%c
C=A(2:4,:);
A(2,:)=[1;1;1]; % insert a row of 1s as the new second row of A
A(3:5,:)=C
%d
A(2,:)=[] % remove the second column