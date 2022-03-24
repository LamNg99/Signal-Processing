% C. FIR Filter Design by Frequency Sampling

% C.1

N = 35; % filter length

% Create N equally spaced frequency samples
Omega = linspace(0,2*pi*(1-1/N),N)'; 

% Design of a high pass FIR filter
H_d_35 = @(Omega) (mod(Omega,2*pi)>2*pi/3) & (mod(Omega,2*pi)<2*pi-2*pi/3);

% Sample the desired magnitude response and create h[n]
H_35 = H_d_35(Omega);

% Define phase to shift h[n] by (N - 1)/2
H_35 = H_35.*exp(-j*Omega*((N-1)/2));
H_35(fix(N/2)+2:N,1) = H_35(fix(N/2)+2:N,1)*((-1)^(N-1));

% Create h[n]
h_35 = real(ifft(H_35));

figure;
stem(0:N-1,h_35);
grid;
title('h[n] with Filter Length N = 35');
xlabel('n');
ylabel('h[n]');

% C.2
Omega = linspace (0, 2*pi, 1002); 
H_35 = freqz(h_35,1,0:2*pi/1001:2*pi);
figure;
plot(Omega,H_d_35(Omega),':','LineWidth',2);
hold on;
plot(Omega,abs(H_35),'color',[0.00 0.45 0.74]);
hold off;
grid;
title('Frequency Response from h[n] with Filter Length N = 35');
xlabel('\Omega');
ylabel('|H(\Omega)|');
axis([0 2*pi 0 1.2]);
legend('Ideal','Actual');

% C.3 

% The frequency response with  filter length N = 35 has general 
% shape which is close to the ideal filter with occurrence of ripple.

% C.4
N = 71; % filter length

% Create N equally spaced frequency samples
Omega = linspace(0,2*pi*(1-1/N),N)'; 

% Design of a high pass FIR filter
H_d_71 = @(Omega) (mod(Omega,2*pi)>2*pi/3) & (mod(Omega,2*pi)<2*pi-2*pi/3);

% Sample the desired magnitude response 
H_71 = 1.0*H_d_35(Omega);

% Define phase to shift h[n] by (N - 1)/2
H_71 = H_71.*exp(-j*Omega*((N-1)/2));
H_71(fix(N/2)+2:N,1) = H_71(fix(N/2)+2:N,1)*((-1)^(N-1));

% Create h[n]
h_71 = real(ifft(H_71));

figure;
stem(0:N-1,h_71);
grid;
title('h[n] with Filter Length N = 71');
xlabel('n');
ylabel('h[n]');

Omega = linspace (0, 2*pi, 1002); 
H_71 = freqz(h_71,1,0:2*pi/1001:2*pi);
figure;
plot(Omega,H_d_71(Omega),':','LineWidth',2);
hold on;
plot(Omega,abs(H_71),'color',[0.00 0.45 0.74]);
hold off;
grid;
title('Frequency Response from h[n] with Filter Length N = 71');
xlabel('\Omega');
ylabel('|H(\Omega)|');
axis([0 2*pi 0 1.2]);
legend('Ideal','Actual');

% C.5

% When the length of filter increased to 71, the ripple in the 
% frequency response is significantly reduced as it has more samples.
% Therefore, the quality of the filter is improved and the response is
% closer to the ideal filter.