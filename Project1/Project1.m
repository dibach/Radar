%% Problem 1
% The tapering fuctions lower the side lobes a lot with reduces false
% positives. By redusing the side lobes the main lobe appears much higher
% relitive to other lobes. The downfall to tapering is the main lobe
% widens

% N = 25;
% lamda = 10;
% x_y = [linspace(-50*pi/180,50*pi/180,100)' linspace(-50*pi/180,50*pi/180,100)'];
% dn = [(0:1:N-1)' zeros(N,1) zeros(N,1)].*lamda/2;
% 
% figure(1);
% E2 = AntennaPattern1D(x_y, dn, lamda, [0 0 0], hamming(N));
% plot(x_y(:,1).*180/pi,E2);
% title('Problem 1(a.a)');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Antenna Pattern (dB)');
% 
% figure(2);
% E2 = AntennaPattern1D(x_y, dn, lamda, [0 0 0], hann(N));
% plot(x_y(:,1).*180/pi,E2);
% title('Problem 1(a.b)');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Antenna Pattern (dB)');
% 
% figure(3);
% E2 = AntennaPattern1D(x_y, dn, lamda, [0 0 0], rectwin(N));
% plot(x_y(:,1).*180/pi,E2);
% title('Problem 1(a.c)');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Antenna Pattern (dB)');
% 
% figure(4); 
% E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], rectwin(N));
% surf(x_y(:,1).*180/pi,x_y(:,2).*180/pi,E2');
% title('Problem 1');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Angle \theta_y (\circ)');
% zlabel('Antenna Pattern (dB)');

% %% Problem 2
% % The problem with the smaller area is that grating lobes appear.
% % The best solution is the N=13 with the worst being N=5 with evenly
% % spaced. The uneven space gave a unique answer because the beam width is
% % significatly smaller however there are still grating lobes. The N=13 has
% % a large beam width however so the accuracy goes down.

% lamda = 3e8/10e9;
% x_y = [linspace(-pi/3,pi/3,150)' linspace(-pi/3,pi/3,150)'];
% % A.
% N = 13;
% dn = [(0:1:N-1)' zeros(N,1) zeros(N,1)].*0.36/N;

% figure(5);
% E2 = AntennaPattern1D(x_y, dn, lamda, [0 0 0], rectwin(N));
% plot(x_y(:,1).*180/pi,E2);
% title('Problem 2(a)');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Antenna Pattern (dB)');
% % B

% figure(6);
% N = 5;
% dn = [(0:1:N-1)' zeros(N,1) zeros(N,1)].*0.36/N;
% E2 = AntennaPattern1D(x_y, dn, lamda, [0 0 0], rectwin(N));
% plot(x_y(:,1).*180/pi,E2);
% title('Problem 2(b)');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Antenna Pattern (dB)');
% % C

% figure(7);
% N = 5;
% dn = [[0;1;4;9;11] zeros(N,1) zeros(N,1)].*0.36/11;
% E2 = AntennaPattern1D(x_y, dn, lamda, [0 0 0], rectwin(N));
% plot(x_y(:,1).*180/pi,E2);
% title('Problem 2(c)');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Antenna Pattern (dB)');

%% Problem 3

% figure(8);
lamda = 3e8/3e9;
direction = [linspace(-pi/2,pi/2,100)' linspace(-pi/2,pi/2,100)'];
pointing = [0 0 0]; %[azimuthal zenith]
% scatter(d(:,1),d(:,2), 8);
% xlabel('x');
% ylabel('y');
% title('Antenna Elements');

% figure(9);
% E2 = AntennaPattern2D(direction,d,lamda, pointing, rectwin(size(d,1)));
% surf(direction(:,1)*180/pi, direction(:,2)*180/pi, E2');
% xlabel('Angle \theta_x (\circ)');
% ylabel('Angle \theta_y (\circ)');
% zlabel('Antenna Pattern (dB)');
% title('Problem 3(b)');

figure(10);
pointing = [0 45*pi/180 0];
E2 = AntennaPattern1D(direction, d, lamda, pointing, rectwin(size(d,1)));
plot(direction(:,1).*180/pi,E2);
title('Problem 3(c)');
xlabel('Angle \theta_x (\circ)');
ylabel('Antenna Pattern (dB)');
