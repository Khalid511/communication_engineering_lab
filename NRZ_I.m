
bits = [0 1 0 0 1 1 1 0];
bitrate = 1;

T = length(bits)/bitrate; % full time of bit sequence
n = 100;
N = n*length(bits);
t = 0:T/N:T;
prev_level = 1;
inversion = -1;
x = zeros(1,length(t)); % output signal
for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1:(i+1)*n) = inversion;
    prev_level = inversion;
    if(inversion==1)
        inversion = -1;
    else
        inversion = 1;
    end
  else
    x(i*n+1:(i+1)*n) = prev_level;
  end
end

plot(t, x, 'r');