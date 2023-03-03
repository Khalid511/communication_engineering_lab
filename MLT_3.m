
data = [0 1 0 1 1 0 1 1];
bit_rate = 1;

Time = length(data)/bit_rate;
points = 100;
total_points = length(data)*points;
sample_time = 0:Time/total_points:Time - (Time/total_points);
encoded_output = zeros(1, length(sample_time));

last_non_zero_level = -1;
no_change = 0;

for i=0:length(data)-1
    if data(i+1)== 0
        encoded_output(i*points+1:(i+1)*points) = no_change;
        
    else
      if no_change == 0
       if last_non_zero_level>0
           encoded_output(i*points+1:(i+1)*points) = -1;
           no_change = -1;
           last_non_zero_level = -1;
       else
           encoded_output(i*points+1:(i+1)*points) = 1;
           no_change = 1;
           last_non_zero_level = 1;
       end
      else
        encoded_output(i*points+1:(i+1)*points) = 0;
        no_change = 0;  
      end
    end
end

if data(1)==1
    encoded_output(1) = 0;
end

subplot(2, 1, 1)
plot(sample_time, encoded_output, 'r');
title('Encoded Signal');

%Decoding the encoded signal
data_length = length(encoded_output)/points;
decoded_data = zeros(1, data_length);

value = 0;

for i=0:data_length-1
    
    if encoded_output(i*points+2) == value
        decoded_data(i+1) = 0;
    else
        decoded_data(i+1) = 1;
        value = encoded_output(i*points+2);
    end
end

subplot(2, 1, 2);
stem(decoded_data);
title('Decoded Signal');

