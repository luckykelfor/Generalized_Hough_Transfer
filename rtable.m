%R-table
function T=Rtable(inputimage,entries)
[rows,columns]=size(inputimage);
BW=edge(inputimage);
[Fx,Fy]=gradient(inputimage);
for x=1:columns
    for y=1:rows
        if (Fx(y,x)~=0)
            ang(y,x)=atan(Fy(y,x)/Fx(y,x));
        else
            ang(y,x)=pi/2;
        end
    end
end
%compute reference point
xr=0;yr=0;p=0;
for x=1:columns
    for y=1:rows
        if (BW(y,x)==1)
            xr=xr+x;
            yr=yr+y;
            p=p+1;
        end
    end
end
xr=round(xr/p);
yr=round(yr/p);
%for each edge point
d=pi/entries;
s=0;
F=zeros(entries,1);
for x=1:columns
    for y=1:rows
        if (BW(y,x)==1)
            phi=ang(y,x);
            i=round((phi+(pi/2))/d);
            if (i==0)
                i=1;
            end
            v=F(i)+1;
              if (v>s)
                  s=s+1;
                  T(:,:,s)=zeros(entries,2);
              end
              F(i)=F(i)+1;
              T(i,1,v)=x-xr;
              T(i,2,v)=y-yr;
        end
    end
end

              
