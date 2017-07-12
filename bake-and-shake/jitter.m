% normally distributed horizontal jitter

function I = jitter(I, lambda)

[r, c] = size(I);

% lambda = 10; % max amount of horizontal jitter

for row = 1:r
  displacement = round((2*lambda) * rand(1) - lambda);
  if displacement > 0
    I(row, :) = [zeros(1, displacement), I(row, 1:c-displacement)];
  elseif displacement < 0
    displacement = displacement * -1;
    I(row, :) = [I(row,displacement + 1:end), zeros(1,displacement)];
  end
end

% imshow(I)

end
