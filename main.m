T=imread('template2.jpg');
T=rgb2gray(T);
figure,imshow(T);
title('Ä£°å');
T=double(T);
Table=rtable(T,30);
[rowT,columnT,pageT]=size(Table);
O=imread('noise.jpg');
O=rgb2gray(O);
figure,imshow(O);
title('Ô­Í¼');
[row,column]=size(O);
BW=edge(O);
outimage=zeros(row,column);
O=double(O);
acc=ght(O,Table);
M=max(acc(:));
[b,a]=find(acc==M);
for x=1:column
       for y=1:row
           if (BW(y,x)==1)
              c1=x-a;
              c2=y-b;
              for z=1:pageT
                  for i=1:rowT
                      if (c1==Table(i,1,z)&c2==Table(i,2,z))  
                         outimage(y,x)=BW(y,x);
                      end
                  end
              end
           end
       end
end
figure,imshow(outimage);
title('Êä³öÍ¼Ïñ');
figure,imagesc(acc);
title('ÀÛ¼ÓÆ÷');  
