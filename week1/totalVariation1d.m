% working script for TVR in one dimension

clear

in = imread('../img/amoeba.png');
in = double(in);
h = 1;
dt = .05;
[r,c,l] = size(in);
lambda = 0.01;
alpha = 1;
B_original = in(:,:,1); % + 50*rand(r,c);
B = B_original;

for t = 0:dt:5
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
        
        diff = abs(sum(sum(B - B_old)))
        
        subplot(1,2,1)
        if mod(t,5)==0,
            show=B/max(max(B));
            show(:,:,2)=show(:,:,1);
            show(:,:,3)=show(:,:,1);
            image(show)
            snapnow
        end
        
        B_edge = edgeFunction(B, 1);
        subplot(1,2,2)
        if mod(t,5)==0,
            show=B_edge/max(max(B_edge));
            show(:,:,2)=show(:,:,1);
            show(:,:,3)=show(:,:,1);
            image(show)
            snapnow
        end
        
end

% subplot(1,2,1);
% imshow(uint8(B_original))
% title('old image')
% 
% subplot(1,2,2);
% imshow(uint8(B))
% title('less noisy image')

subplot(1,2,1)
show=B/max(max(B));
show(:,:,2)=show(:,:,1);
show(:,:,3)=show(:,:,1);
image(show)
snapnow


B_edge = edgeFunction(B, 15);
subplot(1,2,2)
show2=B_edge/max(max(B_edge));
show2(:,:,2)=show2(:,:,1);
show2(:,:,3)=show2(:,:,1);
image(show2)
snapnow

% imwrite(show, '../img/tvr-ed_amoeba.jpg', 'JPG');

