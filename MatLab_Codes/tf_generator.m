% twiddle factor calculation 
N = 32; 
%% Stage 1 

P = 1;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage1_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 2 
P = 2;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage2_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 3 
P = 3;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage3_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 4 
P = 4;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage4_tf = exp(-j*2*pi*Q(k)/N); 

%% Stage 5
P = 5;  % stage # 

Q = @(t) t*2^P/2;
k = 0:(N/2^P)-1;
stage5_tf = exp(-j*2*pi*Q(k)/N); 

%% Final Build Out 

w = zeros(5, 16); 
w(1,:) = stage1_tf; 
w(2,1:8) = stage2_tf; 
w(3,1:4) = stage3_tf; 
w(4,1:2) = stage4_tf; 
w(5,1) = stage5_tf; 
