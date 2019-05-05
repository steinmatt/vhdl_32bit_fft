% twiddle factor calculation 

%% Stage 1 

N = 32; % total # that gets crossed 
P = 1;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage1_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 2 
N = 32; % total # that gets crossed 
P = 2;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage2_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 3 
N = 32; % total # that gets crossed 
P = 3;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage3_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 4 
N = 32; % total # that gets crossed 
P = 4;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage4_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 5
N = 32; % total # that gets crossed 
P = 5;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage5_tf = exp(-j*2*pi*Q(k)/N); 

%% Final Build Out 

w = zeros(5, 16); 
w(1,:) = stage1_tf; 
w(2,1:8) = stage2_tf; 
