function var_plot(var)

var.w = var.range;
a = var.range;
c0 = var.nug;
c1 = var.sill-c0;

plot(var.h,var.gam,'o', 'color',0*[1 1 1]); grid on; hold on
h = 0:(var.h(2) - var.h(1))/10:var.h(end);
gam = var.vario_model(a, c0, c1, h, var.w);

plot(var.range*[1 1], [0 var.sill], '--','color',0.7*[1 1 1],'linewidth',2);
plot([h(1) h(end)], [var.sill var.sill], '--','color',0.7*[1 1 1],'linewidth',2);

plot(h,gam,'color',0.3*[1 1 1],'linewidth',3);
phrase = ['\textbf{ $\leftarrow$}', num2str(round(10*var.nug)/10)];
text('Interpreter', 'latex',...
 'Position', [15,var.nug],...
 'String', phrase,...
 'FontSize', 14,...
 'HorizontalAlignment', 'right');

phrase = ['\textbf{', num2str(round(10*var.sill)/10) ' $\rightarrow$}'];
text('Interpreter', 'latex',...
 'Position', [-diff(xlim)/50,var.sill],...
 'String', phrase,...
 'FontSize', 14,...
 'HorizontalAlignment', 'right');

phrase = ['\textbf{$\leftarrow$ '  num2str(round(10*var.range)/10),'}'];
text('Interpreter','latex',...
 'String',phrase,...
 'Position',[var.range, diff(ylim)/50],...
 'FontSize', 14,...
 'FontName', 'Arial',...
 'HorizontalAlignment', 'left',...
 'VerticalAlignment', 'bottom')


formatFig('Variogram Fit','','',16,14);
