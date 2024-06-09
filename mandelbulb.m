% Define the size of the volume
volumeSize = 1000;

n=8;

% empty volume array
volumeData = zeros(volumeSize, volumeSize, volumeSize);

zn=0;
a=4/(volumeSize*(1-1/volumeSize));
b=-2-a;

for k=1:volumeSize
    for l=1:volumeSize
        for m=1:volumeSize
                %z=0;
                q=0;
                r=0;
                s=0;

                %c= a*k+b + j*(a*l+b);
                t=a*k+b;
                u=a*l+b;
                v=a*m+b;
                rho=sqrt(q*q+r*r+s*s);
                theta=atan2(sqrt(q*q+r*r),s);
                phi=atan2(r,q);
                for p=0:200
                %zn=z^2+c;
                qton=rho^n*sin(theta*n)*cos(phi*n);
                rton=rho^n*sin(theta*n)*sin(phi*n);
                ston=rho^n*cos(theta*n);

                qn=qton + t;
                rn=rton + u;
                sn=ston + v;
                
                %z=zn;
                rho=sqrt(qn*qn+rn*rn+sn*sn);
                theta=atan2(sqrt(qn*qn+rn*rn),sn);
                phi=atan2(rn,qn);
                if abs(rho)>=2
                break;
                end
                end
                if abs(rho)<2
                volumeData(k,l,m)=1;
                end
        end
    end
end


% volshow(volumeData);
customColormap = 'cyan';
viewer=volshow(volumeData, 'Colormap', customColormap);