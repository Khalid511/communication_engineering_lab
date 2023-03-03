
data = [0 1 0 0 1 0];
bit_rate = 1;

Time = length(data)/bit_rate;
points = 100;
total_points = length(data)*points;
sample_time = 0:Time/total_points:Time - (Time/total_points);
encoded_output = zeros(1, length(sample_time));

prev_level = 1;

for i=0:length(data)-1
    if data(i+1)== 0
        encoded_output(i*points+1:(i+1)*points) = 0;
    else
       encoded_output(i*points+1:(i+1)*points) = prev_level;
       if prev_level == 1
           prev_level = -1;
       else
           prev_level = 1;
       end
    end
end

subplot(2, 1, 1)
plot(sample_time, encoded_output, 'r');
title('Encoded Signal');

%Decoding the encoded signal
data_length = length(encoded_output)/points;
decoded_data = zeros(1, data_length);


for i=0:data_length-1
    if encoded_output(i*points+1) == 0
        decoded_data(i+1) = 0;
    else
        decoded_data(i+1) = 1;
    end
end

subplot(2, 1, 2);
stem(decoded_data);
title('Decoded Signal');

