str=zeros(32,1);
twrd=[1, 0.98079, 0.92388, 0.83147, .70711, 0.5557, 0.38268,...
    0.19509, 0, -0.19509, -0.38268, -.55557, -.70711, -0.83147, -0.92388, ...
    -.9807];
twid=[0, 0.19509, 0.38268, 0.55557, 0.70711, 0.83147, 0.92388, 0.98079, 1, ...
    0.98079 0.92388, 0.83147, 0.70711, 0.55557, 0.38268, 0.19509];
twrr=32767*twrd;
twir=32767*twid;
d1=round(twrr);
d2=round(twir);

x=sdec2hex(d1,4);
y=sdec2hex(d2,4);
