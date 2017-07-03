%I = 255 * ones(50, 50);
%I(10:40, 20:30) = 0;
%u = jitter(I, 2);

I = imread('../img/futuro.jpg');
I = I(:,:,1);
I = imresize(I, 0.5)
u = double(I);
u = jitter(u, 5);

h = heatequation(u, 25);
tvr = totalvariationdenoising(u, 50)
pm2 = peronamalik(u, 50);
pm3 = peronamalik(u, 200);
pm4 = peronamalik(u, 500);

subplot(4,2,1)
dispImage(u); axis image
title('Original jittered image')

subplot(4,2,2)
dispImage(tvr) axis image
title('TV run for 10 iterations')

subplot(4,2,3)
dispImage(h) axis image
title('Heat equation run for 25 iterations')


subplot(4,2,4)
dispImage(pm2) axis image
title('Perona Malik run for 50 iterations')

subplot(4,2,5)
dispImage(pm3) axis image
title('Perona Malik run for 200 iterations')

subplot(4,2,6)
dispImage(pm4) axis image
title('Perona Malik run for 500 iterations')
