function acc=ght(inputimage,Rtable)
[rows,columns]=size(inputimage);
BW=edge(inputimage);
[Fx,Fy]=gradient(inputimage);
[rowst,h,columnst]=size(Rtable);
d=pi/rowst;
acc=zeros(rows,columns);
for x=1:columns
    for y=1:rows
        if (Fx(y,x)~=0)
            ang(y,x)=atan(Fy(y,x)/Fx(y,x));
        else
            ang(y,x)=pi/2;
        end
    end
    
end
for x=1:columns
    for y=1:rows
        if (BW(y,x)==1)
            phi=ang(y,x);
            i=round((phi+(pi/2))/d);
            if (i==0)
                i=1;
            end
               for j=1:columnst
                   if(Rtable(i,1,j)==0&Rtable(i,2,j)==0)
                       j=columnst;
                   else
                        b0=y-Rtable(i,2,j);
                        a0=x-Rtable(i,1,j);
                           if (a0>0&a0<columns&b0>0&b0<rows)
                               acc(b0,a0)=acc(b0,a0)+1;
                           end
                    end
               end
        end
    end
end

        
                           

              