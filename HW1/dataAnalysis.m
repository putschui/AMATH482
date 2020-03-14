clear; close all; clc;
load Testdata
L=15; % spatial domain
n=64; % Fourier modes
x2=linspace(-L,L,n+1); x=x2(1:n); y=x; z=x;
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks=fftshift(k);

[X,Y,Z]=meshgrid(x,y,z);
[Kx,Ky,Kz]=meshgrid(ks,ks,ks);

% Create a matrix with the sum of all the data points over time
Uavg = zeros(n,n,n);
for j=1:20
     Un(:,:,:)=reshape(Undata(j,:),n,n,n);
     Uf = fftn(Un);
     Uavg = Uavg + Uf;
end

% Divide the sum by the number of time points and shift values
Uavg = abs(fftshift(Uavg))./ 20;

% Show the image of the averaged data
isosurface(X,Y,Z,abs(Uavg),150)
axis([-20 20 -20 20 -20 20]), grid on, drawnow
xlabel('x'), ylabel('y'), zlabel('z')
title('Averaged Ultrasound Spatial Data', 'Fontsize', 15)
%%
% Get maximum frequency
[M,I] = max(abs(Uavg),[],'all','linear');
k0 = [Kx(I),Ky(I),Kz(I)];

% Define filter
tau = 0.01;
filter = exp(-tau*((Kx-k0(1)).^2.*(Ky-k0(2)).^2.*(Kz-k0(3)).^2));
filter = fftshift(filter);

% Create vectors to hold coordinates
X_coords = zeros(20,0);
Y_coords = zeros(20,0);
Z_coords = zeros(20,0);
path = zeros(20,3);
for j=1:20
     % Reshape data
     Un(:,:,:)=reshape(Undata(j,:),n,n,n);
     % Apply the filter to signal in frequency space
     Uf = fftn(Un);
     unft = filter.*Uf;
     % Construct the filtered signal in time domain
     unf=ifftn(unft);
     [M,I] = max(abs(unf),[],'all','linear');
     % Get coordinates of maximun frequency
     X_coords(j) = X(I);
     Y_coords(j) = Y(I);
     Z_coords(j) = Z(I);
end

% Plot the trajectory of the marble
plot3(X_coords,Y_coords,Z_coords,'ko-', 'Linewidth', 2)
xlabel('x'), ylabel('y'), zlabel('z')
title('Path of the Marble', 'Fontsize', 15)

% Plot the last location of marble
hold on
plot3(X_coords(20),Y_coords(20),Z_coords(20),'ro', 'Linewidth', 2)
