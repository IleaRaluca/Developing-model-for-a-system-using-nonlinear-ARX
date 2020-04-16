function [phi]=aflarephi(na,nb,nk,m,y,u)
phi=[];
N=length(y);
for k=1:N
    yc=[];
    for i=1:(na+nb)
        if(i<=na)
            if(k-i<=0)
                yc=[yc 0];
            else
                yc=[yc y(k-i)];
            end
        else
            if(k-i+na-nk+1<=0)
                yc=[yc 0];
            else
                yc=[yc u(k-i+na-nk+1)];
            end
        end
    end
    if(m>1)
        lin=[yc 1];
        for i=2:m
            c=[];
            for j=1:length(yc)
                c=[c (yc(j).*lin(j:end))];
            end
            lin=c;
            if(i<m)
                lin=[lin 1];
            end
        end
    else
        lin=yc;
    end
    phi=[phi;lin];
end
end