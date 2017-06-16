function uij = heatequation(uij, iteration)
dt = 0.2;
h = 1;

[r,c] = size(uij);
  for i = 1:iteration

    uxx = (uij(:,[2:c,c]) - 2*uij(:,1:c) + uij(:,[c, 1:c-1])) ./ h;
    uyy = (uij([2:r,r],:) - 2*uij(1:r,:) + uij([r, 1:r-1],:)) ./ h;

    uij = uij + dt*(uxx + uyy);
  end
    imshow(uij)

end
