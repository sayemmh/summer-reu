I = imread('../img/ngafghan.jpg');
I = I(:,:,1);
I = imresize(I, 0.5)
I = double(I);

I = 255 * ones(50, 50);
I(10:40, 20:30) = 0;

I_jitter = jitter(I, 4);

I_heat = heatequation(I_jitter, 15);

I_edges = getEdges(double(I))

Ij_edges = getEdges(double(I_jitter))

Ijh_edges = getEdges(double(I_heat))

Ij_tvr = totalvariationdenoising(double(I_jitter), 250)
Ijtvr_edges = getEdges(Ij_tvr)

u = jitter(I, 2);
pm = peronamalik(u, 10);

pm = perona2(u, 10);

subplot(4,2,1)
dispImage(I)
title('I')

subplot(4,2,2)
dispImage(I_jitter)
title('Ij (I jitter)')

subplot(4,2,3)
dispImage(I_heat)
title('Ijh (Ij heat)')

subplot(4,2,4)
dispImage(Ij_tvr)
title('Ij tvr')

subplot(4,2,5)
dispImage(I_edges)
title('I edges')

subplot(4,2,6)
dispImage(Ij_edges)
title('Ij edges')

subplot(4,2,7)
dispImage(Ijh_edges)
title('Ijh edges')

subplot(4,2,8)
dispImage(Ijtvr_edges)
title('Ijtvr edges')

% shake step
% for each line get each line
snp1 = sn - ep ./ edp
