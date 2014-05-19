dataOnGlacier('data/s4_G_fixed.dtm',1,1,1,1);
hold on
G = load('data/f12_filtered');
h=scatter(G(:,1),G(:,2),45,G(:,3),'filled');
set(h,'MarkerEdgeColor','k')
y=scatter(G(:,1),G(:,2),30,G(:,3),'filled');
