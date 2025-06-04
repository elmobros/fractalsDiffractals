%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$%
%                                                                         %
%           This program is written to construct computer                 %
%            generated hologram (CGH) for Optical Vortex                  %
%                                    Author: Pravin Vaity  
%
%              Edited Sean Nomoto
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$%
%-------------------------------------------------------------------------%
tic;        clc;        clear all;           % close all;
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
%-------------------------    SLM Parameters    -------------------------%
N   = 512;                 % No. of Pixels 
dx  = 15E-6;               % Pixel Size in 'm'                  
z   = 1E-20; 

% %----------------------------- Display Grid ------------------------------%
% m   = -((N-1)/2):1:((N-1)/2);
% 
% xy  = m*dx;                  [x,y] = meshgrid(xy,xy'); % Cartetian 
% r   = (x.*x+y.*y).^0.5;         ph = atan2(y,x); % Polar Coordinates
%----------------------------- Display Grid 2 ------------------------------%
mx   = -((N-1)/(4/3)):1:((N-1)/4);
my  = -((N-1)/2):1:((N-1)/2);
xx  = mx*dx; yy = my*dx;           [x,y] = meshgrid(xx,yy'); % Cartetian 
 
r   = (x.*x+y.*y).^0.5;         ph = atan2(y,x); % Polar Coordinates

%-------------------------------------------------------------------------%



%-------------------------Fork pattern -----------------------------------%
%-------------------------------------------------------------------------%
l   = 13;                % Topological Charge of Vortex
p  =  0;                % azimuthal index for ring phase dislocations
sg  = -1;               % Sign of Vortex: 1 -> +ve and -1 -> -ve 
n   = 50;% original n = 50               % No. of lines in Hologram

%  n = 250, 700, 750 yield okay rings
%  Optimum n apprx = 253 lines in calculation

w = 10; % set radius for blazed hologram in units of pixels from center
% FP  = 2*(1+cos(2*pi*n*x/(N*dx)+sg*l*ph));
% %figure(1);imagesc(FP);colormap(gray);axis image; axis off
% 
% imwrite(FP/max(max(FP)),'Vort1.bmp'); 
% hologram image file generated in current folder
%---------------------- Gaussian distridution-----------------------------% 
 wo  = 1000E-6;             % BeamWidth
% Ew  = exp(-(r/wo).^2);
% FPg = Ew.*FP;   
% %figure(2);imagesc(FPg);colormap(gray);axis image; axis off     %
% 
% imwrite(FPg/max(max(FPg)),'Vort2.bmp'); 
% hologram image file generated in current folder

%------------------------  Blazed hologram -------------------------------%
%
%  Set values in matrix x to zero for values outside the radius w


for w = 300;%1:10:500
    for i = 1:512
        for j = 1:512
            R = sqrt((i-256)^2 +(j-256)^2);
            if R > w
                x(i,j) = 0;
                y(i,j) = 0;
            end
        end
    end
    % Calculate polynomial values in x y grid into LG array of values
    LG = polyval(AssociatedLaguerrePoly(p,abs(l)),(2*(sqrt(x.^2+y.^2)/wo).^2));
    
    % Calculate the pi phase shift at each location in x y grid via LG array
    for i = 1:512
        for j = 1:512
            R = sqrt((i-256)^2 +(j-256)^2);
            if R > w
                x(i,j) = 0;
                y(i,j) = 0;
            end
            C(i,j) = - pi*step_unit_fun(LG(i,j));
            
        end
    end
    
    %for n = 1:1:500
    %final modulated phase to be produced
    FPb = mod((2*pi*n*x/(N*dx)+sg*l*ph + C),2*pi);
    % this should include p dependence
    
    
    % figure();imagesc(FPb);colormap(gray);axis image; axis off    %
    formatspec ='LGGratespacing\\LGMaskw0%dl%dp%d.bmp';
    str = sprintf(formatspec,w,l,p);
    imwrite(FPb/max(max(FPb)),str,'bmp');
    %end
end
%imwrite(FPb/max(max(FPb)),'Vort3.bmp'); 
% hologram image file generated in current folder

%-------------------------------------------------------------------------%
toc
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$%
