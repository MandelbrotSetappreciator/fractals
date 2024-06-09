% Dimensions of cube
Dimension = 1000;

n=8; %order of the mandelbulb

% empty volume array
Data = zeros(Dimension, Dimension, Dimension);

%below is solution to equations for mapping
a=4/(Dimension*(1-1/Dimension));
b=-2-a;
%looping through cartesian coordinates
for k=1:Dimension
    for l=1:Dimension
        for m=1:Dimension
                %establish origin
                q=0;
                r=0;
                s=0;

                %map the loop variables to coordinates
                t=a*k+b;
                u=a*l+b;
                v=a*m+b;

                %establish spherical coordinates for origin
                rho=sqrt(q*q+r*r+s*s);
                theta=atan2(sqrt(q*q+r*r),s);
                phi=atan2(r,q);

                %iterate 200 times
                for p=0:200
                %raise coordinate to the nth power
                qton=rho^n*sin(theta*n)*cos(phi*n);
                rton=rho^n*sin(theta*n)*sin(phi*n);
                ston=rho^n*cos(theta*n);
                
                %add to it the current coordinate (like adding c)
                qn=qton + t;
                rn=rton + u;
                sn=ston + v;
                
                %update coordinate (like updating z value);
                rho=sqrt(qn*qn+rn*rn+sn*sn);
                theta=atan2(sqrt(qn*qn+rn*rn),sn);
                phi=atan2(rn,qn);
                if abs(rho)>=2 %leave it outside sphere of radius 2
                break;
                end
                end
                if abs(rho)<2 %place a voxel if we never leave
                Data(k,l,m)=1;
                end
        end
    end
end


% volshow(Data);
colormap = 'cyan'; %cyan is pretty
volshow(Data, 'Colormap', colormap); %plot the bih