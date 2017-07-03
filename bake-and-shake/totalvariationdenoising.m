function B = totalvariationdenoising(in, runtime)

    h = 1;
    dt = .1;
    [r,c,l] = size(in);
    lambda = 0.1;
    alpha = 1;
    B_original = in(:,:,1); % + 50*rand(r,c);
    B = B_original;

    for t = 0:dt:runtime
            B_old = B;

            uxf = (B(:,[2:c,c]) - B)./h;
            uyf = (B([2:r,r],:) - B)./h;

            uxb = (B - B(:,[1,1:c-1]))./h;
            uyb = (B - B([1,1:r-1],:))./h;

            uxm = minmod(uxf, uxb);
            uym = minmod(uyf, uyb);

            cir = uxf./((uxf.^2 + uym.^2).^(0.5) + alpha);
            tri = uyf./((uyf.^2 + uxm.^2).^(0.5) + alpha);

            cirB = (cir - cir(:,[1,1:c-1]))./h;
            triB = (tri - tri([1,1:r-1],:))./h;

            B = B + (dt)*((cirB + triB) - lambda*(B - B_original));

            diff = abs(sum(sum(B - B_old)));
    end

    % dispImage(B)

end
