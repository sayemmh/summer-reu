I = imread('../img/ngafghan.jpg');
I = I(:,:,1);
% I = double(I);

%I = 255 * ones(200, 200);
%I(30:170, 75:125) = 0;

I_jitter = jitter(I, 10);

I_heat = heatequation(I_jitter, 30);

I_edges = getEdges(double(I))

Ij_edges = getEdges(double(I_jitter))

Ij_tvr = tvrFunction(double(I_jitter), 50)
Ijtvr_edges = getEdges(Ij_tvr)

subplot(2,4,1)
dispImage(I)
ntitle('I original')

subplot(2,4,2)
dispImage(I_jitter)
ntitle('I_jitter')

subplot(2,4,3)
dispImage(I_heat)

subplot(2,4,4)
dispImage(I_edges)

subplot(2,4,5)
dispImage(Ij_edges)

subplot(2,4,6)
dispImage(Ij_tvr)

subplot(2,4,7)
dispImage(Ijtvr_edges)
