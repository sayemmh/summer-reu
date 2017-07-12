I = imread('../img/ngafghan.jpg');
I = I(:,:,1);
I = imresize(I, 0.5)
I = double(I);

I = 255 * ones(50, 50);
I(10:40, 20:30) = 0;

I = 255 * ones(50, 50);
I(10:40, 20:30) = 0;

I2 = jitter(I, 2);

I4 = peronamalik(I2, 100);

I5 = peronamalik(I2, 300);


I3 = peronamalik(I2, 500);



subplot(2,2,1)
dispImage(I2)
title('Jittered Image')

subplot(2,2,2)
dispImage(I4)
title('Peronal Malik run for 100 iterations')

subplot(2,2,3)
dispImage(I5)
title('perona malik run for 300 iterations')

subplot(2,2,4)
dispImage(I3)
title('Perona malik run for 500 iterations')
