function RST(A, B, C, n)
%-------------------------------------------------------------------------
% Recursion for Sierpinski Triangle
% Description: This function draws Sierpinski triangle by using recursion
%        UPDATE:  fills in areas of triangle
% Input: 3 coordinates A, B, C (2-D vector) and number of recursion 'n'
% Example: A(2,4), B(0,0), C(4,0), n = 5 --> RST(A, B, C, n)
% Output: Graph of Sierpinski Triangle
% Complexity: O(3^n)
%-------------------------------------------------------------------------
% Author: Trong Hoang Vo Edited by Sean Nomoto
% Date: April 14, 2016
% Contact: hoangtrong2305@gmail.com (my Gmail)
%          facebook.com/hoangtrong2305 (my Facebook)
%-------------------------------------------------------------------------

x0=10;
y0=10;
width=500;
height=500;
set(gcf,'units','points','position',[x0,y0,width,height]);


if n <= 0
%     plot([A(1), B(1)], [A(2), B(2)], 'color', 'k','LineWidth',3);
%     hold on
%     plot([B(1), C(1)], [B(2), C(2)], 'color', 'k','LineWidth',3);
%     plot([C(1), A(1)], [C(2), A(2)], 'color', 'k','LineWidth',3);
%     title('Recursion for Sierpinski Triangle');
%      plot([A(1), B(1)], [A(2), B(2)], 'color', 'k');
%     hold on
%     plot([B(1), C(1)], [B(2), C(2)], 'color', 'k');
%     plot([C(1), A(1)], [C(2), A(2)], 'color', 'k');
%     title('Recursion for Sierpinski Triangle');
    patch([A(1) B(1) C(1)],[A(2) B(2) C(2)],'k') 

else  
    RST_Fill(A, (A + B) / 2, (A + C) / 2, n - 1);
    RST_Fill(B, (B + A) / 2, (B + C) / 2, n - 1);
    RST_Fill(C, (C + A) / 2, (C + B) / 2, n - 1);
end
% quiver(0,0,0.2,0.2,'k','LineWidth',5,'MaxHeadSize',1);
% text(0.2,0.2,'$$ \Delta\vec{r} $$','FontSize',20,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  this section for Figures

%  initial coords
%  [0,sqrt(3)/3],[-1/2,-sqrt(3)/6],[1/2,-sqrt(6),3]
% 
% xlim([-1.,1.]);  %  Sets the axes limits
% ylim([-1.,1.]);
% xlabel('$$ \textit{x} $$ (mm)','FontSize',20,'Interpreter','latex');
% ylabel('$$ \textit{y} $$ (mm)','FontSize',20,'Interpreter','latex');
% % title('Sierpinski Triangle for $$ n = 1 $$','FontSize',20,'Interpreter','latex');
% % title('\textit{Initiator}','FontSize',20,'Interpreter','latex');
% title('\textit{Magnified and Displaced Initiator}','FontSize',20,'Interpreter','latex');
% axis square;
% %   forcing the background of figure to be white in value   
%     ax = gca;   % get current axis in the figure
%     ax.XAxisLocation = 'origin';  % setting the axes location to origin
%     ax.YAxisLocation = 'origin';  %  for x and y axes
%     saveas(gcf,'n=0InitMag&Displaced.pdf','pdf');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% hold on;
% quiver([0,0],[0.2,0.2]);

axis off;  % no axis
title '';  % no title
axis square;
% 
% 
plotlims = 10;
xlim([-plotlims,plotlims]);  %  Sets the axes limits
ylim([-plotlims,plotlims]);   %  millimeters
%   forcing the background of figure to be white in value   
    ax = gca;   % get current axis in the figure
    ax.XAxisLocation = 'origin';  % setting the axes location to origin
    ax.YAxisLocation = 'origin';  %  for x and y axes
    set(gcf,'color','w');       % setting get current figure (gcf) so background 
% %                                is white

end
