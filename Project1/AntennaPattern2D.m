function E2 = AntennaPattern2D(x_y, dn, lamda, a0, win)
    N = size(dn,1);
    k = 2*pi/lamda;
    
    
    
    E = zeros(length(x_y(:,1)), length(x_y(:,2)));
    for i=1:size(x_y(:,1),1),
        for m=1:size(x_y(:,2),1),
            zenith = atan(sqrt(tan(x_y(i,1)).^2 + tan(x_y(m,2)).^2));
            azimuthal = atan2(tan(x_y(m,2)), tan(x_y(i,1)));
            ar = [sin(zenith).*cos(azimuthal) sin(zenith).*sin(azimuthal) cos(zenith)];
            a = repmat((ar - a0),N,1);
%             Esum = 0;
%             for n=1:N,
%                 Esum = Esum + win(n)*exp(1i*k*dot(a,dn(n,:)));
%             end;
%         E(i,m) = Esum;
          E(i,m) = sum(win.*exp(1i*k.*dot(a,dn,2)));
        end;
    end;
E2 = 10*log10((E.*conj(E)));
E2 = E2 - max(max(E2));