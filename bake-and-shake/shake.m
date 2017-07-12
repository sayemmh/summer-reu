function [] = shake()

I = 255 * ones(50, 50);
I(10:40, 20:30) = 0;

I2 = jitter(I, 2);
I3 = peronamalik(I2, 500);

[r, ~] = size(I3);

abserr = 0.1;
itmax = 5;
s0 = 0;

I2o = I2;

for row = 1:20
  k = 1;
  sn = s0;


  ideal = I(row, :); %ideal
  f0 = I2(row, :); %f_original
  fb = I3(row, :); %f_baked
  dxfb = fb([2:end, 1]) - fb;

  fontSize = 30;
  %'
  compare = [ideal; f0; fb]';

  % Now plot them all.
  plot(compare, 'LineWidth', 1.5);
  title('ideal, f0, fb', 'FontSize', 20);
  xlabel('column', 'FontSize', fontSize);
  ylabel('value', 'FontSize', fontSize);
  grid on;
  legend('ideal', 'f0', 'fb');

  while (k < itmax && abs(sn1 - sn) < abserr)
    sn = sn1;
    sn1 = round(sn - 2*dot((f0 - fb), dxfb) / ((dot(abs(dxfb), abs(dxfb)))))
    f0 = shift(f0, -sn1);
    k = k + 1;
  end

  I2(row, :) = f0;

end

subplot(1,2,1)
dispImage(I2)
title('After bake and shake')

subplot(1,2,2)
dispImage(I2o)
title('jittered image')

end
