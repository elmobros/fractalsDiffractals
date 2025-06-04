    
% Run the LG_Beam.m program for fields
  
run('vortex_formation_All.m');

% Take the hologram made by LG_Beam.
%Resize the array to a quadrant, then attach into four sections
I = FPb/max(max(FPb));




%setup filename and write to directory LGMasks
formatspec = 'l%dp%d';
nameparameters = sprintf(formatspec,l,p);
filename = strcat('LGMasks\LG_grating2',nameparameters,'.bmp');
imwrite(I,filename,'bmp');

figure();
imshow(I)




