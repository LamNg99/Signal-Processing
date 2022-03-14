% C. System Response

% C.1
N_0 = 32; %fundamental period
omega_0 = 2*pi/N_0; % fundamental frequency

u = @(r) (r >= 0) * 1.0 .* (mod(r,1)==0);
H = @(r) u(r+4)-u(r-5);

r = (-16:16); 

omega = r.*omega_0;

figure;
subplot(2, 1, 1);
stem(r,H(r));
xlabel('r'); 
ylabel('H[r]'); 
title('Frequency Response H[r]');

subplot(2, 1, 2);
stem(omega,H(r)); 
xlabel('\omega'); 
ylabel('H[\omega]'); 
axis([-pi pi 0 1]);
title ('Frequency Response H[r] with Respect to \omega_0 ');