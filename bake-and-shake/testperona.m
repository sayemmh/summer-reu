I = 255 * ones(50, 50);
I(10:40, 20:30) = 0;


u = jitter(I, 2);
pm = peronamalik(u, 10);



pm2 = peronamalik(u, 5);

subplot(4,2,1)
dispImage(pm)
title('pm')

subplot(4,2,2)
dispImage(pm2)
title('pm2')
