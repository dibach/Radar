function E2 = AntennaPattern1D(x_y, dn, lamda, pointing, win)
    N = size(dn,1);
    k = 2*pi/lamda;
    
    
%     zenith_pt = pointing(:,2);
%     azimuthal_pt = pointing(:,1);
%     a0 = [sin(zenith_pt).*cos(azimuthal_pt) sin(zenith_pt).*sin(azimuthal_pt) cos(zenith_pt)];
    a0 = pointing;
    E = zeros(length(x_y(:,1)));
    for i=1:size(x_y(:,1),1),
        for m=1:size(x_y(:,2),1),
            zenith = atan(sqrt(tan(x_y(i,1)).^2 + tan(x_y(m,2)).^2));
            azimuthal = atan(tan(x_y(m,2))./tan(x_y(i,1)));
            ar = [sin(zenith).*cos(azimuthal) sin(zenith).*sin(azimuthal) cos(zenith)];
            a = ar - a0;
            Esum = 0;
            for n=1:N,
                Esum = Esum + win(n)*exp(1i*k*dot(a,dn(n,:)));
            end;
        E(i) = Esum;
        end;
    end;
E2 = 10*log10((E.*conj(E)).^2);
E2 = E2 - max(E2(:,1));