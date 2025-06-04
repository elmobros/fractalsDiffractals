    
% Run the LG_Beam.m program for fields
  
run('vortex_formation_All.m');

% Take the hologram made by LG_Beam.
%Resize the array to a quadrant, then attach into four sections
I = FPb/max(max(FPb));
I = imresize(I,[256 256]);
quadI = cat(2,I,I);
quadI = cat(1,quadI,quadI);



%setup filename and write to directory LGMasks
formatspec = 'l%dp%d';
nameparameters = sprintf(formatspec,l,p);
filename = strcat('LGMasks\LG_grating',nameparameters,'.bmp');
imwrite(quadI,filename,'bmp');

figure();
imshow(quadI)

%same for grating2 style
formatspec = 'l%dp%d';
nameparameters = sprintf(formatspec,l,p);
filename = strcat('LGMasks\LG_grating2',nameparameters,'.bmp');
imwrite(I,filename,'bmp');



