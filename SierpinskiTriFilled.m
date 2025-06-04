 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Sierpinski Triangle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%


nmax =5;scale = 1;
for n =0:nmax
    clear P A B C;
H = 0;V = 0;

S = scale*1; %  scale, over all size of initial triangle
    % or 'radius' of circle  0.5573 for side of length 1
% Recursion for Sierpinski Triangle (O(3^n))
A = [0+H, S*1+V]; %Coordinate A
B = [-S*sqrt(3)/2+H, -S*(1/2)+V]; %Coordinate B
C = [S*sqrt(3)/2+H, -S*(1/2)+V]; %Coordinate C
% n = 0;      %Number of recursions (iterations)
b = sqrt(S^2+S^2-2*S^2*cos(2*pi/3));  %side of triangle
%loop through the iterations
    
RST_Fill(A, B, C, n);  % for specific operation, refer to function RST.m file
% 


pos = get(gca,'Position');
h = gcf;
                               
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                               
 %   converting the figure into an array of doubles
    F = getframe(gca);          % gcf to obtain image data
    [P, map] = frame2im(F);     % convert to array P with corresponding map
%     
%     figure('Name','PolyImage');  % new, separate figure
%     
    P = rgb2gray(P);        %  change RGB 3 layer to index grayscale single
               N = 1000;                     %           layer   
    P = imresize(P,[N,N]);plotlims = N/2;
    P = imcomplement(P); %  normalize later to 0 and 1, otherwise
    
    P = double(P);
Pnorm = P./max(max(P));
formatspec = 'SierTriOrder s=%i.bmp';
filename = sprintf(formatspec, n);
imwrite(P,filename,'bmp');

apertures(n+1).apertures = Pnorm;
close(gcf);
end


% 
% clear P A B C;
% H = 0;V = 0;scale = 5;n =10;
% 
% S = scale*1; %  scale, over all size of initial triangle
%     % or 'radius' of circle  0.5573 for side of length 1
% % Recursion for Sierpinski Triangle (O(3^n))
% A = [0+H, S*1+V]; %Coordinate A
% B = [-S*sqrt(3)/2+H, -S*(1/2)+V]; %Coordinate B
% C = [S*sqrt(3)/2+H, -S*(1/2)+V]; %Coordinate C
% % n = 0;      %Number of recursions (iterations)
% b = sqrt(S^2+S^2-2*S^2*cos(2*pi/3));  %side of triangle
% %loop through the iterations
%     
% RST_Fill(A, B, C, n);  % for specific operation, refer to function RST.m file